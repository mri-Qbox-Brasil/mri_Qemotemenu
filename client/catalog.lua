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

    local function padDigits(str)
        return (str:gsub("%d+", function(digits)
            return string.format("%09d", tonumber(digits))
        end))
    end

    table.sort(index, function(a, b)
        if a.category ~= b.category then return a.category < b.category end
        local aLabel = padDigits((a.label or a.name or ""):lower())
        local bLabel = padDigits((b.label or b.name or ""):lower())
        return aLabel < bLabel
    end)

    CatalogIndex = index
end

---Marca no indice os emotes cuja animacao (ou prop) nao existe neste cliente.
---
---O `LoadAnim` ja testava `DoesAnimDictExist` na hora de tocar; aqui o teste sobe
---para a lista, para o player ver antes de clicar.
---
---Duas coisas evitam que isso segure o boot: os dicts sao deduplicados (sao
---~3.700 emotes para umas centenas de dicts distintos) e a varredura cede o
---frame a cada bloco.
---
---Cobre tambem os dicts nativos do GTA, que uma varredura da pasta stream/ nao
---veria. Cenarios nao tem dict e ficam sem verificacao — nao ha nativo barato
---para isso, e inventar um "existe" falso seria pior que nao marcar.
local function checkAvailability()
    local dictCache, propCache = {}, {}
    local missing, checked = 0, 0

    local function dictExists(dict)
        local cached = dictCache[dict]
        if cached ~= nil then return cached end
        local exists = DoesAnimDictExist(dict) and true or false
        dictCache[dict] = exists
        return exists
    end

    local function propExists(model)
        local cached = propCache[model]
        if cached ~= nil then return cached end
        local exists = IsModelValid(joaat(model)) and true or false
        propCache[model] = exists
        return exists
    end

    for i = 1, #CatalogIndex do
        local entry = CatalogIndex[i]
        local emote = EmoteData[entry.name]

        if emote then
            local reason

            if emote.dict and not dictExists(emote.dict) then
                reason = 'anim'
            else
                local opts = emote.AnimationOptions
                if opts and opts.Prop and not propExists(opts.Prop) then
                    reason = 'prop'
                elseif opts and opts.SecondProp and not propExists(opts.SecondProp) then
                    reason = 'prop'
                end
            end

            if reason then
                entry.missing = reason
                missing = missing + 1
            end
        end

        checked = checked + 1
        if checked % 250 == 0 then Wait(0) end
    end

    if missing > 0 then
        lib.print.warn(('%d de %d emotes estao indisponiveis neste cliente (anim ou prop ausente).')
            :format(missing, #CatalogIndex))
    end

    -- Se o menu ja estiver aberto quando a varredura terminar, atualiza a lista.
    SendNUIMessage({ action = 'catalogUpdated', catalog = CatalogIndex })
end

CreateThread(function()
    -- Antes de qualquer uso de RP: se a ordem do fxmanifest quebrar, o erro tem
    -- que dizer o que houve, e nao um "index a nil value" tres linhas abaixo.
    assert(RP ~= nil, 'RP nao existe — data/animations.lua nao carregou antes de client/catalog.lua')

    if not Config.AnimalEmotesEnabled then
        RP.AnimalEmotes = {}
    end

    LoadAddonEmotes()

    local flat = {}

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

    -- Depois de liberar o catalogo, nao antes: a varredura leva alguns frames e
    -- nao deve atrasar a primeira abertura do menu.
    checkAvailability()
end)

-- ============================================================
-- Apelidos
-- ============================================================
-- O player pode renomear qualquer emote so para ele. Fica em
-- `settings.nicknames[<emote>]`, no mesmo JSON por citizenid que ja guarda
-- favoritos, walk e mood — nenhuma coluna nova.

---Nome exibido de um emote: apelido do player > label do catalogo > nome cru.
---@param name string
---@return string
function GetEmoteDisplayName(name)
    local nicknames = GetSetting('nicknames')
    local nickname = (type(nicknames) == 'table') and nicknames[name] or nil
    if type(nickname) == 'string' and nickname ~= '' then return nickname end

    local emote = EmoteData and EmoteData[name]
    return (emote and emote.label) or name
end

---Define (ou limpa, com nickname nil/vazio) o apelido de um emote.
---@param name string
---@param nickname string?
---@return boolean
function SetEmoteNickname(name, nickname)
    if type(name) ~= 'string' or not EmoteData[name] then return false end

    local nicknames = GetSetting('nicknames')
    if type(nicknames) ~= 'table' then nicknames = {} end

    -- So string vira apelido. Sem este filtro, um payload com tabela ou numero
    -- passava reto pelos dois testes abaixo e estourava no `:sub()` — e o erro
    -- mata o RegisterNUICallback antes do `cb`, deixando a NUI pendurada.
    if type(nickname) == 'string' then
        nickname = nickname:gsub('^%s+', ''):gsub('%s+$', '')
    elseif nickname ~= nil then
        return false
    end

    if not nickname or nickname == '' then
        nicknames[name] = nil
    else
        -- Teto de tamanho: o objeto inteiro vai para o banco a cada save, e a
        -- lista tem 3.7k emotes.
        nicknames[name] = nickname:sub(1, 48)
    end

    -- Guarda so o que foi renomeado; a tabela vazia vira nil para nao inchar o
    -- JSON de quem nunca renomeou nada.
    SaveSetting('nicknames', next(nicknames) and nicknames or nil)

    -- O apelido nao entra no CatalogIndex: o indice e montado no boot, antes das
    -- settings chegarem do servidor. A NUI recebe o mapa de apelidos separado e
    -- resolve na hora de exibir; a roda se reregistra com o nome novo.
    if RefreshWheel then RefreshWheel() end
    return true
end

---@return table<string, string>
function GetEmoteNicknames()
    local nicknames = GetSetting('nicknames')
    return type(nicknames) == 'table' and nicknames or {}
end

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

    local function padDigits(str)
        return (str:gsub("%d+", function(digits)
            return string.format("%09d", tonumber(digits))
        end))
    end

    table.sort(out, function(a, b)
        local aLabel = padDigits((a.Label or a.Command or ""):lower())
        local bLabel = padDigits((b.Label or b.Command or ""):lower())
        return aLabel < bLabel
    end)
    return out
end
