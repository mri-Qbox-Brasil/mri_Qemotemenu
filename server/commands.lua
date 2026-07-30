---@diagnostic disable: lowercase-global

-- Comandos de servidor: administracao dos padroes de atalho e a ferramenta de
-- extracao usada para conferir o catalogo contra o do rpemotes.

lib.addCommand('emotedefault', {
    help = 'Define o emote padrao de um atalho de seta para todo o servidor',
    params = {
        { name = 'slot',  type = 'string', help = 'UP | DOWN | LEFT | RIGHT' },
        { name = 'emote', type = 'string', help = 'Nome do emote (ex: salute)' },
    },
    restricted = false, -- a checagem real e HasEmotePerms, que conhece o mri_Qadmin
}, function(source, args)
    if not HasEmotePerms(source) then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = locale('admin_no_permission'),
        })
        return
    end

    local ok, err = SetDefault(source, tostring(args.slot):upper(), tostring(args.emote):lower())
    TriggerClientEvent('ox_lib:notify', source, {
        type = ok and 'success' or 'error',
        description = ok and locale('admin_default_set') or (err or locale('admin_invalid_slot')),
    })
end)

lib.addCommand('emotedefaults', {
    help = 'Lista os emotes padrao dos atalhos de seta',
}, function(source)
    local defaults = GetDefaults()
    local lines = {}

    for _, entry in ipairs(Config.FavoriteSlots) do
        local current = defaults[entry.slot]
        lines[#lines + 1] = ('%s: %s%s'):format(
            entry.slot,
            current and current.emote or entry.emote,
            current and current.label and (' ("' .. current.label .. '")') or '')
    end

    TriggerClientEvent('ox_lib:notify', source, {
        description = table.concat(lines, '\n'),
        duration = 9000,
    })
end)

-- ============================================================
-- emoteextract — paridade com o catalogo antigo
-- ============================================================
-- Console apenas. Serve para diffar a lista do mri_Qemotemenu contra a do
-- rpemotes-reborn e provar que o port nao perdeu emote nenhum.

local function extract(format)
    format = tonumber(format)

    if format ~= 1 and format ~= 2 and format ~= 3 and format ~= 4 then
        print('\n### mri_Qemotemenu — extrator de catalogo ###\n')
        print("  emoteextract 1  ->  'prop_name',")
        print('  emoteextract 2  ->  "prop_name",')
        print('  emoteextract 3  ->  prop_name')
        print('  emoteextract 4  ->  contagem por categoria')
        print('  emoteextract 5  ->  lista completa de nomes de emote (para diff)\n')
        return
    end

    local animationFile = LoadResourceFile(GetCurrentResourceName(), 'data/animations.lua')
    if not animationFile then
        print('^1Nao consegui ler data/animations.lua^0')
        return
    end

    local chunk, err = load(animationFile .. ' return RP')
    if not chunk then
        print('^1Erro ao compilar o catalogo: ' .. tostring(err) .. '^0')
        return
    end

    local ok, res = pcall(chunk)
    if not ok or type(res) ~= 'table' then
        print('^1Erro ao executar o catalogo^0')
        return
    end

    if format == 4 then
        local total = 0
        for category, entries in pairs(res) do
            local count = 0
            for _ in pairs(entries) do count = count + 1 end
            total = total + count
            print(('  %-16s %d'):format(category, count))
        end
        print(('  %-16s ^3%d^0'):format('TOTAL', total))
        return
    end

    local quote = format == 1 and "'" or format == 2 and '"' or ''
    local comma = (format == 1 or format == 2) and ',' or ''

    local uniqueProps = {}
    for _, value in pairs(res.PropEmotes or {}) do
        if type(value) == 'table' and value.AnimationOptions then
            local prop = value.AnimationOptions.Prop
            local secondProp = value.AnimationOptions.SecondProp
            if prop then uniqueProps[prop] = true end
            if secondProp then uniqueProps[secondProp] = true end
        end
    end

    local lines = {}
    for propName in pairs(uniqueProps) do
        lines[#lines + 1] = quote .. propName .. quote .. comma
    end
    table.sort(lines)

    SaveResourceFile(GetCurrentResourceName(), 'prop_list.lua', table.concat(lines, '\n'), -1)
    print(('Exportei %d props para ^2prop_list.lua^0'):format(#lines))
end

---Lista achatada de nomes, ordenada — o formato certo para `diff` contra o
---catalogo do rpemotes.
local function extractNames()
    local animationFile = LoadResourceFile(GetCurrentResourceName(), 'data/animations.lua')
    local customFile = LoadResourceFile(GetCurrentResourceName(), 'data/animations_custom.lua')
    if not animationFile then return end

    local chunk = load(animationFile .. (customFile or '') .. ' return RP')
    if not chunk then return end

    local ok, res = pcall(chunk)
    if not ok or type(res) ~= 'table' then return end

    local names = {}
    for category, entries in pairs(res) do
        for name in pairs(entries) do
            names[#names + 1] = ('%s\t%s'):format(category, name)
        end
    end
    table.sort(names)

    SaveResourceFile(GetCurrentResourceName(), 'emote_list.txt', table.concat(names, '\n'), -1)
    print(('Exportei %d emotes para ^2emote_list.txt^0'):format(#names))
end

RegisterCommand('emoteextract', function(source, args)
    if source > 0 then return end
    if tonumber(args[1]) == 5 then
        extractNames()
    else
        extract(args[1])
    end
end, true)
