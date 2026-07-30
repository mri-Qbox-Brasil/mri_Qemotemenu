---@diagnostic disable: lowercase-global

-- Emotes sincronizados (dupla). Porta rpemotes-reborn/client/Syncing.lua com os
-- eventos renomeados para o namespace do resource.

local isRequestAnim = false
local targetPlayerId = nil

---@param ped number
---@param targetPed number
---@param options table
local function attachTo(ped, targetPed, options)
    AttachEntityToEntity(ped, targetPed, GetPedBoneIndex(targetPed, options.bone or -1),
        options.pos.x, options.pos.y, options.pos.z,
        options.rot.x, options.rot.y, options.rot.z,
        false, false, false, true, 1, true)
end

---Lista os emotes sincronizados disponiveis.
function ListSharedEmotes()
    local names = {}
    for name, data in PairsByKeys(EmoteData) do
        if type(data) == 'table' and data.category == Category.SHARED then
            names[#names + 1] = name
        end
    end
    NotifyLong(table.concat(names, ', '))
end

---@param emotename string
function RequestSharedEmote(emotename)
    if not LocalPlayer.state.canEmote then return end

    if IsPedInAnyVehicle(cache.ped, true) then
        Notify(locale('not_in_a_vehicle'), 'error')
        return
    end

    local target, distance = GetClosestPlayer()
    if not target or distance == -1 or distance >= 3 then
        Notify(locale('nobodyclose'), 'error')
        return
    end

    local emote = EmoteData[emotename]
    if not emote or emote.category ~= Category.SHARED then
        Notify(("'%s' %s"):format(emotename, locale('notvalidsharedemote')), 'error')
        return
    end

    TriggerServerEvent('mri_Qemotemenu:server:requestEmote', GetPlayerServerId(target), emotename)
    Notify(('%s %s (%s)'):format(locale('sentrequestto'), GetPlayerName(target), emote.label))
end

RegisterNetEvent('mri_Qemotemenu:client:syncEmote', function(emote, player)
    EmoteCancel()
    Wait(300)

    targetPlayerId = player
    local plyId = GetPlayerFromServerId(player)
    local otherPed = GetPlayerPed(plyId ~= 0 and plyId or GetClosestPlayer())

    if IsPedInAnyVehicle(otherPed, true) then
        Notify(locale('not_in_a_vehicle'), 'error')
        return
    end

    local data = EmoteData[emote]
    if not data then
        DebugPrint('syncEmote: emote nao encontrado ' .. tostring(emote))
        return
    end

    local options = data.AnimationOptions
    if options and options.Attachto then
        local targetEmote = data.secondPlayersAnim
        local targetOptions = targetEmote and EmoteData[targetEmote] and EmoteData[targetEmote].AnimationOptions

        -- So o "lado passivo" se anexa. Se o emote do parceiro tambem tem
        -- Attachto, ele que faz — anexar os dois trava um no outro.
        if not (targetOptions and targetOptions.Attachto) then
            attachTo(cache.ped, otherPed, options)
        end
    end

    OnEmotePlay(emote)
end)

RegisterNetEvent('mri_Qemotemenu:client:syncEmoteSource', function(emote, player)
    local ped = cache.ped
    local plyId = GetPlayerFromServerId(player)
    local otherPed = GetPlayerPed(plyId ~= 0 and plyId or GetClosestPlayer())

    if IsPedInAnyVehicle(ped, true) or IsPedInAnyVehicle(otherPed, true) then
        Notify(locale('not_in_a_vehicle'), 'error')
        return
    end

    local data = EmoteData[emote]
    if not data then return end

    local options = data.AnimationOptions
    if options and options.Attachto then
        attachTo(ped, otherPed, options)
    end

    local offset = (options and options.syncOffset) or vector4(0.0, 1.0, 0.0, 180.0)
    local coords = GetOffsetFromEntityInWorldCoords(otherPed, offset.x + 0.0, offset.y + 0.0, offset.z + 0.0)
    SetEntityHeading(ped, GetEntityHeading(otherPed) - offset.w + 0.0)
    SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z)

    EmoteCancel()
    Wait(300)

    targetPlayerId = player
    OnEmotePlay(emote)
end)

RegisterNetEvent('mri_Qemotemenu:client:cancelEmote', function(player)
    if targetPlayerId and targetPlayerId == player then
        targetPlayerId = nil
        EmoteCancel()
    end
end)

function CancelSharedEmote()
    if not targetPlayerId then return end
    TriggerServerEvent('mri_Qemotemenu:server:cancelEmote', targetPlayerId)
    targetPlayerId = nil
end

RegisterNetEvent('mri_Qemotemenu:client:requestEmote', function(emotename, _etype, target)
    local emote = EmoteData[emotename]
    if not emote then return end

    isRequestAnim = true
    PlaySound(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false, 0, true)
    Notify(('%s %s'):format(locale('doyouwanna'), emote.label))

    CreateThread(function()
        local timer = 10000
        while isRequestAnim do
            Wait(5)
            timer = timer - 5

            if timer <= 0 then
                isRequestAnim = false
                Notify(locale('refuseemote'))
                break
            end

            if IsControlJustPressed(1, 246) then -- Y
                isRequestAnim = false
                local otherEmote = emote.secondPlayersAnim or emotename
                TriggerServerEvent('mri_Qemotemenu:server:confirmEmote', target, emotename, otherEmote)
                break
            elseif IsControlJustPressed(1, 182) then -- N
                isRequestAnim = false
                Notify(locale('refuseemote'))
                break
            end
        end
    end)
end)
