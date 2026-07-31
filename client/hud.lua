---@diagnostic disable: lowercase-global

-- ============================================================
-- HUD enquanto o menu esta aberto
-- ============================================================
-- Sao dois problemas diferentes, com solucoes diferentes:
--
--   1. HUD nativa do GTA (minimapa, estrelas, dinheiro). Os natives de esconder
--      valem por UM frame, entao precisam de um thread rodando enquanto o menu
--      estiver aberto. Nao ha o que restaurar: parar de chamar ja devolve.
--   2. HUD em NUI (ghds_advancedhud, jg-hud, ...). Cada uma some do seu jeito,
--      via evento ou export do proprio resource. Sao chamadas de ida e volta, e
--      e aqui que mora o risco: se a ida falhar e a volta rodar mesmo assim, o
--      jogador fica com a HUD escondida depois de fechar o menu.
--
-- Por isso o `hidden` abaixo e uma trava por integracao: so devolve o que esta
-- comprovadamente escondido por nos. Uma HUD que ja estava escondida por outro
-- motivo continua escondida ao fechar o menu, que e o comportamento correto —
-- nao somos donos do estado dela.

---Integracoes que este modulo escondeu, indexadas pela posicao em
---Config.HudIntegrations. So o que esta aqui e devolvido no ShowGameHud.
local hidden = {}

local nativeTickRunning = false

---Suprime a HUD nativa a cada frame. Sai sozinho quando o menu fecha.
local function startNativeTick()
    if nativeTickRunning then return end
    nativeTickRunning = true

    CreateThread(function()
        while nativeTickRunning do
            HideHUDThisFrame()
            Wait(0)
        end
    end)
end

---Esconde a HUD. Idempotente: chamar duas vezes nao duplica nada.
function HideGameHud()
    if not Config.HideHudWhileOpen then return end

    if Config.HideNativeHudWhileOpen then
        startNativeTick()
    end

    for index, integration in ipairs(Config.HudIntegrations) do
        if not hidden[index] and GetResourceState(integration.resource) == 'started' then
            local ok, err = pcall(integration.hide)

            if ok then
                hidden[index] = true
            else
                -- Sem marcar em `hidden`: o ShowGameHud vai ignorar esta
                -- integracao e nao vai tentar "devolver" uma HUD que nunca
                -- chegou a sumir.
                lib.print.error(('falha ao esconder a HUD de %s: %s')
                    :format(integration.resource, tostring(err)))
            end
        end
    end
end

---Devolve a HUD ao estado anterior.
function ShowGameHud()
    nativeTickRunning = false

    for index, integration in ipairs(Config.HudIntegrations) do
        if hidden[index] then
            hidden[index] = nil

            local ok, err = pcall(integration.show)
            if not ok then
                lib.print.error(('falha ao devolver a HUD de %s: %s')
                    :format(integration.resource, tostring(err)))
            end
        end
    end
end

-- Rede de seguranca: se o resource cair com o menu aberto, o jogador ficaria
-- sem HUD e sem nada para clicar que a trouxesse de volta.
AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    ShowGameHud()
end)

-- Se a HUD reiniciar com o menu aberto, ela volta desenhada e a nossa trava
-- ficaria mentindo — o `hide` que demos foi para a instancia antiga. Reaplica.
AddEventHandler('onClientResourceStart', function(resource)
    if not MenuIsOpen then return end

    for index, integration in ipairs(Config.HudIntegrations) do
        if integration.resource == resource then
            hidden[index] = nil

            -- A NUI dela acabou de subir e pode ainda nao estar ouvindo. Mesma
            -- folga que o wheel.lua usa ao reregistrar no radial.
            SetTimeout(500, function()
                if MenuIsOpen then HideGameHud() end
            end)
            return
        end
    end
end)
