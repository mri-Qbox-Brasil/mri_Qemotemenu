---@diagnostic disable: lowercase-global

-- Estado por player — tier "por-player" da .claude/rules/persistence.md:
-- hidrata no player load, vive em memoria enquanto ele esta online, e so encosta
-- no banco em write real (com debounce) ou no logout. Trocar o emote de um slot
-- NAO dispara uma query por clique.

---@type table<string, { binds: table, settings: table, dirty: boolean }>
local cache = {}
---@type table<number, string> source -> citizenid
local bySource = {}

local SAVE_INTERVAL = 30000

---@param value string?
---@param fallback table
---@return table
local function decode(value, fallback)
    if type(value) ~= 'string' or value == '' then return fallback end
    local ok, decoded = pcall(json.decode, value)
    return (ok and type(decoded) == 'table') and decoded or fallback
end

---@param source number
---@return string?
local function citizenIdOf(source)
    if bySource[source] then return bySource[source] end

    local player = exports.qbx_core:GetPlayer(source)
    if not player then return nil end

    local cid = player.PlayerData.citizenid
    bySource[source] = cid
    return cid
end

---@param citizenid string
---@return table
local function load(citizenid)
    if cache[citizenid] then return cache[citizenid] end

    local row = MySQL.single.await(
        'SELECT `binds`, `settings` FROM `mri_qemotemenu_players` WHERE `citizenid` = ?',
        { citizenid })

    cache[citizenid] = {
        binds = decode(row and row.binds, {}),
        settings = decode(row and row.settings, {}),
        dirty = false,
    }

    return cache[citizenid]
end

---@param citizenid string
local function persist(citizenid)
    local entry = cache[citizenid]
    if not entry or not entry.dirty then return end

    entry.dirty = false

    -- Nunca gravar '' numa coluna JSON: o read faria fallback silencioso e a
    -- coluna viraria lixo. Tabela vazia vira NULL.
    local binds = next(entry.binds) and json.encode(entry.binds) or nil
    local settings = next(entry.settings) and json.encode(entry.settings) or nil

    MySQL.query.await([[
        INSERT INTO `mri_qemotemenu_players` (`citizenid`, `binds`, `settings`)
        VALUES (?, ?, ?)
        ON DUPLICATE KEY UPDATE `binds` = VALUES(`binds`), `settings` = VALUES(`settings`)
    ]], { citizenid, binds, settings })
end

-- ============================================================
-- Callbacks
-- ============================================================

lib.callback.register('mri_Qemotemenu:getSettings', function(source)
    local cid = citizenIdOf(source)
    if not cid then
        return { defaults = GetDefaults(), binds = {}, settings = {}, isAdmin = false }
    end

    local entry = load(cid)
    return {
        defaults = GetDefaults(),
        binds = entry.binds,
        settings = entry.settings,
        isAdmin = HasEmotePerms(source),
    }
end)

lib.callback.register('mri_Qemotemenu:setBind', function(source, payload)
    if type(payload) ~= 'table' or type(payload.slot) ~= 'string' then return false end

    local cid = citizenIdOf(source)
    if not cid then return false end

    -- Validacao: slot precisa ser um dos configurados, e os textos tem teto.
    local known = false
    for _, entry in ipairs(Config.FavoriteSlots) do
        if entry.slot == payload.slot then
            known = true
            break
        end
    end
    if not known then return false end

    if payload.emote ~= nil and (type(payload.emote) ~= 'string' or payload.emote == '' or #payload.emote > 64) then
        return false
    end
    if payload.label ~= nil and (type(payload.label) ~= 'string' or #payload.label > 64) then
        return false
    end

    local entry = load(cid)
    if payload.emote then
        entry.binds[payload.slot] = { emote = payload.emote, label = payload.label }
    else
        entry.binds[payload.slot] = nil
    end
    entry.dirty = true

    return true
end)

lib.callback.register('mri_Qemotemenu:setDefault', function(source, payload)
    if not HasEmotePerms(source) then
        lib.print.warn(('%s tentou alterar o padrao de emote sem permissao'):format(GetPlayerName(source) or source))
        return false, locale('admin_no_permission')
    end

    if type(payload) ~= 'table' then return false, locale('admin_invalid_slot') end

    return SetDefault(source, payload.slot, payload.emote, payload.label)
end)

-- ============================================================
-- Settings (walk, mood, favoritos)
-- ============================================================

RegisterNetEvent('mri_Qemotemenu:server:saveSettings', function(settings)
    local source = source
    if type(settings) ~= 'table' then return end

    local cid = citizenIdOf(source)
    if not cid then return end

    -- Teto de tamanho: o client manda o objeto inteiro, entao vale limitar o
    -- que um player pode empurrar para o banco.
    local encoded = json.encode(settings)
    if #encoded > 16384 then
        lib.print.warn(('settings grandes demais de %s (%d bytes), descartado'):format(cid, #encoded))
        return
    end

    local entry = load(cid)
    entry.settings = settings
    entry.dirty = true
end)

-- ============================================================
-- Ciclo de vida
-- ============================================================

AddEventHandler('playerDropped', function()
    local source = source
    local cid = bySource[source]
    if not cid then return end

    persist(cid)
    cache[cid] = nil
    bySource[source] = nil
end)

RegisterNetEvent('QBCore:Server:OnPlayerUnload', function(src)
    local target = src or source
    local cid = bySource[target]
    if not cid then return end

    persist(cid)
    cache[cid] = nil
    bySource[target] = nil
end)

-- Flush periodico: cobre crash do servidor sem perder mais que um intervalo.
CreateThread(function()
    while true do
        Wait(SAVE_INTERVAL)
        for citizenid in pairs(cache) do
            persist(citizenid)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for citizenid in pairs(cache) do
        persist(citizenid)
    end
end)
