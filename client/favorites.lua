---@diagnostic disable: lowercase-global

-- Favoritos nas setas.
--
-- Cada slot resolve em tres niveis, do mais forte para o mais fraco:
--   1. override do player  (mri_qemotemenu_players.binds, por citizenid)
--   2. default do servidor (mri_qemotemenu_defaults, editavel pelo admin)
--   3. Config.FavoriteSlots (este repositorio)
--
-- O disparo passa SEMPRE por CanFireEmoteBind(), que e o que substitui o antigo
-- export DisableEmoteKeybinds.

---@type table<string, { emote: string, label: string?, source: string }>
ResolvedSlots = {}

local serverDefaults = {}
local playerBinds = {}

---@param slot string
---@return table? { emote, label, source }
function GetSlot(slot)
    return ResolvedSlots[slot]
end

---@return table<string, table>
function GetAllSlots()
    return ResolvedSlots
end

local function configSlot(slot)
    for _, entry in ipairs(Config.FavoriteSlots) do
        if entry.slot == slot then return entry end
    end
end

local function resolveSlots()
    for _, entry in ipairs(Config.FavoriteSlots) do
        local slot = entry.slot
        local override = playerBinds[slot]
        local default = serverDefaults[slot]

        if override and override.emote then
            ResolvedSlots[slot] = { emote = override.emote, label = override.label, source = 'player' }
        elseif default and default.emote then
            ResolvedSlots[slot] = { emote = default.emote, label = default.label, source = 'server' }
        else
            ResolvedSlots[slot] = { emote = entry.emote, label = entry.label, source = 'config' }
        end
    end

    SendNUIMessage({ action = 'slotsUpdated', slots = ResolvedSlots })
end

---Nome exibido do slot: rotulo custom > label do emote > nome do emote.
---@param slot string
---@return string
function GetSlotDisplayName(slot)
    local resolved = ResolvedSlots[slot]
    if not resolved then return slot end
    if resolved.label and resolved.label ~= '' then return resolved.label end

    local emote = EmoteData[resolved.emote]
    return (emote and emote.label) or resolved.emote
end

---@param slot string
local function fireSlot(slot)
    local allowed, reason = CanFireEmoteBind(slot)
    if not allowed then
        DebugPrint(('Atalho %s ignorado: %s'):format(slot, reason))
        return
    end

    local resolved = ResolvedSlots[slot]
    if not resolved or not resolved.emote then return end

    EmoteCommandStart({ resolved.emote })
end

-- ============================================================
-- Keybinds
-- ============================================================
-- Registrados com lib.addKeybind mantendo os nomes que ja existiam no
-- rpemotes-reborn (ultra_salute / ultra_assobio / ultra_joia / ultra_facepalm)
-- para que quem ja remapeou a tecla nas configuracoes do FiveM nao perca.

CreateThread(function()
    for _, entry in ipairs(Config.FavoriteSlots) do
        lib.addKeybind({
            name = entry.keybindName,
            description = entry.label,
            defaultKey = entry.key,
            onPressed = function()
                fireSlot(entry.slot)
            end,
        })
    end
end)

-- ============================================================
-- Sincronizacao com o servidor
-- ============================================================

RegisterNetEvent('mri_Qemotemenu:client:defaultsUpdated', function(defaults)
    if type(defaults) ~= 'table' then return end
    serverDefaults = defaults
    resolveSlots()
end)

RegisterNetEvent('mri_Qemotemenu:client:bindsUpdated', function(binds)
    if type(binds) ~= 'table' then return end
    playerBinds = binds
    resolveSlots()
end)

---Troca o emote de um slot para este player. Persiste no banco.
---@param slot string
---@param emote string? nil limpa o override e volta ao default do servidor
---@param label string?
---@return boolean
function SetFavoriteSlot(slot, emote, label)
    if not Config.ArrowControls[slot] then return false end
    if emote and not EmoteData[emote] then
        Notify(("'%s' %s"):format(tostring(emote), locale('notvalidemote')), 'error')
        return false
    end

    local ok = lib.callback.await('mri_Qemotemenu:setBind', false, {
        slot = slot,
        emote = emote,
        label = label,
    })

    if ok then
        if emote then
            playerBinds[slot] = { emote = emote, label = label }
        else
            playerBinds[slot] = nil
        end
        resolveSlots()
    end

    return ok and true or false
end

---Alimentado pelo hydrate() do client/main.lua, que ja faz o unico
---`getSettings` da sessao. Nao chamar callback proprio aqui: seriam duas
---queries por player load e uma corrida entre elas.
---@param defaults table?
---@param binds table?
function ApplyServerSlots(defaults, binds)
    serverDefaults = defaults or {}
    playerBinds = binds or {}
    resolveSlots()
end

-- Resolve uma vez com os defaults do config, para os atalhos ja funcionarem
-- antes do servidor responder.
CreateThread(resolveSlots)
