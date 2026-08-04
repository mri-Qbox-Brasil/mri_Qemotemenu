CustomDP = CustomDP or {}

CustomDP.Shared = {

    ["sbaseball"] = { "anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_a", "Baseball", "sbaseballthrow" },

    ["lbaseball"] = { "anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_b", "Lançamento de Baseball", "sbaseball" },

    ["refem"] = { "anim@gangops@hostage@", "victim_idle", "Refem", "shostage", AnimationOptions = { Attachto = true, xPos = -0.3, yPos = 0.1, zPos = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, EmoteLoop = true } },

    ["revistar2"] = { "missfam5_yoga", "a2_pose", "Revista", "ssearch", AnimationOptions = { Attachto = true, xPos = 0.0, yPos = 0.5, zPos = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, EmoteMoving = true } },

    ["ccachorrog"] = { "creatures@rottweiler@amb@sleep_in_kennel@", "sleep_in_kennel", "Ação de Cachorro", "scbdog", AnimationOptions = { Attachto = true, xPos = -0.1, yPos = 0.65, zPos = 0.43, xRot = 0.0, yRot = 0.0, zRot = -100.0, EmoteLoop = true } },

    ["cumprimentar"] = { "mp_ped_interaction", "hugs_guy_a", "Cumprimentar", "sbro2" },

    ["cumprimentar2"] = { "mp_ped_interaction", "hugs_guy_b", "Cumprimentar 2", "sbro" },

    ["carregar"] = { "nm", "firemans_carry", "Carregar", "scarry", AnimationOptions = { Attachto = true, xPos = -0.14, yPos = 0.15, zPos = 0.14, xRot = 0.0, yRot = -59.0, zRot = -4.5, EmoteLoop = true } },

    ["carregar2"] = { "amb@code_human_in_car_idles@generic@ps@base", "base", "Carregar 2", "carry2", AnimationOptions = { Attachto = true, xPos = 0.35, yPos = 0.15, zPos = -0.15, xRot = -42.5, yRot = -22.5, zRot = 22.5, EmoteLoop = true } },

    ["carregar3"] = { "couplepose2cmg@animation", "couplepose2cmg_clip", "Carregar 3", "scarry3", AnimationOptions = { Attachto = true, xPos = 0.01, yPos = 0.344, zPos = -0.01, xRot = 180.0, yRot = 180.0, zRot = -1.9999, EmoteLoop = true } },

    ["carregar4"] = { "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", "Carregar 4", "scarried", AnimationOptions = { EmoteLoop = true, EmoteMoving = true } },

    ["carregar5"] = { "anim@heists@box_carry@", "idle", "Carregar Cachorro Grande", "scarried2", AnimationOptions = { EmoteLoop = true, EmoteMoving = true } },

    ["carregar6"] = { "couplepose1cmg@animation", "couplepose1cmg_clip", "Carregar 6", "carried3", AnimationOptions = { EmoteLoop = true } },

    ["ccgrande"] = { "anim@heists@box_carry@", "idle", "Carregar Cachorro Grande", "scbdog2", AnimationOptions = { EmoteLoop = true, EmoteMoving = true } },

    ["tdrinkm"] = { "anim@scripted@robbery@tun_prep_uni_ig1_couple@", "action_var_01_bank_manager", "Tomar um Drink Masculino", "scoupleanim2", AnimationOptions = { Prop = "p_wine_glass_s", PropBone = 60309, PropPlacement = { -0.05, -0.01, -0.17, 0.0, 0.0, 0.0 }, EmoteLoop = true } },

    ["tdrinkf"] = { "anim@scripted@robbery@tun_prep_uni_ig1_couple@", "action_var_01_female", "Tomar um Drink Feminino", "scoupleanim", AnimationOptions = { Prop = "p_wine_glass_s", PropBone = 28422, PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }, EmoteLoop = true } },

    ["rcpr"] = { "mini@cpr@char_b@cpr_str", "cpr_pumpchest", "Reanimar CPR", "scprs", AnimationOptions = { Attachto = true, xPos = 0.35, yPos = 0.8, zPos = 0.0, xRot = 0.0, yRot = 0.0, zRot = 270.0, EmoteLoop = true } },

    ["rcpr2"] = { "missheistfbi3b_ig8_2", "cpr_loop_victim", "Reanimar CPR 2", "scprs3", AnimationOptions = { Attachto = true, xPos = 0.35, yPos = 0.65, zPos = 0.0, xRot = 0.0, yRot = 0.0, zRot = 270.0, EmoteLoop = true } },

    ["passar"] = { "mp_common", "givetake1_a", "Passar", "sgive2", AnimationOptions = { EmoteMoving = true } },

    ["passar2"] = { "mp_common", "givetake1_b", "Passar 2", "sgive", AnimationOptions = { EmoteMoving = true } },

    ["pbqt"] = { "misscarsteal2pimpsex", "pimpsex_hooker", "Pagando Bqt", "sreceiveblowjob" },

    ["rcpr3"] = { "mini@cpr@char_a@cpr_str", "cpr_pumpchest", "Reanimar CPR 3", "scprs2", AnimationOptions = { EmoteLoop = true } },

    ["rcpr4"] = { "missheistfbi3b_ig8_2", "cpr_loop_paramedic", "Reanimar CPR 4", "scprs4", AnimationOptions = { EmoteLoop = true } },

    ["amao"] = { "mp_ped_interaction", "handshake_guy_a", "Aperto de Mão", "shandshake2", AnimationOptions = { EmoteMoving = true } },

    ["amao2"] = { "mp_ped_interaction", "handshake_guy_b", "Aperto de Mão 2", "shandshake", AnimationOptions = { EmoteMoving = true } },

    ["cabecada"] = { "melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Cabeçada", "sheadbutted" },

    ["cabecada2"] = { "melee@unarmed@streamed_variations", "victim_takedown_front_headbutt", "Cabeçada 2", "sheadbutt" },

    ["abracar"] = { "mp_ped_interaction", "kisses_guy_a", "Abraçar", "shug2" },

    ["abracar2"] = { "mp_ped_interaction", "kisses_guy_b", "Abraçar 2", "shug" },

    ["abracar3"] = { "littlespoon@friendship007", "friendship007", "Abraçar 3", "hugtip2", AnimationOptions = { EmoteLoop = true } },

    ["abracar4"] = { "littlespoon@friendship008", "friendship008", "Abraçar 4", "hugtip", AnimationOptions = { EmoteLoop = true } },

    ["abracar5"] = { "misscarsteal2chad_goodbye", "chad_armsaround_chad", "Abraçar 5", "shug4", AnimationOptions = { EmoteLoop = true } },

    ["abracar6"] = { "misscarsteal2chad_goodbye", "chad_armsaround_girl", "Abraçar 6", "shug3", AnimationOptions = { EmoteLoop = true } },

    ["beijo"] = { "hs3_ext-20", "cs_lestercrest_3_dual-20", "Beijo", "skiss2" },

    ["beijo2"] = { "hs3_ext-20", "csb_georginacheng_dual-20", "Beijo 2", "skiss" },

    ["beijo3"] = { "hs3_ext-19", "cs_lestercrest_3_dual-19", "Beijo 3", "skiss4" },

    ["beijo4"] = { "hs3_ext-19", "csb_georginacheng_dual-19", "Beijo 4", "skiss3" },

    ["pose75"] = { "couplepose1pack1anim2@animation", "couplepose1pack1anim2_clip", "Pose 75", "sliftme2", AnimationOptions = { EmoteLoop = true } },

    ["pose76"] = { "couplepose1pack1anim1@animation", "couplepose1pack1anim1_clip", "Pose 76", "sliftme", AnimationOptions = { Attachto = true, xPos = 0.002, yPos = 0.287, zPos = 0.25, xRot = 0.0, yRot = 0.0, zRot = 180.0, EmoteLoop = true } },

    ["pose77"] = { "couplepose2pack1anim2@animation", "couplepose2pack1anim2_clip", "Pose 77", "sliftme4", AnimationOptions = { EmoteLoop = true } },

    ["pose78"] = { "couplepose2pack1anim1@animation", "couplepose2pack1anim1_clip", "Pose 78", "sliftme3", AnimationOptions = { Attachto = true, xPos = 0.01, yPos = 0.48, zPos = 0.53, xRot = 0.0, yRot = 0.0, zRot = 180.0, EmoteLoop = true } },

    ["pose79"] = { "couplepose3pack1anim2@animation", "couplepose3pack1anim2_clip", "Pose 79", "sliftme6", AnimationOptions = { EmoteLoop = true } },

    ["pose80"] = { "couplepose3pack1anim1@animation", "couplepose3pack1anim1_clip", "Pose 80", "sliftme5", AnimationOptions = { Attachto = true, xPos = -0.212, yPos = -0.54, zPos = -0.1, xRot = 0.0, yRot = 0.0, zRot = 0.0, EmoteLoop = true } },

    ["carregar7"] = { "mx@piggypack_a", "mxclip_a", "Carregar 7", "spback2", AnimationOptions = { EmoteLoop = true, EmoteMoving = true } },

    ["carregar8"] = { "mx@piggypack_b", "mxanim_b", "Carregar 8", "spback", AnimationOptions = { Attachto = true, xPos = 0.02, yPos = -0.4399, zPos = 0.42, xRot = 0.0, yRot = 0.0, zRot = 0.0, EmoteLoop = true } },

    ["carregar9"] = { "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_a", "Carregar 9", "spback2", AnimationOptions = { EmoteLoop = true, EmoteMoving = true } },

    ["carregar10"] = { "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_b", "Carregar 10", "spback", AnimationOptions = { Attachto = true, xPos = 0.0, yPos = -0.7, zPos = 0.4, xRot = 0.0, yRot = 0.0, zRot = 0.0, EmoteLoop = true } },

    ["scara"] = { "melee@unarmed@streamed_variations", "plyr_takedown_rear_lefthook", "Soco na Cara", "spunched" },

    ["scara2"] = { "melee@unarmed@streamed_variations", "victim_takedown_front_cross_r", "Soco na Cara 2", "spunch" },

    ["rbqt"] = { "misscarsteal2pimpsex", "pimpsex_punter", "Recebendo bqt", "sgiveblowjob" },

    ["revistar3"] = { "custom@police", "police", "Revista", "ssearch2", AnimationOptions = { EmoteMoving = true } },

    ["tapa"] = { "melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Tapa", "sslapped", AnimationOptions = { EmoteLoop = true, EmoteMoving = true } },

    ["tapa2"] = { "melee@unarmed@streamed_variations", "plyr_takedown_front_backslap", "Tapa 2", "sslapped2", AnimationOptions = { EmoteLoop = true, EmoteMoving = true } },

    ["estapear"] = { "melee@unarmed@streamed_variations", "victim_takedown_front_slap", "Estapear", "sslap" },

    ["estapear2"] = { "melee@unarmed@streamed_variations", "victim_takedown_front_backslap", "Estapear 2", "sslap2" },

    ["render"] = { "random@countryside_gang_fight", "biker_02_stickup_loop", "Render", "sstickupscared", AnimationOptions = { EmoteLoop = true, EmoteMoving = true } },

    ["srendido"] = { "missminuteman_1ig_2", "handsup_base", "Ser Rendido", "sstickup", AnimationOptions = { EmoteLoop = true, EmoteMoving = true } },

    ["sruaf"] = { "misscarsteal2pimpsex", "shagloop_hooker", "Sexo Na Rua F", "sstreetsexmale", AnimationOptions = { EmoteLoop = true } },

    ["sruam"] = { "misscarsteal2pimpsex", "shagloop_pimp", "Sexo Na Rua M", "sstreetsexfemale", AnimationOptions = { EmoteLoop = true } },

    ["refem_2"] = { "anim@gangops@hostage@", "perp_idle", "Refém", "shostage2", AnimationOptions = { EmoteLoop = true, EmoteMoving = true } },

}

