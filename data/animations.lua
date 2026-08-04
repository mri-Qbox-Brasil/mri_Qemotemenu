-- Catalogo de animacoes herdado do rpemotes-reborn 1.9.0 (fork Ultra City).
-- If an emote does not work, you may be on an older gamebuild --
-- To get a higher gamebuild, see ReadMe on github repository --
---@type AnimationListConfig
---@diagnostic disable-next-line: missing-fields
RP = {}

-- EXPRESSIONS --

RP.Expressions = { ---- MOODS ----

    ["Aiming"] = {"mood_aiming_1"},

    ["Nervoso"] = {"mood_angry_1"},

    ["Burning"] = {"burning_1"},

    ["Choro"] = {"console_wasnt_fun_end_loop_floyd_facial"},

    ["Morto"] = {"dead_1"},

    ["Bêbado"] = {"mood_drunk_1"},

    ["Dumb"] = {"pose_injured_1"},

    ["Eletrocutado"] = {"electrocuted_1"},

    ["Excited"] = {"mood_excited_1"},

    ["Frustrado"] = {"mood_frustrated_1"},

    ["Mal-humorado"] = {"effort_1"},

    ["Grumpy2"] = {"mood_drivefast_1", "Grumpy 2"},

    ["Grumpy3"] = {"pose_angry_1", "Grumpy 3"},

    ["Happy"] = {"mood_happy_1"},

    ["Ferido"] = {"mood_injured_1"},

    ["Joyful"] = {"mood_dancing_low_1"},

    ["Joyful2"] = {"mood_dancing_low_2", "Joyful 2"},

    ["Mouthbreather"] = {"smoking_hold_1"},

    ["Mouthbreather2"] = {"smoking_inhale_1", "Mouthbreather 2"},

    ["Neverblink"] = {"pose_normal_1", "Nunca pisque"},

    ["Caolho"] = {"pose_aiming_1", "Um olho"},

    ["Scheme"] = {"mood_dancing_high_2"},

    ["Chocado"] = {"shocked_1"},

    ["Shocked2"] = {"shocked_2", "Shocked 2"},

    ["Dormindo"] = {"mood_sleeping_1"},

    ["Sleeping2"] = {"dead_1", "Sleeping 2"},

    ["Sleeping3"] = {"dead_2", "Sleeping 3"},

    ["Smug"] = {"mood_smug_1"},

    ["Especulativo"] = {"mood_aiming_1"},

    ["Stressed"] = {"mood_stressed_1"},

    ["Sulking"] = {"mood_sulk_1"},

    ["Weird"] = {"effort_2"},

    ["Weird2"] = {"effort_3", "Weird 2"},

    ["Weird3"] = {"melee_effort_1", "Weird 3"}

}

--- WALKSTYLES ---

RP.Walks = {

    -- The key shouldn't have any other uppercase letter than the first one!

    -- The first letter HAS to be uppercase!

    -- First element of array is the walk animation

    -- Second element is the label, this is optional

    ["Estrangeiro"] = {"move_m@alien"},

    ["Armored"] = {"anim_group_move_ballistic"},

    ["Arrogante"] = {"move_f@arrogant@a"},

    ["Butch"] = {"move_m@hurry_butch@a"},

    ["Butch2"] = {"move_m@hurry_butch@b", "Butch 2"},

    ["Butch3"] = {"move_m@hurry_butch@c", "Butch 3"},

    ["Pé Grande"] = {"move_characters@orleans@core@"},

    ["Buzzed"] = {"move_m@buzzed"},

    ["Brave"] = {"move_m@brave"},

    ["Brave2"] = {"move_m@brave@a", "Brave 2"},

    ["Casey"] = {"move_casey"},

    ["Casual"] = {"move_m@casual@a"},

    ["Casual2"] = {"move_m@casual@b", "Casual 2"},

    ["Casual3"] = {"move_m@casual@c", "Casual 3"},

    ["Casual4"] = {"move_m@casual@d", "Casual 4"},

    ["Casual5"] = {"move_m@casual@e", "Casual 5"},

    ["Casual6"] = {"move_m@casual@f", "Casual 6"},

    ["Chichi"] = {"move_f@chichi"},

    ["Confiante"] = {"move_m@confident"},

    ["Cop"] = {"move_m@business@a"},

    ["Cop2"] = {"move_m@business@b", "Cop 2"},

    ["Cop3"] = {"move_m@business@c", "Cop 3"},

    ["Covarde"] = {"move_m@coward"},

    ["Gordinho"] = {"move_chubby", "Chubby Male"},

    ["Mulher gordinha"] = {"move_f@chubby@a", "Mulher gordinha"},

    ["Dave"] = {"move_characters@dave_n"},

    ["Padrão feminino"] = {"move_f@multiplayer", "Feminino padrão"},

    ["Defaultmale"] = {"move_m@multiplayer", "Default Male"},

    ["Depressed"] = {"move_m@depressed@a"},

    ["Depressed2"] = {"move_m@depressed@b", "Depressed 2"},

    ["Depressed3"] = {"move_f@depressed@a", "Depressed 3"},

    ["Depressed4"] = {"move_f@depressed@c", "Depressed 4"},

    ["Dreyfuss"] = {"move_dreyfuss"},

    ["DrunkWalk"] = {"move_m@drunk@a"},

    ["DrunkWalk2"] = {"move_m@buzzed", "Drunk 2 - Buzzed"},

    ["DrunkWalk3"] = {"move_m@drunk@moderatedrunk", "Drunk 3 - Moderate"},

    ["DrunkWalk4"] = {

        "move_m@drunk@moderatedrunk_head_up", "Drunk 4 - Moderate 2"

    },

    ["DrunkWalk5"] = {"move_m@drunk@slightlydrunk", "Drunk 5 - Slightly Drunk"},

    ["DrunkWalk6"] = {"move_m@drunk@verydrunk", "Drunk 6 - Very Drunk"},

    ["Gordo"] = {"move_m@fat@a", "Macho Gordo"},

    ["Fat2"] = {"move_f@fat@a", "Fat Female"},

    ["Fat3"] = {"move_m@fat@bulky", "Fat & Bulky"},

    ["Fat4"] = {"move_f@fat@a_no_add", "Fat Female 2"},

    ["Femme"] = {"move_f@femme@"},

    ["Femme2"] = {"move_m@femme@", "Femme 2"},

    ["Fogo"] = {"move_characters@franklin@fire"},

    ["Fire2"] = {"move_characters@michael@fire", "Fire 2"},

    ["Fire3"] = {"move_m@fire", "Fire 3"},

    ["Fugir"] = {"move_f@flee@a"},

    ["Flee2"] = {"move_f@flee@c", "Flee 2"},

    ["Flee3"] = {"move_m@flee@a", "Flee 3"},

    ["Flee4"] = {"move_m@flee@b", "Flee 4"},

    ["Flee5"] = {"move_m@flee@c", "Flee 5"},

    ["Floyd"] = {"move_characters@floyd"},

    ["Franklin"] = {"move_p_m_one"},

    ["Gangster"] = {"move_m@gangster@generic"},

    ["Gangsterb"] = {"move_gangster", "Gangster 2"},

    ["Gangsterc"] = {"move_m@gangster@ng", "Gangster 3"},

    ["Gângster"] = {"move_m@gangster@var_a", "Gangster 4"},

    ["Gangstere"] = {"move_m@gangster@var_b", "Gangster 5"},

    ["Gângster"] = {"move_m@gangster@var_c", "Gangster 6"},

    ["Gangsterg"] = {"move_m@gangster@var_d", "Gangster 7"},

    ["Gangsterh"] = {"move_m@gangster@var_e", "Gangster 8"},

    ["Gângsteres"] = {"move_m@gangster@var_f", "Gangster 9"},

    ["Gangsterj"] = {"move_m@gangster@var_g", "Gangster 10"},

    ["Gângster"] = {"move_m@gangster@var_h", "Gangster 11"},

    ["Gangsterl"] = {"move_m@gangster@var_i", "Gangster 12"},

    ["Gangsterm"] = {"move_m@gangster@var_j", "Gangster 13"},

    ["Gangstern"] = {"move_m@gangster@var_k", "Gangster 14"},

    ["Generic"] = {"move_m@generic", "Generic Male"},

    ["Generic2"] = {"move_f@generic", "Generic Female"},

    ["Grooving"] = {"anim@move_m@grooving@", "Grooving Male"},

    ["Grooving2"] = {"anim@move_f@grooving@", "Grooving Female"},

    ["Guard"] = {"move_m@prison_gaurd"},

    ["Handcuffs"] = {"move_m@prisoner_cuffed"},

    ["Heels"] = {"move_f@heels@c"},

    ["Heels2"] = {"move_f@heels@d", "Heels 2"},

    ["Caminhada"] = {"move_m@hiking"},

    ["Hiking2"] = {"move_f@hiking", "Hiking 2"},

    ["Moderno"] = {"move_m@hipster@a"},

    ["Vagabundo"] = {"move_m@hobo@a", "Vagabundo"},

    ["Hobo2"] = {"move_m@hobo@b", "Hobo 2"},

    ["Pressa"] = {"move_m@hurry@a", "Depressa, macho"},

    ["Hurry2"] = {"move_f@hurry@a", "Hurry Female"},

    ["Hurry3"] = {"move_f@hurry@b", "Hurry Female 2"},

    ["InjuredWalk"] = {"move_m@injured", "Ferido"},

    ["InjuredWalk2"] = {"move_f@injured", "Injured 2 - Female"},

    ["Intimidação"] = {"move_m@intimidation@1h", "Intimidação"},

    ["Intimidation2"] = {"move_m@intimidation@cop@unarmed", "Intimidation 2"},

    ["Intimidation3"] = {"move_m@intimidation@unarmed", "Intimidation 3"},

    ["Janitor"] = {"move_p_m_zero_janitor"},

    ["Janitor2"] = {"move_p_m_zero_slow", "Janitor 2"},

    ["Jimmy"] = {"move_characters@jimmy"},

    ["Jog"] = {"move_m@jog@"},

    ["Lamar"] = {"move_characters@lamar"},

    ["Lamar2"] = {"anim_group_move_lemar_alley", "Lamar 2"},

    ["Lester"] = {"move_heist_lester"},

    ["Lester2"] = {"move_lester_caneup", "Lester 2"},

    ["Maneater"] = {"move_f@maneater"},

    ["Michael"] = {"move_ped_bucket"},

    ["Money"] = {"move_m@money"},

    ["Muscle"] = {"move_m@muscle@a"},

    ["Nervoso"] = {"move_characters@jimmy@nervous@"},

    ["Patricia"] = {"move_characters@patricia"},

    ["Paramedic"] = {"move_paramedic"},

    ["Elegante"] = {"move_m@posh@"},

    ["Posh2"] = {"move_f@posh@", "Posh 2"},

    ["Rápido"] = {"move_m@quick"},

    ["Ron"] = {"move_characters@ron"},

    ["Runner"] = {"female_fast_runner"},

    ["Sad"] = {"move_m@sad@a", "Homem triste"},

    ["Sad2"] = {"move_m@sad@b", "Sad Male 2"},

    ["Sad3"] = {"move_m@sad@c", "Sad Male 3"},

    ["Sad4"] = {"move_f@sad@a", "Mulher triste"},

    ["Sad5"] = {"move_f@sad@b", "Sad Female 2"},

    ["Irreverente"] = {"move_m@sassy"},

    ["Sassy2"] = {"move_f@sassy", "Sassy 2"},

    ["Assustado"] = {"move_f@scared"},

    ["Sensual"] = {"move_f@sexy@a"},

    ["Sombrio"] = {"move_m@shadyped@a"},

    ["Lento"] = {"move_characters@jimmy@slow@"},

    ["Stripper"] = {"move_f@stripper@a"},

    ["Arrogância"] = {"move_m@swagger"},

    ["Swagger2"] = {"move_m@swagger@b", "Swagger 2"},

    ["Tough"] = {"move_m@tough_guy@"},

    ["Tough2"] = {"move_f@tough_guy@", "Tough 2"},

    ["Toolbelt"] = {"move_m@tool_belt@a", "Cinto de Ferramentas Masculino"},

    ["Toolbelt2"] = {"move_f@tool_belt@a", "Toolbelt Female"},

    ["Lixo"] = {"clipset@move@trash_fast_turn"},

    ["Trash2"] = {"missfbi4prepp1_garbageman", "Trash 2"},

    ["Tracey"] = {"move_characters@tracey"},

    ["Trevor"] = {"move_p_m_two"},

    ["Muito lento"] = {"move_m@leaf_blower", "Very Slow"},

    ["Largo"] = {"move_m@bag"},

    ["ZombieWalk"] = {"clipset@anim@ingame@move_m@zombie@core"}

}

--- SHARED EMOTES ---

RP.Shared = {

    -- [emotename] = {dictionary, animation, displayname, targetemotename, additionalanimationoptions} --

    -- You don't have to specify targetemotename; If you don't, it will just play the same animation on both.--

    -- targetemote is used for animations that have a corresponding animation to the other player, ie Carry and Be Carried --

    -- Emotes will work with either SyncOffset or Attachto. We can attach players either in front of us, to a specific bone, or either side of us. --

    ["carrymecute"] = { -- Male Custom emote by Amnilka

        "amnilka@photopose@couple@couplefirst",

        "amnilka_couple_mal_002",

        "Carregar Me Cute",

        "carrymecute2",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["carrymecute2"] = { -- Female Custom emote by Amnilka

        "amnilka@photopose@couple@couplefirst",

        "amnilka_couple_fem_002",

        "Carregar Me Cute 2",

        "carrymecute",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            bone = 0,

            pos = vector3(0.0000, 0.0000, 0.0000),

            rot = vector3(0.0000, 0.0000, 0.0000)

        }

    },

    ["melhoresamigos"] = { -- Female Custom emote by MrWitt

        "mrwitt@casual_composure_female01",

        "mrwitt",

        "Melhores Amigos 1",

        "bestfriends2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["melhoresamigos2"] = { -- Female Custom emote by MrWitt

        "mrwitt@casual_composure_female02",

        "mrwitt",

        "Melhores Amigos 2",

        "bestfriends",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            bone = 0,

            pos = vector3(-0.2500, 0.1400, 0.0200),

            rot = vector3(0.0000, 0.0000, -0.0000)

        }

    },

    ["melhoramiga"] = {

        "anim@male_couple_03_b",

        "m_couple_03_b_clip",

        "Pose De Melhor Amiga",

        "bffb",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["bffb"] = {

        "anim@female_couple_03_b",

        "f_couple_03_b_clip",

        "Pose 2 Da Melhor Amiga",

        "bff",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            bone = 0,

            pos = vector3(0.0100, 0.1300, 0.0),

            rot = vector3(0.0, 0.0, 76.0000)

        }

    },

    ["sitwithmepose"] = { -- Male Custom emote by Amnilka

        "amnilka@photopose@couple@couplefirst",

        "amnilka_couple_mal_003",

        "Sentar With Me",

        "sitwithmepose2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["sitwithmepose2"] = { -- Female Custom emote by Amnilka

        "amnilka@photopose@couple@couplefirst",

        "amnilka_couple_fem_003",

        "Sentar With Me Please?",

        "sitwithmepose",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            bone = 0,

            pos = vector3(0.3540, 0.5110, 0.8310),

            rot = vector3(0.0000, 0.0000, -2.8000)

        }

    },

    ["abraco"] = { -- Male Custom emote by Amnilka

        "amnilka@photopose@couple@couplefirst",

        "amnilka_couple_mal_001",

        "Pose Do Abraço",

        "hugpose2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["abraco2"] = { -- Female Custom emote by Amnilka

        "amnilka@photopose@couple@couplefirst",

        "amnilka_couple_fem_001",

        "Abraço Posa Comigo?",

        "hugpose",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            bone = 0,

            pos = vector3(0.1400, 0.2500, 0.0000),

            rot = vector3(0.0000, 0.0000, 0.0000)

        }

    },

    ["fotofofa"] = { -- Male Custom emote by Amnilka

        "amnilka@photopose@couple@couplefirst",

        "amnilka_couple_mal_004",

        "Pose Fofa Para Foto",

        "cutepicpose2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["fotofofa2"] = { -- Female Custom emote by Amnilka

        "amnilka@photopose@couple@couplefirst",

        "amnilka_couple_fem_004",

        "Pose Fofa Da Foto 2",

        "cutepicpose",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            bone = 0,

            pos = vector3(0.2700, 0.1200, 0.0000),

            rot = vector3(0.0000, 0.0000, 0.0000)

        }

    },

    ["maosdecasal"] = { -- Male Custom emote by Amnilka

        "amnilka@photopose@couple@couplefirst",

        "amnilka_couple_mal_005",

        "Casal Coração Mãos",

        "couplehhands2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["maosdecasal2"] = { -- Female Custom emote by Amnilka

        "amnilka@photopose@couple@couplefirst",

        "amnilka_couple_fem_005",

        "Casal Coração Mãos 2",

        "couplehhands",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            bone = 0,

            pos = vector3(-0.1230, 0.4740, 0.0000),

            rot = vector3(0.0000, 0.0000, 94.0000)

        }

    },

    ["acoplado1a"] = { -- Male Custom emote by EnchantedBrwny

        "EnchantedBrwny@wedding1a",

        "wedding1a",

        "Pose De Casamento De Casal 1A",

        "couplewed1b",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["acoplado1b"] = { -- Female Custom emote by EnchantedBrwny

        "EnchantedBrwny@wedding1b",

        "wedding1b",

        "Pose De Casamento De Casal 1B",

        "couplewed1a",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            bone = 0,

            pos = vector3(0.0300, 1.0000, 0.0200),

            rot = vector3(0.0000, 0.0000, 130.0000)

        }

    },

    ["casal2a"] = { -- Male Custom emote by EnchantedBrwny

        "EnchantedBrwny@wedding2b",

        "wedding2b",

        "Pose De Casamento De Casal 2A",

        "couplewed2b",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["casal2b"] = { -- Female Custom emote by EnchantedBrwny

        "EnchantedBrwny@wedding2a",

        "wedding2a",

        "Pose De Casamento De Casal 2B",

        "couplewed2a",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            bone = 0,

            pos = vector3(0.0100, 0.2500, 0.0),

            rot = vector3(0.0, 0.0, -88.9000)

        }

    },

    ["csdog2"] = { -- Emote by MissSnowie

        "misssnowie@little_doggy_lying_down",

        "base",

        "Cachorro Pequeno Transportado",

        "csdog",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            pos = vector3(-0.040, 0.330, 0.280),

            rot = vector3(0.0, 0.0, 80.0)

        },

        AnimalEmote = true

    },

    ["csdog3"] = { -- Custom Emote by MissSnowie

        "hooman@hugging_little_doggy",

        "base",

        "Carregar Small Dog 2",

        "csdog4",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING},

        AnimalEmote = true

    },

    ["csdog4"] = { -- Custom Emote by MissSnowie

        "little_doggy@hugging_hooman",

        "base",

        "Cachorro Pequeno Transportado 2",

        "csdog3",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            bone = 24818,

            pos = vector3(-0.95, 0.16, -0.15),

            rot = vector3(3.70, 75.00, -161.90)

        },

        AnimalEmote = true

    },

    ["segue"] = { -- Custom Ped In Front Emote By Dollie Mods

        "dollie_mods@follow_me_001",

        "follow_me_001",

        "Segue A (Frente)",

        "followb",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP

            -- We can set this to true for lols, however it messes up if you walk through doors. Either player can press X to cancel the shared emotes

        }

    },

    ["siga"] = { -- Custom Ped At Back Emote by Dollie Mods

        "dollie_mods@follow_me_002",

        "follow_me_002",

        "Siga B (Voltar)",

        "followa",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            pos = vector3(0.078, 0.018, 0.00),

            rot = vector3(0.00, 0.00, 0.00)

        }

    },

    ["kisscuteneck"] = {

        "genesismods_kissme@kissmale8",

        "kissmale8",

        "Beijo Cute - Neck (Male)",

        "kisscuteneck2",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            -- SyncOffsetFront = 0.05,

            -- bone = 0,

            pos = vector3(-0.56, 0.0, 0.0),

            rot = vector3(0.0, 0.0, 0.0)

        }

    },

    ["kisscuteneck2"] = {

        "genesismods_kissme@kissfemale8",

        "kissfemale8",

        "Beijo Cute - Neck (Female)",

        "kisscuteneck",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP

            -- SyncOffsetFront = 0.05,

        }

    },

    ["kisscutecheek"] = {

        "genesismods_kissme@kissmale9",

        "kissmale9",

        "Beijo Cute Cheek (Male)",

        "kisscutecheek2",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            -- SyncOffsetFront = 0.05,

            -- bone = 0,

            pos = vector3(0.35, 0.0, 0.0),

            rot = vector3(0.0, 0.0, 0.0)

        }

    },

    ["kisscutecheek2"] = {

        "genesismods_kissme@kissfemale9",

        "kissfemale9",

        "Beijo Cute Cheek (Female)",

        "kisscutecheek",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP

            -- SyncOffsetFront = 0.05,

        }

    },

    ["kisscutefh"] = {

        "genesismods_kissme@kissmale10",

        "kissmale10",

        "Beijo Forehead (Male)",

        "kisscutefh2",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            -- SyncOffsetFront = 0.05,

            -- bone = 0,

            pos = vector3(0.38, 0.0, 0.0),

            rot = vector3(0.0, 0.0, 0.0)

        }

    },

    ["kisslips"] = {

        "chocoholic@couple13",

        "couple13_clip",

        "Beijo Cute Lips (Female)",

        "kisslips2",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            bone = 0,

            pos = vector3(0.1600, 0.2700, 0.0),

            rot = vector3(0.0, 0.0, 130.0)

        }

    },

    ["kisslips2"] = {

        "chocoholic@couple14",

        "couple14_clip",

        "Beijo Cute Lips (Male)",

        "kisslips",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["kisscutefh2"] = {

        "genesismods_kissme@kissfemale10",

        "kissfemale10",

        "Beijo Forehead (Female)",

        "kisscutefh",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP

            -- SyncOffsetFront = 0.05,

        }

    },

    ["mesegure"] = { -- Custom Animation By SapphireMods

        "mx_couple5_1_a",

        "mx_couple5_1_a_clip",

        "Segure-Me",

        "holdmeb",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["holdmeb"] = { -- Custom Animation By SapphireMods

        "mx_couple5_1_b",

        "mx_couple5_1_b_clip",

        "Seja Detido",

        "holdme",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            bone = 0,

            pos = vector3(-0.0200, 0.2400, -0.0100),

            rot = vector3(0.0, 0.0, 0.0)

        }

    },

    ["holdmec"] = { -- Custom Animation By SapphireMods

        "mx_couple5_2_a",

        "mx_couple5_2_a_clip",

        "Segure-Me 2",

        "holdmed",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["mantido"] = { -- Custom Animation By SapphireMods

        "mx_couple5_2_b",

        "mx_couple5_2_b_clip",

        "Seja Realizado 2",

        "holdmec",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            bone = 0,

            pos = vector3(-0.1200, 0.3600, -0.0100),

            rot = vector3(0.0, 0.0, -180.0)

        }

    },

    ["espera"] = { -- Custom Animation By SapphireMods

        "mx_couple5_3_a",

        "mx_couple5_3_a_clip",

        "Segure-Me 3",

        "holdmef",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["holdmef"] = { -- Custom Animation By SapphireMods

        "mx_couple5_3_b",

        "mx_couple5_3_b_clip",

        "Seja Realizado 3",

        "holdmee",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            Attachto = true,

            bone = 0,

            pos = vector3(0.0400, 0.2100, -0.0300),

            rot = vector3(0.0, 0.0, 0.0)

        }

    }

}

--- DANCING EMOTES, SOME WITH PROPS ---

RP.Dances = {

    ["danceclubq"] = {

        "fix_stu_ext-25",

        "a_f_y_studioparty_01_dual-25",

        "Dança Clube 17",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["dancedrink9"] = {

        "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@",

        "med_right_down",

        "Dança Beber 9 (Beer)",

        AnimationOptions = {

            Prop = 'prop_beer_amopen',

            PropBone = 60309,

            PropPlacement = {0.09, -0.2, 0.05, -100.0, 0.0, 0.00},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["dancaboba10"] = {

        "anim@amb@nightclub@lazlow@hi_podium@",

        "danceidle_hi_17_spiderman_laz",

        "Dança Boba 10",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["dancabobo11"] = {

        "anim@amb@nightclub@lazlow@hi_podium@",

        "danceidle_mi_11_pointthrust_laz",

        "Dança Boba 11",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["exerciciodedanca"] = {

        "sdrill@animation",

        "sdrill_clip",

        "Broca Dança",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["tecnodanca"] = {

        "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@",

        "high_left_up",

        "Technodança",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["tecnodanca2"] = {

        "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@",

        "med_center_up",

        "Technodança 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["tecnodanca3"] = {

        "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@",

        "high_left",

        "Technodança 3",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["tecnodanca4"] = {

        "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@",

        "high_right_up",

        "Technodança 4",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    }

}

---- ANIMAL EMOTES ----

----    BIG DOG    ----

RP.AnimalEmotes = {

    ["bdogbark2"] = { -- Retrievers use different anims/skeletons from Rottweilers, so we need to use them specifically for retriever-based peds to work

        "creatures@retriever@amb@world_dog_barking@idle_a",

        "idle_a",

        "Latido (Cachorro Grande - Retriever)",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["bdogindicateahead"] = {

        "creatures@rottweiler@indication@",

        "indicate_ahead",

        "Indique À Frente (Cachorro Grande)",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["bdogindicatehigh"] = {

        "creatures@rottweiler@indication@",

        "indicate_high",

        "Indique Alto (Cachorro Grande)",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["bdogindicatelow"] = {

        "creatures@rottweiler@indication@",

        "indicate_low",

        "Indica Baixo (Cachorro Grande)",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["bdogexcitado"] = { -- Retrievers use different anims/skeletons from Rottweilers, so we need to use them specifically for retriever-based peds to work

        "creatures@retriever@amb@world_dog_barking@idle_a",

        "idle_c",

        "Animado (Cachorro Grande - Retriever)",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ---- ANIMAL EMOTES ----

    ----   SMALL DOG   ----

    ["sdogld"] = {

        "misssnowie@little_doggy_lying_down",

        "base",

        "Deitar Down (small dog)",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "sdogup"}

    }

}

--- EXIT EMOTES ---

RP.Exits = {

    ------ HUMAN EXIT EMOTES  ------

    ["roupa"] = {

        "get_up@sat_on_floor@to_stand",

        "getup_0",

        "Levante-Se",

        AnimationOptions = {EmoteDuration = 2000, StartDelay = 600}

    },

    ["roupa2"] = {

        "anim@scripted@aoa@ship_climb@male@",

        "getup_a",

        "Levante-Se 2",

        AnimationOptions = {StartDelay = 600}

    },

    ["meditar"] = {

        "rcmcollect_paperleadinout@",

        "meditate_getup",

        "Medite Levante-Se",

        AnimationOptions = {EmoteDuration = 2000}

    },

    ["empe"] = {

        "get_up@directional@movement@from_knees@injured",

        "getup_l_0",

        "Ficar Em Pé Up",

        AnimationOptions = {EmoteDuration = 2000, StartDelay = 600}

    },

    ["surrender_exit"] = {

        "random@arrests",

        "kneeling_arrest_get_up",

        "Surrender Exit",

        AnimationOptions = {EmoteDuration = 2200}

    },

    ["cadeira"] = {

        "switch@michael@sitting",

        "exit_forward",

        "Fora Da Cadeira",

        AnimationOptions = {EmoteDuration = 1000}

    },

    ["mesaextraivel"] = {

        "anim@amb@board_room@diagram_blueprints@",

        "look_around_01_amy_skater_01",

        "Fora Da Mesa",

        AnimationOptions = {EmoteDuration = 5700}

    },

    ["telefonar"] = {

        "amb@world_human_stand_mobile@male@text@exit",

        "exit",

        "Celular Ausente",

        AnimationOptions = {

            EmoteDuration = 1780,

            StartDelay = 1150,

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["pausalivre"] = {

        "mp_arresting",

        "b_uncuff",

        "Liberte-Se",

        AnimationOptions = {

            EmoteDuration = 6099,

            StartDelay = 450,

            onFootFlag = AnimFlag.MOVING

        }

    },

    ------ ANIMAL EXIT EMOTES  ------

    ["sdogup"] = {

        "creatures@pug@amb@world_dog_sitting@exit",

        "exit",

        "Cachorro Pequeno Levante",

        AnimationOptions = {EmoteDuration = 1000}

    },

    ["bdogup"] = {

        "creatures@rottweiler@amb@world_dog_sitting@exit",

        "exit",

        "Cachorro Grande Levanta",

        AnimationOptions = {EmoteDuration = 1000}

    },

    ["bdogupk"] = {

        "creatures@rottweiler@amb@sleep_in_kennel@",

        "exit_kennel",

        "Cachorro Grande Levante-Se V2",

        AnimationOptions = {EmoteDuration = 5000}

    }

}

--- SCENARIOS ---

--- EMOTES NO PROPS ---

RP.Emotes = {

    -----------------------------------------------------------------------------------------------------------

    ------ The male and female 'interaction menu' emotes from GTA Online can be found under the following animation directories:

    ------

    ------ Male: anim@mp_player_intcelebrationmale

    ------

    ------ Female: anim@mp_player_intcelebrationfemale

    -----------------------------------------------------------------------------------------------------------

    ------ THESE ARE SCENARIOS, SOME OF THESE DON'T WORK ON WOMEN AND SOME OTHER ISSUES, BUT STILL GOOD TO HAVE    ------

    -----------------------------------------------------------------------------------------------------------

    ["caixaeletronico"] = {

        ScenarioType.SCENARIO, "PROP_HUMAN_ATM", "Caixa Eletrônico"

    },

    ["churrasco"] = {ScenarioType.MALE, "PROP_HUMAN_BBQ", "Churrasco"},

    ["bumbina"] = {

        ScenarioType.SCENARIO, "PROP_HUMAN_BUM_BIN", "Caixote Do Vagabundo"

    },

    ["torcer"] = {ScenarioType.SCENARIO, "WORLD_HUMAN_CHEERING", "Torça"},

    ["queixoparacima"] = {

        ScenarioType.SCENARIO, "PROP_HUMAN_MUSCLE_CHIN_UPS", "Chinup"

    },

    ["areadetransferencia2"] = {

        ScenarioType.MALE, "WORLD_HUMAN_CLIPBOARD", "Prancheta 2"

    },

    ["policial"] = {ScenarioType.SCENARIO, "WORLD_HUMAN_COP_IDLES", "Policial"},

    ["perfurar"] = {

        ScenarioType.SCENARIO, "WORLD_HUMAN_CONST_DRILL",

        "Perfuração De Construção"

    },

    ["chocante"] = {

        ScenarioType.SCENARIO, "WORLD_HUMAN_MOBILE_FILM_SHOCKING",

        "Filme Chocante"

    },

    ["flexivel"] = {

        ScenarioType.SCENARIO, "WORLD_HUMAN_MUSCLE_FLEX", "Flexível"

    },

    ["guarda"] = {ScenarioType.SCENARIO, "WORLD_HUMAN_GUARD_STAND", "Guarda"},

    ["jardim"] = {

        ScenarioType.SCENARIO, "WORLD_HUMAN_GARDENER_PLANT", "Jardinagem"

    },

    ["martelo"] = {ScenarioType.SCENARIO, "WORLD_HUMAN_HAMMERING", "Martelo"},

    ["pontodeencontro"] = {

        ScenarioType.SCENARIO, "WORLD_HUMAN_HANG_OUT_STREET", "Hangout"

    },

    ["impaciente"] = {

        ScenarioType.SCENARIO, "WORLD_HUMAN_STAND_IMPATIENT", "Impaciente"

    },

    ["zelador"] = {ScenarioType.SCENARIO, "WORLD_HUMAN_JANITOR", "Zelador"},

    ["correr"] = {ScenarioType.SCENARIO, "WORLD_HUMAN_JOG_STANDING", "Correr"},

    ["ajoelhese"] = {

        ScenarioType.SCENARIO, "CODE_HUMAN_MEDIC_KNEEL", "Ajoelhe-Se"

    },

    ["magra"] = {ScenarioType.SCENARIO, "WORLD_HUMAN_LEANING", "Magro"},

    ["barrainclinada"] = {

        ScenarioType.SCENARIO, "PROP_HUMAN_BUM_SHOPPING_CART", "Barra Enxuta"

    },

    ["vigia"] = {ScenarioType.SCENARIO, "CODE_HUMAN_CROSS_ROAD_WAIT", "Mirante"},

    ["empregadadomestica"] = {

        ScenarioType.SCENARIO, "WORLD_HUMAN_MAID_CLEAN", "Empregada Doméstica"

    },

    ["medico"] = {

        ScenarioType.SCENARIO, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", "Médico"

    },

    ["musico"] = {ScenarioType.MALE, "WORLD_HUMAN_MUSICIAN", "Músico"},

    -- Ambient Music Doesn't Seem To Work For Female, Hence It's Male Only

    ["blocodenotas2"] = {

        ScenarioType.SCENARIO, "CODE_HUMAN_MEDIC_TIME_OF_DEATH",

        "Bloco De Notas 2"

    },

    ["parquimetro"] = {

        ScenarioType.SCENARIO, "PROP_HUMAN_PARKING_METER", "Parquímetro"

    },

    ["festa"] = {ScenarioType.SCENARIO, "WORLD_HUMAN_PARTYING", "Festa"},

    ["mensagensdetexto"] = {

        ScenarioType.SCENARIO, "WORLD_HUMAN_STAND_MOBILE", "Mensagens De Texto"

    },

    ["protese"] = {

        ScenarioType.SCENARIO, "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS",

        "Prostituta Alta"

    },

    ["prostlow"] = {

        ScenarioType.SCENARIO, "WORLD_HUMAN_PROSTITUTE_LOW_CLASS",

        "Prostituta Baixa"

    },

    ["poca"] = {ScenarioType.SCENARIO, "WORLD_HUMAN_BUM_WASH", "Poça"},

    ["registrar"] = {

        ScenarioType.SCENARIO, "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Registro"

    },

    ["fumaca"] = {ScenarioType.SCENARIO, "WORLD_HUMAN_SMOKING", "Fumaça"},

    ["ervadefumaca"] = {

        ScenarioType.MALE, "WORLD_HUMAN_DRUG_DEALER",

        "Fumaça De Erva Daninha (Masculino)"

    },

    -- Female

    ["ervadefumaca2"] = {

        ScenarioType.SCENARIO, "WORLD_HUMAN_SMOKING_POT",

        "Fumaça De Erva Daninha (Feminino)"

    },

    -- Female

    ["estatua"] = {

        ScenarioType.SCENARIO, "WORLD_HUMAN_HUMAN_STATUE", "Estátua"

    },

    ["soldar"] = {ScenarioType.SCENARIO, "WORLD_HUMAN_WELDING", "Soldar"},

    ["vitrine"] = {

        ScenarioType.SCENARIO, "WORLD_HUMAN_WINDOW_SHOP_BROWSE", "Vitrines"

    },

    ["ioga"] = {ScenarioType.SCENARIO, "WORLD_HUMAN_YOGA", "Ioga"},

    ---------- END OF SCENARIOS --------------

    ["irritado"] = {

        "missdocksshowoffcar@idle_a",

        "idle_b_5",

        "Irritado",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["compunhofrontal"] = {

        "anim@move_m@prisoner_cuffed",

        "idle",

        "Algemado - Frente",

        AnimationOptions = {

            onFootFlag = AnimFlag.MOVING,

            ExitEmote = "breakfreefont"

        }

    },

    ["algemado"] = {

        "mp_arresting",

        "idle",

        "Algemado - Costas",

        AnimationOptions = {

            onFootFlag = AnimFlag.MOVING,

            ExitEmote = "breakfreeback"

        }

    },

    ["deslumbrar1"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@dazzleme",

        "pose1_clip",

        "Deslumbre-Me Pose 1",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["deslumbrar2"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@dazzleme",

        "pose2_clip",

        "Pose De Deslumbrar-Me 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["deslumbrar3"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@dazzleme",

        "pose3_clip",

        "Pose Deslumbre-Me 3",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["deslumbrar4"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@dazzleme",

        "pose4_clip",

        "Deslumbre-Me Pose 4",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["deslumbrar5"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@dazzleme",

        "pose5_clip",

        "Pose Deslumbre-Me 5",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["deslumbrar6"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@dazzleme",

        "pose6_clip",

        "Pose Deslumbre-Me 6",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["deslumbrar7"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@dazzleme",

        "pose7_clip",

        "Pose De Deslumbrar-Me 7",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["morto2"] = {

        "anim@scripted@data_leak@fixf_fin_ig2_johnnyguns_wounded@",

        "enter",

        "Jogar Ato Morto",

        AnimationOptions = {}

    },

    ["femininotaofofo"] = {

        "stand_cute_6@dark",

        "stand_cute_6_clip",

        "Feminino Ficar Em Pé Cute Pose",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["femininotaofofo1"] = {

        "stand_fem_1@darksj",

        "stand_fem_1_clip",

        "Feminino Ficar Em Pé Cute Pose 1",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["femininoandcute2"] = {

        "feet_stand_w@darksj",

        "feet_stand_w_clip",

        "Feminino Ficar Em Pé Cute Pose 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["femininoandcute3"] = {

        "anim@female_model_14",

        "f_model_14_clip",

        "Feminino Ficar Em Pé Cute Pose 3",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["femininostandcutefinger"] = {

        "anim@female_model_15",

        "f_model_15_clip",

        "Feminino Ficar Em Pé Cute Pose Finger",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["femininostandcute4"] = {

        "anim@female_model_17",

        "f_model_17_clip",

        "Feminino Ficar Em Pé Cute Pose 4",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posturamasculina"] = {

        "anim@male_model_11",

        "m_model_11_clip",

        "Masculino Ficar Em Pé Pose",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["femalesitcute"] = {

        "sit_cute_1@dark",

        "sit_cute_1_clip",

        "Mulher Sentar Fofa",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "getup"}

    },

    ["femalesitcute1"] = {

        "mrwitt@chin_support_on_floor",

        "mrwitt",

        "Female Sentar Cute 1",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "getup"}

    },

    ["femalesitcute2"] = {

        "beach_1@janina234",

        "beach_1_clip",

        "Female Sentar Cute 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "getup"}

    },

    ["femeadejoelhos"] = {

        "beach_4@janina234",

        "beach_4_clip",

        "Pose Feminina De Joelhos",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "standup"}

    },

    ["femininodejoelhos1"] = {

        "on_the_knees@darksj",

        "on_the_knees_clip",

        "Mulher De Joelhos, Pose 1",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "standup"}

    },

    ["joelhofeminino2"] = {

        "anim@female_model_21",

        "f_model_21_clip",

        "Mulher De Joelhos, Pose 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "getup"}

    },

    ["posedemoda1"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyxco@dresstoimpress",

        "chic",

        "Pose De Moda Pose 1",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posedemoda2"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyxco@dresstoimpress",

        "deathdrop",

        "Pose De Moda Pose 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "standup"}

    },

    ["posedemoda3"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyxco@dresstoimpress",

        "magica",

        "Pose De Moda Pose 3",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posedemoda4"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyxco@dresstoimpress",

        "pose5",

        "Pose De Moda Pose 4",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posedemoda5"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyxco@dresstoimpress",

        "pose8",

        "Pose De Moda Pose 5",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posedemoda6"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyxco@dresstoimpress",

        "pose20",

        "Pose De Moda Pose 6",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posedemoda7"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyxco@dresstoimpress",

        "pose28",

        "Pose De Moda Pose 7",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posedemoda8"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyxco@dresstoimpress",

        "runoutofposes",

        "Pose De Moda Pose 8",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posedemoda9"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyxco@dresstoimpress",

        "split",

        "Pose De Moda Pose 9",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "standup"}

    },

    ["agacharse"] = {

        "anim@veh@van@mule5@rds",

        "lean_back_idle",

        "Agachar E Alcançar",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, StartDelay = 700}

    },

    ["agacharse2"] = {

        "anim@scripted@npc@mission@pln_ig4_cargo@",

        "line_5_dax",

        "Agachar E Alcançar 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, StartDelay = 700}

    },

    ["sonharacordado"] = { -- Custom Emote By Darks Animations

        "girl_groupe_d@darksj",

        "girl_groupe_d_clip",

        "Sonhar Acordado Nas Nuvens",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["maos"] = { -- Custom Emote By EnchantedBrwny

        "ebrwny_heart000",

        "ebrwny_hrt000",

        "Corações Mão Coreanos 🇰🇷",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["uau2"] = { -- Custom Emote By EnchantedBrwny

        "ebrwny_pack000",

        "ebrwny_shy",

        "Uau 2",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["cru"] = { -- Custom Emote By EnchantedBrwny

        "ebrwny_pack000",

        "ebrwny_rawr",

        "Cru",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["parar"] = { -- Custom Emote By EnchantedBrwny

        "ebrwny_pack000",

        "ebrwny_stop",

        "Pare",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["atrevido"] = { -- Custom Emote By EnchantedBrwny

        "ebrwny_pack000",

        "ebrwny_sass",

        "Atrevido",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["sitsad3"] = { -- Custom Emote By EnchantedBrwny

        "ebrwny_pack000",

        "ebrwny_sitf000",

        "Sentar Triste 3",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "getup"}

    },

    ["sitsad4"] = { -- Custom Emote By EnchantedBrwny

        "ebrwny_pack000",

        "ebrwny_sitf001",

        "Sentar Triste 4",

        AnimationOptions = {

            StartDelay = 600,

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup"

        }

    },

    ["dobrar"] = {

        "ebrwny_pack000",

        "ebrwny_bend",

        "Curve-Se",

        AnimationOptions = {

            StartDelay = 600,

            onFootFlag = AnimFlag.MOVING,

            vehicleRequirement = VehicleRequirement.NOT_ALLOWED

        }

    },

    ["ocioso12"] = {

        "mp_corona_idles@female_b@base",

        "base",

        "Inativo 12",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["ocioso13"] = {

        "mp_corona_idles@female_c@base",

        "base",

        "Inativo 13",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["ocioso15"] = {

        "anim_heist@arcade_combined@",

        "female_hold_arm@_base_base",

        "Inativo 15",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["ocioso16"] = {

        "anim_heist@arcade_combined@",

        "ped_female@_stand@_02a@_base_base",

        "Inativo 16",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["ocioso17"] = {

        "anim_heist@arcade_combined@",

        "amb_world_human_hang_out_street_female_hold_arm_idle_b",

        "Inativo 17",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["ocioso18"] = {

        "mp_move@prostitute@m@hooker",

        "idle",

        "Inativo 18",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["ocioso19"] = {

        "missdocksshowoffcar@base",

        "base_4",

        "Inativo 19",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["impaciente2"] = {

        "oddjobs@taxi@gyn@cc@intro",

        "f_impatient_b",

        "Impaciente 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["argumento3"] = {

        "missheistdockssetup1leadinoutig_1",

        "lsdh_ig_1_argue_wade",

        "Argumento 3",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["argumento4"] = {

        "car_2_mcs_1-6",

        "cs_devin_dual-6",

        "Argumento 4",

        AnimationOptions = {EmoteDuration = 6000, onFootFlag = AnimFlag.MOVING}

    },

    ["argumento5"] = {

        "anim@amb@casino@brawl@fights@argue@",

        "arguement_loop_mp_m_brawler_01",

        "Argumente Com Raiva 1",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["argumento6"] = {

        "anim@amb@casino@brawl@fights@argue@",

        "arguement_loop_mp_m_brawler_02",

        "Argumente Com Raiva 2",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["cruzetas7"] = {

        "anim_heist@arcade_combined@",

        "female_arms_crossed@_base_base",

        "Cruzetas 7",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["cruzetas8"] = {

        "anim_heist@arcade_combined@",

        "ped_female@_stand@_03b@_base_base",

        "Cruzetas 8",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["cruzetas9"] = {

        "fix_trip3_ext-4",

        "a_f_y_vinewood_02_dual-4",

        "Cruzetas 9",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["cruzetalateral2"] = {

        "amb@world_human_hang_out_street@female_hold_arm@base",

        "base",

        "Cruzetas Lado 2",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["pointpose"] = {

        "tun_meet_int-47",

        "a_m_y_carclub_01^3_dual-47",

        "Apontar para baixo",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["surrender7"] = {

        "anim@scripted@bty4@ig2_bounty_kneel@male@",

        "on_knee_idle_a",

        "Surrender 7",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "getup"}

    },

    ["adormecer2"] = {

        "mp_sleep",

        "sleep_loopfemale",

        "Adormecer 2",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["inspecionar2"] = {

        "anim@amb@carmeet@checkout_engine@", "female_c_idle_d", "Inspecione 2"

    },

    ["inspecionar3"] = {

        "anim@amb@carmeet@checkout_car@", "female_b_idle_d", "Inspecione 3"

    },

    ["ajoelhar4"] = {

        "anim@scripted@cbr5@ig3_drill_box@pattern_03@lockbox_03@male@",

        "rest",

        "Ajoelhar 4",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["ajoelhese5"] = {

        "anim@scripted@cbr5@ig3_drill_box@pattern_01@lockbox_02@male@",

        "rest",

        "Ajoelhar 5",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["courodejoelhos"] = {

        "anim@scripted@bty2@ig1_hiding_target@male@",

        "hiding_kneel",

        "Ajoelhar Esconder",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["ajoelhado"] = { -- Custom Emote By Chocoholic Animations

        "chocoholic@duo17",

        "duo17_clip",

        "Pose Entediada De Ajoelhar",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 200,

            ExitEmote = "standup"

        }

    },

    ["ajoelheseempaz"] = { -- Custom Emote By Chocoholic Animations

        "chocoholic@duo18",

        "duo18_clip",

        "Pose Do Sinal De Paz De Ajoelhar",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 200,

            ExitEmote = "standup"

        }

    },

    ["sapato"] = { -- Custom Emote By Darks Animations

        "male_duo_a@darksj",

        "male_duo_a_clip",

        "Pose De Chute De Sapato",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, StartDelay = 240}

    },

    ["rap"] = { -- Custom Emote By Darks Animations

        "couple_singing_m@darks37",

        "couple_singing_m_clip",

        "Rap / Cantar",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["posedeagachamento"] = { -- Custom Emote By Darks Animations

        "ganggirls_pose1@darks37",

        "ganggirls_pose1_clip",

        "Pose De Arma De Agachamento - Esquerda",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posedeagachamento3"] = { -- Custom Emote By Darks Animations

        "gun_prime_2@darksj",

        "gun_prime_2_clip",

        "Postura De Arma De Agachamento 3",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["magro5"] = {

        "amb@world_human_leaning@male@wall@back@hands_together@idle_b",

        "idle_e",

        "Encostar 5",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["magro6"] = {

        "anim@scripted@freemode_npc@fix_agy_ig4_lamar@",

        "lean_wall_idle_03_lamar",

        "Encostar 6",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["planoenxuto"] = {

        "anim@amb@board_room@diagram_blueprints@",

        "idle_01_amy_skater_01",

        "Encostar Na Mesa",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 200,

            ExitEmote = "offtable"

        }

    },

    ["assustado3"] = {

        "xm3_drg2_cook_int-5",

        "csb_labrat_dual-5",

        "Assustado 2",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["sonoruim"] = {

        "amb@world_human_bum_slumped@male@laying_on_left_side@idle_a",

        "idle_b",

        "Vagabundo Dormir",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 700,

            ExitEmote = "getup",

            ExitEmoteType = "Saídas",

            vehicleRequirement = VehicleRequirement.NOT_ALLOWED

        }

    },

    ["sit3"] = {

        "amb@lo_res_idles@",

        "world_human_picnic_male_lo_res_base",

        "Sentar 3",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "getup"}

    },

    ["Sentar 59"] = {

        "amb@lo_res_idles@",

        "world_human_picnic_female_lo_res_base",

        "Sentar 59",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup",

            EmoteMoving = false,

            EmoteLoop = true

        }

    },

    ["sit10"] = {

        "anim@scripted@bty2@ig1_hiding_target@male@",

        "hiding_sit",

        "Sentar 10",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "getup"}

    },

    ["sitfu"] = {

        "chocoholic@single80",

        "single80_clip",

        "Sentar Middle Finger",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "getup"}

    },

    ["bemvindodevolta"] = {

        "anim@scripted@island@special_peds@dave@hs4_dave_stage2_ig6",

        "you're_back",

        "Bem Vindo De Volta",

        AnimationOptions = {}

    },

    ["posedeparede"] = { -- Credit to LadyyShamrockk for this custom emote

        "shamrock@wallpose1",

        "pose",

        "Pose De Parede",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posedeparede2"] = { -- Credit to LadyyShamrockk for this custom emote

        "shamrock@wallpose2",

        "pose",

        "Pose De Parede 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posedeparede3"] = { -- Credit to LadyyShamrockk for this custom emote

        "shamrock@wallpose3",

        "pose",

        "Pose De Parede 3",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posedeparede4"] = { -- Credit to LadyyShamrockk for this custom emote

        "shamrock@wallpose4",

        "pose",

        "Pose De Parede 4",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posedeparede5"] = { -- Credit to LadyyShamrockk for this custom emote

        "shamrock@wallpose5",

        "pose",

        "Pose De Parede 5",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["cotovelo2"] = { -- Custom Emote By Chocoholic Animations

        "chocoholic@single47",

        "single47_clip",

        "Cotovelo Da Janela 2",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["sitlean2"] = {

        "anim@scripted@player@fix_astu_ig8_weed_smoke_v1@male@",

        "male_pos_a_p2_base",

        "Sentar Encostar 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "offchair"}

    },

    ["sitlean3"] = {

        "anim@scripted@freemode@ig7_office_cell_floor@heeled@",

        "base_pose_01",

        "Sentar Encostar 3",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "getup"}

    },

    ["sitsad2"] = {

        "anim@female_sit_01",

        "f_sit_01_clip",

        "Sentar Triste 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "getup"}

    },

    ["sitchair7"] = {

        "anim@scripted@freemode_npc@fix_astu_ig3_pooh_jimmy@jimmy@",

        "sit_base_jimmy",

        "Cadeira Sentar Atenta",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "offchair"}

    },

    ["sitchair8"] = {

        "anim@scripted@freemode_npc@fix_dre_studio_entourage@",

        "lonely_ballas",

        "Cadeira Sentar Solitária",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "offchair"}

    },

    ["sittoilet"] = {

        "anim@scripted@freemode@ig5_office_cell_seat@heeled@",

        "base_pose_01",

        "Sentar toilet",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "offchair"}

    },

    ["sittoilet2"] = {

        "anim@scripted@cbr5@ig3_drill_box@pattern_01@lockbox_04@male@",

        "idle",

        "Sentar Toilet 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "offchair"}

    },

    ["smokengun"] = {

        "smokingweapon@animation",

        "smokingweapon_clip",

        "Sentado Fumar & Gun",

        AnimationOptions = {

            Prop = "ng_proc_cigarette01a",

            PropBone = 4185,

            PropPlacement = {0.0300, 0.0000, 0.0200, 1.7096, -43.1362, -27.9428},

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup",

            ExitEmoteType = "Saídas",

            PtfxAsset = "scr_mp_cig",

            PtfxName = "ent_anim_cig_smoke",

            PtfxNoProp = false,

            PtfxPlacement = {-0.07, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('smoke'),

            PtfxWait = 0.8,

            PtfxCanHold = true

        }

    },

    ['smokendrink'] = { -- Custom Emote By Darks Animations

        "drx@male_smoke",

        "male_smoke",

        "Smoke And Whiskey",

        AnimationOptions = {

            Prop = 'prop_drink_whisky',

            PropBone = 26612,

            PropPlacement = {0.0500, -0.0700, -0.0500, 0.0, 0.0, 0.0},

            SecondProp = 'ng_proc_cigarette01a',

            SecondPropBone = 64113,

            SecondPropPlacement = {

                0.0270, 0.0080, 0.0050, -11.6920, -78.3079, 7.9470

            },

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_mp_cig",

            PtfxName = "ent_anim_cig_smoke",

            PtfxNoProp = false,

            PtfxPlacement = {-0.07, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('smoke'),

            PtfxWait = 0.8,

            PtfxCanHold = true

        }

    },

    ["sunbathe3"] = {

        "amb@world_human_sunbathe@female@front@base",

        "base",

        "Sunbathe 3 - Deitar On Stomach",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 700,

            vehicleRequirement = VehicleRequirement.NOT_ALLOWED,

            ExitEmote = "getup"

        }

    },

    ["Deitar 3"] = {

        "amb@world_human_sunbathe@male@back@idle_a",

        "idle_a",

        "Deitar 3",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 700,

            vehicleRequirement = VehicleRequirement.NOT_ALLOWED,

            ExitEmote = "getup",

            EmoteMoving = false,

            EmoteLoop = true

        }

    },

    ["Deitar"] = {

        "amb@world_human_sunbathe@female@back@idle_a",

        "idle_a",

        "Deitar",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 700,

            vehicleRequirement = VehicleRequirement.NOT_ALLOWED,

            ExitEmote = "getup",

            EmoteMoving = false,

            EmoteLoop = true

        }

    },

    ["tomarsol6"] = {

        "amb@world_human_sunbathe@female@front@idle_a",

        "idle_c",

        "Tomar Sol 6",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 700,

            vehicleRequirement = VehicleRequirement.NOT_ALLOWED,

            ExitEmote = "getup"

        }

    },

    ["tomarsol7"] = {

        "amb@world_human_sunbathe@male@front@base",

        "base",

        "Tomar Sol 7",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 700,

            vehicleRequirement = VehicleRequirement.NOT_ALLOWED,

            ExitEmote = "getup"

        }

    },

    ["tipo5"] = {

        "anim@scripted@freemode@ig12_use_computer@male@",

        "loop",

        "Tipo 5 - Olhar Fixo",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["sim2"] = {

        "sum24_office_int-37",

        "csb_jenettee_dual-37",

        "Sim, Sim",

        AnimationOptions = {}

    },

    ["ioga2"] = {

        "timetable@amanda@ig_4",

        "ig_4_idle",

        "Ioga 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["perdidoconfuso"] = {

        "anim@scripted@island@special_peds@dave@hs4_dave_stage2_ig6",

        "i_lost_it",

        "Perdido E Confuso",

        AnimationOptions = {}

    },

    ["sinaldegangue3"] = {

        "amb@code_human_in_car_mp_actions@gang_sign_b@low@ps@base",

        "idle_a",

        "Sinal De Gangue 3",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["sinaldegangue4"] = {

        "amb@code_human_in_car_mp_actions@v_sign@std@rds@base",

        "idle_a",

        "Sinal De Gangue 4",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["passou6"] = {

        "anim@scripted@data_leak@fix_bil_ig2_chopper_crawl@",

        "fix_bil_ig2_chopper_crawl_loop_ped",

        "Passagem 6",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 900,

            vehicleRequirement = VehicleRequirement.NOT_ALLOWED,

            ExitEmote = "getup"

        }

    },

    ["passou7"] = {

        "anim@scripted@data_leak@fix_bil_ig2_chopper_crawl@",

        "fix_bil_ig2_chopper_crawl_dead_loop_ped",

        "Passo 7",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 900,

            vehicleRequirement = VehicleRequirement.NOT_ALLOWED,

            ExitEmote = "getup"

        }

    },

    ["passou8"] = {

        "anim@scripted@data_leak@fix_bil_ig2_chopper_crawl@",

        "fix_bil_ig2_chopper_crawl_dead_loop_ped",

        "Passagem 8",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 900,

            vehicleRequirement = VehicleRequirement.NOT_ALLOWED,

            ExitEmote = "getup"

        }

    },

    ["coldre2"] = { -- Custom Emote Provided To RpEmotes By Mads

        "mads@police_reaching_holster",

        "idle",

        "Coldre 2",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["coldre3"] = {

        "anim@hlstr_7360_walk",

        "holster_walk",

        "Coldre 3",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["coldre4"] = {

        "anim@hlstr_7360_hold",

        "holster_stop",

        "Coldre 4 - Parar",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["coldre5"] = {

        "anim@holster_hold_there",

        "holster_hold",

        "Coldre 5 - Parada 2",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["socando2"] = {

        "anim@scripted@bty2@ig2_beat_target@male@",

        "standing_punch_v1_golfer",

        "Socando 2",

        AnimationOptions = {}

    },

    ["roupasdeteste4"] = {

        "anim@scripted@ulp_missions@change_clothes@female@",

        "change_highroller",

        "Experimente A Roupa 4",

        AnimationOptions = {}

    },

    ["roupasdeteste5"] = {

        "anim@scripted@ulp_missions@change_clothes@",

        "change_highroller_male",

        "Experimente A Roupa 5",

        AnimationOptions = {}

    },

    ["nervoso4"] = {

        "fix_trip3_mcs1-9",

        "cs_marnie_dual-9",

        "Nervoso 4",

        AnimationOptions = {}

    },

    ["viciado"] = {

        "anim@scripted@island@special_peds@dave@hs4_dave_stage3_ig7",

        "base",

        "Viviado(A)",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ['handsup3'] = {

        'anim@mp_rollarcoaster',

        'hands_up_idle_a_player_one',

        'Hands Up 3',

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ['handsup4'] = {

        'anim@scripted@bty2@ig2_beat_target@male@',

        'leaning_idle_bounty',

        'Hands Up 4',

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ['handsup5'] = {

        'anim@scripted@bty2@ig2_beat_target@male@',

        'standing_idle_bounty',

        'Hands Up 5',

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["bolsos"] = { -- Custom Emote By Dark Animations

        "hoodie_hands@dad",

        "hoodie_hands_clip",

        "Mãos Nos Bolsos (Hoodie)",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["bloquear"] = {

        "missheist_agency3ashield_face",

        "idle",

        "Bloco Rosto",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["multidaopolicial"] = {

        "amb@code_human_police_crowd_control@idle_a",

        "idle_a",

        "Multidão Polícia",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["multidaopolicial2"] = {

        "amb@code_human_police_crowd_control@idle_b",

        "idle_d",

        "Polícia Multidão 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["k9pose"] = {

        "anim@k9_pose",

        "hug_dog",

        "Cachorro Abraço",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["ranho"] = {

        "move_p_m_two_idles@generic",

        "fidget_blow_snot",

        "Soprar Ranho",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING, EmoteDuration = 4500}

    },

    ["arranhar"] = {

        "move_p_m_two_idles@generic",

        "fidget_scratch_balls",

        "Bolas De Raspar",

        AnimationOptions = {EmoteDuration = 4000},

        AdultAnimation = true

    },

    ["cartaunt"] = {

        "missarmenian1driving_taunts@lamar_1",

        "cmonfrank",

        "Provocação Do Carro",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            EmoteDuration = 2000

        }

    },

    ["cartaunb"] = {

        "missarmenian1driving_taunts@lamar_1",

        "cmonmynigga",

        "Provocação Do Carro 2",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            EmoteDuration = 2000

        }

    },

    ["cartaunc"] = {

        "missarmenian1driving_taunts@lamar_1",

        "hahahakeepup",

        "Provocação Do Carro 3",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            EmoteDuration = 2000

        }

    },

    ["cartauntd"] = {

        "missarmenian1driving_taunts@lamar_1",

        "manthisismeanttobe",

        "Provocação Do Carro 4",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            EmoteDuration = 2000

        }

    },

    ["cartaunte"] = {

        "missarmenian1driving_taunts@lamar_1",

        "rememberthis",

        "Provocação Do Carro 5",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            EmoteDuration = 3000

        }

    },

    ["cartaunf"] = {

        "missarmenian1driving_taunts@lamar_1",

        "skoolinyoass",

        "Provocação Do Carro 6",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            EmoteDuration = 3000

        }

    },

    ["cartaung"] = {

        "missarmenian1driving_taunts@lamar_1",

        "youaintfuckin",

        "Carro Provocação 7",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            EmoteDuration = 2000

        }

    },

    ["cartaunth"] = {

        "missarmenian1driving_taunts@franklin",

        "heyidontneedanybody",

        "Provocação Do Carro 8",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            EmoteDuration = 2000

        }

    },

    ["cartaunti"] = {

        "missarmenian1driving_taunts@franklin",

        "heymotherfuckayoudriveslowasfuck",

        "Provocação Do Carro 9",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            EmoteDuration = 3000

        }

    },

    ["cartaunj"] = {

        "missarmenian1driving_taunts@franklin",

        "kids_on_bicycles",

        "Provocação Do Carro 10",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            EmoteDuration = 2000

        }

    },

    ["cartaunk"] = {

        "missarmenian1driving_taunts@franklin",

        "learnhowtouseastick",

        "Provocação Do Carro 11",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            EmoteDuration = 2000

        }

    },

    ["cartaunl"] = {

        "missarmenian1driving_taunts@franklin",

        "slowassshit",

        "Provocação Do Carro 12",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            EmoteDuration = 2000

        }

    },

    ["cartaunt"] = {

        "mp_intro_seq@mcs_7_race_taunt",

        "mcs_7_taunt_female",

        "Provocação Do Carro 13",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            EmoteDuration = 5000

        }

    },

    ["cartaun"] = {

        "mp_intro_seq@mcs_7_race_taunt",

        "mcs_7_taunt_male",

        "Provocação Do Carro 14",

        AnimationOptions = {

            vehicleRequirement = VehicleRequirement.REQUIRED,

            EmoteDuration = 5000

        }

    },

    ["flexivel2"] = { -- Custom Emote By Amnilka

        "frabi@malepose@solo@firstsport",

        "pose_sport_002",

        "Fisiculturista 2",

        AnimationOptions = {

            onFootFlag = AnimFlag.MOVING -- Allows us to flex while performing another animation,

        }

    },

    ["academia"] = { -- Custom Female Emote By Souris

        "mouse@air_squat",

        "air_squat_clip",

        "Ginásio - Agachamento",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["academia2"] = { -- Custom Female Emote By Souris

        "mouse@byc_crunch",

        "byc_crunch_clip",

        "Ginásio - Flexões",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 400,

            ExitEmote = "getup"

        }

    },

    ["academia3"] = { -- Custom Female Emote By Souris

        "mouse@jump_exc",

        "jump_exc_clip",

        "Ginásio - Salto",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["academia4"] = { -- Custom Female Emote By Souris

        "mouse@jump_jack",

        "jump_jack_clip",

        "Ginásio - Polichinelos",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["gym5"] = { -- Custom Female Emote By Souris

        "mouse@situp",

        "situp_clip",

        "Gym - Sentar Up",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 550,

            ExitEmote = "getup"

        }

    },

    ["ginastica"] = { -- Custom Emote By Amnilka

        "frabi@malepose@solo@firstsport",

        "pose_sport_001",

        "Postura De Ginástica",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            vehicleRequirement = VehicleRequirement.NOT_ALLOWED

        }

    },

    ["ginastica2"] = { -- Custom Emote By Amnilka

        "frabi@malepose@solo@firstsport",

        "pose_sport_005",

        "Pose De Ginástica 2 - Flexão Com Uma Mão",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 550,

            ExitEmote = "standup",

            ExitEmoteType = "Saídas",

            vehicleRequirement = VehicleRequirement.NOT_ALLOWED

        }

    },

    ["ginastica3"] = { -- Custom Female Emote By Frabi

        "frabi@femalepose@solo@firstsport",

        "fem_pose_sport_004",

        "Pose De Ginástica 3 - Pose De Prancha",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 550,

            ExitEmote = "standup",

            ExitEmoteType = "Saídas",

            vehicleRequirement = VehicleRequirement.NOT_ALLOWED

        }

    },

    ["gympose4"] = { -- Custom Female Emote By Frabi

        "frabi@femalepose@solo@firstsport",

        "fem_pose_sport_005",

        "Gym Pose 4 - Sentar Ups Pose",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 510,

            ExitEmote = "getup",

            ExitEmoteType = "Saídas",

            vehicleRequirement = VehicleRequirement.NOT_ALLOWED

        }

    },

    -- CASINO DLC EMOTES (Requires gamebuild 2060 or higher)

    ["boxe3"] = {

        "melee@unarmed@streamed_core_fps",

        "idle",

        "Boxe 3",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["capoeira"] = {

        "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@",

        "med_right",

        "Capoeira",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["capoeira2"] = {

        "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@",

        "high_right_down",

        "Capoeira 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["taichi"] = {

        "anim@veh@van@mule5@rps",

        "lean_forward_idle",

        "Tai Chi",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["taichi2"] = {

        "switch@trevor@rand_temple",

        "tai_chi_trevor",

        "Tai Chi - Estranho",

        AnimationOptions = {}

    },

    ["salpico"] = {

        "stand_dab@dark",

        "stand_dab_clip",

        "Toque",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["posesexy7"] = { -- Custom Emote By Darks Animations

        "bad_girls_pose3@darks37",

        "bad_girls_pose3_clip",

        "Pose Sensual 7",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["modelo3"] = { -- Custom emote by Struggleville

        "anim@female_model_photo_cute",

        "photo_cute_clip",

        "Pose Do Modelo 3",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["layncry7"] = {

        "anim@scripted@data_leak@fixf_fin_ig2_johnnyguns_wounded@",

        "base",

        "Deitar & Choro 7",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 700,

            ExitEmote = "getup"

        }

    },

    ["layncry8"] = {

        "anim@scripted@data_leak@fix_golf_ig2_golfclub_intimidation@",

        "stage_3_base_golfer",

        "Deitar & Choro 8",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 700,

            ExitEmote = "getup"

        }

    },

    ["exercito1"] = {

        "bzzz@animation@army1", -- Custom Emote By BzZz

        "bz_army1",

        "Exército 1",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["exercito1l"] = {

        "bzzz@animation@army1_left", -- Custom Emote By BzZz

        "bz_army1_left",

        "Exército 1 Esquerda",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["exercito1p"] = {

        "bzzz@animation@army1_right", -- Custom Emote By BzZz

        "bz_army1_right",

        "Exército 1 Direita",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["exercito2"] = {

        "bzzz@animation@army2", -- Custom Emote By BzZz

        "bz_army2",

        "Exército 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["exercito2l"] = {

        "bzzz@animation@army2_left", -- Custom Emote By BzZz

        "bz_army2_left",

        "Exército 2 Esquerda",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["exercito2p"] = {

        "bzzz@animation@army2_right", -- Custom Emote By BzZz

        "bz_army2_right",

        "Exército 2 Direita",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["caminhadazumbi3"] = {

        "anim@ingame@move_m@zombie@core",

        "walk_up",

        "Andar Zumbi 3",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["caminhadazumbi4"] = {

        "anim@ingame@move_m@zombie@core",

        "run_turn_r3",

        "Corredor Zumbi - Círculo",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["zumbiswipe"] = {

        "anim@ingame@melee@unarmed@streamed_core_zombie",

        "short_-180_punch",

        "Golpe De Zumbi",

        AnimationOptions = {}

    },

    ["zumbiswipe2"] = {

        "anim@ingame@melee@unarmed@streamed_variations_zombie",

        "heavy_punch_b_var_2",

        "Golpe Zumbi 2",

        AnimationOptions = {}

    },

    ["zumbiswipe3"] = {

        "anim@ingame@melee@unarmed@streamed_core_zombie",

        "short_90_punch",

        "Golpe Zumbi 3",

        AnimationOptions = {}

    },

    ["laysexy"] = { -- Custom Emote By Amnilka

        "amnilka@photopose@female@homepack001",

        "amnilka_femalehome_photopose_004",

        "Deitar Sexy",

        AnimationOptions = {

            onFootFlag = AnimFlag.LOOP,

            StartDelay = 700,

            ExitEmote = "getup"

        }

    },

    ["garotaarmada1"] = { -- Custom Emote By Struggleville

        "anim@female_gunbunny_rifle_photo",

        "rifle_photo_clip",

        "Postura Do Rifle",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["colete2"] = {

        "anim@holding_side_vest",

        "holding_side_vest_clip",

        "Segure Colete 2",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["maoscruzadas"] = {

        "anim@amb@carmeet@checkout_car@",

        "male_e_base",

        "Cruzar Mãos",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["aslyes"] = {

        "ebrwny_sign",

        "ebrwny_yes",

        "Asl Sim 🇺🇸",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING, EmoteDuration = 1030}

    },

    ["aslnao"] = {

        "ebrwny_sign",

        "ebrwny_no",

        "Asl Não 🇺🇸",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING, EmoteDuration = 2080}

    },

    ["taofino"] = {

        "ebrwny_sign",

        "ebrwny_imgood",

        "Asl Eu Sou Bom 🇺🇸",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING, EmoteDuration = 3940}

    },

    ["aslcia"] = {

        "ebrwny_sign",

        "ebrwny_seeya",

        "Asl Até Mais 🇺🇸",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING, EmoteDuration = 1200}

    },

    ["aslwhat"] = {

        "ebrwny_sign",

        "ebrwny_what",

        "Asl O Que 🇺🇸",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING, EmoteDuration = 1480}

    },

    ["armaescondida"] = { -- Credit to Darks Animations for this exclusive rpemotes animation

        "pistol_b_b@dark",

        "pistol_b_b_clip",

        "Esconda Uma Arma",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["posefeminina"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@femalepose_10",

        "mrwitt",

        "Pose Feminina B",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["femininoadoravel1"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@adorable_style",

        "mrwitt",

        "Feminino Adorável 1",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["femininoadoravel2"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@adorable",

        "mrwitt",

        "Feminino Adorável 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@characterful_poses",

        "mrwitt",

        "Pose Feminina B",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@elegant_floor_hock",

        "mrwitt",

        "Pose Feminina B",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@femalepose_03",

        "mrwitt",

        "Pose Feminina D",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@femalepose_04",

        "mrwitt",

        "Pose Feminina E",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@femalepose_05",

        "mrwitt",

        "Pose Feminina F",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@femalepose_06",

        "mrwitt",

        "Pose Feminina G",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@femalepose_07",

        "mrwitt",

        "Pose Feminina H",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["poseifeminina"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@femalepose_09",

        "mrwitt",

        "Pose Feminina I",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefemininaj"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@femalepose_10",

        "mrwitt",

        "Pose Feminina J",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@femalepose_11",

        "mrwitt",

        "Pose Feminina K",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["poselfeminino"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@finger_gun_pose",

        "mrwitt",

        "Pose Feminina M",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@models_in_action",

        "mrwitt",

        "Pose Feminina M",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@photo_session_posing",

        "mrwitt",

        "Pose Feminina N",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@school_uniform_expression",

        "mrwitt",

        "Pose Feminina O",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@urban_posing",

        "mrwitt",

        "Pose Feminina M",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["poserfeminina"] = { -- Custom Emote By DRX Animations

        "drx@femalestand14",

        "xrd",

        "Pose Feminina R",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posesfemininas"] = { -- Custom Emote By DRX Animations

        "drx@femalestand15",

        "xrd",

        "Pose Feminina S",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emote By DRX Animations

        "drx@femalestand16",

        "xrd",

        "Pose Feminina T",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emote By DRX Animations

        "drx@f_sitcool",

        "drx",

        "Pose Feminina Em U",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP, ExitEmote = "getup"}

    },

    ["posefeminina"] = { -- Custom Emote By DRX Animations

        "drx@f_standcasual1",

        "drx",

        "Pose Feminina V",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emote By DRX Animations

        "drx@f_standcasual2",

        "drx",

        "Pose Feminina M",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["sexofeminino"] = { -- Custom Emote By DRX Animations

        "drx@femalestand7",

        "xrd",

        "Pose Feminina X",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posefeminina"] = { -- Custom Emote By DRX Animations

        "drx@femalestand8",

        "xrd",

        "Pose Feminina E",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posezfeminina"] = { -- Custom Emote By DRX Animations

        "drx@femalestand9",

        "xrd",

        "Pose Feminina Z",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["maleposea"] = { -- Custom Emote By DRX Animations

        "drx@singlemale1",

        "drx",

        "Pose Masculina A",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["maleposeb"] = { -- Custom Emote By DRX Animations

        "drx@singlemale2",

        "drx",

        "Pose Masculina B",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["maleposec"] = { -- Custom Emote By DRX Animations

        "drx@singlemalestand1",

        "drx",

        "Pose Masculina C",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["maleposto"] = { -- Custom Emote By DRX Animations

        "drx@singlemalestand2",

        "drx",

        "Pose Masculina D",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["maleposee"] = { -- Custom Emote By DRX Animations

        "drx@m_doublehands",

        "drx",

        "Pose Masculina E",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["maleposef"] = { -- Custom Emote By DRX Animations

        "drx@m_standhide",

        "drx",

        "Pose Masculina F",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["malepose1"] = { -- Custom Emote By DRX Animations

        "drx@malestand2",

        "xrd",

        "Pose Masculina E1",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["maleposef1"] = { -- Custom Emote By DRX Animations

        "drx@malestand3c",

        "xrd",

        "Pose Masculina F1",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["maleposeg"] = { -- Custom Emote By DRX Animations

        "drx@pose_male",

        "pose_male",

        "Pose Masculina G",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["maleposeh"] = { -- Custom Emote By MrWitt

        "mrwitt@gentleman_style_male",

        "mrwitt",

        "Pose Masculina H",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["maleposei"] = { -- Custom Emote By MrWitt

        "mrwitt@thoughtful_man_m",

        "mrwitt",

        "Pose Masculina I",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["maleposetie"] = { -- Custom Emotes By MrWhitt Provided To RPEmotes 01/08/2023

        "mrwitt@tie_perfection_in_suit_male",

        "mrwitt",

        "Gravata Pose Masculina",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["cruzetasmasculinas"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023

        "cross_arms@dark",

        "cross_arms_clip",

        "Masculino Cruzar Braços",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["masculinodedomedio"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023

        "stand_middlefinger@dark",

        "stand_middlefinger_clip",

        "Dedo Médio Masculino",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["caradepunhomasculino"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023

        "fist_face@darksj",

        "fist_face_clip",

        "Punho Masculino Rosto",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["malepose4"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023

        "fuckm@nxsty",

        "fuckm_clip",

        "Pose Masculina 4",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["posedearmamasculina1"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023

        "gun_ink@darksj",

        "gun_ink_clip",

        "Pose De Arma Masculina 1",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["malepose5"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023

        "koko_male@darksj",

        "koko_male_clip",

        "Pose Masculina 5",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["malepose3"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023

        "male_solo_1@darksj",

        "male_solo_1_clip",

        "Pose Masculina 3",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["malepose2"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023

        "male_solo_3@darksj",

        "male_solo_3_clip",

        "Pose Masculina 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["malepose1"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023

        "male_solo_4@darksj",

        "male_solo_4_clip",

        "Pose Masculina 1",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["verificacaodesapatomasculino"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023

        "side_shoe_check@darksj",

        "side_shoe_check_clip",

        "Pose De Verificação De Sapato Masculino",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["malegangpose"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023

        "westside_cap@darksj",

        "westside_cap_clip",

        "Pose De Gangue Masculina",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["iluminados"] = { -- Custom Emote By EnchantedBrwny

        "ebrwny_illum",

        "ebrwny_illum003",

        "Sinal Illuminati Mão",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["iluminati2"] = { -- Custom Emote By EnchantedBrwny

        "ebrwny_illum",

        "ebrwny_illum001",

        "Sinal Illuminati Mão 2",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["iluminati3"] = { -- Custom Emote By EnchantedBrwny

        "ebrwny_illum",

        "ebrwny_illum002",

        "Sinal Illuminati Mão 3",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["gunpoint"] = { -- Custom Emote Provided To RPEmotes Courtesy Of Darks Animations

        "male_gun@vanessssi",

        "male_gun_clip",

        "Gun Apontar - Robbery",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["pazma"] = { -- Custom Emote provided by 41anims

        "41animpeacebaddie@animation",

        "41animpeacebaddie_clip",

        "Pose Da Paz Do Malvado",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["baddiebendova"] = { -- Custom Emote provided by 41anims

        "bendova@animation",

        "bendova_clip",

        "Pose De Baddie Bendova",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["baddienailpose"] = { -- Custom Emote provided by 41anims

        "nailpose@animation",

        "nailpose_clip",

        "Pose Da Unha Do Vilão",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["afroditepose"] = { -- Custom Emote provided by corbs

        "aphrodite1@corbs",

        "aphrodite1_clip",

        "Postura De Afrodite",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["afroditepose2"] = { -- Custom Emote provided by corbs

        "aphrodite2@corbs",

        "aphrodite2_clip",

        "Pose De Afrodite 2",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    },

    ["afroditepose3"] = { -- Custom Emote provided by corbs

        "aphrodite3@corbs",

        "aphrodite3_clip",

        "Pose 3 De Afrodite",

        AnimationOptions = {onFootFlag = AnimFlag.LOOP}

    }

}

--- PROP EMOTES GO HERE. CURRENTLY SUPPORTS UP TO ONE OR TWO PROPS  ---

RP.PropEmotes = {

    ['umbrella2'] = {

        'rcmnigel1d',

        'base_club_shoulder',

        'Umbrella 2 - Right Shoulder',

        AnimationOptions = {

            Prop = 'p_amb_brolly_01',

            PropBone = 28422,

            PropPlacement = {

                0.0700, 0.0100, 0.1100, 2.3402393, -150.9605721, 57.3374916

            },

            onFootFlag = AnimFlag.MOVING,

            ExitEmote = "shakeitoffhuman"

        }

    },

    ['umbrella3'] = { -- Custom Emote Provided To RPEmotes By Mr Witt

        'mrwitt@rain_dreamy_pose',

        'mrwitt',

        'Umbrella 3 - Rain Check',

        AnimationOptions = {

            Prop = 'p_amb_brolly_01',

            PropBone = 58867,

            PropPlacement = {0.0150, 0.0340, -0.0340, 16.0040, -6.7284, -0.9319},

            onFootFlag = AnimFlag.MOVING,

            ExitEmote = "shakeitoffhuman"

        }

    },

    ['umbrella4'] = { -- Custom Emote  By Mr ultrahacx

        'custom@hold_umbrella',

        'hold_left',

        'Umbrella 4 - Hold Left',

        AnimationOptions = {

            Prop = 'p_amb_brolly_01',

            PropBone = 60309,

            PropPlacement = {0.0600, -0.0100, 0.0200, -94.3996, -1.7343, 9.9656},

            onFootFlag = AnimFlag.MOVING,

            ExitEmote = "shakeitoffhuman"

        }

    },

    -----------------------------------------------------------------------------------------------------

    ------ This is an example of an emote with 2 props, pretty simple! ----------------------------------

    -----------------------------------------------------------------------------------------------------

    ["presente"] = {

        "hold_flowers@dad", -- Custom Animation By Darks Animations

        "hold_flowers_clip",

        "Presente",

        AnimationOptions = {

            Prop = 'bzzz_prop_gift_orange',

            PropBone = 60309,

            PropPlacement = {

                0.0180, 0.0390, 0.1160, -82.4097, -157.5768, -27.6738

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["presente2"] = {

        "hold_flowers@dad", -- Custom Animation By Darks Animations

        "hold_flowers_clip",

        "Presente 2",

        AnimationOptions = {

            Prop = 'bzzz_prop_gift_purple',

            PropBone = 60309,

            PropPlacement = {

                0.0180, 0.0390, 0.1160, -82.4097, -157.5768, -27.6738

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["martelo"] = {

        "amb@world_human_hammering@male@base",

        "base",

        "Martelo",

        AnimationOptions = {

            Prop = 'prop_tool_mallet',

            PropBone = 28422,

            PropPlacement = {0.00, 0.00, 0.00, 0.00, 0.00, 0.00},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["serracraniana"] = {

        "anim@heists@fleeca_bank@drilling",

        "drill_straight_end",

        "Serra Craniana",

        AnimationOptions = {

            Prop = 'prop_cranial_saw',

            PropBone = 28422,

            PropPlacement = {0.00, 0.00, 0.05, 90.00, 0.00, 90.00},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["pistoladepregos"] = {

        "anim@heists@fleeca_bank@drilling",

        "drill_straight_end",

        "Pistola De Pregos",

        AnimationOptions = {

            Prop = 'prop_tool_nailgun',

            PropBone = 28422,

            PropPlacement = {0.00, 0.00, 0.00, 0.00, 0.00, 90.00},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["k12serra"] = {

        "anim@heists@fleeca_bank@drilling",

        "drill_straight_end",

        "Bombeiro Serra K12",

        AnimationOptions = {

            Prop = "prop_tool_consaw",

            PropBone = 28422,

            PropPlacement = {

                0.0, 0.0900, 0.0500, -70.3009797, 71.0092017, 83.759421

            },

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_paletoscore",

            PtfxName = "scr_paleto_box_sparks",

            PtfxNoProp = true,

            PtfxPlacement = {0.20, 0.88, 0.25, 0.0, 90.0, 180.0, 1.1},

            PtfxInfo = Translate('cut'),

            PtfxWait = 0.8,

            PtfxCanHold = false -- we set this to false, but yet it allows us to hold,

        }

    },

    ["extintordetransporte"] = {

        "amb@lo_res_idles@",

        "world_human_musician_bongos_lo_res_base",

        "Extintor De Bombeiros",

        AnimationOptions = {

            Prop = "prop_fire_exting_1a",

            PropBone = 28422,

            PropPlacement = {

                0.1500, 0.1400, -0.5200, 179.7874004, -178.5954846, 4.5961806

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["mascara"] = {

        "anim@mp_helmets@on_foot",

        "visor_up",

        "Desmascarar Bombeiro",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["mascaraparabaixo"] = {

        "anim@mp_helmets@on_foot",

        "visor_down",

        "Máscara De Bombeiro",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["decolagemdamascara"] = {

        "anim@scripted@bty5@ig1_intimidate_actor@female_heeled@",

        "mask_action_b",

        "Tirar Máscara",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["ajustarbolsa"] = {

        "amb@world_human_hiker_standing@male@idle_a",

        "idle_b",

        "Bombeiro Ajusta Tanque / Bolsa",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING, EmoteDuration = 9500}

    },

    ["paineldeajuste"] = {

        "anim@scripted@heist@ig9_control_tower@male@",

        "loop",

        "Bomba Bombeiro Psi",

        AnimationOptions = {onFootFlag = AnimFlag.MOVING}

    },

    ["smoke5"] = { -- Custom Emote Provided To RPEmotes By Mr Witt

        "mrwitt@composed_photo_moments",

        "mrwitt",

        "Fumar 5",

        AnimationOptions = {

            Prop = 'ng_proc_cigarette01a',

            PropBone = 64097,

            PropPlacement = {0.0020, 0.0010, -0.0090, 0.0, 0.0, 50.0},

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_mp_cig",

            PtfxName = "ent_anim_cig_smoke",

            PtfxNoProp = false,

            PtfxPlacement = {-0.07, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('smoke'),

            PtfxWait = 0.8,

            PtfxCanHold = true

        }

    },

    ["smoke6"] = {

        "anim@amb@carmeet@checkout_car@",

        "smoke_male_a_idle_b",

        "Fumar 6",

        AnimationOptions = {

            Prop = 'ng_proc_cigarette01a',

            PropBone = 28422,

            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_mp_cig",

            PtfxName = "ent_anim_cig_smoke",

            PtfxNoProp = false,

            PtfxPlacement = {-0.07, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('smoke'),

            PtfxWait = 0.8,

            PtfxCanHold = true

        }

    },

    ["bong3"] = {

        "sit_bong@dark",

        "sit_bong_clip",

        "Bong 3 - Sentar & Rip",

        AnimationOptions = {

            Prop = 'prop_bong_01',

            PropBone = 60309,

            PropPlacement = {

                0.0490, -0.2000, 0.0800, -85.0199, 102.3320, -15.0085

            },

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup",

            ExitEmoteType = "Saídas",

            PtfxAsset = "scr_agencyheistb",

            PtfxName = "scr_agency3b_elec_box",

            PtfxNoProp = true,

            PtfxBone = 31086,

            PtfxPlacement = {0.0, 0.170, 0.0, 0.0, 0.0, 0.0, 1.4},

            PtfxInfo = Translate('vape'),

            PtfxWait = 0.8,

            PtfxCanHold = true

        }

    },

    ["bong4"] = {

        "sit_bong@dark",

        "sit_bong_clip",

        "Bong 4 - Sentar & Rip Purple",

        AnimationOptions = {

            Prop = 'xm3_prop_xm3_bong_01a',

            PropBone = 60309,

            PropPlacement = {

                0.0490, -0.2000, 0.0800, -85.0199, 102.3320, -15.0085

            },

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup",

            ExitEmoteType = "Saídas",

            PtfxAsset = "scr_agencyheistb",

            PtfxName = "scr_agency3b_elec_box",

            PtfxNoProp = true,

            PtfxBone = 31086,

            PtfxPlacement = {0.0, 0.170, 0.0, 0.0, 0.0, 0.0, 1.4},

            PtfxInfo = Translate('vape'),

            PtfxWait = 0.8,

            PtfxCanHold = true

        }

    },

    ["junta2"] = { -- Custom Emote Provided To RPEmotes By Sel of Darks Animations

        "smoke_m@sel",

        "smoke_m_clip",

        "Passe Direto",

        AnimationOptions = {

            Prop = 'p_cs_joint_01',

            PropBone = 26612,

            PropPlacement = {

                0.0540, -0.0120, 0.0480, 172.3040, -131.4506, 45.1778

            },

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_mp_cig",

            PtfxName = "ent_anim_cig_smoke",

            PtfxNoProp = false,

            PtfxPlacement = {-0.07, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('smoke'),

            PtfxWait = 0.5,

            PtfxCanHold = true

        }

    },

    ["ligacaoparacafe"] = {

        "switch@michael@coffee_w_dave",

        "002291_02_fbi_3_coffee_w_dave_idle_dave",

        "Café Celular Chamada",

        AnimationOptions = {

            Prop = 'p_ing_coffeecup_01',

            PropBone = 28422,

            PropPlacement = {0.0, 0.0, -0.0140, 0.0, 0.0, 90.0},

            SecondProp = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            SecondPropBone = 60309,

            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["cerveja4"] = {

        "amb@world_human_drinking@beer@male@idle_a",

        "idle_b",

        "Cerveja 4 - Sirva Uma Para Os Manos",

        AnimationOptions = {

            Prop = 'p_cs_bottle_01',

            PropBone = 28422,

            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["cerveja4"] = {

        "fix_stu_ext-1",

        "a_f_y_studioparty_01^1_dual-1",

        "Cerveja Feminino 4",

        AnimationOptions = {

            Prop = 'prop_amb_beer_bottle',

            PropBone = 28422,

            PropPlacement = {0.08, 0.11, 0.0, -74.0, 0.0, 0.0},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["cerveja5"] = {

        "anim@scripted@freemode_npc@fix_dre_studio_entourage_b@",

        "stand_drink_cup_female_a_base",

        "Cerveja Feminino 5",

        AnimationOptions = {

            Prop = 'prop_amb_beer_bottle',

            PropBone = 28422,

            PropPlacement = {0.0, -0.0, 0.05, 15.0, 15.0, 0.0},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["carne"] = {

        "move_crouch_proto",

        "idle",

        "Carne No Palito",

        AnimationOptions = {

            Prop = 'bzzz_camp_stick_kebab',

            PropBone = 64080,

            PropPlacement = {

                0.0600, 0.0500, -0.1600, 17.0651, -30.9089, 60.0374

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["malva"] = {

        "move_crouch_proto",

        "idle",

        "Stick De Marshmallow - Branco",

        AnimationOptions = {

            Prop = 'bzzz_camp_stick_marshmallow',

            PropBone = 64080,

            PropPlacement = {

                0.0600, 0.0500, -0.1600, 17.0651, -30.9089, 60.0374

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["malva2"] = {

        "move_crouch_proto",

        "idle",

        "Stick De Marshmallow - Rosa",

        AnimationOptions = {

            Prop = 'bzzz_camp_stick_mellopink',

            PropBone = 64080,

            PropPlacement = {

                0.0600, 0.0500, -0.1600, 17.0651, -30.9089, 60.0374

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["malva3"] = {

        "move_crouch_proto",

        "idle",

        "Palito De Marshmallow - Queimado",

        AnimationOptions = {

            Prop = 'bzzz_camp_stick_melloburnt',

            PropBone = 64080,

            PropPlacement = {

                0.0600, 0.0500, -0.1600, 17.0651, -30.9089, 60.0374

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["cafe"] = {

        "amb@world_human_aa_coffee@base",

        "base",

        "Café",

        AnimationOptions = {

            Prop = 'pata_christmasfood1',

            PropBone = 28422,

            PropPlacement = {0.0100, -0.1100, -0.1300, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["hamburguerpose"] = { -- Custom Emote By Dark Animations exclusive to RPEmotes exclusive to RPEmotes

        "brugershot_dark_fixed@dark",

        "brugershot_dark_fixed_clip",

        "Hambúrguer - Pose",

        AnimationOptions = {

            Prop = 'prop_cs_burger_01',

            PropBone = 60309,

            PropPlacement = {0.0460, 0.0140, 0.0460, 3.4346, 20.1823, -10.000},

            SecondProp = 'ba_prop_battle_sports_helmet',

            SecondPropBone = 28422,

            SecondPropPlacement = {

                0.0400, -0.0100, -0.2000, 176.3835, -169.3724, 19.6834

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["refrigerante3"] = {

        "amb@code_human_wander_drinking@male@base",

        "static",

        "Refrigerante 3 - Copa P'S E Q'S",

        AnimationOptions = {

            Prop = 'v_ret_fh_bscup',

            PropBone = 28422,

            PropPlacement = {0.0, 0.0, 0.0400, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["refrigerante4"] = {

        "amb@code_human_wander_drinking@male@base",

        "static",

        "Refrigerante 4 - Copo Burger Shot",

        AnimationOptions = {

            Prop = 'prop_cs_bs_cup',

            PropBone = 28422,

            PropPlacement = {0.0060, 0.0010, 0.0, 0.0, 0.0, -150.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["refrigerante5"] = {

        "amb@code_human_wander_drinking@male@base",

        "static",

        "Refrigerante 5 - Copo De Combustível Hércules Power",

        AnimationOptions = {

            Prop = 'rpemotesreborn_soda03',

            PropBone = 28422,

            PropPlacement = {0.0060, 0.0010, 0.0, 0.0, 0.0, 80.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["refrigerante6"] = {

        "amb@code_human_wander_drinking@male@base",

        "static",

        "Refrigerante 6 - Taça Orang-O-Tang",

        AnimationOptions = {

            Prop = 'rpemotesreborn_soda04',

            PropBone = 28422,

            PropPlacement = {0.0060, 0.0010, 0.0, 0.0, 0.0, 80.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["refrigerante7"] = {

        "amb@code_human_wander_drinking@male@base",

        "static",

        "Refrigerante 7- Copa Lixo",

        AnimationOptions = {

            Prop = 'rpemotesreborn_soda01',

            PropBone = 28422,

            PropPlacement = {0.0060, 0.0010, 0.0, 0.0, 0.0, 80.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["refrigerante8"] = {

        "amb@code_human_wander_drinking@male@base",

        "static",

        "Refrigerante 8 - Copa Lixo",

        AnimationOptions = {

            Prop = 'rpemotesreborn_soda02',

            PropBone = 28422,

            PropPlacement = {0.0060, 0.0010, 0.0, 0.0, 0.0, 80.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sorvete"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Copo De Refrigerante - Lixo",

        AnimationOptions = {

            Prop = 'rpemotesreborn_soda01',

            PropBone = 28422,

            PropPlacement = {

                0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sipsodabe"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Copo De Refrigerante - Sprunk",

        AnimationOptions = {

            Prop = 'rpemotesreborn_soda02',

            PropBone = 28422,

            PropPlacement = {

                0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sipsodaco"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Copo De Refrigerante - Hercules Power Fuel",

        AnimationOptions = {

            Prop = 'rpemotesreborn_soda03',

            PropBone = 28422,

            PropPlacement = {

                0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sipsodad"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Copo De Refrigerante - Orang-O-Tang",

        AnimationOptions = {

            Prop = 'rpemotesreborn_soda04',

            PropBone = 28422,

            PropPlacement = {

                0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["dbsoda"] = {

        "amb@code_human_wander_drinking@male@base",

        "static",

        "Soda - Vadia Burra",

        AnimationOptions = {

            Prop = 'dumbbitchjuice',

            PropBone = 28422,

            PropPlacement = {

                0.0060, -0.0020, -0.0700, 180.0000, 180.0000, -10.0000

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["mojito"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Mojito",

        AnimationOptions = {

            Prop = 'prop_mojito',

            PropBone = 28422,

            PropPlacement = {0.0000, 0.0000, -0.0900, 0.0000, 0.0000, 130.0000},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["frape"] = {

        "amb@code_human_wander_drinking@male@base",

        "static",

        "Frapê",

        AnimationOptions = {

            Prop = 'brum_heartfrappe',

            PropBone = 28422,

            PropPlacement = {0.0, -0.0150, -0.0100, 0.0, -3.9999, 0.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["frape2"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Frapê 2",

        AnimationOptions = {

            Prop = 'beanmachine_cup',

            PropBone = 28422,

            PropPlacement = {0.0110, 0.0, 0.0300, 0.0, 0.0, -140.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["frape3"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Frapê 3",

        AnimationOptions = {

            Prop = 'beanmachine_cup2',

            PropBone = 28422,

            PropPlacement = {0.0, 0.0, -0.0600, 0.0, 0.0, -178.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["frape4"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Frapê 4",

        AnimationOptions = {

            Prop = 'beanmachine_cup3',

            PropBone = 28422,

            PropPlacement = {0.0, 0.0, -0.0600, 0.0, 0.0, -178.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["tremer"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Milkshake - Chiclete",

        AnimationOptions = {

            Prop = 'brum_cherryshake_bubblegum',

            PropBone = 28422,

            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["mshakeb"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Milk-Shake - Cereja",

        AnimationOptions = {

            Prop = 'brum_cherryshake_cherry',

            PropBone = 28422,

            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["mshakec"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Batido - Chocolate",

        AnimationOptions = {

            Prop = 'brum_cherryshake_chocolate',

            PropBone = 28422,

            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["abalado"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Milk-Shake - Café",

        AnimationOptions = {

            Prop = 'brum_cherryshake_coffee',

            PropBone = 28422,

            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["mshakee"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Milkshake - Chocolate Duplo",

        AnimationOptions = {

            Prop = 'brum_cherryshake_doublechocolate',

            PropBone = 28422,

            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["mshakef"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Milkshake - Frapê",

        AnimationOptions = {

            Prop = 'brum_cherryshake_frappe',

            PropBone = 28422,

            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["mshakeg"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Milk-Shake - Limão",

        AnimationOptions = {

            Prop = 'brum_cherryshake_lemon',

            PropBone = 28422,

            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["mshakeh"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Milk-Shake - Menta",

        AnimationOptions = {

            Prop = 'brum_cherryshake_mint',

            PropBone = 28422,

            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["mshakei"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Milk-Shake - Morango",

        AnimationOptions = {

            Prop = 'brum_cherryshake_strawberry',

            PropBone = 28422,

            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["mshakej"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Milk-Shake - Framboesa",

        AnimationOptions = {

            Prop = 'brum_cherryshake_raspberry',

            PropBone = 28422,

            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["mshakek"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Milkshake - Salgado",

        AnimationOptions = {

            Prop = 'brum_cherryshake_salted',

            PropBone = 28422,

            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["shakel"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Milk-Shake - Baunilha",

        AnimationOptions = {

            Prop = 'brum_cherryshake_vanilla',

            PropBone = 28422,

            PropPlacement = {0.0030, 0.0280, 0.0800, -180.0, -180.0, 30.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sorvete"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Beba Milkshake - Chiclete",

        AnimationOptions = {

            Prop = 'brum_cherryshake_raspberry',

            PropBone = 28422,

            PropPlacement = {

                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sipshakeb"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Beba Milkshake - Cereja",

        AnimationOptions = {

            Prop = 'brum_cherryshake_cherry',

            PropBone = 28422,

            PropPlacement = {

                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sipshakec"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Sorvete De Milkshake - Chocolate",

        AnimationOptions = {

            Prop = 'brum_cherryshake_chocolate',

            PropBone = 28422,

            PropPlacement = {

                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sacudido"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Beba Milkshake - Café",

        AnimationOptions = {

            Prop = 'brum_cherryshake_coffee',

            PropBone = 28422,

            PropPlacement = {

                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sorvete"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Sorvete De Milkshake - Chocolate Duplo",

        AnimationOptions = {

            Prop = 'brum_cherryshake_doublechocolate',

            PropBone = 28422,

            PropPlacement = {

                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sipshakef"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Beba Milkshake - Frappé",

        AnimationOptions = {

            Prop = 'brum_cherryshake_frappe',

            PropBone = 28422,

            PropPlacement = {

                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sipshakeg"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Beba Milkshake - Limão",

        AnimationOptions = {

            Prop = 'brum_cherryshake_lemon',

            PropBone = 28422,

            PropPlacement = {

                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sipshakeh"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Beba Milkshake - Menta",

        AnimationOptions = {

            Prop = 'brum_cherryshake_mint',

            PropBone = 28422,

            PropPlacement = {

                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sipshakei"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Beba Milkshake - Morango",

        AnimationOptions = {

            Prop = 'brum_cherryshake_strawberry',

            PropBone = 28422,

            PropPlacement = {

                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sipshakej"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Beba Milkshake - Framboesa",

        AnimationOptions = {

            Prop = 'brum_cherryshake_raspberry',

            PropBone = 28422,

            PropPlacement = {

                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sipshakek"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Sorvete De Milkshake - Salgado",

        AnimationOptions = {

            Prop = 'brum_cherryshake_salted',

            PropBone = 28422,

            PropPlacement = {

                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sorvete"] = {

        "smo@milkshake_idle",

        "milkshake_idle_clip",

        "Beba Milkshake - Baunilha",

        AnimationOptions = {

            Prop = 'brum_cherryshake_vanilla',

            PropBone = 28422,

            PropPlacement = {

                0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["refrigerante"] = {

        "anim@male_drinking_01",

        "m_drinking_01_clip",

        "Refrigerante Dedo Médio Ecola",

        AnimationOptions = {

            Prop = 'prop_ecola_can',

            PropBone = 26613,

            PropPlacement = {0.0400, -0.0500, 0.0390, 0.0000, 0.000, -69.9999},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["refrigerante2"] = {

        "anim@male_drinking_01",

        "m_drinking_01_clip",

        "Refrigerante Dedo Médio Sprunk",

        AnimationOptions = {

            Prop = 'ng_proc_sodacan_01b',

            PropBone = 26613,

            PropPlacement = {0.0300, -0.0600, -0.0700, 0.0000, 0.000, 0.000},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["livrob"] = {

        "holding_book_1@dark",

        "holding_book_1_clip",

        "Livro 2",

        AnimationOptions = {

            Prop = 'prop_cs_book_01',

            PropBone = 57005,

            PropPlacement = {

                0.0900, 0.0900, -0.0400, 80.1585, 158.5623, 24.7080

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["livroc"] = {

        "holding_book_2@dark",

        "holding_book_2_clip",

        "Livro 3",

        AnimationOptions = {

            Prop = "prop_michael_backpack",

            PropBone = 40269,

            PropPlacement = {

                0.0300, -0.1600, -0.0900, -170.7740, 112.8415, -20.0836

            },

            SecondProp = 'prop_cs_book_01',

            SecondPropBone = 18905,

            SecondPropPlacement = {

                0.0400, 0.0400, 0.0300, -69.0815, 176.3905, 19.3724

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["reservado"] = {

        "holding_book_3@dark",

        "holding_book_3_clip",

        "Livro 4",

        AnimationOptions = {

            Prop = 'prop_cs_stock_book',

            PropBone = 18905,

            PropPlacement = {0.0700, 0.0400, 0.0700, 0.0000, 0.0000, -15.0000},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["livro"] = {

        "holding_book_4@dark",

        "holding_book_4_clip",

        "Livro 5",

        AnimationOptions = {

            Prop = 'prop_cs_stock_book',

            PropBone = 57005,

            PropPlacement = {0.0100, 0.0100, -0.0600, 15.1511, 3.1232, -21.2448},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["livrof"] = {

        "holding_book_5@dark",

        "holding_book_5_clip",

        "Livro 6",

        AnimationOptions = {

            Prop = 'v_ilev_mp_bedsidebook',

            PropBone = 18905,

            PropPlacement = {

                0.2100, 0.0600, 0.0400, 170.6161, -14.2960, 28.8727

            },

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup"

        }

    },

    ["buque"] = {

        "hold_flowers@dad", -- Custom Animation By Darks Animations

        "hold_flowers_clip",

        "Buquê",

        AnimationOptions = {

            Prop = 'prop_snow_flower_02',

            PropBone = 60309,

            PropPlacement = {

                0.1100, -0.1300, 0.1200, -18.7186, 121.0529, -11.7724

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["buque2"] = {

        "hold_flowers@dad", -- Custom Animation By Darks Animations

        "hold_flowers_clip",

        "Buquê 2",

        AnimationOptions = {

            Prop = 'pata_freevalentinesday3',

            PropBone = 28422,

            PropPlacement = {-0.0100, 0.0300, -0.1700, -6.0697, 60.1852, 3.4934},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["camera"] = {

        "stand_camera_1@dad",

        "stand_camera_1_clip",

        "Câmera",

        AnimationOptions = {

            Prop = 'prop_pap_camera_01',

            PropBone = 57005,

            PropPlacement = {0.1040, -0.0060, -0.0600, -2.7280, 33.0998, 4.1917},

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_bike_business",

            PtfxName = "scr_bike_cfid_camera_flash",

            PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["camera4"] = {

        "chocoholic@single110a",

        "single110a_clip",

        "Câmera 4 - Câmera Para Transportar Notícias",

        AnimationOptions = {

            Prop = "prop_ing_camera_01",

            PropBone = 28422,

            PropPlacement = {0.0710, 0.0150, -0.0420, -68.3220, 99.6144, 2.9027},

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_bike_business",

            PtfxName = "scr_bike_cfid_camera_flash",

            PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["camera5"] = {

        "chocoholic@single110b",

        "single110b_clip",

        "Câmera 5",

        AnimationOptions = {

            Prop = "prop_ing_camera_01",

            PropBone = 60309,

            PropPlacement = {

                0.0980, 0.0560, 0.1330, -15.8221, 107.0825, -16.0159

            },

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_bike_business",

            PtfxName = "scr_bike_cfid_camera_flash",

            PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["dentesdaescova"] = {

        "mp_player_inteat@pnq",

        "loop_fp",

        "Escovar Os Dentes",

        AnimationOptions = {

            Prop = "prop_toothbrush_01",

            PropBone = 18905,

            PropPlacement = {0.14, 0.04, -0.02, -93.0, -159.0, 26.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["peso2"] = {

        "anim@radio_pose_3",

        "radio_holding_gun",

        "Walkie Talkie 2",

        AnimationOptions = {

            Prop = "prop_cs_hand_radio",

            PropBone = 60309,

            PropPlacement = {0.0750, 0.0470, 0.0110, -97.9442, 3.7058, -23.2367},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["peso3"] = {

        "anim@radio_left",

        "radio_left_clip",

        "Walkie Talkie 3 Esquerdo",

        AnimationOptions = {

            Prop = "prop_cs_hand_radio",

            PropBone = 60309,

            PropPlacement = {0.0750, 0.0470, 0.0110, -97.9442, 3.7058, -23.2367},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["peso4"] = {

        "anim@male@holding_radio",

        "holding_radio_clip",

        "Walkie Talkie 4",

        AnimationOptions = {

            Prop = "prop_cs_hand_radio",

            PropBone = 28422,

            PropPlacement = {0.0750, 0.0230, -0.0230, -90.0000, 0.0, -59.9999},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["pesos3"] = { -- Custom Emote By Amnilka

        "frabi@malepose@solo@firstsport",

        "pose_sport_004",

        "Pesos 3 - Postura",

        AnimationOptions = {

            Prop = 'prop_barbell_01',

            PropBone = 28422,

            PropPlacement = {

                0.0660, 0.0100, -0.0300, 90.0000, 90.0000, -79.9999

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["pesos4"] = { -- Custom Emote By Amnilka

        "frabi@malepose@solo@firstsport",

        "pose_sport_003",

        "Pesos 4 - Postura",

        AnimationOptions = {

            Prop = 'prop_barbell_01', -- Left Wrist,

            PropBone = 60309,

            PropPlacement = {0.0520, -0.0010, 0.0131, 21.5428, 70.2098, 74.5019},

            SecondProp = 'prop_barbell_01', -- Right Wrist,

            SecondPropBone = 28422,

            SecondPropPlacement = {

                0.0660, 0.0100, -0.0300, 90.0000, 90.0000, -79.9999

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["pesos5"] = { -- Custom Female Emote By Frabi

        "frabi@femalepose@solo@firstsport",

        "fem_pose_sport_001",

        "Pesos 5 - Postura Feminina",

        AnimationOptions = {

            Prop = 'v_res_tre_weight',

            PropBone = 28422, -- Right Wrist,

            PropPlacement = {

                0.0580, -0.0060, 0.0300, -11.8498, 170.2644, 7.8352

            },

            SecondProp = 'v_res_tre_weight',

            SecondPropBone = 60309, -- Left Wrist,

            SecondPropPlacement = {

                0.0880, 0.0000, 0.0590, -29.1132, -128.5627, 13.7517

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["pesos6"] = { -- Custom Female Emote By Frabi

        "frabi@femalepose@solo@firstsport",

        "fem_pose_sport_002",

        "Pesos 6 - Pose Feminina 2",

        AnimationOptions = {

            Prop = 'v_res_tre_weight',

            PropBone = 28422, -- Right Wrist,

            PropPlacement = {0.0700, 0.0400, -0.0600, 24.5966, 6.4814, -13.9845},

            SecondProp = 'v_res_tre_weight',

            SecondPropBone = 60309, -- Left Wrist,

            SecondPropPlacement = {

                0.0550, -0.0070, -0.0309, -20.5854, -15.0123, 0.5710

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["pesos7"] = { -- Custom Female Emote By Frabi

        "frabi@femalepose@solo@firstsport",

        "fem_pose_sport_003",

        "Pesos 7 - Pose Feminina 3",

        AnimationOptions = {

            Prop = 'prop_freeweight_01',

            PropBone = 28422, -- Right Wrist,

            PropPlacement = {

                0.0500, 0.0100, -0.0200, 88.6283, -51.8805, 54.3903

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["pesosbarra"] = {

        "amb@prop_human_seat_muscle_bench_press@idle_a",

        "idle_a",

        "Pesos - Barra 10Kg",

        AnimationOptions = {

            Prop = 'prop_barbell_10kg',

            PropBone = 28422, -- Right Wrist,

            PropPlacement = {0.000, 0.000, 0.000, 0.000, 0.000, 0.000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["pesosbarra2"] = {

        "amb@prop_human_seat_muscle_bench_press@idle_a",

        "idle_a",

        "Pesos - Barra 20Kg",

        AnimationOptions = {

            Prop = 'prop_barbell_20kg',

            PropBone = 28422, -- Right Wrist,

            PropPlacement = {0.000, 0.000, 0.000, 0.000, 0.000, 0.000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["pesosbarra3"] = {

        "amb@prop_human_seat_muscle_bench_press@idle_a",

        "idle_a",

        "Pesos - Barra 30Kg",

        AnimationOptions = {

            Prop = 'prop_barbell_30kg',

            PropBone = 28422, -- Right Wrist,

            PropPlacement = {0.000, 0.000, 0.000, 0.000, 0.000, 0.000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["pesosbarra4"] = {

        "amb@prop_human_seat_muscle_bench_press@idle_a",

        "idle_a",

        "Pesos - Barra 40Kg",

        AnimationOptions = {

            Prop = 'prop_barbell_40kg',

            PropBone = 28422, -- Right Wrist,

            PropPlacement = {0.000, 0.000, 0.000, 0.000, 0.000, 0.000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["pesosbarra5"] = {

        "amb@prop_human_seat_muscle_bench_press@idle_a",

        "idle_a",

        "Pesos - Barra 50Kg",

        AnimationOptions = {

            Prop = 'prop_barbell_50kg',

            PropBone = 28422, -- Right Wrist,

            PropPlacement = {0.000, 0.000, 0.000, 0.000, 0.000, 0.000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["pesosbarra6"] = {

        "amb@prop_human_seat_muscle_bench_press@idle_a",

        "idle_a",

        "Pesos - Barra 60Kg",

        AnimationOptions = {

            Prop = 'prop_barbell_60kg',

            PropBone = 28422, -- Right Wrist,

            PropPlacement = {0.000, 0.000, 0.000, 0.000, 0.000, 0.000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["pesosbarra7"] = {

        "amb@prop_human_seat_muscle_bench_press@idle_a",

        "idle_a",

        "Pesos - Barra 80Kg",

        AnimationOptions = {

            Prop = 'prop_barbell_80kg',

            PropBone = 28422, -- Right Wrist,

            PropPlacement = {0.000, 0.000, 0.000, 0.000, 0.000, 0.000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["pesosbarra8"] = {

        "amb@prop_human_seat_muscle_bench_press@idle_a",

        "idle_a",

        "Pesos - Barra 100Kg",

        AnimationOptions = {

            Prop = 'prop_barbell_100kg',

            PropBone = 28422, -- Right Wrist,

            PropPlacement = {0.000, 0.000, 0.000, 0.000, 0.000, 0.000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["etiqueta7"] = {

        "anim@scripted@freemode@tagcoll_ig_postertag@heeled@",

        "postertag",

        "Marcação 7",

        AnimationOptions = {

            Prop = "m24_1_prop_m41_spraycan_01a",

            PropBone = 28422,

            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["microck"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@mic@p1",

        "mic@p1",

        "Rocha do microfone",

        AnimationOptions = {

            Prop = "sf_prop_sf_mic_01a",

            PropBone = 28422,

            PropPlacement = {

                0.0300, 0.0200, -0.0300, 162.9608, -91.1712, -3.8249

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["microckb"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@mic@p2",

        "mic@p2",

        "Microfone Rock 2",

        AnimationOptions = {

            Prop = "sf_prop_sf_mic_01a",

            PropBone = 60309, -- Left Wrist,

            PropPlacement = {

                0.0350, 0.0180, 0.0290, -180.0000, -13.0000, 0.0000

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["microckc"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@mic@p3",

        "mic@p3",

        "Microfone Rock 3",

        AnimationOptions = {

            Prop = "sf_prop_sf_mic_01a",

            PropBone = 28422,

            PropPlacement = {

                0.0300, 0.0200, -0.0300, 162.9608, -91.1712, -3.8249

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["microckd"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@mic@p4",

        "mic@p4",

        "Microfone Rock 4",

        AnimationOptions = {

            Prop = "sf_prop_sf_mic_01a",

            PropBone = 28422,

            PropPlacement = {

                0.0300, 0.0200, -0.0300, 162.9608, -91.1712, -3.8249

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["microcke"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@mic@p5",

        "mic@p5",

        "Microfone Rock 5",

        AnimationOptions = {

            Prop = "sf_prop_sf_mic_01a",

            PropBone = 60309,

            PropPlacement = {

                0.0370, 0.0130, 0.0150, -173.6259, -93.5253, 4.6450

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["microckf"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@mic@p6",

        "mic@p6",

        "Microfone Rock 6",

        AnimationOptions = {

            Prop = "v_ilev_fos_mic",

            PropBone = 28422,

            PropPlacement = {

                -0.4410, -1.0600, -0.4800, -57.7266, 51.8164, 3.0976

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["microckg"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@mic@p7",

        "mic@p7",

        "Microfone Rock 7",

        AnimationOptions = {

            Prop = "v_ilev_fos_mic",

            PropBone = 28422,

            PropPlacement = {

                -0.8210, -0.0900, -1.1900, -2.5478, 36.3684, -11.7503

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["microckh"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@mic@p8",

        "mic@p8",

        "Microfone Rock 8",

        AnimationOptions = {

            Prop = "sf_prop_sf_mic_01a",

            PropBone = 60309,

            PropPlacement = {

                0.0370, 0.0130, 0.0150, -173.6259, -93.5253, 4.6450

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["microcki"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@mic@p9",

        "mic@p9",

        "Microfone Rock 9",

        AnimationOptions = {

            Prop = "sf_prop_sf_mic_01a",

            PropBone = 28422,

            PropPlacement = {

                0.0300, 0.0200, -0.0300, 162.9608, -91.1712, -3.8249

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["microckj"] = { -- Custom Emote Provided To RpEmotes By Prue颜

        "lunyx@mic@p10",

        "mic@p10",

        "Microfone Rock 10",

        AnimationOptions = {

            Prop = "sf_prop_sf_mic_01a",

            PropBone = 28422,

            PropPlacement = {

                0.0300, 0.0200, -0.0300, 162.9608, -91.1712, -3.8249

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["enxada3"] = {

        "anim@amb@drug_field_workers@rake@male_b@base",

        "idle_b",

        "Enxada 3",

        AnimationOptions = {

            Prop = "prop_tool_shovel5",

            PropBone = 28422,

            PropPlacement = {0.0, 0.0, -0.500, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["merda2"] = {

        "missfbi3ig_0",

        "nill",

        "Merda Enquanto Andando",

        AnimationOptions = {

            Prop = "prop_toilet_roll_01",

            PropBone = 28422,

            PropPlacement = {0.0700, -0.02000, -0.2100, 0, 0, 0.0, 0.0},

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_amb_chop",

            PtfxName = "ent_anim_dog_poo",

            PtfxNoProp = true,

            PtfxBone = 11816,

            PtfxPlacement = {0.0, 0.0, -0.1, 0.0, 0.0, 0.0, 1.4},

            PtfxInfo = Translate('poop'),

            PtfxWait = 0,

            PtfxCanHold = true

        }

    },

    ["vomitar"] = { -- Custom Emotes By Darks Animations Provided To RPEmotes 01/08/2023

        "cross_arms@dark",

        "cross_arms_clip",

        "Vomitar",

        AnimationOptions = {

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_paletoscore",

            PtfxName = "scr_trev_puke",

            PtfxNoProp = true,

            PtfxBone = 31086,

            PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('puke'),

            PtfxWait = 0.8,

            PtfxCanHold = true

        }

    },

    ["selfie8"] = {

        "anim@amb@carmeet@take_photos@",

        "female_b_idle_d",

        "Selfie 8",

        AnimationOptions = {

            Prop = "prop_phone_ing",

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 28422,

            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["selfie9"] = {

        "anim@amb@carmeet@take_photos@",

        "female_b_idle_b",

        "Selfie 9",

        AnimationOptions = {

            Prop = "prop_phone_ing",

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 28422,

            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["selfiealta"] = { -- Custom Emote By Darks Animations

        "girl_groupe_b@darksj",

        "girl_groupe_b_clip",

        "Selfie Em Alta",

        AnimationOptions = {

            Prop = "prop_phone_ing",

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 26611,

            PropPlacement = {

                0.0620, -0.0400, 0.0080, -17.1672, 9.8904, -18.1951

            },

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["selfieegirl"] = { -- Custom emote by Struggleville

        "anim@female_egirl_cute_selfie",

        "cute_selfie_clip",

        "Selfie E Garota",

        AnimationOptions = {

            Prop = "prop_phone_ing",

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 26613, -- Left Finger 30,

            PropPlacement = {

                0.0760, -0.0220, 0.0350, -22.0968, 30.4351, -7.9339

            },

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["selfielut"] = { -- Custom Emote By Struggleville

        "anim@female_floor_slutarch_selfie",

        "slutarch_selfie_clip",

        "Pose De Vagabunda Para Selfie",

        AnimationOptions = {

            Prop = "prop_phone_ing",

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 58868, -- Right Finger 20,

            PropPlacement = {

                0.0350, 0.0140, 0.0290, 167.9999, 180.0000, -8.8999

            },

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        },

        AdultAnimation = true

    },

    ["selfie"] = { -- Emote by WhiskerValeMod. Need to configure camera flash and texture variants

        "mouse@female_sitting_selfie",

        "female_sitting_selfie_clip",

        "Selfie Sentada",

        AnimationOptions = {

            Prop = 'prop_phone_ing',

            PropBone = 57005,

            PropPlacement = {

                0.1380, 0.0300, -0.0430, -111.0946, -117.8069, 11.7386

            },

            SecondProp = 'apa_mp_h_stn_chairarm_23',

            SecondPropBone = 0,

            SecondPropPlacement = {

                -0.0100, -0.0800, -0.6800, -180.0000, -180.0000, 10.0000

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["selfiesit2"] = { -- Emote by WolfSquareEmotes

        "eagle@boypose05",

        "boy",

        "Selfie Sentada 2",

        AnimationOptions = {

            Prop = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 4090, -- Left Finger 2,

            PropPlacement = {

                0.0130, 0.0120, -0.0070, -103.6673, -11.0026, 18.2605

            },

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["selfiesit3"] = { -- Emote by Chocoholic Animations

        "chocoholic@single77",

        "single77_clip",

        "Selfie Sentada 3",

        AnimationOptions = {

            Prop = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 4185,

            PropPlacement = {0.0130, -0.0190, 0.0320, 0.0, 0.0000, 0.0},

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup",

            ExitEmoteType = "Saídas",

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["selfiesit4"] = { -- Emote by Chocoholic Animations

        "chocoholic@single89",

        "single89_clip",

        "Selfie Sentada 4",

        AnimationOptions = {

            Prop = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 4169, -- Left Finger 11,

            PropPlacement = {0.0100, -0.0330, 0.000, -19.7197, 9.4080, -3.4048},

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["selfiesit5"] = { -- Emote by Chocoholic Animations

        "chocoholic@single83",

        "single83_clip",

        "Selfie Sentada 5",

        AnimationOptions = {

            Prop = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 64016,

            PropPlacement = {

                0.1080, -0.0160, 0.0300, -171.4163, -117.2863, 17.0148

            },

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup",

            ExitEmoteType = "Saídas",

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["selfiefloor2"] = { -- Custom Emote By Struggleville

        "anim@female_selfie_04",

        "f_selfie_04_clip",

        "Selfie Andar 2",

        AnimationOptions = {

            Prop = "prop_phone_ing",

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 4185,

            PropPlacement = {

                0.0170, -0.0100, 0.0200, -27.3580, 54.9374, -6.1611

            },

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup",

            ExitEmoteType = "Saídas",

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["selfiefloor3"] = { -- Custom Emote By Chocoholic Animations

        "chocoholic@single90",

        "single90_clip",

        "Selfie E Vinho",

        AnimationOptions = {

            Prop = 'p_wine_glass_s',

            PropBone = 28422,

            PropPlacement = {

                0.0800, 0.0170, 0.0810, -174.2748, -11.5083, 29.4987

            },

            SecondProp = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            SecondPropBone = 4186, -- Left Finger 22,

            SecondPropPlacement = {

                -0.0100, 0.0000, 0.0200, -80.0000, 0.0000, -20.0000

            },

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200,

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup"

        }

    },

    ['selfiehb'] = { -- Custom prop by crowded1337

        'anim@female_selfie_cute',

        'selfie_cute_clip',

        'Selfie Hand Bag',

        AnimationOptions = {

            Prop = 'prop_amb_handbag_01',

            PropBone = 28422, -- Right Wrist,

            PropPlacement = {

                0.1700, 0.0020, -0.1000, 105.4525, -178.3549, 69.1794

            },

            SecondProp = 'prop_phone_ing', -- Cell Phone Left Finger 21,

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            SecondPropBone = 4185,

            SecondPropPlacement = {

                0.0200, -0.0250, 0.0000, -8.5947, 30.6141, -5.1311

            },

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["selfiemeh"] = { -- Custom Animation By Chocoholic Animations

        "chocoholic@single81",

        "single81_clip",

        "Selfie Meh",

        AnimationOptions = {

            Prop = "prop_phone_ing",

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 58868,

            PropPlacement = {

                0.0450, 0.0310, 0.0280, 165.3005, -174.8342, -8.4770

            },

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["selfievinho"] = { -- Custom Emote By Wolf's Square

        "holding_wine@taking_selfie",

        "base",

        "Vinho Selfie",

        AnimationOptions = {

            Prop = 'p_wine_glass_s',

            PropBone = 28422,

            PropPlacement = {

                0.0420, -0.0700, -0.0440, -82.6657, 1.2898, -19.9222

            },

            SecondProp = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            SecondPropBone = 4090,

            SecondPropPlacement = {

                0.0250, -0.0080, -0.0050, -140.5541, -24.7476, 13.7795

            },

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["selfieespelhofeminino"] = {

        "mirror_selfie_1@janina234",

        "mirror_selfie_1_clip",

        "Selfie Feminina No Espelho",

        AnimationOptions = { -- Custom emote by Janina234

            Prop = "prop_phone_ing",

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 4089,

            PropPlacement = {

                0.0890, -0.0350, 0.0200, -161.7778308, -54.5014945, -12.0985177

            },

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["espelhofemininoselfie1"] = {

        "mirror_selfie_8@daj",

        "mirror_selfie_8_clip",

        "Selfie De Espelho Feminino 1",

        AnimationOptions = { -- Custom emote by Dark

            Prop = "prop_phone_ing",

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 4153,

            PropPlacement = {

                0.0400, 0.00000, 0.0500, -37.4803963, 33.2648588, 18.6732448

            },

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["camerafotografia"] = { -- Custom emote by MrWitt

        "mrwitt@photographic_journey_f",

        "mrwitt",

        "Câmera Fotografia",

        AnimationOptions = {

            Prop = 'prop_pap_camera_01',

            PropBone = 26613,

            PropPlacement = {

                0.0280, -0.1350, 0.1120, -86.9428843, 157.9882355, 80.8053557

            },

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_bike_business",

            PtfxName = "scr_bike_cfid_camera_flash",

            PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["espelhomasculinoselfie"] = { -- Custom emote by Struggleville

        "anim@male_model_08",

        "m_model_08_clip",

        "Selfie De Espelho Masculino",

        AnimationOptions = {

            Prop = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 4169,

            PropPlacement = {

                0.0300, -0.0200, 0.0200, -64.2080926, 3.367247, 0.0711684

            },

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["espelhomasculinoselfie1"] = { -- Custom emote by Struggleville

        "anim@male_selfie_08",

        "m_selfie_08_clip",

        "Selfie De Espelho Masculino 1",

        AnimationOptions = {

            Prop = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 4169,

            PropPlacement = {

                0.0100, -0.0400, 0.0000, -32.8072134, 11.7427793, 32.5772863

            },

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["espelhomasculinoselfie2"] = { -- Custom emote by Struggleville

        "anim@male_selfie_06",

        "m_selfie_06_clip",

        "Selfie De Espelho Masculino 2",

        AnimationOptions = {

            Prop = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 4169,

            PropPlacement = {

                0.0200, -0.0200, 0.0100, -69.7707963, 3.10072, -8.4531301

            },

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup",

            ExitEmoteType = "Saídas",

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["espelhomasculinoselfie4"] = { -- Custom emote by Struggleville

        "anim@male_model_03",

        "m_model_03_clip",

        "Selfie De Espelho Masculino 4",

        AnimationOptions = {

            Prop = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 4169,

            PropPlacement = {

                0.0100, -0.0600, -0.0100, -23.7215768, 66.9464998, -62.7303262

            },

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["espelhomasculinoselfie3"] = { -- Custom emote by Struggleville

        "anim@male_selfie_09",

        "m_selfie_09_clip",

        "Selfie De Espelho Masculino 3",

        AnimationOptions = {

            Prop = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 4169,

            PropPlacement = {

                0.0400, -0.0300, 0.0000, -46.0563529, -0.6965831, -4.2803096

            },

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["sitchairf"] = { -- Emote by WhiskerValeMods

        "mouse@femalearmchair",

        "female_armchair_clip_01",

        "Sentar Chair - Armchair",

        AnimationOptions = {

            Prop = "p_armchair_01_s",

            PropBone = 11816,

            PropPlacement = {

                0.5320, -0.3310, 0.2000, -90.0000, -180.0000, -40.9999

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["sitchairf2"] = { -- Custom Emote by WhiskerValeMods

        "mouse@female_sitting_folded",

        "female_sitting_folded_clip",

        "Sentar Chair - Braços Folded",

        AnimationOptions = {

            Prop = "ba_prop_battle_club_chair_03",

            PropBone = 0,

            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, -170.0000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["sitchairf3"] = { -- Custom Emote by WhiskerValeMods

        "mouse@female_sitting_forward",

        "female_sitting_forward_clip",

        "Sentar Chair - Encostado Forward",

        AnimationOptions = {

            Prop = "ba_prop_battle_club_chair_03",

            PropBone = 0,

            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, -170.0000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["sitchairf4"] = { -- Custom Emote by WhiskerValeMods

        "mouse@female_smart_sitting",

        "female_smart_sitting_clip",

        "Sentar Chair - Smart",

        AnimationOptions = {

            Prop = "ba_prop_battle_club_chair_03",

            PropBone = 0,

            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, -170.0000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["sitchairf5"] = { -- Custom Emote By WhiskerValeMods

        "mouse@female_smart_sitting_crossed",

        "female_smart_sitting_crossed_clip",

        "Sentar Chair - Legs Cruzado",

        AnimationOptions = {

            Prop = "ba_prop_battle_club_chair_03",

            PropBone = 0,

            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, -170.0000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["sitchairf6"] = { -- Custom Emote By WhiskerValeMods

        "mouse@female_sitting_laptop",

        "female_sitting_laptop_clip",

        "Sentar Chair - Laptop",

        AnimationOptions = {

            Prop = 'ba_prop_club_laptop_dj_02',

            PropBone = 57005,

            PropPlacement = {

                0.0860, -0.1370, -0.1750, -79.9999, -90.0000, 0.0000

            },

            SecondProp = 'ba_prop_battle_club_chair_02',

            SecondPropBone = 0,

            SecondPropPlacement = {

                -0.0400, -0.1900, 0.0000, -180.0000, -180.0000, 9.0999

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["sitchairf7"] = { -- Custom Emote By Emote by WhiskerValeMods

        "mouse@female_sitting_tablet",

        "female_sitting_tablet_clip",

        "Sentar Chair - Tablet",

        AnimationOptions = {

            Prop = 'hei_prop_dlc_tablet',

            PropBone = 28422,

            PropPlacement = {

                0.0870, 0.1030, -0.1240, 144.3540, 157.8527, -4.6318

            },

            SecondProp = 'ba_prop_battle_club_chair_02',

            SecondPropBone = 0,

            SecondPropPlacement = {

                0.0100, -0.0800, 0.0200, 150.0000, -180.0000, 10.0000

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["sitchairf8"] = { -- Custom Emote By Emote by WhiskerValeMods

        "mouse@female_sitting_tablet",

        "female_sitting_tablet_clip",

        "Sentar Chair - Book",

        AnimationOptions = {

            Prop = 'v_ilev_mp_bedsidebook',

            PropBone = 28422,

            PropPlacement = {

                0.1300, 0.1100, -0.1200, 120.3356, -15.9891, 26.1497

            },

            SecondProp = 'ba_prop_battle_club_chair_02',

            SecondPropBone = 0,

            SecondPropPlacement = {

                0.0100, -0.0800, 0.0200, 150.0000, -180.0000, 10.0000

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ['axe'] = {

        'rcmnigel1d',

        'base_club_shoulder',

        'Axe',

        AnimationOptions = {

            Prop = 'prop_tool_fireaxe',

            PropBone = 18905,

            PropPlacement = {

                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['axe3'] = {

        'rcmnigel1d',

        'base_club_shoulder',

        'Axe - Pickaxe',

        AnimationOptions = {

            Prop = 'prop_tool_pickaxe',

            PropBone = 57005,

            PropPlacement = {

                0.0400, -0.2550, -0.1380, -109.0238, 163.6144, 20.6091

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['shopbag4'] = {

        'chocoholic@single54',

        'single54_clip',

        'Shopping Bag 4',

        AnimationOptions = {

            Prop = 'prop_carrier_bag_01',

            PropBone = 28422,

            PropPlacement = {

                0.2280, 0.0070, -0.1230, 1.2556, -53.8020, -34.4621

            },

            SecondProp = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            SecondPropBone = 60309, -- Left Wrist,

            SecondPropPlacement = {

                0.0910, 0.0410, -0.0040, -129.2433, -18.1966, -41.2633

            },

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200,

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["convocar"] = {

        "anim@scripted@surv@ig3_plague_summon@male@",

        "summon_a",

        "Convocar",

        AnimationOptions = {

            Prop = "m24_1_prop_m41_zombiestaff_01a",

            PropBone = 28422,

            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["convocar2"] = {

        "anim@scripted@surv@ig3_plague_summon@male@",

        "summon_b",

        "Invocar2",

        AnimationOptions = {

            Prop = "m24_1_prop_m41_zombiestaff_01a",

            PropBone = 28422,

            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["cartaodeidentificacao"] = {

        "cop_badge_1@dad", -- Custom Animation by Darks Animations

        "cop_badge_1_clip",

        "Cartão De Identificação 1",

        AnimationOptions = {

            Prop = "prop_franklin_dl",

            PropBone = 28422,

            PropPlacement = {

                0.0840, 0.0200, -0.0260, -173.8514, -88.0171, 63.0612

            },

            onFootflag = AnimFlag.STUCK,

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["idcardc"] = {

        "cop_badge_1@dad", -- Custom Animation by Darks Animations

        "cop_badge_1_clip",

        "Carteira De Identidade 3",

        AnimationOptions = {

            Prop = "prop_michael_sec_id",

            PropBone = 28422,

            PropPlacement = {

                0.0840, 0.0200, -0.0260, -173.8514, -88.0171, 63.0612

            },

            onFootflag = AnimFlag.STUCK,

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["cartaodeidentificacao"] = {

        "cop_badge_1@dad", -- Custom Animation by Darks Animations

        "cop_badge_1_clip",

        "Carteira De Identidade 4",

        AnimationOptions = {

            Prop = "prop_trev_sec_id",

            PropBone = 28422,

            PropPlacement = {

                0.0840, 0.0200, -0.0260, -173.8514, -88.0171, 63.0612

            },

            onFootflag = AnimFlag.STUCK,

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["idcard"] = {

        "cop_badge_1@dad", -- Custom Animation by Darks Animations

        "cop_badge_1_clip",

        "Carteira De Identidade 5",

        AnimationOptions = {

            Prop = "prop_casey_sec_id",

            PropBone = 28422,

            PropPlacement = {

                0.0840, 0.0200, -0.0260, -173.8514, -88.0171, 63.0612

            },

            onFootflag = AnimFlag.STUCK,

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["idcardf"] = {

        "cop_badge_1@dad", -- Custom Animation by Darks Animations

        "cop_badge_1_clip",

        "Carteira De Identidade 6",

        AnimationOptions = {

            Prop = "prop_cs_r_business_card",

            PropBone = 28422,

            PropPlacement = {

                0.0840, 0.0200, -0.0260, -173.8514, -88.0171, 63.0612

            },

            onFootflag = AnimFlag.STUCK,

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["cartaodeidentificacao"] = {

        "cop_badge_1@dad", -- Custom Animation by Darks Animations

        "cop_badge_1_clip",

        "Carteira De Identidade 7",

        AnimationOptions = {

            Prop = "p_ld_id_card_002",

            PropBone = 28422,

            PropPlacement = {

                0.0840, 0.0200, -0.0260, -173.8514, -88.0171, 63.0612

            },

            onFootflag = AnimFlag.STUCK,

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["idcardh"] = {

        "cop_badge_1@dad", -- Custom Animation by Darks Animations

        "cop_badge_1_clip",

        "Carteira De Identidade 8 - Distintivo De Policial",

        AnimationOptions = {

            Prop = "prop_cop_badge",

            PropBone = 28422,

            PropPlacement = {

                0.0390, -0.0100, -0.0590, -103.1785, -176.6694, 74.9000

            },

            onFootflag = AnimFlag.STUCK,

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["smssit"] = { -- Custom Emote Provided To RPEmotes By Mr. Witt

        "mrwitt@phone_time_on_floor",

        "mrwitt",

        "SMS Sentar",

        AnimationOptions = {

            Prop = "prop_phone_ing",

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 26611,

            PropPlacement = {0.0560, -0.0270, 0.0170, -19.9298, -4.6998, 1.7081},

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup",

            ExitEmoteType = "Saídas",

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ['pflag'] = {

        'rcmnigel1d',

        'base_club_shoulder',

        'Pride Flag - Rainbow',

        AnimationOptions = {

            Prop = 'prideflag1',

            PropBone = 18905,

            PropPlacement = {

                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['pflag2'] = {

        'rcmnigel1d',

        'base_club_shoulder',

        'Pride Flag 2 - LGBTQ',

        AnimationOptions = {

            Prop = 'prideflag2',

            PropBone = 18905,

            PropPlacement = {

                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['pflag3'] = {

        'rcmnigel1d',

        'base_club_shoulder',

        'Pride Flag 3 - Bisexual ',

        AnimationOptions = {

            Prop = 'prideflag3',

            PropBone = 18905,

            PropPlacement = {

                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['pflag4'] = {

        'rcmnigel1d',

        'base_club_shoulder',

        'Pride Flag 4 - Lesbian ',

        AnimationOptions = {

            Prop = 'prideflag4',

            PropBone = 18905,

            PropPlacement = {

                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['pflag5'] = {

        'rcmnigel1d',

        'base_club_shoulder',

        'Pride Flag 5 - Pansexual ',

        AnimationOptions = {

            Prop = 'prideflag5',

            PropBone = 18905,

            PropPlacement = {

                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['pflag6'] = {

        'rcmnigel1d',

        'base_club_shoulder',

        'Pride Flag 6 - Transgender  ',

        AnimationOptions = {

            Prop = 'prideflag6',

            PropBone = 18905,

            PropPlacement = {

                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['pflag7'] = {

        'rcmnigel1d',

        'base_club_shoulder',

        'Pride Flag 7 - Non Binary ',

        AnimationOptions = {

            Prop = 'prideflag7',

            PropBone = 18905,

            PropPlacement = {

                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['pflag8'] = {

        'rcmnigel1d',

        'base_club_shoulder',

        'Pride Flag 8 - Asexual ',

        AnimationOptions = {

            Prop = 'prideflag8',

            PropBone = 18905,

            PropPlacement = {

                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['pflag9'] = {

        'rcmnigel1d',

        'base_club_shoulder',

        'Pride Flag 9 - Straight Ally ',

        AnimationOptions = {

            Prop = 'prideflag9',

            PropBone = 18905,

            PropPlacement = {

                0.0800, -0.2090, 0.0900, -82.6677, -141.2988, 12.3308

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['old'] = {

        'missbigscore2aleadinout@bs_2a_2b_int',

        'lester_base_idle',

        'Old Man Walking Stick',

        AnimationOptions = {

            Prop = 'prop_cs_walking_stick',

            PropBone = 28422,

            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},

            SecondProp = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            SecondPropBone = 60309, -- Left Wrist,

            SecondPropPlacement = {

                0.0740, 0.0410, 0.0090, -127.9136, -10.6186, 4.7536

            },

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200,

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['old2'] = { -- Custom Animation By Darks Animations

        'zimmerframe_walk@dark',

        'zimmerframe_walk_clip',

        'Old Man Zimmerframe',

        AnimationOptions = {

            Prop = 'v_res_d_zimmerframe',

            PropBone = 28252,

            PropPlacement = {

                0.9500, -0.6640, -0.5470, -122.4053, 85.0955, 23.1787

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['lighter'] = {

        'ebrwny_pack000',

        'ebrwny_spark',

        'Lighter - Cigar',

        AnimationOptions = {

            Prop = 'lux_prop_lighter_luxe',

            PropBone = 26612,

            PropPlacement = {

                0.0300, -0.0360, 0.0270, -168.0000, -180.0000, 8.0000

            },

            SecondProp = 'prop_cigar_01',

            SecondPropBone = 17188,

            SecondPropPlacement = {0.0450, 0.0130, 0.0170, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_mp_cig",

            PtfxName = "ent_anim_cig_smoke",

            PtfxNoProp = false,

            PtfxPlacement = {0.0615, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5},

            PtfxInfo = Translate('smoke'),

            PtfxWait = 0.8,

            PtfxCanHold = true

        }

    },

    ['lighter2'] = {

        'ebrwny_pack000',

        'ebrwny_spark',

        'Lighter - Cigar Sit',

        AnimationOptions = {

            Prop = 'lux_prop_lighter_luxe',

            PropBone = 26612,

            PropPlacement = {

                0.0300, -0.0360, 0.0270, -168.0000, -180.0000, 8.0000

            },

            SecondProp = 'prop_cigar_01',

            SecondPropBone = 17188,

            SecondPropPlacement = {0.0450, 0.0130, 0.0170, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.LOOP,

            PtfxAsset = "scr_mp_cig",

            PtfxName = "ent_anim_cig_smoke",

            PtfxNoProp = false,

            ExitEmote = "getup",

            ExitEmoteType = "Saídas",

            PtfxPlacement = {0.0615, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5},

            PtfxInfo = Translate('smoke'),

            PtfxWait = 0.8,

            PtfxCanHold = true

        }

    },

    ["festalighter"] = { -- Custom Prop & Emote By BzZz

        "samnick@lighter@wave",

        "waving_lighter",

        "Festa Mais Leve",

        AnimationOptions = {

            Prop = 'samnick_prop_lighter01',

            PropBone = 18905,

            PropPlacement = {0.11, 0.01, 0.02, -85.0, 188.0, 10.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['digiscan'] = {

        'weapons@misc@digi_scanner',

        'aim_med_loop',

        'Digiscan 1 ',

        AnimationOptions = {

            Prop = 'w_am_digiscanner',

            PropBone = 28422,

            PropPlacement = {0.0480, 0.0780, 0.0040, -81.6893, 2.5616, -15.7909},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['digiscan2'] = {

        'weapons@misc@digi_scanner',

        'aim_low_loop',

        'Digiscan 2 ',

        AnimationOptions = {

            Prop = 'w_am_digiscanner',

            PropBone = 28422,

            PropPlacement = {0.0480, 0.0780, 0.0040, -81.6893, 2.5616, -15.7909},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['digiscan3'] = {

        'weapons@misc@digi_scanner',

        'aim_high_loop',

        'Digiscan 3 ',

        AnimationOptions = {

            Prop = 'w_am_digiscanner',

            PropBone = 28422,

            PropPlacement = {0.0480, 0.0780, 0.0040, -81.6893, 2.5616, -15.7909},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["bolsadeaeroporto2"] = { -- Custom Emote By Dark Animations exclusive to RPEmotes

        "suitcase_phone@dark",

        "suitcase_phone_clip",

        "Bolsa Aeroporto 2 - Celular",

        AnimationOptions = {

            Prop = 'prop_suitcase_03',

            PropBone = 60309,

            PropPlacement = {

                0.4700, -0.0400, -0.3500, -120.0000, -180.0000, -79.9999

            },

            SecondProp = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            SecondPropBone = 28422,

            SecondPropPlacement = {

                0.1040, 0.0320, -0.0200, -108.6997, -150.5805, 46.7080

            },

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200

        }

    },

    ["bolsadeaeroporto3"] = { -- Custom Emote By Chocoholic Animations

        "chocoholic@single63",

        "single63_clip",

        "Bolsa Aeroporto 3 - Pose",

        AnimationOptions = {

            Prop = "prop_suitcase_03",

            PropBone = 58869,

            PropPlacement = {

                0.2100, 0.4100, -0.3600, 56.9074, -6.1917, -24.3334

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["megafone3"] = {

        "anim@rifle_megaphone",

        "rifle_holding_megaphone",

        "Megafone 3",

        AnimationOptions = {

            Prop = "prop_megaphone_01",

            PropBone = 60309,

            PropPlacement = {

                0.0480, 0.0190, 0.0160, -94.8944, -2.3093, -10.9030

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["bola5"] = {

        "cover@weapon@grenade",

        "hi_r_cook",

        "Postura De Basquete",

        AnimationOptions = {

            Prop = "prop_bskball_01",

            PropBone = 28422,

            PropPlacement = {

                0.0400, 0.0200, -0.1400, 90.0000, -99.9999, 79.9999

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ['ftorch2'] = {

        'special_ped@griff@base',

        'base',

        'Fire Torch 2',

        AnimationOptions = {

            Prop = "bzzz_prop_torch_fire001", -- Custom Prop by BzZz Used With Permission,

            PropBone = 28422,

            PropPlacement = {0.0100, 0.0300, 0.0500, 0.0000, 0.0000, 0.0000},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ['candle'] = {

        'special_ped@griff@base',

        'base',

        'Candle',

        AnimationOptions = {

            Prop = "v_res_fa_candle04",

            PropBone = 28422,

            PropPlacement = {0.0200, 0.0100, 0.0100, 0.0000, 10.0000, 0.0000},

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "core",

            PtfxName = "ent_amb_candle_flame",

            PtfxNoProp = true,

            PtfxBone = 28422,

            PtfxPlacement = {0.0200, 0.0100, 0.0600, 0.0000, 10.0000, 0.0000},

            PtfxInfo = Translate('candle'),

            PtfxWait = 30000, -- ptfxwait is in ms, so 30000 = 30 seconds. This allows the effect to linger for 30 seconds.,

            PtfxCanHold = true

        }

    },

    ["jogador2"] = { -- Custom Emote By Dark Animations exclusive to RPEmotes

        "lay_controller@dark",

        "lay_controller_clip",

        "Jogador Deitado De Bruços",

        AnimationOptions = {

            Prop = 'prop_controller_01',

            PropBone = 18905,

            PropPlacement = {

                0.1350, 0.0360, 0.0950, -180.0000, -72.9699, 0.0000

            },

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup"

        }

    },

    ["estudar"] = { -- Custom Emote By Dark Animations exclusive to RPEmotes

        "study_pc_finally_fixed@dark",

        "study_pc_finally_fixed_clip",

        "Estude",

        AnimationOptions = {

            Prop = 'xm_prop_x17_laptop_lester_01',

            PropBone = 28422,

            PropPlacement = {

                0.1650, 0.1010, -0.1470, -159.2533, -145.7418, -79.5760

            },

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup"

        }

    },

    ["frioteq"] = { -- Custom Emote By Amnilka

        "amnilka@photopose@female@homepack001",

        "amnilka_femalehome_photopose_003",

        "Tequila Gelada",

        AnimationOptions = {

            Prop = 'prop_tequila',

            PropBone = 60309,

            PropPlacement = {

                0.0810, -0.0460, 0.0430, -110.1784, 2.9283, -12.5092

            },

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup"

        }

    },

    ["vlog"] = {

        "amb@world_human_mobile_film_shocking@male@base",

        "base",

        "Vlog",

        AnimationOptions = {

            Prop = 'prop_ing_camera_01',

            PropBone = 28422,

            PropPlacement = {-0.07, -0.01, 0.0, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["skatesit"] = { -- Custom Emote By CMG Mods

        "skateboardposecmganimation",

        "skateboardposecmg_clip",

        "Skateboard - Sentar",

        AnimationOptions = {

            Prop = 'rpemotesreborn_skateboard01',

            PropBone = 0,

            PropPlacement = {0.0, 0.0400, -0.2300, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["skatesit2"] = { -- Custom Emote By Chocoholic Animations

        "chocoholic@skate2",

        "skate2_clip",

        "Skateboard - Sentar 2",

        AnimationOptions = {

            Prop = "rpemotesreborn_skateboard02",

            PropBone = 0,

            PropPlacement = {0.0, -0.0200, -0.2900, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["joelhodeskate"] = { -- Custom Emote By DRX Animations

        "drx@skateboard3",

        "drx",

        "Skate Ajoelhado - Masculino",

        AnimationOptions = {

            Prop = "rpemotesreborn_skateboard02",

            PropBone = 64064,

            PropPlacement = {0.2000, -0.0600, 0.0, -61.0100, 4.4024, -16.913},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["joelhodeskate2"] = { -- Custom Emote By DRX Animations

        "drx@skateboard3",

        "drx",

        "Skate Ajoelhado 2 - Feminino",

        AnimationOptions = {

            Prop = "rpemotesreborn_skateboard01",

            PropBone = 64064,

            PropPlacement = {0.2000, -0.0600, 0.0, -61.0100, 4.4024, -16.913},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["skatehold3"] = { -- Custom Emote By Chocoholic Animations

        "chocoholic@skate4",

        "skate4_clip",

        "Skate - Hold Feminino 3",

        AnimationOptions = {

            Prop = "rpemotesreborn_skateboard01",

            PropBone = 28422,

            PropPlacement = {0.2780, -0.0200, -0.0700, -180.0000, 28.0000, 0.0},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["skatehold6"] = { -- Custom Emote By Chocoholic Animations

        "chocoholic@skate4",

        "skate4_clip",

        "Skate - Hold Masculino 3",

        AnimationOptions = {

            Prop = "rpemotesreborn_skateboard02",

            PropBone = 28422,

            PropPlacement = {0.2780, -0.0200, -0.0700, -180.0000, 28.0000, 0.0},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["skatehold7"] = { -- Custom Emote By DRX Animations

        "drx@skateboard2",

        "drx",

        "Skate - Hold Masculino Drx",

        AnimationOptions = {

            Prop = "rpemotesreborn_skateboard02",

            PropBone = 64080,

            PropPlacement = {

                0.2670, -0.0060, 0.0560, -0.2472, -13.1506, -33.6511

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["skatehold8"] = { -- Custom Emote By DRX Animations

        "drx@skateboard2",

        "drx",

        "Skate - Hold Feminino Drx",

        AnimationOptions = {

            Prop = "rpemotesreborn_skateboard01",

            PropBone = 64080,

            PropPlacement = {

                0.2670, -0.0060, 0.0560, -0.2472, -13.1506, -33.6511

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["mafia"] = { -- Custom Emote By Chocoholic Animations

        "chocoholic@single12",

        "single12_clip",

        "Mafia Boss - Gun Apontar",

        AnimationOptions = {

            Prop = "w_pi_revolver_b",

            PropBone = 28422,

            PropPlacement = {

                0.1150, 0.0590, -0.0100, -69.7101, 1.4074, -13.7554

            },

            SecondProp = 'prop_cigar_01',

            SecondPropBone = 17188,

            SecondPropPlacement = {0.0450, 0.0130, 0.0170, 0.0, 0.0, 0.0},

            onFootFlag = AnimFlag.MOVING,

            PtfxAsset = "scr_mp_cig",

            PtfxName = "ent_anim_cig_smoke",

            PtfxNoProp = false,

            PtfxPlacement = {0.0615, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5},

            PtfxInfo = Translate('smoke'),

            PtfxWait = 0.8,

            PtfxCanHold = true

        }

    },

    ["cofpor"] = {

        "chocoholic@single23",

        "single23_clip",

        "Pose De Café E Hambúrguer",

        AnimationOptions = {

            Prop = "prop_fib_coffee",

            PropBone = 28422,

            PropPlacement = {

                0.0720, 0.0390, -0.0230, -125.8797, -168.4347, 17.4518

            },

            SecondProp = 'prop_cs_burger_01',

            SecondPropBone = 60309,

            SecondPropPlacement = {

                0.0860, 0.0030, 0.0570, 106.1459, 8.0371, 17.0945

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["coldre6"] = {

        "anim@hlstr_7360_torch",

        "flsh_ps",

        "Coldre 6 - Luz Flash",

        AnimationOptions = {

            Prop = 'prop_cs_police_torch_02',

            PropBone = 60309,

            PropPlacement = {0.0550, -0.0200, 0.0370, -29.6216, -8.6822, 4.9809},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["coldre8"] = {

        "anim@holster_walk_torch",

        "flash_ps",

        "Coldre 8 Lanterna 2",

        AnimationOptions = {

            Prop = 'prop_cs_police_torch_02',

            PropBone = 60309,

            PropPlacement = {0.0600, -0.0100, 0.0200, -20.0000, 0.0000, 3.9999},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["pipoca"] = {

        "amb@code_human_wander_drinking@female@base",

        "static",

        "Pipoca",

        AnimationOptions = {

            Prop = 'xs_prop_trinket_cup_01a',

            PropBone = 28422,

            PropPlacement = {

                -0.0200, -0.0100, -0.0700, -179.3626, 176.9331, 11.9833

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sax"] = {

        "play_saxophone@dark",

        "play_saxophone_clip",

        "Saxofone 1",

        AnimationOptions = {

            Prop = 'p_ld_sax',

            PropBone = 57005,

            PropPlacement = {0.0700, 0.0400, 0.0300, -71.2242, 29.3364, 5.9514},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["tacodesinuca"] = {

        "pool_pack_1@dark",

        "pool_pack_1_clip",

        "Jogar Sinuca",

        AnimationOptions = {

            Prop = 'prop_pool_cue',

            PropBone = 57005,

            PropPlacement = {0.0900, 0.2000, 0.0800, -61.4338, -7.2194, 3.1642},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["tacodesinuca2"] = {

        "pool_pack_2@dark",

        "pool_pack_2_clip",

        "Jogar Sinuca 2 (Pose)",

        AnimationOptions = {

            Prop = 'prop_pool_cue',

            PropBone = 57005,

            PropPlacement = {

                0.1200, -0.5200, -0.1200, -78.0400, -1.4526, 1.8479

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["tacodesinuca3"] = {

        "pool_pack_3@dark",

        "pool_pack_3_clip",

        "Jogar Sinuca 3 (Postura)",

        AnimationOptions = {

            Prop = 'prop_pool_cue',

            PropBone = 57005,

            PropPlacement = {0.1200, -0.3500, -0.0200, -90.0000, 0.0, 0.0},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["tacodesinuca4"] = {

        "pool_pack_4@dark",

        "pool_pack_4_clip",

        "Jogar Sinuca 4 (Postura)",

        AnimationOptions = {

            Prop = 'prop_pool_cue',

            PropBone = 61163,

            PropPlacement = {

                0.2600, -0.1600, -0.3100, -31.8144, 14.4214, -13.2854

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["tacodesinuca5"] = {

        "pool_pack_5@dark",

        "pool_pack_5_clip",

        "Jogar Sinuca 5",

        AnimationOptions = {

            Prop = 'prop_pool_cue',

            PropBone = 57005,

            PropPlacement = {0.0700, 0.5500, 0.1000, -76.6157, -9.5838, 2.9748},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["bolsadenegocios"] = { -- Custom Emote Provided To RPEmotes Courtesy Of Mr Witt

        "mrwitt@dark_appearance_with_bag_male",

        "mrwitt",

        "Bolsa De Negócios",

        AnimationOptions = {

            Prop = 'prop_med_bag_01b',

            PropBone = 60309,

            PropPlacement = {

                0.3050, 0.0200, 0.0790, 43.8282, -54.1834, -88.4424

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["bolsadenegocios2"] = { -- Custom Emote Provided To RPEmotes Courtesy Of Mr Witt

        "mrwitt@dark_appearance_with_bag_male",

        "mrwitt",

        "Bolsa De Negócios - Pose",

        AnimationOptions = {

            Prop = 'prop_med_bag_01b',

            PropBone = 60309,

            PropPlacement = {

                0.3050, 0.0200, 0.0790, 43.8282, -54.1834, -88.4424

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["agachamento"] = { -- Custom Emote Provided To RPEmotes Courtesy Of Mr Witt

        "mrwitt@checked_shirt_squat_male",

        "mrwitt",

        "Agachamento Cash - Pose",

        AnimationOptions = {

            Prop = 'prop_cash_pile_02',

            PropBone = 28422,

            PropPlacement = {

                0.0880, 0.0440, 0.0030, 149.6422, -164.7312, 25.2203

            },

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["mascaradeagachamento"] = { -- Custom Emote Provided To RPEmotes Courtesy Of Mr Witt

        "mrwitt@selfie02_male",

        "mrwitt",

        "Máscara De Agachamento Vermelha - Pose",

        AnimationOptions = {

            Prop = 'scarymask1',

            PropBone = 64065,

            PropPlacement = {0.0200, 0.1700, -0.0210, 0.0000, 0.0000, 0.0000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["mascaradeagachamento1"] = { -- Custom Emote Provided To RPEmotes Courtesy Of Mr Witt

        "mrwitt@selfie02_male",

        "mrwitt",

        "Máscara De Agachamento Branca - Pose",

        AnimationOptions = {

            Prop = 'scarymask2',

            PropBone = 64065,

            PropPlacement = {0.0200, 0.1700, -0.0210, 0.0000, 0.0000, 0.0000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["mascaradeagachamento2"] = { -- Custom Emote Provided To RPEmotes Courtesy Of Mr Witt

        "mrwitt@selfie02_male",

        "mrwitt",

        "Máscara De Agachamento Preta - Pose",

        AnimationOptions = {

            Prop = 'scarymask3',

            PropBone = 64065,

            PropPlacement = {0.0200, 0.1700, -0.0210, 0.0000, 0.0000, 0.0000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["selfiequat"] = { -- Custom Emote Provided To RPEmotes Courtesy Of Mr Witt

        "mrwitt@selfie02_male",

        "mrwitt",

        "Selfie Agachamento Masculino",

        AnimationOptions = {

            Prop = 'prop_cash_pile_02',

            PropBone = 26614,

            PropPlacement = {

                0.0300, -0.0300, 0.0700, -90.0000, -180.0000, 6.9999

            },

            SecondProp = 'prop_phone_ing',

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            SecondPropBone = 64112,

            SecondPropPlacement = {

                0.0180, 0.0380, 0.0260, 179.6474, -177.9691, 9.9938

            },

            PtfxAsset = "scr_tn_meet",

            PtfxName = "scr_tn_meet_phone_camera_flash",

            PtfxPlacement = {-0.015, 0.0, 0.041, 0.0, 0.0, 0.0, 1.0},

            PtfxInfo = Translate('camera'),

            PtfxWait = 200,

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["mascarafemscar"] = { -- Animation by MrWitt

        "mrwitt@helloween4_f",

        "mrwitt",

        "Máscara Assustadora Feminina Vermelha - Pose",

        AnimationOptions = {

            Prop = 'scarymask1', -- Prop by Vedere,

            PropBone = 64064,

            PropPlacement = {

                -0.0460, 0.1170, 0.0850, 21.9542799, -81.9467213, 9.0687101

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["mascarafemscar2"] = { -- Animation by MrWitt

        "mrwitt@helloween4_f",

        "mrwitt",

        "Máscara Assustadora Feminina Preta - Pose",

        AnimationOptions = {

            Prop = 'scarymask2', -- Prop by Vedere,

            PropBone = 64064,

            PropPlacement = {

                -0.0460, 0.1170, 0.0850, 21.9542799, -81.9467213, 9.0687101

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["mascarafemscar3"] = { -- Animation by MrWitt

        "mrwitt@helloween4_f",

        "mrwitt",

        "Máscara Assustadora Feminina Branca - Pose",

        AnimationOptions = {

            Prop = 'scarymask3', -- Prop by Vedere,

            PropBone = 64064,

            PropPlacement = {

                -0.0460, 0.1170, 0.0850, 21.9542799, -81.9467213, 9.0687101

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["copolevantado"] = { -- Custom Animation by Chocoholic Animations

        "chocoholic@duo32",

        "duo32_clip",

        "Levante Seu Copo",

        AnimationOptions = {

            Prop = 'p_champ_flute_s',

            PropBone = 64065,

            PropPlacement = {0.0140, 0.0310, -0.0990, 0.0000, 0.0000, 0.0000},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["copodeaumento2"] = { -- Custom Animation by Chocoholic Animations

        "chocoholic@duo34",

        "duo34_clip",

        "Levante Seu Copo 2",

        AnimationOptions = {

            Prop = 'p_champ_flute_s',

            PropBone = 64065,

            PropPlacement = {0.0260, 0.0190, -0.1280, -14.9999, 0.0000, -2.9999},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["posedeagachamento2"] = { -- Custom Emote By Darks Animations

        "ganggirls_pose2@darks37",

        "ganggirls_pose2_clip",

        "Postura De Arma De Agachamento 2 - Direita",

        AnimationOptions = {

            Prop = 'w_pi_pistolsmg_m31',

            PropBone = 26614,

            PropPlacement = {0.0260, -0.0280, 0.0980, -4.8222, -6.9836, 23.6186},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["rap2"] = { -- Custom Emote Provided To RPEmotes Courtesy Of Darks Animations

        "mic_pose_1@darksj",

        "mic_pose_1_clip",

        "Rap/Cante 2 - Microfone",

        AnimationOptions = {

            Prop = 'sf_prop_sf_mic_01a',

            PropBone = 28422,

            PropPlacement = {0.0680, 0.0190, -0.0220, 0.0000, 0.0000, 170.0000},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["rap3"] = { -- Custom Emote Provided To RPEmotes Courtesy Of Darks Animations

        "mic_pose_2@darksj",

        "mic_pose_2_clip",

        "Rap/Sing 3 - Microfone Rock Mão Sign",

        AnimationOptions = {

            Prop = 'sf_prop_sf_mic_01a',

            PropBone = 28422,

            PropPlacement = {0.0680, 0.0190, -0.0220, 0.0000, 0.0000, 170.0000},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["rap4"] = { -- Custom Emote Provided To RPEmotes Courtesy Of Darks Animations

        "mic_pose_3@darksj",

        "mic_pose_3_clip",

        "Rap / Sing 4 - Microfone Dobrado Para Trás",

        AnimationOptions = {

            Prop = 'sf_prop_sf_mic_01a',

            PropBone = 28422,

            PropPlacement = {0.0680, 0.0190, -0.0220, 0.0000, 0.0000, 170.0000},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["rap5"] = { -- Custom Emote Provided To RPEmotes Courtesy Of Darks Animations

        "mic_pose_4@darksj",

        "mic_pose_4_clip",

        "Rap/Cante 5 - Microfone Ajoelhar",

        AnimationOptions = {

            Prop = 'sf_prop_sf_mic_01a',

            PropBone = 28422,

            PropPlacement = {0.0680, 0.0190, -0.0220, 0.0000, 0.0000, 170.0000},

            onFootFlag = AnimFlag.LOOP,

            ExitEmote = "getup"

        }

    },

    ["rap6"] = { -- Custom Emote Provided To RPEmotes Courtesy Of Darks Animations

        "mic_pose_5_a@darksj",

        "mic_pose_5_a_clip",

        "Rap/Cante 6 - Microfone",

        AnimationOptions = {

            Prop = 'sf_prop_sf_mic_01a',

            PropBone = 28422,

            PropPlacement = {0.0680, 0.0190, -0.0220, 0.0000, 0.0000, 170.0000},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["bbat"] = { -- Custom Emote Provided To RPEmotes Courtesy Of Darks Animations

        "bat@sel",

        "bat_clip",

        "Postura Do Taco De Beisebol",

        AnimationOptions = {

            Prop = 'p_cs_bbbat_01',

            PropBone = 28422,

            PropPlacement = {0.0600, 0.0700, 0.0100, -73.8317, 0.8479, -12.8826},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["sinaldeparada"] = { -- Custom Prop By PNWParksFan

        "amb@world_human_janitor@male@base",

        "base",

        "Sinal De Parada",

        AnimationOptions = {

            Prop = 'prop_flagger_sign_01',

            PropBone = 28422,

            PropPlacement = {0.0000, 0.0000, -0.6800, 0.0000, 0.0000, -50.0000},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sinaldeparada2"] = { -- Custom Prop By PNWParksFan

        "amb@world_human_janitor@male@base",

        "base",

        "Sinal De Stop 2 - Desacelere",

        AnimationOptions = {

            Prop = 'prop_flagger_sign_01',

            PropBone = 28422,

            PropPlacement = {0.0000, 0.0000, -0.6800, 0.0000, 0.0000, 120.0000},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sinaldeparada3"] = { -- Custom Prop By PNWParksFan

        "special_ped@griff@base",

        "base",

        "Sinal De Parada 3 - Pare",

        AnimationOptions = {

            Prop = 'prop_flagger_sign_02',

            PropBone = 28422,

            PropPlacement = {

                0.0200, 0.0200, -0.2600, 169.9999, -180.0000, 59.9999

            },

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["sinaldeparada4"] = { -- Custom Prop By PNWParksFan

        "special_ped@griff@base",

        "base",

        "Sinal De Stop 4 - Desacelere",

        AnimationOptions = {

            Prop = 'prop_flagger_sign_02',

            PropBone = 28422,

            PropPlacement = {0.0200, 0.0200, -0.2600, 10.0000, 0.0000, -59.9999},

            onFootFlag = AnimFlag.MOVING

        }

    },

    ["stonerbabepose"] = { -- Custom Emote provided by 41anims

        "stonerbabe@animation",

        "stonerbabe_clip",

        "Pose De Gata Stoner",

        AnimationOptions = {

            Prop = 'p_cs_joint_01',

            PropBone = 57005,

            PropPlacement = {0.15, 0.03, -0.04, -1.0, 170.0, 0.0},

            onFootFlag = AnimFlag.LOOP

        }

    },

    ["baddiegyat"] = { -- Custom Emote provided by 41anims

        "baddiegyat",

        "baddiegyat_clip",

        "Baddie Gyat Selfie",

        AnimationOptions = {

            Prop = "prop_phone_ing",

            PropTextureVariations = {

                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},

                {Name = "<font color=\"#1AA20E\">Green", Value = 1},

                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},

                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},

                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},

                {Name = "<font color=\"#a356fa\">Purple", Value = 5},

                {Name = "<font color=\"#FF0099\">Pink", Value = 6},

                {Name = "Preto", Value = 7}

            },

            PropBone = 4169,

            PropPlacement = {0.0300, -0.0200, 0.0200, -5.0, 3.367247, 0.0711684},

            onFootFlag = AnimFlag.LOOP

        }

    }

}
