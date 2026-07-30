---@diagnostic disable: lowercase-global

-- Preview de emote num ped clonado. Dois modos, escolhidos por Config.PreviewMode.
--
-- 'studio' (padrao)
--   O clone e teleportado para um ponto isolado e uma camera propria enquadra
--   ele. Fundo limpo, iluminacao previsivel, enquadramento identico sempre.
--   A camera e a do retrato do qbx_core (client/character.lua:130-174), que ja
--   resolve o enquadramento fora do centro via PointCamAtPedBone com offset
--   lateral — e o que libera o resto da tela para a interface.
--
-- 'world'
--   O clone fica visivel no mundo, reposicionado a cada frame na frente da
--   camera do jogo. Tecnica do proprio rpemotes-reborn (Utils.lua, ShowPedMenu).
--   Mais leve (nao troca a camera, nao streama area nova), mas o ped pega a
--   iluminacao do lugar e pode encostar em geometria.
--
-- NAO existe modo 'scaleform'. O GivePedToPauseMenu desenha o ped mas ignora
-- qualquer task de animacao enquanto o pause menu esta ativo — confirmado na
-- documentacao do native, em duas discussoes de quem tentou o mesmo caso de uso,
-- e no nosso proprio diagnostico in-game (o clone reportava
-- `IsEntityPlayingAnim = true` enquanto a scaleform desenhava a pose dela).
-- A unica animacao que aquela scaleform aceita e a de dormir, que e dela.

---@type number? handle do ped clonado (lido por props.lua e emote.lua)
PreviewPed = nil
PreviewActive = false

local previewingEmote = nil
local tickRunning = false
local previewCam = nil
local playerWasFrozen = false

local HEAD_BONE = 31086

local function isStudio()
    return Config.PreviewMode == 'studio'
end

-- ============================================================
-- Clone
-- ============================================================

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
-- Modo 'studio'
-- ============================================================

---Posiciona o clone no estudio e forca o streaming da area em volta dele.
local function placeCloneInStudio()
    local coords = Config.StudioCoords

    SetEntityCoordsNoOffset(PreviewPed, coords.x, coords.y, coords.z, false, false, false)
    SetEntityHeading(PreviewPed, Config.StudioHeading)
    SetEntityVisible(PreviewPed, true, false)
    SetEntityAlpha(PreviewPed, 255, false)

    -- Sem isto o jogo continua streamando ao redor do jogador e o estudio pode
    -- aparecer vazio no primeiro frame.
    SetFocusEntity(PreviewPed)

    if Config.StudioLoadScene then
        NewLoadSceneStartSphere(coords.x, coords.y, coords.z, 20.0, 0)
        local deadline = GetGameTimer() + 2000
        while not IsNewLoadSceneLoaded() and GetGameTimer() < deadline do
            Wait(0)
        end
        NewLoadSceneStop()
    end
end

---Camera do retrato. Portada de qbx_core/client/character.lua:139-152.
local function setupStudioCam()
    local offset = Config.StudioCamOffset
    local coords = GetOffsetFromEntityInWorldCoords(PreviewPed, offset.x, offset.y, 0.0)

    previewCam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    SetCamActive(previewCam, true)

    -- Corte seco, nao interpolado. O qbx_core usa blend porque la o ped ja esta
    -- no local; aqui o estudio fica do outro lado do mapa, e interpolar faria a
    -- camera atravessar o mundo inteiro voando ate chegar la.
    local blend = Config.StudioCamBlend or 0
    RenderScriptCams(true, blend > 0, blend, true, false)

    SetCamCoord(previewCam, coords.x, coords.y, coords.z + offset.z)
    SetCamFov(previewCam, Config.StudioCamFov)
    SetCamRot(previewCam, 0.0, 0.0, GetEntityHeading(PreviewPed) + 180.0, 2)

    -- O offset lateral e o que empurra o ped para um lado do quadro, liberando o
    -- resto da tela para a NUI. Sem ele o ped fica centralizado atras da lista.
    PointCamAtPedBone(previewCam, PreviewPed, HEAD_BONE, Config.StudioCamLateral, 0.0, 0.03, true)

    if Config.StudioDof then
        SetCamUseShallowDofMode(previewCam, true)
        SetCamNearDof(previewCam, 1.2)
        SetCamFarDof(previewCam, 12.0)
        SetCamDofStrength(previewCam, 1.0)
        SetCamDofMaxNearInFocusDistance(previewCam, 1.0)
    end
end

local function destroyStudioCam()
    if not previewCam then return end

    RenderScriptCams(false, false, 0, true, true)
    SetCamActive(previewCam, false)
    DestroyCam(previewCam, true)
    previewCam = nil
end

local function runStudioTick()
    CreateThread(function()
        while tickRunning do
            -- O DOF raso so vale se isto for chamado a cada frame
            -- (ver 0r-multicharacterv3/client/main.lua:446-453).
            if Config.StudioDof then
                SetUseHiDof()
            end

            DisableAllControlActions(0)
            EnableControlAction(0, 245, true) -- chat

            InvalidateIdleCam()
            InvalidateVehicleIdleCam()

            Wait(0)
        end
    end)
end

-- ============================================================
-- Modo 'world'
-- ============================================================

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
-- API
-- ============================================================

---Abre o preview. Idempotente.
---@return boolean
function OpenPreview()
    if not Config.PreviewPed then return false end
    if PreviewActive then return true end
    if not spawnClone() then return false end

    if Config.FreezePlayerWhileOpen then
        playerWasFrozen = IsEntityPositionFrozen(cache.ped)
        FreezeEntityPosition(cache.ped, true)
    end

    if isStudio() then
        placeCloneInStudio()
        setupStudioCam()

        if Config.StudioTimecycle and Config.StudioTimecycle ~= '' then
            SetTimecycleModifier(Config.StudioTimecycle)
            SetTimecycleModifierStrength(1.0)
        end

        if Config.StudioForceDaytime then
            NetworkOverrideClockTime(12, 0, 0)
        end
    else
        SetEntityVisible(PreviewPed, true, false)
        SetEntityAlpha(PreviewPed, 255, false)

        if Config.PreviewBlur then
            SetTimecycleModifier('hud_def_blur')
            SetTimecycleModifierStrength(1.0)
        end
    end

    PreviewActive = true
    tickRunning = true

    if isStudio() then
        runStudioTick()
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
    return PlayEmoteOnPed(name, textureVariation, PreviewPed)
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
        mode          = Config.PreviewMode,
        previewActive = PreviewActive,
        camHandle     = previewCam or 0,
        camExists     = previewCam and DoesCamExist(previewCam) or false,
        camRendering  = IsCamRendering and previewCam and IsCamRendering(previewCam) or false,
        pedHandle     = ped or 0,
        pedExists     = alive,
        pedVisible    = alive and IsEntityVisible(ped) or false,
        pedCoords     = alive and GetEntityCoords(ped) or nil,
        emote         = previewingEmote,
        emoteDict     = emote and emote.dict or nil,
        emoteAnim     = emote and emote.anim or nil,
        dictLoaded    = (emote and emote.dict) and HasAnimDictLoaded(emote.dict) or false,
        playingAnim   = playing,
    }
end

---Fecha o preview. A ordem importa: tick -> camera -> ped -> jogador ->
---timecycle. Errar deixa a tela presa na camera do estudio ou o mundo borrado.
function ClosePreview()
    if not PreviewActive then return end

    tickRunning = false
    previewingEmote = nil

    destroyStudioCam()
    ClearFocus()

    DestroyAllProps(true)

    if PreviewPed and DoesEntityExist(PreviewPed) then
        DeleteEntity(PreviewPed)
    end
    PreviewPed = nil

    if Config.FreezePlayerWhileOpen and not playerWasFrozen then
        FreezeEntityPosition(cache.ped, false)
    end
    playerWasFrozen = false

    ClearTimecycleModifier()
    SetTimecycleModifierStrength(1.0)

    if Config.StudioForceDaytime then
        NetworkClearClockTimeOverride()
    end

    PreviewActive = false
end

---Reaplica a camera com os valores atuais do Config. Usado pela calibracao
---(/emotepreview), para nao precisar reiniciar o resource a cada ajuste.
function RefreshPreviewCam()
    if not PreviewActive or not isStudio() then return false end

    destroyStudioCam()
    SetEntityHeading(PreviewPed, Config.StudioHeading)
    setupStudioCam()
    return true
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
