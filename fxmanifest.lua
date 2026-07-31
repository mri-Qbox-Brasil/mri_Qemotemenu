fx_version "cerulean"
game "gta5"

lua54 "yes"
use_experimental_fxv2_oal "yes"

author "MRI Qbox Team"
description "Menu de emotes em NUI com preview de ped, favoritos nas setas e binds por personagem"
version "__VERSION__"

-- Compatibilidade com os resources de emote que a comunidade consome por nome.
-- `provide` faz `exports['rpemotes-reborn']:X()` resolver para ca; NAO faz
-- GetResourceState('rpemotes-reborn') retornar 'started' (ver client/compat.lua).
provide "rpemotes"
provide "rpemotes-reborn"
provide "dpemotes"
provide "scully_emotemenu"

dependencies {
    "/onesync",
    "ox_lib",
    "qbx_core",
    "oxmysql"
}

ox_lib "locale"

-- `shared/translate.lua` PRECISA vir antes de `data/animations.lua` (que e
-- client_script, portanto carrega depois de todo shared_script): o catalogo
-- chama Translate() em 111 entradas de PtfxInfo durante o proprio load.
shared_scripts {
    "@ox_lib/init.lua",
    "@qbx_core/modules/playerdata.lua",
    "shared/types.lua",
    "shared/config.lua",
    "shared/translate.lua",
    "data/animals.lua"
}

-- ORDEM IMPORTA. `data/animations.lua` popula o global `RP`,
-- `data/animations_custom.lua` define LoadAddonEmotes() que faz o merge, e
-- `client/catalog.lua` consome os dois e libera `RP`. Nao trocar por glob.
client_scripts {
    "data/animations.lua",
    "data/animations_custom.lua",
    "client/utils.lua",
    "client/catalog.lua",
    "client/inputguard.lua",
    "client/emote.lua",
    "client/props.lua",
    "client/ptfx.lua",
    "client/syncing.lua",
    "client/walk.lua",
    "client/expressions.lua",
    "client/favorites.lua",
    "client/wheel.lua",
    "client/preview.lua",
    "client/hud.lua",
    "client/nui.lua",
    "client/commands.lua",
    "client/compat.lua",
    "client/handsup.lua",
    "client/pointing.lua",
    "client/ragdoll.lua",
    "client/crouch.lua",
    "client/binoculars.lua",
    "client/newscam.lua",
    "client/noidlecam.lua",
    "client/cinematics.lua",
    "client/main.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/permissions.lua",
    "server/defaults.lua",
    "server/players.lua",
    "server/sync.lua",
    "server/commands.lua",
    "server/mri_qadmin.lua",
    "server/main.lua"
}

ui_page "web/build/index.html"

files {
    "conditionalanims.meta",
    "locales/*.json",
    "web/build/index.html",
    "web/build/**/*"
}

data_file "CONDITIONAL_ANIMS_FILE" "conditionalanims.meta"

-- Os .ytyp moram em stream/[Props]/<autor>/ e stream/[Custom Emotes]/GH/VKSHOP/,
-- mas o FiveM resolve DLC_ITYP_REQUEST por basename — por isso o caminho aqui e
-- sempre "stream/<arquivo>.ytyp" independente da subpasta real.
data_file "DLC_ITYP_REQUEST" "stream/rpemotesreborn_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/brummie_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/bzzz_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/bzzz_camp_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/apple_1.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/kaykaymods_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/knjgh_pizzas.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/natty_props_lollipops.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/ultra_ringcase.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pata_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/vedere_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pnwsigns.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/pprp_icefishing.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/scully_props.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/samnick_prop_lighter01.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/bzzz_murderpack.ytyp"

-- Os 6 abaixo existem em stream/ desde sempre mas nunca foram declarados no
-- rpemotes-reborn, entao os props deles nunca registraram no jogo.
data_file "DLC_ITYP_REQUEST" "stream/glap-pom-pillow.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/jarp_afk_prop.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/jarp_scooter_prop.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/prop_mawar_bayu.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/scrlt_ipif14max.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/skol.ytyp"
