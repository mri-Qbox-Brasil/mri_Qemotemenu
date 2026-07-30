---@diagnostic disable: lowercase-global

-- ============================================================
-- Input guard
-- ============================================================
-- O rpemotes-reborn exigia que TODO resource que usasse as setas chamasse
-- `exports['rpemotes-reborn']:DisableEmoteKeybinds(true/false)`. Isso e fragil:
-- qualquer resource novo quebra ate alguem lembrar do export, e quem esquece de
-- chamar o `false` deixa os emotes mortos para o resto da sessao.
--
-- Aqui nao existe esse export. Os atalhos de seta se calam sozinhos, olhando
-- sinais que o proprio jogo ja expoe. O sinal que faz o trabalho pesado e o
-- `controlClaim`: todo menu nativo (WarMenu, NativeUI, MenuAPI) desabilita os
-- controles direcionais a cada frame para o player nao sair andando enquanto
-- navega. Se o controle da seta esta desabilitado agora, alguem reivindicou a
-- tecla — e nos ficamos quietos.
--
-- Cobertura verificada nos call sites reais deste servidor:
--   [ultra]/loaf_bowling/client.lua:159,185,201
--       `for i = 0, 31 do DisableAllControlActions(i) end` em loop  -> coberto
--   [ultra]/[ilegal]/spray/client/warmenu.lua:438-443
--       DisableControlAction(0, 188/187/189/190, true) por frame    -> coberto
--
-- Ponto cego conhecido: um menu que leia `IsControlJustPressed` SEM desabilitar
-- o controle nao e detectavel. Para esses existe a valvula de escape
-- `LocalPlayer.state:set('emoteBindsBlocked', true)` — statebag, nao export.

---@type boolean Menu de emotes proprio aberto (setado por client/nui.lua)
MenuIsOpen = false

local guard = Config.InputGuard

---Alguem desabilitou o controle desta seta neste frame?
---@param slot string 'UP'|'DOWN'|'LEFT'|'RIGHT'
---@return boolean
local function arrowIsClaimed(slot)
    local controls = Config.ArrowControls[slot]
    if not controls then return false end

    for i = 1, #controls do
        if not IsControlEnabled(0, controls[i]) then
            return true
        end
    end
    return false
end

---O player esta num estado que impede tocar emote?
---@return boolean, string?
local function playerStateBlocks()
    local ped = cache.ped
    if not ped or ped == 0 then return true, 'sem ped' end

    if IsEntityDead(ped) then return true, 'morto' end
    if IsPedRagdoll(ped) then return true, 'ragdoll' end
    if IsPedGettingUp(ped) then return true, 'levantando' end
    if IsPedInMeleeCombat(ped) then return true, 'em combate' end
    if IsPedCuffed(ped) then return true, 'algemado' end
    if IsPedBeingStunned(ped, 0) then return true, 'atordoado' end
    if IsPlayerAiming(cache.playerId) then return true, 'mirando' end

    return false
end

---Pode disparar o atalho desta seta agora?
---@param slot string 'UP'|'DOWN'|'LEFT'|'RIGHT'
---@return boolean allowed
---@return string? reason motivo do bloqueio (para debug)
function CanFireEmoteBind(slot)
    -- Menu proprio aberto: as setas navegam a lista, nao tocam emote.
    if MenuIsOpen then return false, 'menu proprio aberto' end

    if guard.nuiFocus and IsNuiFocused() then
        return false, 'NUI com foco'
    end

    if guard.pauseMenu then
        if IsPauseMenuActive() then return false, 'pause menu' end
        if IsWarningMessageActive() then return false, 'warning message' end
    end

    if guard.controlClaim and arrowIsClaimed(slot) then
        return false, 'controle da seta reivindicado por outro resource'
    end

    if guard.stateBags then
        if LocalPlayer.state.canEmote == false then return false, 'statebag canEmote' end
        if LocalPlayer.state.emoteBindsBlocked then return false, 'statebag emoteBindsBlocked' end
    end

    if guard.playerState then
        local blocked, reason = playerStateBlocks()
        if blocked then return false, reason end
    end

    if guard.inVehicle and IsPedInAnyVehicle(cache.ped, true) then
        return false, 'em veiculo'
    end

    if guard.inWater and (IsPedSwimming(cache.ped) or IsPedSwimmingUnderWater(cache.ped)) then
        return false, 'na agua'
    end

    if IsInActionWithErrorMessage then
        if IsProne or IsUsingNewscam or IsUsingBinoculars then
            return false, 'em outra acao (crawl/newscam/binoculos)'
        end
    end

    return true
end

---Diagnostico: mostra por que cada seta esta (ou nao) liberada agora.
---Util para depurar conflito com resource novo sem precisar ler codigo.
function DumpInputGuard()
    local lines = {}
    for slot in pairs(Config.ArrowControls) do
        local ok, reason = CanFireEmoteBind(slot)
        lines[#lines + 1] = ('  %-5s %s%s'):format(slot, ok and 'LIVRE' or 'BLOQUEADO', ok and '' or ' — ' .. reason)
    end
    table.sort(lines)
    lib.print.info('[input guard]\n' .. table.concat(lines, '\n'))
end
