---@diagnostic disable: lowercase-global

-- Normalizacao do catalogo. Porta convertToEmoteData() + o achatamento de RP.*
-- que viviam em rpemotes-reborn/client/EmoteMenu.lua:553-668.
--
-- Entrada:  RP.<Categoria>[<nome>] = { array posicional + AnimationOptions }
-- Saida:    EmoteData[<nome>]      = { dict, anim, label, category, scenario, ... }

---@type table<string, table>
EmoteData = {}
CatalogReady = false

-- Indice enxuto mandado para a NUI. Nao carrega AnimationOptions inteiro.
---@type table[]
CatalogIndex = {}

---Converte uma entrada do formato posicional para o formato nomeado.
---@param emote table
local function convertToEmoteData(emote)
    local arraySize = 0
    for i = 1, 4 do
        if emote[i] then
            arraySize = arraySize + 1
        end
    end

    if arraySize == 1 then
        emote.anim = emote[1]
    elseif arraySize == 2 then
        emote.anim = emote[1]
        emote.label = emote[2]
    elseif arraySize >= 3 then
        local kind = emote[1]
        if kind == ScenarioType.MALE or kind == ScenarioType.SCENARIO or kind == ScenarioType.OBJECT then
            emote.scenario = emote[2]
            emote.scenarioType = kind
        else
            emote.dict = emote[1]
            emote.anim = emote[2]
            emote.secondPlayersAnim = emote[4]
        end
        emote.label = emote[3]
    end

    local animOptions = emote.AnimationOptions
    if not animOptions then return end

    if not animOptions.onFootFlag then
        if animOptions.EmoteMoving then
            animOptions.onFootFlag = AnimFlag.MOVING
        elseif animOptions.EmoteLoop then
            animOptions.onFootFlag = AnimFlag.LOOP
        elseif animOptions.EmoteStuck then
            animOptions.onFootFlag = AnimFlag.STUCK
        end
    end

    if animOptions.Attachto then
        animOptions.pos = animOptions.pos
            or vector3(animOptions.xPos or 0.0, animOptions.yPos or 0.0, animOptions.zPos or 0.0)
        animOptions.rot = animOptions.rot
            or vector3(animOptions.xRot or 0.0, animOptions.yRot or 0.0, animOptions.zRot or 0.0)
    end

    if not animOptions.vehicleRequirement then
        if animOptions.NotInVehicle then
            animOptions.vehicleRequirement = VehicleRequirement.NOT_ALLOWED
        elseif animOptions.onlyInVehicle then
            animOptions.vehicleRequirement = VehicleRequirement.REQUIRED
        end
    end

    if animOptions.SyncOffsetSide or animOptions.SyncOffsetFront
        or animOptions.SyncOffsetHeight or animOptions.SyncOffsetHeading then
        animOptions.syncOffset = vector4(
            animOptions.SyncOffsetSide or 0.0,
            animOptions.SyncOffsetFront or 1.0,
            animOptions.SyncOffsetHeight or 0.0,
            animOptions.SyncOffsetHeading or 180.0)
    end
end

---Monta o indice enxuto que a NUI consome.
local function buildIndex()
    local index = {}

    for name, emote in pairs(EmoteData) do
        local opts = emote.AnimationOptions
        index[#index + 1] = {
            name       = name,
            label      = emote.label or name,
            category   = emote.category,
            prop       = (opts and opts.Prop) and true or nil,
            variations = (opts and opts.PropTextureVariations) and #opts.PropTextureVariations or nil,
            shared     = emote.secondPlayersAnim and true or nil,
            adult      = emote.AdultAnimation and true or nil,
            animal     = (emote.category == Category.ANIMAL_EMOTES) and true or nil,
            scenario   = emote.scenario and true or nil,
        }
    end

    table.sort(index, function(a, b)
        if a.category ~= b.category then return a.category < b.category end
        return a.label:lower() < b.label:lower()
    end)

    CatalogIndex = index
end

CreateThread(function()
    if not Config.AnimalEmotesEnabled then
        RP.AnimalEmotes = {}
    end

    LoadAddonEmotes()

    local flat = {}
    assert(RP ~= nil, 'RP nao existe — data/animations.lua nao carregou antes de client/catalog.lua')

    for emoteType, content in pairs(RP) do
        for emoteName, emoteData in pairs(content) do
            if flat[emoteName] then
                DebugPrint(('Nome de emote duplicado: %s em %s e %s')
                    :format(emoteName, emoteType, flat[emoteName].category))
            end

            if not (Config.AdultEmotesDisabled and type(emoteData) == 'table' and emoteData.AdultAnimation) then
                if type(emoteData) == 'table' then
                    flat[emoteName] = {}
                    for k, v in pairs(emoteData) do
                        flat[emoteName][k] = v
                    end
                else
                    flat[emoteName] = { emoteData }
                end

                flat[emoteName].category = emoteType
                convertToEmoteData(flat[emoteName])
            end
        end
    end

    EmoteData = flat
    RP = nil
    buildIndex()
    CatalogReady = true

    DebugPrint(('Catalogo pronto: %d emotes'):format(#CatalogIndex))
end)

---Espera o catalogo terminar de normalizar. Usado pelos comandos e pela NUI,
---que podem ser acionados antes da thread acima acabar.
---@param timeout? number ms
---@return boolean
function AwaitCatalog(timeout)
    local deadline = GetGameTimer() + (timeout or 10000)
    while not CatalogReady and GetGameTimer() < deadline do
        Wait(50)
    end
    return CatalogReady
end

---Projeta o catalogo no formato PascalCase do scully_emotemenu, para
---consumidores que esperam `{ Label = ..., Command = ... }` num array plano.
---@param category? string categoria no vocabulario do scully ou o nosso
---@return table[]
function GetCatalogAsScully(category)
    AwaitCatalog()

    -- Nomes de categoria do scully -> os nossos
    local alias = {
        Emotes = Category.EMOTES,
        PropEmotes = Category.PROP_EMOTES,
        DanceEmotes = Category.DANCES,
        AnimalEmotes = Category.ANIMAL_EMOTES,
        SynchronizedEmotes = Category.SHARED,
        Walks = Category.WALKS,
        Expressions = Category.EXPRESSIONS,
        Scenarios = Category.EMOTES,
    }
    local wanted = category and (alias[category] or category) or nil

    local out = {}
    for name, emote in pairs(EmoteData) do
        if not wanted or emote.category == wanted then
            out[#out + 1] = {
                Label      = emote.label or name,
                Command    = name,
                Animation  = emote.anim,
                Dictionary = emote.dict,
                Scenario   = emote.scenario,
                Walk       = (emote.category == Category.WALKS) and emote.anim or nil,
                Expression = (emote.category == Category.EXPRESSIONS) and emote.anim or nil,
            }
        end
    end

    table.sort(out, function(a, b) return a.Label:lower() < b.Label:lower() end)
    return out
end
