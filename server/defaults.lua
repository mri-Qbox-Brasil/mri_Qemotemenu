---@diagnostic disable: lowercase-global

-- Padroes de slot do servidor — tier "referencia" da .claude/rules/persistence.md:
-- carrega uma vez no boot para uma tabela Lua, leitura SEMPRE da memoria, e
-- recarrega + broadcast no write. Nenhuma query por request.

---@type table<string, { emote: string, label: string? }>
local defaults = {}
local loaded = false

---@return table<string, table>
function GetDefaults()
    return defaults
end

function ReloadDefaultsCache()
    local rows = MySQL.query.await('SELECT `slot`, `emote`, `label` FROM `mri_qemotemenu_defaults`')
    local fresh = {}

    for i = 1, #(rows or {}) do
        local row = rows[i]
        fresh[row.slot] = { emote = row.emote, label = row.label }
    end

    defaults = fresh
    loaded = true
    return defaults
end

---Garante que os 4 slots do config existem na tabela. Roda uma vez no boot, e
---nao sobrescreve nada que o admin ja tenha mudado (ON DUPLICATE KEY no-op).
local function seedDefaults()
    local queries = {}

    for _, entry in ipairs(Config.FavoriteSlots) do
        queries[#queries + 1] = {
            query = [[
                INSERT INTO `mri_qemotemenu_defaults` (`slot`, `emote`, `label`, `updated_by`)
                VALUES (?, ?, ?, 'boot')
                ON DUPLICATE KEY UPDATE `slot` = `slot`
            ]],
            values = { entry.slot, entry.emote, entry.label },
        }
    end

    if #queries > 0 then
        MySQL.transaction.await(queries)
    end
end

---Troca o padrao de um slot para o servidor inteiro.
---@param source number quem pediu (para o log de auditoria)
---@param slot string
---@param emote string
---@param label string?
---@return boolean ok
---@return string? err
function SetDefault(source, slot, emote, label)
    if type(slot) ~= 'string' or not slot:match('^[A-Z]+$') then
        return false, locale('admin_invalid_slot')
    end

    local known = false
    for _, entry in ipairs(Config.FavoriteSlots) do
        if entry.slot == slot then
            known = true
            break
        end
    end
    if not known then return false, locale('admin_invalid_slot') end

    if type(emote) ~= 'string' or emote == '' or #emote > 64 then
        return false, locale('notvalidemote')
    end
    if label ~= nil and (type(label) ~= 'string' or #label > 64) then
        return false, locale('admin_invalid_slot')
    end

    local player = exports.qbx_core:GetPlayer(source)
    local by = player and player.PlayerData.citizenid or ('src:' .. tostring(source))

    MySQL.query.await([[
        INSERT INTO `mri_qemotemenu_defaults` (`slot`, `emote`, `label`, `updated_by`)
        VALUES (?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE `emote` = VALUES(`emote`), `label` = VALUES(`label`), `updated_by` = VALUES(`updated_by`)
    ]], { slot, emote, label, by })

    ReloadDefaultsCache()

    -- Broadcast: quem tem override proprio nao muda nada (o client resolve a
    -- precedencia), quem nao tem ve o slot novo na hora.
    TriggerClientEvent('mri_Qemotemenu:client:defaultsUpdated', -1, defaults)

    lib.print.info(('Padrao do slot %s alterado para "%s" por %s'):format(slot, emote, by))
    return true
end

CreateThread(function()
    seedDefaults()
    ReloadDefaultsCache()
    lib.print.info(('Padroes de atalho carregados (%d slots)'):format(#Config.FavoriteSlots))
end)

---@return boolean
function DefaultsReady()
    return loaded
end
