---@diagnostic disable: lowercase-global

-- Bootstrap do cliente: estado do player, cache de settings e restauracao do
-- que estava salvo (walk, mood, favoritos).
--
-- As settings vivem no banco por citizenid (server/players.lua). Aqui ha so um
-- espelho em memoria + um flush com debounce, para nao bater no banco a cada
-- clique da NUI.

---@type table<string, any>
local settings = {}
local dirty = false
-- SetTimeout no Lua do CFX nao devolve handle, entao o debounce e controlado por
-- flag: so existe um timer voando por vez.
local flushScheduled = false

IsEmoteAdmin = false

---@param key string
---@return any
function GetSetting(key)
    return settings[key]
end

---@param key string
---@param value any nil remove
function SaveSetting(key, value)
    if settings[key] == value then return end
    settings[key] = value
    dirty = true

    if flushScheduled then return end
    flushScheduled = true

    SetTimeout(Config.SaveDebounce, function()
        flushScheduled = false
        if not dirty then return end
        dirty = false
        TriggerServerEvent('mri_Qemotemenu:server:saveSettings', settings)
    end)
end

---Descarrega imediatamente o que estiver pendente.
function FlushSettings()
    if not dirty then return end
    dirty = false
    TriggerServerEvent('mri_Qemotemenu:server:saveSettings', settings)
end

local function hydrate()
    if not AwaitCatalog() then return end

    local data = lib.callback.await('mri_Qemotemenu:getSettings', false)
    if type(data) ~= 'table' then return end

    settings = data.settings or {}
    IsEmoteAdmin = data.isAdmin and true or false

    SetFavoritesLocal(settings.favorites or {})
    ApplyServerSlots(data.defaults, data.binds)

    RestoreWalkStyle()
    RestoreExpression()
end

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    hydrate()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(2000)
    hydrate()
end)

AddEventHandler('playerSpawned', function()
    Wait(3000)
    if next(settings) == nil then
        hydrate()
    else
        RestoreWalkStyle()
        RestoreExpression()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    FlushSettings()
    settings = {}
    IsEmoteAdmin = false
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    FlushSettings()
end)
