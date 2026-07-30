---@diagnostic disable: lowercase-global

-- Motor de playback. Porta rpemotes-reborn/client/Emote.lua.
--
-- Diferenca principal do original: `OnEmotePlay` aceita um `targetPed`. Quando
-- ele e passado (preview de ped, ou `playEmoteByCommand(cmd, variant, ped)` do
-- scully), o emote roda naquele ped SEM mexer nos statebags do player, sem
-- sincronizar PTFX pela rede e com props locais. Sem isso, animar um NPC
-- apagaria os props do proprio player — bug que existe no scully ate hoje.

IsInAnimation = false
CurrentAnimationName = nil
CurrentTextureVariation = nil
InHandsup = false

---@type ScenarioType
local ChosenScenarioType
local CurrentAnimOptions
local PlayerGender = 'male'
local PtfxNotif = false
local PtfxPrompt = false
local AnimationThreadStatus = false
local CheckStatus = false
local InExitEmote = false
local ExitAndPlay = false
local EmoteCancelPlaying = false
local currentEmote = {}

CreateThread(function()
    LocalPlayer.state:set('canEmote', true, true)
    LocalPlayer.state:set('canCancel', true, true)
end)

-- ============================================================
-- Threads auxiliares
-- ============================================================

local function runAnimationThread()
    if AnimationThreadStatus then return end
    AnimationThreadStatus = true

    CreateThread(function()
        while AnimationThreadStatus and (IsInAnimation or PtfxPrompt) do
            local sleep = 500

            if IsInAnimation then
                sleep = 0
                if IsPlayerAiming(cache.playerId) then
                    EmoteCancel()
                end
                if not Config.AllowPunchingDuringEmote then
                    DisableControlAction(2, 140, true)
                    DisableControlAction(2, 141, true)
                    DisableControlAction(2, 142, true)
                end
            end

            if PtfxPrompt and CurrentAnimOptions then
                sleep = 0
                if not PtfxNotif then
                    Notify(CurrentAnimOptions.PtfxInfo or locale('ptfxinfo'))
                    PtfxNotif = true
                end
                if IsControlPressed(0, 47) then
                    PtfxStart()
                    Wait(CurrentAnimOptions.PtfxWait or 0)
                    if CurrentAnimOptions.PtfxCanHold then
                        while IsControlPressed(0, 47) and IsInAnimation and AnimationThreadStatus do
                            Wait(5)
                        end
                    end
                    PtfxStop()
                end
            end

            Wait(sleep)
        end
    end)
end

---Vigia a animacao e cancela quando ela termina sozinha.
local function checkStatusThread(dict, anim)
    CreateThread(function()
        if CheckStatus then
            CheckStatus = false
            Wait(10)
        end
        CheckStatus = true

        while not IsEntityPlayingAnim(cache.ped, dict, anim, 3) do
            Wait(5)
        end

        while CheckStatus and IsInAnimation do
            if not IsEntityPlayingAnim(cache.ped, dict, anim, 3) then
                DestroyAllProps()
                EmoteCancel()
                break
            end
            Wait(0)
        end
    end)
end

local function exitScenario()
    if (ChosenScenarioType == ScenarioType.MALE or ChosenScenarioType == ScenarioType.SCENARIO)
        and IsInAnimation then
        ClearPedTasksImmediately(cache.ped)
        IsInAnimation = false
    end
end

local function checkGender()
    PlayerGender = GetEntityModel(cache.ped) == `mp_f_freemode_01` and 'female' or 'male'
end

-- ============================================================
-- Cancelamento
-- ============================================================

---@param force? boolean ignora o statebag canCancel
function EmoteCancel(force)
    if not LocalPlayer.state.canCancel and not force then return end

    LocalPlayer.state:set('currentEmote', nil, true)
    EmoteCancelPlaying = true

    if InExitEmote then return end

    exitScenario()

    PtfxNotif = false
    PtfxPrompt = false
    Pointing = false

    if IsInAnimation then
        local ped = cache.ped
        if LocalPlayer.state.ptfx then
            PtfxStop()
        end
        DetachEntity(ped, true, false)
        CancelSharedEmote()

        if CurrentAnimOptions and CurrentAnimOptions.ExitEmote then
            local exitName = CurrentAnimOptions.ExitEmote

            if not EmoteData[exitName] then
                DebugPrint('Exit emote invalido: ' .. tostring(exitName))
                IsInAnimation = false
                ClearPedTasks(ped)
                return
            end

            OnEmotePlay(exitName)

            local exitOptions = EmoteData[exitName].AnimationOptions
            if exitOptions and exitOptions.EmoteDuration then
                InExitEmote = true
                SetTimeout(exitOptions.EmoteDuration, function()
                    InExitEmote = false
                    DestroyAllProps()
                    ClearPedTasks(ped)
                    EmoteCancelPlaying = false
                end)
                return
            end
        else
            IsInAnimation = false
            ClearPedTasks(ped)
            EmoteCancelPlaying = false
        end

        DestroyAllProps()
    end

    CleanScenarioObjects(cache.ped)
    AnimationThreadStatus = false
    CheckStatus = false
end

local function playExitAndEnterEmote(name, textureVariation)
    if not LocalPlayer.state.canCancel then return end
    ExitAndPlay = true

    local ped = cache.ped
    exitScenario()

    PtfxNotif = false
    PtfxPrompt = false
    Pointing = false

    if LocalPlayer.state.ptfx then
        PtfxStop()
    end
    DetachEntity(ped, true, false)
    CancelSharedEmote()

    if CurrentAnimOptions and CurrentAnimOptions.ExitEmote then
        local exitName = CurrentAnimOptions.ExitEmote

        if not EmoteData[exitName] then
            ClearPedTasks(ped)
            IsInAnimation = false
            ExitAndPlay = false
            return
        end

        OnEmotePlay(exitName)

        local exitOptions = EmoteData[exitName].AnimationOptions
        if exitOptions and exitOptions.EmoteDuration then
            InExitEmote = true
            SetTimeout(exitOptions.EmoteDuration, function()
                InExitEmote = false
                DestroyAllProps(true)
                ClearPedTasks(ped)
                OnEmotePlay(name, textureVariation)
                ExitAndPlay = false
            end)
            return
        end
    else
        ClearPedTasks(ped)
        IsInAnimation = false
        ExitAndPlay = false
        DestroyAllProps(true)
        OnEmotePlay(name, textureVariation)
    end
end

-- ============================================================
-- Scenarios
-- ============================================================

---@param emoteData table
---@param targetPed number
---@return boolean ok
local function playScenario(emoteData, targetPed)
    local isPlayer = targetPed == cache.ped

    if isPlayer then
        checkGender()
        ClearPedTasks(targetPed)
        DestroyAllProps()
    else
        ClearPedTasks(targetPed)
    end

    if emoteData.scenarioType == ScenarioType.MALE then
        if isPlayer and PlayerGender ~= 'male' then
            EmoteCancel()
            Notify(locale('maleonly'), 'error')
            return false
        end
        TaskStartScenarioInPlace(targetPed, emoteData.scenario, 0, true)
    elseif emoteData.scenarioType == ScenarioType.OBJECT then
        local behind = GetOffsetFromEntityInWorldCoords(targetPed, 0.0, -0.5, -0.5)
        TaskStartScenarioAtPosition(targetPed, emoteData.scenario, behind.x, behind.y, behind.z,
            GetEntityHeading(targetPed), 0, true, false)
    else
        TaskStartScenarioInPlace(targetPed, emoteData.scenario, 0, true)
    end

    if isPlayer then
        IsInAnimation = true
        runAnimationThread()
    end

    return true
end

-- ============================================================
-- Playback
-- ============================================================

---Toca um emote.
---@param name string
---@param textureVariation? integer
---@param targetPed? number quando setado, roda no ped indicado (preview / NPC)
function OnEmotePlay(name, textureVariation, targetPed)
    local emoteData = EmoteData[name]
    if not emoteData then
        Notify(("'%s' %s"):format(tostring(name), locale('notvalidemote')), 'error')
        return false
    end

    local isPlayer = not targetPed or targetPed == cache.ped
    local ped = targetPed or cache.ped

    if not DoesEntityExist(ped) then return false end

    -- --------------------------------------------------------
    -- Caminho do ped alvo (preview / NPC): nada de statebag,
    -- nada de sync pela rede, props locais.
    -- --------------------------------------------------------
    if not isPlayer then
        CleanScenarioObjects(ped)

        local animOption = emoteData.AnimationOptions
        local isClone = ped == PreviewPed

        if animOption and animOption.Prop then
            DestroyAllProps(isClone)
        end

        if emoteData.scenario then
            DestroyAllProps(isClone)
            return playScenario(emoteData, ped)
        end

        if not LoadAnim(emoteData.dict) then
            DebugPrint(("dict invalido para '%s'"):format(name))
            return false
        end

        if IsPedUsingAnyScenario(ped) or IsPedActiveInScenario(ped) then
            ClearPedTasksImmediately(ped)
        end

        local flag = (animOption and (animOption.Flag or animOption.onFootFlag)) or 0
        TaskPlayAnim(ped, emoteData.dict, emoteData.anim, 5.0, 5.0,
            (animOption and animOption.EmoteDuration) or -1, flag, 0, false, false, false)
        RemoveAnimDict(emoteData.dict)

        if animOption and animOption.Prop then
            AddProps(animOption, textureVariation, isClone, ped)
        end

        return true
    end

    -- --------------------------------------------------------
    -- Caminho do player
    -- --------------------------------------------------------
    if not LocalPlayer.state.canEmote then return false end

    CleanScenarioObjects(ped)

    local inVehicle = IsPedInAnyVehicle(ped, true)
    Pointing = false

    if not Config.AllowEmoteInVehicle and inVehicle then return false end

    if Config.AdultEmotesDisabled and emoteData.AdultAnimation then
        Notify(locale('adultemotedisabled'), 'error')
        return false
    end

    if InExitEmote then return false end

    if Config.CancelPreviousEmote and IsInAnimation and not ExitAndPlay and not EmoteCancelPlaying then
        playExitAndEnterEmote(name, textureVariation)
        return true
    end

    local animOption = emoteData.AnimationOptions
    if animOption then
        if inVehicle and animOption.vehicleRequirement == VehicleRequirement.NOT_ALLOWED then
            Notify(locale('not_in_a_vehicle'), 'error')
            return false
        elseif not inVehicle and animOption.vehicleRequirement == VehicleRequirement.REQUIRED then
            Notify(locale('in_a_vehicle'), 'error')
            return false
        end
    end

    -- Nao interrompe um emote que tem exit proprio por outro com exit diferente.
    if CurrentAnimOptions and CurrentAnimOptions.ExitEmote
        and animOption and animOption.ExitEmote
        and CurrentAnimOptions.ExitEmote ~= animOption.ExitEmote
        and EmoteData[CurrentAnimOptions.ExitEmote]
        and EmoteData[CurrentAnimOptions.ExitEmote].anim ~= emoteData.anim then
        return false
    end

    if IsInActionWithErrorMessage() then return false end

    ChosenScenarioType = emoteData.scenarioType
    CurrentAnimationName = name
    CurrentTextureVariation = textureVariation
    CurrentAnimOptions = animOption
    LocalPlayer.state:set('currentEmote', name, true)

    if Config.DisarmPlayerOnEmote and IsPedArmed(ped, 7) then
        SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
    end

    if animOption and animOption.Prop then
        DestroyAllProps()
    end

    if emoteData.scenario then
        if not inVehicle then
            playScenario(emoteData, ped)
        end
        return true
    end

    if animOption and animOption.StartDelay then
        Wait(animOption.StartDelay)
    end

    if not LoadAnim(emoteData.dict) then
        Notify(("'%s' %s"):format(name, locale('notvalidemote')), 'error')
        return false
    end

    local movementType = 0
    if inVehicle then
        movementType = (animOption and animOption.FullBody) and 35 or 51
    elseif animOption and animOption.onFootFlag then
        movementType = animOption.onFootFlag
    end

    if animOption and animOption.PtfxAsset then
        local p1, p2, p3, p4, p5, p6, scale = table.unpack(animOption.PtfxPlacement)
        PtfxNotif = false
        PtfxPrompt = true
        runAnimationThread()
        TriggerServerEvent('mri_Qemotemenu:server:ptfxSync', animOption.PtfxAsset, animOption.PtfxName,
            vector3(p1, p2, p3), vector3(p4, p5, p6), animOption.PtfxBone, scale, animOption.PtfxColor)
    else
        PtfxPrompt = false
    end

    if IsPedUsingAnyScenario(ped) or IsPedActiveInScenario(ped) then
        ClearPedTasksImmediately(ped)
    end

    TaskPlayAnim(ped, emoteData.dict, emoteData.anim,
        (animOption and animOption.BlendInSpeed) or 5.0,
        (animOption and animOption.BlendOutSpeed) or 5.0,
        (animOption and animOption.EmoteDuration) or -1,
        (animOption and animOption.Flag) or movementType or 0,
        0, false, false, false)
    RemoveAnimDict(emoteData.dict)

    IsInAnimation = true
    runAnimationThread()

    if not (animOption and animOption.Prop) then
        checkStatusThread(emoteData.dict, emoteData.anim)
    end

    currentEmote = emoteData

    -- Hook do battlepass (gh-pausemenuv2). Customizacao da Ultra City herdada do
    -- fork do rpemotes — preservar.
    if emoteData.category == Category.DANCES or emoteData.category == 'CustomDances' then
        TriggerServerEvent('battlepass:client:track', 'dance', { category = emoteData.category })
    end

    if animOption and animOption.Prop then
        AddProps(animOption, textureVariation)
        if animOption.PtfxAsset and not animOption.PtfxNoProp and AttachedProp then
            TriggerServerEvent('mri_Qemotemenu:server:ptfxSyncProp', ObjToNet(AttachedProp))
        end
    end

    return true
end

-- Referencia ao motor capturada AGORA, no load deste arquivo.
--
-- `OnEmotePlay` e um global e existe pelo menos um wrapper legitimo em cima dele
-- (client/cinematics.lua, que espelha o emote ativo para o core_cinematics).
-- Um wrapper que esqueca de repassar o 3o argumento faria o preview do menu
-- tocar no ped REAL do jogador. Quem toca em ped alvo passa por aqui e nao
-- depende de wrapper nenhum se comportar.
local engine = OnEmotePlay

---Toca um emote num ped especifico (preview do menu, NPC).
---@param name string
---@param textureVariation? integer
---@param targetPed number
---@return boolean
function PlayEmoteOnPed(name, textureVariation, targetPed)
    if not targetPed or targetPed == 0 then return false end
    return engine(name, textureVariation, targetPed) and true or false
end

---Emotes de animal so funcionam se o player estiver com o ped certo.
---@param name string
local function checkAnimalAndPlay(name)
    local ped = cache.ped
    local isValidPet = false
    local prefix = name:sub(1, 4)

    local list = (prefix == 'bdog' and BigDogs) or (prefix == 'sdog' and SmallDogs) or nil
    if list then
        for _, model in ipairs(list) do
            if IsPedModel(ped, joaat(model)) then
                isValidPet = true
                break
            end
        end
    end

    if isValidPet then
        OnEmotePlay(name)
    else
        Notify(locale('notvalidpet'), 'error')
    end
end

---Ponto de entrada do menu.
---@param name string
---@param category string
---@param textureVariation? integer
function EmoteMenuStart(name, category, textureVariation)
    local emote = EmoteData[name]
    if not emote or emote.category ~= category then return false end

    if category == Category.EXPRESSIONS then
        SetPlayerPedExpression(name, true)
        return true
    end

    if category == Category.WALKS then
        SetWalkStyle(name, true)
        return true
    end

    if emote.category == Category.ANIMAL_EMOTES then
        checkAnimalAndPlay(name)
        return true
    end

    return OnEmotePlay(name, textureVariation)
end

---Ponto de entrada do comando /e. `args` e um array: { nome, variacao }.
---@param args table
function EmoteCommandStart(args)
    if type(args) ~= 'table' or #args <= 0 then return end
    if not AwaitCatalog(5000) then
        Notify(locale('catalog_loading'), 'error')
        return
    end

    local ped = cache.ped

    if IsEntityDead(ped) or IsPedRagdoll(ped) or IsPedGettingUp(ped) or IsPedInMeleeCombat(ped) then
        Notify(locale('dead'), 'error')
        return
    end

    if (IsPedSwimming(ped) or IsPedSwimmingUnderWater(ped)) and not Config.AllowInWater then
        Notify(locale('swimming'), 'error')
        return
    end

    local name = tostring(args[1]):lower()

    if name == 'c' then
        if IsInAnimation then
            EmoteCancel()
        else
            Notify(locale('nocancel'), 'error')
        end
        return
    end

    local emote = EmoteData[name]
    if not emote then
        Notify(("'%s' %s"):format(name, locale('notvalidemote')), 'error')
        return
    end

    if emote.category == Category.ANIMAL_EMOTES then
        if Config.AnimalEmotesEnabled then
            checkAnimalAndPlay(name)
        else
            Notify(locale('animaldisabled'), 'error')
        end
        return
    end

    if emote.category == Category.PROP_EMOTES
        and emote.AnimationOptions and emote.AnimationOptions.PropTextureVariations then
        local variations = emote.AnimationOptions.PropTextureVariations
        local wanted = tonumber(args[2])

        if wanted and variations[wanted] then
            OnEmotePlay(name, variations[wanted].Value or (wanted - 1))
        else
            local list = {}
            for k, v in ipairs(variations) do
                list[#list + 1] = ('(%s) %s'):format(k, (v.Name:gsub('<[^>]+>', '')))
            end
            NotifyLong(('%s\n%s'):format(locale('invalidvariation'), table.concat(list, '  ')))
            OnEmotePlay(name, 0)
        end
        return
    end

    OnEmotePlay(name)
end

---@return table? emoteData
function GetCurrentEmote()
    return currentEmote
end

-- ============================================================
-- Recuperacao de animacao interrompida pelo jogo
-- ============================================================

local openingDoor = false
AddEventHandler('CEventOpenDoor', function(entities)
    if entities[1] ~= cache.ped then return end
    if PreviewActive or not IsInAnimation or openingDoor then return end

    openingDoor = true
    while IsPedOpeningADoor(cache.ped) do
        Wait(100)
    end
    openingDoor = false

    Wait(200)
    ClearPedTasks(cache.ped)
    DestroyAllProps()
    OnEmotePlay(CurrentAnimationName, CurrentTextureVariation)
end)

local isBumpingPed = false
local bumpTimeout = 500
AddEventHandler('CEventPlayerCollisionWithPed', function(entities)
    if entities[1] ~= cache.ped then return end
    if not IsInAnimation then return end

    if isBumpingPed then
        bumpTimeout = 500
        return
    end

    isBumpingPed = true
    bumpTimeout = 500

    while bumpTimeout > 0 do
        Wait(100)
        bumpTimeout = bumpTimeout - 100
    end

    isBumpingPed = false
    if not IsInAnimation then return end

    ClearPedTasks(cache.ped)
    Wait(125)
    DestroyAllProps()
    OnEmotePlay(CurrentAnimationName, CurrentTextureVariation)
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    local ped = PlayerPedId()
    DestroyAllProps()
    DestroyAllProps(true)
    ClearPedTasksImmediately(ped)
    DetachEntity(ped, true, false)
    ResetPedMovementClipset(ped, 0.8)
end)
