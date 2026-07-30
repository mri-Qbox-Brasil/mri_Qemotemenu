---@diagnostic disable: lowercase-global

-- Emotes sincronizados + broadcast de PTFX.
-- Porta rpemotes-reborn/server/Server.lua com os eventos no namespace do
-- resource e a validacao de distancia endurecida.

local MAX_SYNC_DISTANCE = 3.0

---@param source number
---@param target number
---@return boolean
local function withinRange(source, target)
    local sourcePed = GetPlayerPed(source)
    local targetPed = GetPlayerPed(target)
    if not sourcePed or sourcePed == 0 or not targetPed or targetPed == 0 then return false end

    return #(GetEntityCoords(sourcePed) - GetEntityCoords(targetPed)) <= MAX_SYNC_DISTANCE
end

RegisterNetEvent('mri_Qemotemenu:server:requestEmote', function(target, emotename, etype)
    local source = source
    target = tonumber(target)

    if not target or target <= 0 then return end
    if type(emotename) ~= 'string' or #emotename > 64 then return end
    if Player(source).state.canEmote == false then return end
    if not withinRange(source, target) then return end

    TriggerClientEvent('mri_Qemotemenu:client:requestEmote', target, emotename, etype, source)
end)

RegisterNetEvent('mri_Qemotemenu:server:confirmEmote', function(target, requestedEmote, otherEmote)
    local source = source
    target = tonumber(target)

    if not target or target <= 0 then return end
    if type(requestedEmote) ~= 'string' or #requestedEmote > 64 then return end
    if type(otherEmote) ~= 'string' or #otherEmote > 64 then return end
    if not withinRange(source, target) then return end

    TriggerClientEvent('mri_Qemotemenu:client:syncEmote', source, otherEmote, target)
    TriggerClientEvent('mri_Qemotemenu:client:syncEmoteSource', target, requestedEmote, source)
end)

RegisterNetEvent('mri_Qemotemenu:server:cancelEmote', function(target)
    local source = source
    target = tonumber(target)
    if not target or target <= 0 then return end

    TriggerClientEvent('mri_Qemotemenu:client:cancelEmote', target, source)
end)

-- ============================================================
-- PTFX
-- ============================================================

RegisterNetEvent('mri_Qemotemenu:server:ptfxSync', function(asset, name, offset, rot, bone, scale, color)
    local source = source

    -- O original usava assert(), que derruba o handler e polui o console quando
    -- alguem manda payload torto. Aqui so descartamos.
    if type(asset) ~= 'string' or type(name) ~= 'string' then return end
    if type(offset) ~= 'vector3' or type(rot) ~= 'vector3' then return end

    local state = Player(source).state
    state:set('ptfxAsset', asset, true)
    state:set('ptfxName', name, true)
    state:set('ptfxOffset', offset, true)
    state:set('ptfxRot', rot, true)
    state:set('ptfxBone', bone, true)
    state:set('ptfxScale', scale, true)
    state:set('ptfxColor', color, true)
    state:set('ptfxPropNet', nil, true)
    state:set('ptfx', nil, true)
end)

RegisterNetEvent('mri_Qemotemenu:server:ptfxSyncProp', function(propNet)
    local source = source
    local state = Player(source).state

    if propNet then
        local attempts = 0
        repeat
            local entity = NetworkGetEntityFromNetworkId(propNet)
            if entity and DoesEntityExist(entity) then
                state:set('ptfxPropNet', propNet, true)
                return
            end
            attempts = attempts + 1
            Wait(10)
        until attempts >= 100

        lib.print.warn(('Nao achei a entidade do propNet %s apos 100 tentativas (source %s)')
            :format(tostring(propNet), tostring(source)))
    end

    state:set('ptfxPropNet', nil, true)
end)

-- Limpa os statebags de PTFX ao sair, senao o proximo player que herdar o id
-- pode reaproveitar particula alheia.
AddEventHandler('playerDropped', function()
    local source = source
    local state = Player(source).state
    state:set('ptfx', nil, true)
    state:set('ptfxPropNet', nil, true)
end)
