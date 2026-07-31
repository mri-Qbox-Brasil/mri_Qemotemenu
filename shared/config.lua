---@diagnostic disable: lowercase-global

Config = {}

Config.Debug = false

-- ============================================================
-- Menu
-- ============================================================

Config.MenuKeybindEnabled = true
Config.MenuKeybind = 'f5'
Config.CancelKeybindEnabled = true
Config.CancelEmoteKey = 'f6'

Config.PreviewPed = true -- preview do emote num ped clonado

-- 'studio' — clone teleportado para um ponto isolado, com camera propria.
--            Fundo limpo, iluminacao previsivel, enquadramento sempre igual.
-- 'world'  — clone plantado na frente da camera do jogo, sem camera nova.
--            Mais leve, mas pega a iluminacao do lugar e pode encostar em
--            geometria.
--
-- NAO existe 'scaleform'. O GivePedToPauseMenu desenha o ped mas ignora
-- qualquer task de animacao — ver o cabecalho de client/preview.lua.
Config.PreviewMode = 'studio'

-- ------------------------------------------------------------
-- Modo 'studio'
-- ------------------------------------------------------------
-- Coordenada herdada da lista de interiores escondidos que o qbx_core ja usa
-- para preview de personagem (config/client.lua:33-34), entao e um ponto ja
-- validado neste servidor. O `mri_Qautoshot` documenta uma alternativa mais
-- radical — vec3(0.0, 0.0, -150.0), onde nao existe geometria nenhuma para
-- vazar atras do ped — mas o client dele ainda nao esta implementado.
Config.StudioCoords = vec3(1104.49, 195.9, -49.44)
Config.StudioHeading = 44.22

-- Camera baseada no retrato do qbx_core (client/character.lua:139-152), mas
-- recuada: la o enquadramento e busto, e aqui precisamos do corpo inteiro para
-- ver a animacao.
--
-- StudioCamOffset e relativo ao ped: x = lado, y = distancia, z = altura.
-- A 3.2 m com FOV 42 o quadro tem ~2.5 m de altura util, o que cabe um ped de
-- ~1.9 m com folga. A altura 0.95 deixa a camera na linha do peito, e nao
-- olhando de baixo para cima.
Config.StudioCamOffset = vec3(0.0, 3.2, 0.95)
Config.StudioCamFov = 42.0

-- Ambos sao offsets do ponto de mira, aplicados sobre o osso da cabeca.
--   Lateral  empurra o ped para um lado do quadro (negativo = direita da tela).
--            O -0.4 do qbx_core servia o layout DELES; aqui a coluna do ped e a
--            do meio, entao 0 centraliza.
--   Vertical desce a mira da cabeca para o meio do corpo. Sem isto a camera
--            mira no rosto e corta os pes.
Config.StudioCamLateral = 0.0
Config.StudioCamVertical = -0.70
-- 0 = corte seco. Qualquer valor > 0 faz a camera INTERPOLAR da posicao do
-- jogador ate o estudio — ou seja, atravessar o mapa voando. Deixe em 0.
Config.StudioCamBlend = 0
Config.StudioDof = true       -- profundidade de campo rasa (exige SetUseHiDof no tick)
Config.StudioLoadScene = true -- forca o streaming do estudio antes de mostrar

-- Iluminacao previsivel. O timecycle nao mexe no relogio; o ForceDaytime sim,
-- e e client-side e global enquanto o menu esta aberto — por isso os dois sao
-- separados, para dar de usar so o primeiro se algo mais no servidor ler a hora.
Config.StudioTimecycle = ''
Config.StudioForceDaytime = true

Config.FreezePlayerWhileOpen = true

-- ------------------------------------------------------------
-- Modo 'world'
-- ------------------------------------------------------------
Config.PreviewBlur = true -- SetTimecycleModifier('hud_def_blur') com o menu aberto
-- Onde plantar o ped. X/Y sao coordenadas de tela (0..1).
Config.PreviewScreenX = 0.50
Config.PreviewScreenY = 0.82
Config.PreviewDepth = 3.2           -- metros a frente da camera
Config.PreviewHeadingOffset = 180.0 -- 180 = de frente para a camera

-- ============================================================
-- Roda de emotes (radial do ox_lib)
-- ============================================================
-- 6 e o teto, nao escolha: o PAGE_ITEMS da NUI do ox_lib e fixo em 6
-- (resources/[ox]/ox_lib/web/src/features/menu/radial/index.tsx:120). Do 7o item
-- em diante o slot 6 vira botao "mais", comendo um lugar da roda.
Config.WheelEnabled = true
Config.WheelSlots = 6

-- Item raiz da roda. O F1 abre a roda do ox_lib e os emotes ficam dentro deste
-- item — nao ha como abrir submenu direto (o showRadial e local ao ox_lib).
Config.WheelRootId = 'emotes'
Config.WheelMenuId = 'mri_emotewheel'
Config.WheelRootIcon = 'masks-theater'
Config.WheelItemIcon = 'person-running' -- icone de cada emote equipado

-- ============================================================
-- Favoritos nas setas
-- ============================================================
-- Cada slot tem um default que o admin pode trocar em runtime (tabela
-- mri_qemotemenu_defaults) e que o player pode sobrescrever so para ele.
-- Precedencia: override do player > default do servidor > este arquivo.
--
-- Os defaults abaixo sao exatamente os que estavam no rpemotes-reborn. O slot
-- RIGHT tem o keybind chamado `ultra_facepalm` mas roda `wtf4` — divergencia
-- herdada, mantida de proposito para nao mudar o comportamento dos players.

Config.FavoriteSlots = {
    { slot = 'UP',    key = 'UP',    keybindName = 'ultra_salute',    label = 'Emote favorito (cima)',    emote = 'salute' },
    { slot = 'DOWN',  key = 'DOWN',  keybindName = 'ultra_assobio',   label = 'Emote favorito (baixo)',   emote = 'assobiar' },
    { slot = 'LEFT',  key = 'LEFT',  keybindName = 'ultra_joia',      label = 'Emote favorito (esquerda)', emote = 'joia' },
    { slot = 'RIGHT', key = 'RIGHT', keybindName = 'ultra_facepalm',  label = 'Emote favorito (direita)', emote = 'wtf4' },
}

-- ============================================================
-- Input guard — quando os atalhos de seta NAO devem disparar
-- ============================================================
-- Tudo aqui e automatico: nenhum outro resource precisa chamar export nenhum.
-- Ver client/inputguard.lua para o detalhe de cada sinal.

-- Nao ha sinal de "teclado on-screen nativo aberto": a unica forma de perguntar
-- e chamar UpdateOnscreenKeyboard(), que AVANCA a maquina de estado do teclado
-- e atrapalharia o loop de quem o abriu. Na pratica esses teclados desabilitam
-- os controles, entao o `controlClaim` ja cobre o caso.
Config.InputGuard = {
    nuiFocus     = true,  -- qualquer NUI com foco (nosso menu, ox_lib, chat, MDT, phone...)
    pauseMenu    = true,  -- pause menu / warning message
    controlClaim = true,  -- menu nativo desabilitou o controle da seta neste frame
    stateBags    = true,  -- LocalPlayer.state.canEmote / emoteBindsBlocked
    playerState  = true,  -- morto, ragdoll, algemado, mirando
    inVehicle    = false, -- true = nao dispara dentro de veiculo
    inWater      = true,  -- true = nao dispara nadando
}

-- Controles que cada seta fisica aciona. Se QUALQUER um estiver desabilitado
-- neste frame, e porque outro resource reivindicou a tecla.
Config.ArrowControls = {
    UP    = { 172, 188, 27 },  -- CELLPHONE_UP    / FRONTEND_UP    / PHONE_UP
    DOWN  = { 173, 187 },      -- CELLPHONE_DOWN  / FRONTEND_DOWN
    LEFT  = { 174, 189 },      -- CELLPHONE_LEFT  / FRONTEND_LEFT
    RIGHT = { 175, 190 },      -- CELLPHONE_RIGHT / FRONTEND_RIGHT
}

-- ============================================================
-- Emotes
-- ============================================================

Config.AdultEmotesDisabled = false
Config.AnimalEmotesEnabled = true
Config.SharedEmotesEnabled = true
Config.CancelPreviousEmote = false
Config.AllowEmoteInVehicle = true
Config.AllowInWater = false
Config.DisarmPlayerOnEmote = false
Config.AllowPunchingDuringEmote = false

Config.ExpressionsEnabled = true
Config.PersistentExpression = true
Config.WalkingStylesEnabled = true
Config.PersistentWalk = true

-- ============================================================
-- Modulos auxiliares
-- ============================================================
-- Valores espelham o que estava ligado no rpemotes-reborn, com uma excecao:
-- Crouch/Crawl ficam DESLIGADOS porque `resources/[mri]/crouch_crawl` e o dono
-- dessa mecanica neste servidor (LCONTROL/RCONTROL). Ligar os dois registra
-- keybind duplicada. E um flip de flag se um dia consolidarem aqui.

Config.CrouchEnabled = false
Config.CrouchKeybindEnabled = true
Config.CrouchKeybind = 'LCONTROL'
Config.CrouchOverrideStealthMode = false
Config.FpsMode = false
Config.CrawlEnabled = false
Config.CrawlKeybindEnabled = true
Config.CrawlKeybind = 'RCONTROL'

Config.HandsupEnabled = false
Config.HandsupKeybind = 'X'
Config.HandsupKeybindEnabled = false
Config.HandsupInCar = false
Config.ReplayEmoteAfterHandsup = true
Config.HoldToHandsUp = false

Config.PointingEnabled = true
Config.PointingKeybindEnabled = true
Config.PointingKeybind = 'B'
Config.PointingInCar = false
Config.ReplayEmoteAfterPointing = true

Config.RagdollEnabled = false
Config.RagdollKeybind = 'U'
Config.RagdollAsToggle = true

Config.BinocularsEnabled = false
Config.NewscamEnabled = false
Config.AllowVisionsToggling = false -- visao noturna / termica nos binoculos
Config.DisableIdleCam = true

-- Integracao com o core_cinematics (espelha o emote ativo num state bag para a
-- gravacao). O bridge so se instala se o core_cinematics estiver de fato
-- rodando; este flag e o desligamento manual. Hoje o core_cinematics nao esta
-- no `ensure` de nenhum cfg deste servidor, entao o bridge fica dormente.
Config.CinematicsBridgeEnabled = true

-- Controles bloqueados enquanto o player esta de maos ao alto.
Config.DisabledHandsupControls = {
    24, 25, 47, 58, 140, 141, 142, 143, 263, 264, 257,
    ---@diagnostic disable-next-line: assign-type-mismatch
    45, 22, 44, 38, 23, 288, 289, 170, 167, 73,
    59, 71, 72, 75, 76, 82, 83, 84, 85, 86,
    99, 100, 115, 116, 117, 118, 122, 135, 156, 157,
    158, 159, 160, 161, 162, 163, 164, 165,
}

-- ============================================================
-- Plugin do mri_Qadmin (tela de defaults do servidor)
-- ============================================================

Config.Plugin = {
    id          = 'emotes',
    label       = 'Emotes',
    icon        = 'smile',
    description = 'Define os emotes padrao dos atalhos de seta para todo o servidor.',
    htmlPath    = 'web/build/index.html',
    perms       = { 'emotes.manage' },
}

-- ACE exigida para editar os defaults do servidor quando o mri_Qadmin nao
-- estiver disponivel para resolver a permissao.
Config.AdminAce = 'command.mriqemotemenu'

-- ============================================================
-- Persistencia
-- ============================================================

Config.SaveDebounce = 5000 -- ms entre a ultima alteracao e o flush no banco

-- ============================================================
-- HUD
-- ============================================================

-- Esconde a HUD enquanto o menu esta aberto e devolve ao fechar. O preview e
-- uma cena montada com camera propria: barra de fome, minimapa e velocimetro
-- por cima dela nao fazem sentido.
Config.HideHudWhileOpen = true

-- HUD nativa do GTA (minimapa, estrelas de procurado, dinheiro). Precisa ser
-- suprimida a cada frame, entao vive num thread proprio enquanto o menu esta
-- aberto — ver client/hud.lua.
Config.HideNativeHudWhileOpen = true

---HUDs em NUI. Cada uma tem o seu jeito de sumir, entao a integracao e uma
---entrada aqui em vez de codigo espalhado: `resource` e o que o
---`GetResourceState` testa, e so entra em acao quando aquele resource esta no ar.
---
---Toda chamada roda dentro de pcall, e o `show` so e executado se o `hide`
---correspondente tiver funcionado — senao um erro de contrato do vendor deixaria
---a HUD do jogador escondida para sempre.
---
---> **mri_Qhud nao esta aqui de proposito.** Ele nao expoe nada: zero exports e
---> nenhum evento de visibilidade global, so `hud:client:*` por widget
---> (conferido no client.lua dele). Para integrar, adicione do lado do mri_Qhud:
---> ```lua
---> RegisterNetEvent('hud:client:setVisible', function(visible)
--->     SendNUIMessage({ action = 'hudtick', show = visible })
---> end)
---> ```
---> e destrave a entrada comentada abaixo. Sem isso nao ha o que chamar — o
---> loop dele reescreve o `hudtick` no tick seguinte de qualquer forma.
Config.HudIntegrations = {
    {
        resource = 'ghds_advancedhud',
        -- Os dois nomes tem caixa diferente mesmo (hideHUD / showHud), e e
        -- assim no resource: ghds_advancedhud/client/main.lua:356 e :364.
        hide = function() TriggerEvent('ghds_advancedhud:client:hideHUD') end,
        show = function() TriggerEvent('ghds_advancedhud:client:showHud') end,
    },
    {
        resource = 'jg-hud',
        -- https://docs.jgscripts.com/hud/exports
        hide = function() exports['jg-hud']:toggleHud(false) end,
        show = function() exports['jg-hud']:toggleHud(true) end,
    },
    -- {
    --     resource = 'mri_Qhud',
    --     hide = function() TriggerEvent('hud:client:setVisible', false) end,
    --     show = function() TriggerEvent('hud:client:setVisible', true) end,
    -- },
}
