---@diagnostic disable: lowercase-global

-- Helpers portados do rpemotes-reborn (client/Utils.lua), com as notificacoes
-- trocadas para ox_lib e o preview de ped movido para client/preview.lua.

function DebugPrint(...)
    if Config.Debug then
        lib.print.debug(...)
    end
end

---Registra um export tambem no alias legado `__cfx_export_rpemotes_*`, que e
---como o rpemotes original expunha as funcoes. Alguns resources da comunidade
---chamam por esse caminho em vez de `exports['rpemotes-reborn']`.
---@param name string
---@param fn function
function CreateExport(name, fn)
    AddEventHandler('__cfx_export_rpemotes_' .. name, function(setCb)
        setCb(function(...) return fn(...) end)
    end)
    exports(name, fn)
end

-- Esta versao do ox_lib normaliza 'inform' -> 'info' internamente
-- (resource/interface/client/notify.lua:66), mas 'info' e o valor canonico.

---@param message string
---@param kind? NotificationType
function Notify(message, kind)
    lib.notify({
        id = 'mri_Qemotemenu',
        title = 'Emotes',
        description = message,
        type = kind or 'info',
        duration = 4000,
    })
end

---Mensagem longa (listagens de comandos, variacoes de textura).
---@param message string
function NotifyLong(message)
    lib.notify({
        title = 'Emotes',
        description = message,
        type = 'info',
        duration = 9000,
    })
end

function FirstToUpper(str)
    return (str:gsub('^%l', string.upper))
end

function IsPlayerAiming(player)
    return (IsPlayerFreeAiming(player) or IsAimCamActive() or IsAimCamThirdPersonActive())
        and tonumber(GetSelectedPedWeapon(player)) ~= tonumber(`WEAPON_UNARMED`)
end

function CanPlayerCrouchCrawl(playerPed)
    return IsPedOnFoot(playerPed)
        and not IsPedJumping(playerPed)
        and not IsPedFalling(playerPed)
        and not IsPedInjured(playerPed)
        and not IsPedInMeleeCombat(playerPed)
        and not IsPedRagdoll(playerPed)
end

function PlayAnimOnce(playerPed, animDict, animName, blendInSpeed, blendOutSpeed, duration, startTime)
    LoadAnim(animDict)
    TaskPlayAnim(playerPed, animDict, animName, blendInSpeed or 2.0, blendOutSpeed or 2.0, duration or -1, 0,
        startTime or 0.0, false, false, false)
    RemoveAnimDict(animDict)
end

function ChangeHeadingSmooth(playerPed, amount, time)
    local times = math.abs(amount)
    if times == 0 then return end
    local step = amount / times
    local wait = time / times

    for _ = 1, times do
        Wait(wait)
        SetEntityHeading(playerPed, GetEntityHeading(playerPed) + step)
    end
end

function PairsByKeys(t, f)
    local a = {}
    for n in pairs(t) do
        a[#a + 1] = n
    end
    table.sort(a, f)
    local i = 0
    return function()
        i = i + 1
        if a[i] == nil then return nil end
        return a[i], t[a[i]]
    end
end

function LoadAnim(dict)
    if not DoesAnimDictExist(dict) then
        return false
    end

    local timeout = 2000
    while not HasAnimDictLoaded(dict) and timeout > 0 do
        RequestAnimDict(dict)
        Wait(5)
        timeout = timeout - 5
    end

    if timeout <= 0 then
        DebugPrint(('Timeout carregando anim dict %s'):format(dict))
        return false
    end
    return true
end

function LoadPropDict(model)
    local hash = joaat(model)
    if HasModelLoaded(hash) then return end

    RequestModel(hash)
    local timeout = 2000
    while not HasModelLoaded(hash) and timeout > 0 do
        Wait(5)
        timeout = timeout - 5
    end

    if timeout <= 0 then
        DebugPrint(('Timeout carregando modelo %s'):format(model))
    end
end

function RequestWalking(set)
    local timeout = GetGameTimer() + 5000
    while not HasAnimSetLoaded(set) and GetGameTimer() < timeout do
        RequestAnimSet(set)
        Wait(5)
    end
    return HasAnimSetLoaded(set)
end

function GetPedInFront()
    local plyPed = cache.ped
    local plyPos = GetEntityCoords(plyPed, false)
    local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
    local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 10.0,
        12, plyPed, 7)
    local _, _, _, _, ped2 = GetShapeTestResult(rayHandle)
    return ped2
end

function GetActivePlayers()
    local players = {}
    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players + 1] = i
        end
    end
    return players
end

function GetClosestPlayer()
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer
    local ped = cache.ped
    local pedCoords = GetEntityCoords(ped, false)

    for _, value in ipairs(players) do
        local target = GetPlayerPed(value)
        if target ~= ped then
            local targetCoords = GetEntityCoords(target, false)
            local distance = #(targetCoords - pedCoords)
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end

---Verifica se o player ja esta numa acao que impede tocar emote.
---@param ignores? table chaves: IsProne, IsUsingNewscam, IsUsingBinoculars
function IsInActionWithErrorMessage(ignores)
    ignores = ignores or {}

    if not ignores.IsProne and IsProne then
        Notify(locale('no_anim_crawling'), 'error')
        return true
    end
    if not ignores.IsUsingNewscam and IsUsingNewscam then
        Notify(locale('no_anim_right_now'), 'error')
        return true
    end
    if not ignores.IsUsingBinoculars and IsUsingBinoculars then
        Notify(locale('no_anim_right_now'), 'error')
        return true
    end

    return false
end

function HideHUDThisFrame()
    HideHelpTextThisFrame()
    HideHudAndRadarThisFrame()
    HideHudComponentThisFrame(19) -- weapon wheel
    HideHudComponentThisFrame(1)  -- wanted stars
    HideHudComponentThisFrame(2)  -- weapon icon
    HideHudComponentThisFrame(3)  -- cash
    HideHudComponentThisFrame(4)  -- mp cash
    HideHudComponentThisFrame(13) -- cash change
    HideHudComponentThisFrame(11) -- floating help text
    HideHudComponentThisFrame(12) -- more floating help text
    HideHudComponentThisFrame(15) -- subtitle text
    HideHudComponentThisFrame(18) -- game stream
end

---Scaleform de botoes instrucionais (binoculos / newscam).
function SetupButtons(buttons)
    local scaleform = RequestScaleformMovie('instructional_buttons')
    while not HasScaleformMovieLoaded(scaleform) do
        Wait(10)
    end

    PushScaleformMovieFunction(scaleform, 'CLEAR_ALL')
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, 'SET_CLEAR_SPACE')
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    for i, btn in pairs(buttons) do
        PushScaleformMovieFunction(scaleform, 'SET_DATA_SLOT')
        PushScaleformMovieFunctionParameterInt(i - 1)
        ScaleformMovieMethodAddParamPlayerNameString(GetControlInstructionalButton(0, btn.key, true))
        BeginTextCommandScaleformString('STRING')
        AddTextComponentScaleform(btn.text)
        EndTextCommandScaleformString()
        PopScaleformMovieFunctionVoid()
    end

    PushScaleformMovieFunction(scaleform, 'DRAW_INSTRUCTIONAL_BUTTONS')
    PopScaleformMovieFunctionVoid()

    return scaleform
end

function HandleZoomAndCheckRotation(cam, fov)
    local zoomspeed = 10.0
    local lPed = cache.ped

    local fov_max = 70.0
    local fov_min = 10.0
    local speed_lr = 8.0
    local speed_ud = 8.0

    local zoomvalue = (1.0 / (fov_max - fov_min)) * (fov - fov_min)
    local rightAxisX = GetDisabledControlNormal(0, 220)
    local rightAxisY = GetDisabledControlNormal(0, 221)
    local rotation = GetCamRot(cam, 2)

    if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
        local new_z = rotation.z + rightAxisX * -1.0 * speed_ud * (zoomvalue + 0.1)
        local new_x = math.max(math.min(20.0, rotation.x + rightAxisY * -1.0 * speed_lr * (zoomvalue + 0.1)), -29.5)
        SetCamRot(cam, new_x, 0.0, new_z, 2)
    end

    local zoomIn, zoomOut = 241, 242
    if IsPedSittingInAnyVehicle(lPed) then
        zoomIn, zoomOut = 17, 16
    end

    if IsControlJustPressed(0, zoomIn) then
        fov = math.max(fov - zoomspeed, fov_min)
    end
    if IsControlJustPressed(0, zoomOut) then
        fov = math.min(fov + zoomspeed, fov_max)
    end

    local current_fov = GetCamFov(cam)
    if math.abs(fov - current_fov) < 0.1 then
        fov = current_fov
    end
    SetCamFov(cam, current_fov + (fov - current_fov) * 0.05)

    return fov
end
