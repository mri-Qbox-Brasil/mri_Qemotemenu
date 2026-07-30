--[[ ============================================================
     CinematicsBridge.lua

     Conecta rpemotes-reborn ⇄ core_cinematics.

     Problema sem essa bridge:
       Quando você grava no editor (F5 = menu de emote do rpemotes), o emote
       toca visualmente no seu ped, mas no playback do editor o ped spawnado
       fica parado. Isso porque o recording (main.lua linha ~752) lê o emote
       ativo via AnimProviders.getPedAnim(ped), que por sua vez lê o state
       bag 'cinematics:animProvider' do player. rpemotes-reborn nunca escreve
       nesse state bag → frame.emote = nil → playback não tem o que tocar.

     O que essa bridge faz:
       1) Espelha o emote/walk ATIVO no state bag 'cinematics:animProvider'.
          Replica para os outros clients, então o cliente que está gravando
          consegue capturar o emote de peds remotos no raio também.
          Implementado wrappando os globais do rpemotes (OnEmotePlay,
          EmoteCancel, SetWalkStyle, ResetWalkStyle) — sem alterar Emote.lua.

       2) Expõe os exports que core_cinematics/anim_providers.lua espera:
            GetAnimData / GetAllAnims / PlayAnimOnPed / CancelAnimOnPed
            GetWalkData / GetAllWalks / SetWalkOnPed / ClearWalkOnPed
            GetMenuPed
          - Os 4 primeiros: necessários pro playback reproduzir o emote no
            ped spawnado (TaskPlayAnim no ped não-local).
          - Walk: idem para clipset.
          - Get*Data + GetAll* alimentam o dropdown do editor com a library
            inteira do rpemotes (categorias Emotes / PropEmotes / Dances /
            AnimalEmotes / Shared, etc).

     Carregamento: registrado por ÚLTIMO em fxmanifest.lua client_scripts,
     então EmoteData / OnEmotePlay / EmoteCancel / SetWalkStyle / ResetWalkStyle
     já estão definidos quando esse arquivo executa.
     ============================================================ ]]

local STATE_BAG_KEY = "cinematics:animProvider"
local PROVIDER_ID   = GetCurrentResourceName()   -- "rpemotes-reborn"

-- Estado local espelhado (atualizado pelos wraps)
local currentEmoteName = nil
local currentEmoteVar  = nil
local currentWalkName  = nil

-- ─── Helpers ─────────────────────────────────────────────────────────────────

local function waitConverted(timeoutMs)
    timeoutMs = timeoutMs or 5000
    local elapsed = 0
    while not CatalogReady and elapsed < timeoutMs do
        Wait(50); elapsed += 50
    end
    return CatalogReady == true and type(EmoteData) == "table"
end

local function isPlayableAnim(data)
    return type(data) == "table"
        and type(data.dict) == "string" and #data.dict > 0
        and type(data.anim) == "string" and #data.anim > 0
        and not data.scenario
        and data.category ~= "Walks"
        and data.category ~= "Expressions"
end

local function isWalkEntry(data)
    return type(data) == "table"
        and data.category == "Walks"
        and type(data.anim) == "string"
        and #data.anim > 0
end

local function buildAnimPayload(name, data, textureVar)
    return {
        name       = name,
        label      = data.label or name,
        dict       = data.dict,
        anim       = data.anim,
        flag       = (data.AnimationOptions and data.AnimationOptions.onFootFlag) or 1,
        textureVar = textureVar,
        library    = data.category or "Emotes",
    }
end

local function buildWalkPayload(name, data)
    return {
        name    = name,
        label   = data.label or name,
        clipset = data.anim,
    }
end

-- ─── State bag publisher ─────────────────────────────────────────────────────
-- Mantém LocalPlayer.state['cinematics:animProvider'] sincronizado com o
-- emote/walk ativo do player local. Replicado pra todos os clients lerem
-- via Player(serverId).state.

local function publishState()
    local anim, walk

    if currentEmoteName and EmoteData then
        local data = EmoteData[currentEmoteName]
        if isPlayableAnim(data) then
            anim = buildAnimPayload(currentEmoteName, data, currentEmoteVar)
        end
    end

    if currentWalkName and EmoteData then
        local data = EmoteData[currentWalkName]
        if isWalkEntry(data) then
            walk = buildWalkPayload(currentWalkName, data)
        end
    end

    local payload = (anim or walk)
        and { providerId = PROVIDER_ID, anim = anim, walk = walk }
        or  nil

    LocalPlayer.state:set(STATE_BAG_KEY, payload, true)
end

-- ─── Wrap dos globais do rpemotes ────────────────────────────────────────────
-- Intercepta start/stop sem editar Emote.lua/Walk.lua. As funções originais
-- são chamadas primeiro; o estado interno (IsInAnimation / CurrentAnimationName)
-- já está atualizado quando a nossa lógica roda.

CreateThread(function()
    -- Aguarda EmoteData popular pra termos o lookup pronto
    waitConverted()

    -- Defensivo caso a ordem do manifest mude e os globais ainda não existam
    while type(OnEmotePlay) ~= "function"
       or type(EmoteCancel) ~= "function"
       or type(SetWalkStyle) ~= "function"
       or type(ResetWalkStyle) ~= "function"
    do
        Wait(100)
    end

    -- Emote start
    local _origOnEmotePlay = OnEmotePlay
    OnEmotePlay = function(name, textureVariation)
        _origOnEmotePlay(name, textureVariation)
        -- Só publica se a função original confirmou o emote
        if IsInAnimation and CurrentAnimationName == name then
            currentEmoteName = name
            currentEmoteVar  = textureVariation or CurrentTextureVariation
            publishState()
        end
    end

    -- Emote cancel
    local _origEmoteCancel = EmoteCancel
    EmoteCancel = function(force)
        _origEmoteCancel(force)
        if not IsInAnimation then
            currentEmoteName = nil
            currentEmoteVar  = nil
            publishState()
        end
    end

    -- Walk set
    local _origSetWalkStyle = SetWalkStyle
    SetWalkStyle = function(name, force)
        _origSetWalkStyle(name, force)
        local data = name and EmoteData and EmoteData[name]
        if isWalkEntry(data) then
            currentWalkName = name
            publishState()
        end
    end

    -- Walk reset
    local _origResetWalkStyle = ResetWalkStyle
    ResetWalkStyle = function()
        _origResetWalkStyle()
        currentWalkName = nil
        publishState()
    end
end)

-- Limpa o state bag se o resource parar (evita "fantasma" do último emote)
AddEventHandler("onResourceStop", function(resource)
    if resource ~= GetCurrentResourceName() then return end
    pcall(function() LocalPlayer.state:set(STATE_BAG_KEY, nil, true) end)
end)

-- ─── Exports: anims ──────────────────────────────────────────────────────────

exports("GetAnimData", function(animName)
    if animName == "__cinematics_probe__" then
        return { name = "__probe__", dict = "_", anim = "_" }
    end
    if not waitConverted() then return nil end
    local data = EmoteData[animName]
    if not isPlayableAnim(data) then return nil end
    return buildAnimPayload(animName, data, nil)
end)

exports("GetAllAnims", function()
    if not waitConverted() then return {} end
    local out = {}
    for name, data in pairs(EmoteData) do
        if isPlayableAnim(data) then
            out[#out + 1] = buildAnimPayload(name, data, nil)
        end
    end
    return out
end)

exports("PlayAnimOnPed", function(ped, animName, options)
    if not waitConverted() then return false end
    local data = EmoteData[animName]
    if not isPlayableAnim(data) then return false end
    if not ped or not DoesEntityExist(ped) then return false end

    -- Local player: usa fluxo nativo (props/exits/sync do rpemotes)
    if ped == PlayerPedId() then
        EmoteCommandStart({ animName, options and options.textureVar })
        return true
    end

    -- Ped spawnado pelo playback do cinematics: roda anim raw
    RequestAnimDict(data.dict)
    local tries = 0
    while not HasAnimDictLoaded(data.dict) and tries < 100 do
        Wait(10); tries += 1
    end
    if not HasAnimDictLoaded(data.dict) then return false end

    local flag = (data.AnimationOptions and data.AnimationOptions.onFootFlag) or 1
    TaskPlayAnim(ped, data.dict, data.anim, 8.0, -8.0, -1, flag, 0, false, false, false)
    return true
end)

exports("CancelAnimOnPed", function(ped)
    if not ped or not DoesEntityExist(ped) then return false end
    if ped == PlayerPedId() then
        EmoteCancel(true)
    else
        ClearPedTasks(ped)
    end
    return true
end)

-- ─── Exports: walks ──────────────────────────────────────────────────────────

exports("GetWalkData", function(walkName)
    if walkName == "__cinematics_probe__" then
        return { name = "__probe__", clipset = "_" }
    end
    if not waitConverted() then return nil end
    local data = EmoteData[walkName]
    if not isWalkEntry(data) then return nil end
    return buildWalkPayload(walkName, data)
end)

exports("GetAllWalks", function()
    if not waitConverted() then return {} end
    local out = {}
    for name, data in pairs(EmoteData) do
        if isWalkEntry(data) then
            out[#out + 1] = buildWalkPayload(name, data)
        end
    end
    return out
end)

exports("SetWalkOnPed", function(ped, walkName)
    if not waitConverted() then return false end
    if not ped or not DoesEntityExist(ped) then return false end
    local data = EmoteData[walkName]
    if not isWalkEntry(data) then return false end

    if ped == PlayerPedId() then
        local ok = pcall(SetWalkStyle, walkName, true)
        if ok then return true end
    end

    RequestAnimSet(data.anim)
    local tries = 0
    while not HasAnimSetLoaded(data.anim) and tries < 50 do
        Wait(10); tries += 1
    end
    if not HasAnimSetLoaded(data.anim) then return false end
    SetPedMovementClipset(ped, data.anim, 1.0)
    return true
end)

exports("ClearWalkOnPed", function(ped)
    if not ped or not DoesEntityExist(ped) then return false end
    ResetPedMovementClipset(ped, 1.0)
    return true
end)

-- ─── Menu ped ────────────────────────────────────────────────────────────────
-- O export `GetMenuPed` que o core_cinematics consome (main.lua linha ~694,
-- para EXCLUIR o ped de preview da lista capturada no recording) vive em
-- client/preview.lua, que é o dono do handle. Não registrar aqui também:
-- dois `exports()` com o mesmo nome no mesmo resource se sobrescrevem.
