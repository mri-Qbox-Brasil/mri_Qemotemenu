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

Config.PreviewPed = true -- preview do emote num ped clonado (scaleform do pause menu)

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

Config.CinematicsBridgeEnabled = true -- integracao com core_cinematics

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
