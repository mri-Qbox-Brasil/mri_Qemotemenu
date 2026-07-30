---@diagnostic disable: lowercase-global

-- Preview de emote num ped clonado. Dois modos, escolhidos por Config.PreviewMode.
--
-- 'world' (padrao)
--   O clone fica visivel no mundo, reposicionado a cada frame na frente da
--   camera, na altura da coluna central vazia da NUI. E a tecnica que o proprio
--   rpemotes-reborn usava (client/Utils.lua, ShowPedMenu).
--
-- 'scaleform'
--   Entrega o clone para a scaleform do pause menu, como a gh-arenapaintball
--   faz (src/client/modules/home.ts:15-88).
--
-- Por que 'world' e o padrao: o diagnostico in-game mostrou que, no modo
-- scaleform, o clone existia, tinha o dict carregado e estava DE FATO tocando a
-- animacao (`IsEntityPlayingAnim` = true) — mas o pause menu nao o desenhava, e
-- ainda reativava a visibilidade dele no mundo, deixando um sosia animando em
-- cima do jogador. A referencia da arena so mostra um ped parado, entao nunca
-- houve prova de que aquela scaleform aceita animacao arbitraria.

---@type number? handle do ped clonado (lido por props.lua e emote.lua)
PreviewPed = nil
PreviewActive = false

local previewingEmote = nil
local tickRunning = false

local function isScaleform()
    return Config.PreviewMode == 'scaleform'
end

---Cria o clone local do jogador.
---@return boolean
local function spawnClone()
    local ped = cache.ped
    if not DoesEntityExist(ped) then return false end

    -- isNetwork = false: o clone e local, nenhum outro jogador enxerga.
    PreviewPed = ClonePed(ped, false, false, false)
    if not PreviewPed or PreviewPed == 0 then return false end

    SetEntityCollision(PreviewPed, false, false)
    SetEntityInvincible(PreviewPed, true)
    SetEntityCanBeDamaged(PreviewPed, false)
    SetBlockingOfNonTemporaryEvents(PreviewPed, true)
    NetworkSetEntityInvisibleToNetwork(PreviewPed, true)
    FreezeEntityPosition(PreviewPed, true)

    return true
end

-- ============================================================
-- Modo 'world'
-- ============================================================

---Mantem o clone plantado na frente da camera, na coluna central da NUI.
local function runWorldTick()
    CreateThread(function()
        -- Media movel das ultimas posicoes: sem isso o ped treme junto com
        -- qualquer micro-movimento da camera.
        local buffer, bufferSize = {}, 5

        while tickRunning and PreviewPed and DoesEntityExist(PreviewPed) do
            local world, normal = GetWorldCoordFromScreenCoord(Config.PreviewScreenX, Config.PreviewScreenY)
            local target = world + normal * Config.PreviewDepth

            buffer[#buffer + 1] = target
            if #buffer > bufferSize then table.remove(buffer, 1) end

            local averaged = vector3(0.0, 0.0, 0.0)
            for i = 1, #buffer do averaged = averaged + buffer[i] end
            averaged = averaged / #buffer

            SetEntityCoordsNoOffset(PreviewPed, averaged.x, averaged.y, averaged.z, false, false, false)

            local camRot = GetGameplayCamRot(2)
            SetEntityRotation(PreviewPed, 0.0, 0.0, camRot.z + Config.PreviewHeadingOffset, 2, false)

            Wait(0)
        end
    end)
end

-- ============================================================
-- Modo 'scaleform'
-- ============================================================

local function runScaleformTick()
    CreateThread(function()
        while tickRunning do
            DisableAllControlActions(0)
            EnableControlAction(0, 1, true)   -- look left/right
            EnableControlAction(0, 2, true)   -- look up/down
            EnableControlAction(0, 245, true) -- chat

            -- Impede o jogador de fechar o frontend por baixo da NUI.
            DisableControlAction(0, 177, true)
            DisableControlAction(0, 200, true)
            DisableControlAction(0, 202, true)
            DisableControlAction(0, 322, true)

            InvalidateIdleCam()
            InvalidateVehicleIdleCam()

            -- O frontend reaplica o estado do ped a cada frame — inclusive a
            -- visibilidade, o que deixa o clone aparecendo no mundo em cima do
            -- jogador. Por isso reforcamos os tres aqui.
            SetPauseMenuPedSleepState(Config.PreviewSleepState)
            SetPauseMenuPedLighting(true)
            if PreviewPed and DoesEntityExist(PreviewPed) then
                SetEntityVisible(PreviewPed, false, false)
            end

            Wait(0)
        end
    end)
end

-- ============================================================
-- API
-- ============================================================

---Abre o preview. Idempotente.
---@return boolean
function OpenPreview()
    if not Config.PreviewPed then return false end
    if PreviewActive then return true end
    if not spawnClone() then return false end

    if isScaleform() then
        SetEntityVisible(PreviewPed, false, false)

        ActivateFrontendMenu(`FE_MENU_VERSION_EMPTY_NO_BACKGROUND`, false, -1)

        -- Obrigatorio: sem esse respiro a engine ainda nao montou o menu e o
        -- ped simplesmente nao aparece, sem erro nenhum.
        Wait(100)

        GivePedToPauseMenu(PreviewPed, Config.PreviewPedSlot)
        SetPauseMenuPedLighting(true)
        SetPauseMenuPedSleepState(Config.PreviewSleepState)
        SetMouseCursorVisibleInMenus(false)
    else
        SetEntityVisible(PreviewPed, true, false)
        SetEntityAlpha(PreviewPed, 255, false)
    end

    if Config.PreviewBlur then
        SetTimecycleModifier('hud_def_blur')
        SetTimecycleModifierStrength(1.0)
    end

    PreviewActive = true
    tickRunning = true

    if isScaleform() then
        runScaleformTick()
    else
        runWorldTick()
    end

    return true
end

---Toca um emote no ped de preview.
---@param name string
---@param textureVariation? integer
---@return boolean
function PreviewEmote(name, textureVariation)
    if not PreviewActive or not PreviewPed or not DoesEntityExist(PreviewPed) then return false end
    if not EmoteData[name] then return false end

    previewingEmote = name

    local emote = EmoteData[name]
    if emote.category == Category.EXPRESSIONS then
        SetFacialIdleAnimOverride(PreviewPed, emote.anim, 0)
        return true
    end

    if emote.category == Category.WALKS then
        -- Walk nao tem como ser mostrado num ped parado.
        return false
    end

    DestroyAllProps(true)
    ClearPedTasks(PreviewPed)

    -- PlayEmoteOnPed e nao OnEmotePlay: o segundo e global e pode estar
    -- embrulhado por outro modulo (ver client/emote.lua).
    local ok = PlayEmoteOnPed(name, textureVariation, PreviewPed)
    if not ok then return false end

    if isScaleform() and Config.PreviewRegiveOnPlay then
        GivePedToPauseMenu(PreviewPed, Config.PreviewPedSlot)
        SetPauseMenuPedSleepState(Config.PreviewSleepState)
        SetPauseMenuPedLighting(true)
    end

    return true
end

function ClearPreviewEmote()
    if not PreviewPed or not DoesEntityExist(PreviewPed) then return end
    previewingEmote = nil
    DestroyAllProps(true)
    ClearPedTasksImmediately(PreviewPed)
end

---@return string?
function GetPreviewingEmote()
    return previewingEmote
end

---Estado bruto do preview. Serve para separar "a entidade sumiu" de "a
---entidade esta viva e tocando a animacao, mas nao esta sendo desenhada" —
---sao problemas diferentes e a tela sozinha nao distingue os dois.
---@return table
function GetPreviewDiagnostics()
    local ped = PreviewPed
    local alive = ped and ped ~= 0 and DoesEntityExist(ped) or false

    local emote = previewingEmote and EmoteData[previewingEmote] or nil
    local playing = nil
    if alive and emote and emote.dict and emote.anim then
        playing = IsEntityPlayingAnim(ped, emote.dict, emote.anim, 3)
    end

    return {
        mode           = Config.PreviewMode,
        previewActive  = PreviewActive,
        pauseMenuOpen  = IsPauseMenuActive(),
        pedHandle      = ped or 0,
        pedExists      = alive,
        pedVisible     = alive and IsEntityVisible(ped) or false,
        pedFrozen      = alive and IsEntityPositionFrozen(ped) or false,
        emote          = previewingEmote,
        emoteDict      = emote and emote.dict or nil,
        emoteAnim      = emote and emote.anim or nil,
        dictLoaded     = (emote and emote.dict) and HasAnimDictLoaded(emote.dict) or false,
        playingAnim    = playing,
        distanceToPed  = alive and #(GetEntityCoords(cache.ped) - GetEntityCoords(ped)) or -1,
    }
end

---Fecha o preview. A ordem importa: tick -> cursor -> frontend -> ped ->
---timecycle. Trocar a ordem deixa ped fantasma na tela ou blur preso.
function ClosePreview()
    if not PreviewActive then return end

    tickRunning = false
    previewingEmote = nil

    if isScaleform() then
        SetMouseCursorVisibleInMenus(true)
        SetFrontendActive(false)
    end

    DestroyAllProps(true)

    if PreviewPed and DoesEntityExist(PreviewPed) then
        DeleteEntity(PreviewPed)
    end
    PreviewPed = nil

    -- Sem isto o mundo fica borrado depois que o menu fecha.
    ClearTimecycleModifier()
    SetTimecycleModifierStrength(1.0)

    PreviewActive = false
end

---Export usado pelo core_cinematics para excluir o ped de preview das gravacoes
---(core_cinematics/client/main.lua ~694). Retorna 0 quando nao ha preview — o
---consumidor compara com `ped ~= menuPed`, entao nil quebraria a comparacao.
exports('GetMenuPed', function()
    if type(PreviewPed) == 'number' and PreviewPed ~= 0 and DoesEntityExist(PreviewPed) then
        return PreviewPed
    end
    return 0
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    ClosePreview()
end)
