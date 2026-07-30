---@diagnostic disable: lowercase-global

-- Preview de emote num ped clonado.
--
-- Tecnica herdada da gh-arenapaintball (src/client/modules/home.ts:15-88): em vez
-- de camera + render target, entrega o ped clonado para a scaleform do pause
-- menu nativo, ativada na variante vazia e sem fundo. O jogo desenha o ped
-- iluminado e posicionado; a NUI fica por cima com a coluna do meio transparente.
--
-- Duas diferencas em relacao a arena:
--   * SetPauseMenuPedSleepState(false) — la o ped fica dormindo; aqui ele precisa
--     tocar a animacao.
--   * O clone recebe TaskPlayAnim + props via OnEmotePlay(name, variation, ped).

---@type number? handle do ped clonado (lido por props.lua e emote.lua)
PreviewPed = nil
PreviewActive = false

local previewingEmote = nil

-- A gh-arenapaintball usa setTick/clearTick porque e TypeScript. No Lua do CFX
-- esses nativos nao existem — o equivalente e uma CreateThread governada por
-- flag, encerrada no ClosePreview.
local tickRunning = false

---Abre o preview. Idempotente.
---@return boolean
function OpenPreview()
    if not Config.PreviewPed then return false end
    if PreviewActive then return true end

    local ped = cache.ped
    if not DoesEntityExist(ped) then return false end

    -- isNetwork = false: o clone e local, nenhum outro player enxerga.
    PreviewPed = ClonePed(ped, false, false, false)
    if not PreviewPed or PreviewPed == 0 then return false end

    FreezeEntityPosition(PreviewPed, true)
    SetEntityCollision(PreviewPed, false, false)
    SetEntityVisible(PreviewPed, false, false)
    SetEntityInvincible(PreviewPed, true)
    SetBlockingOfNonTemporaryEvents(PreviewPed, true)

    ActivateFrontendMenu(`FE_MENU_VERSION_EMPTY_NO_BACKGROUND`, false, -1)

    -- Obrigatorio: sem esse respiro a engine ainda nao montou o menu e o ped
    -- simplesmente nao aparece, sem erro nenhum.
    Wait(100)

    GivePedToPauseMenu(PreviewPed, 2) -- slot 2 = ped a direita do centro
    SetPauseMenuPedLighting(true)
    SetPauseMenuPedSleepState(false)  -- o ped precisa animar
    SetMouseCursorVisibleInMenus(false)

    SetTimecycleModifier('hud_def_blur')
    SetTimecycleModifierStrength(1.0)

    PreviewActive = true

    tickRunning = true
    CreateThread(function()
        while tickRunning do
            DisableAllControlActions(0)
            -- Mouse continua vivo para a NUI; o resto do jogo fica surdo.
            EnableControlAction(0, 1, true)   -- look left/right
            EnableControlAction(0, 2, true)   -- look up/down
            EnableControlAction(0, 245, true) -- chat

            -- Impede o player de fechar o frontend por baixo da NUI.
            DisableControlAction(0, 177, true)
            DisableControlAction(0, 200, true)
            DisableControlAction(0, 202, true)
            DisableControlAction(0, 322, true)

            InvalidateIdleCam()
            InvalidateVehicleIdleCam()

            Wait(0)
        end
    end)

    return true
end

---Toca um emote no ped de preview.
---@param name string
---@param textureVariation? integer
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
        -- Walk nao tem como ser mostrado num ped parado na scaleform.
        return false
    end

    DestroyAllProps(true)
    ClearPedTasks(PreviewPed)

    return OnEmotePlay(name, textureVariation, PreviewPed)
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

---Fecha o preview. A ordem importa: tick -> cursor -> frontend -> ped -> timecycle.
---Trocar a ordem deixa ped fantasma na tela ou blur preso.
function ClosePreview()
    if not PreviewActive then return end

    tickRunning = false
    previewingEmote = nil

    SetMouseCursorVisibleInMenus(true)
    SetFrontendActive(false)

    DestroyAllProps(true)

    if PreviewPed and DoesEntityExist(PreviewPed) then
        DeleteEntity(PreviewPed)
    end
    PreviewPed = nil

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
