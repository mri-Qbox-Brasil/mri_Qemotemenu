---@diagnostic disable: lowercase-global

-- Comandos. Os nomes vem do rpemotes-reborn e do scully_emotemenu porque outros
-- resources ja os chamam por ExecuteCommand:
--   * pma-voice usa `e wt4` e `e c` (server.cfg:51-52, voice_emoteMenuAnim)
--   * elysium-medicaltablet usa `e c`
-- Renomear qualquer um deles quebra esses consumidores em silencio.

local function listByCategory(category, header)
    if not AwaitCatalog(5000) then return end

    local names = {}
    for name, data in PairsByKeys(EmoteData) do
        if type(data) == 'table' and data.category == category then
            names[#names + 1] = name:lower()
        end
    end

    NotifyLong(('%s\n%s'):format(header, table.concat(names, ', ')))
end

-- ============================================================
-- Emotes
-- ============================================================

local function emoteCommand(_source, args)
    if not args[1] then
        ToggleEmoteMenu()
        return
    end
    EmoteCommandStart(args)
end

RegisterCommand('e', emoteCommand, false)
RegisterCommand('emote', emoteCommand, false)
RegisterCommand('eplay', emoteCommand, false)

RegisterCommand('emotecancel', function()
    EmoteCancel()
end, false)

RegisterCommand('emotes', function()
    listByCategory(Category.EMOTES, locale('list_emotes'))
end, false)

RegisterCommand('dances', function()
    listByCategory(Category.DANCES, locale('list_dances'))
end, false)

RegisterCommand('propemotes', function()
    listByCategory(Category.PROP_EMOTES, locale('list_props'))
end, false)

-- ============================================================
-- Menu
-- ============================================================

local function menuCommand()
    ToggleEmoteMenu()
end

RegisterCommand('emoteui', menuCommand, false)
RegisterCommand('emotemenu', menuCommand, false)
RegisterCommand('em', menuCommand, false)

if Config.MenuKeybindEnabled then
    RegisterKeyMapping('emoteui', locale('keybind_menu'), 'keyboard', Config.MenuKeybind)
end

if Config.CancelKeybindEnabled then
    RegisterKeyMapping('emotecancel', locale('keybind_cancel'), 'keyboard', Config.CancelEmoteKey)
end

-- ============================================================
-- Walks / Moods
-- ============================================================

if Config.WalkingStylesEnabled then
    local function walkCommand(_source, args)
        local name = args[1]
        if not name or name == '' then
            listByCategory(Category.WALKS, locale('list_walks'))
            return
        end

        name = FirstToUpper(tostring(name):lower())
        if name == 'Reset' or name == 'C' then
            ResetWalkStyle()
            return
        end

        SetWalkStyle(name, true)
    end

    RegisterCommand('walk', walkCommand, false)
    RegisterCommand('w', walkCommand, false)
    RegisterCommand('andar', walkCommand, false)
    RegisterCommand('walks', function()
        listByCategory(Category.WALKS, locale('list_walks'))
    end, false)
end

if Config.ExpressionsEnabled then
    RegisterCommand('mood', function(_source, args)
        local name = args[1]
        if not name or name == '' then
            listByCategory(Category.EXPRESSIONS, locale('list_moods'))
            return
        end

        name = FirstToUpper(tostring(name):lower())
        if name == 'Reset' then
            ResetPlayerPedExpression()
            return
        end

        if not SetPlayerPedExpression(name, true) then
            Notify(("'%s' %s"):format(name, locale('notvalidmood')), 'error')
        end
    end, false)

    RegisterCommand('moods', function()
        listByCategory(Category.EXPRESSIONS, locale('list_moods'))
    end, false)
end

-- ============================================================
-- Emotes sincronizados
-- ============================================================

if Config.SharedEmotesEnabled then
    RegisterCommand('nearby', function(_source, args)
        if args[1] then
            RequestSharedEmote(tostring(args[1]):lower())
        else
            ListSharedEmotes()
        end
    end, false)
end

-- ============================================================
-- Slots de favorito (setas)
-- ============================================================

local function slotFromArg(arg)
    if not arg then return nil end
    local upper = tostring(arg):upper()
    if Config.ArrowControls[upper] then return upper end

    -- Aceita 1..4 na ordem de Config.FavoriteSlots, como o /emotebind antigo.
    local index = tonumber(arg)
    if index and Config.FavoriteSlots[index] then
        return Config.FavoriteSlots[index].slot
    end
end

RegisterCommand('emotebind', function(_source, args)
    local slot = slotFromArg(args[1])
    if not slot then
        Notify(locale('bind_usage'), 'error')
        return
    end

    local emote = args[2] and tostring(args[2]):lower() or nil
    if not emote then
        Notify(locale('bind_usage'), 'error')
        return
    end

    -- Tudo depois do nome do emote vira o rotulo custom do atalho.
    local label = nil
    if args[3] then
        label = table.concat(args, ' ', 3)
    end

    if SetFavoriteSlot(slot, emote, label) then
        Notify(('%s %s -> %s'):format(locale('bind_set'), slot, GetSlotDisplayName(slot)), 'success')
    end
end, false)

RegisterCommand('emotebinds', function()
    local lines = {}
    for _, entry in ipairs(Config.FavoriteSlots) do
        local resolved = ResolvedSlots[entry.slot]
        lines[#lines + 1] = ('%s: %s (%s)'):format(
            entry.slot,
            resolved and GetSlotDisplayName(entry.slot) or '-',
            resolved and resolved.source or '-')
    end
    NotifyLong(('%s\n%s'):format(locale('bind_list'), table.concat(lines, '\n')))
end, false)

RegisterCommand('emotedelete', function(_source, args)
    local slot = slotFromArg(args[1])
    if not slot then
        Notify(locale('bind_usage'), 'error')
        return
    end

    if SetFavoriteSlot(slot, nil, nil) then
        Notify(('%s %s'):format(locale('bind_reset'), slot), 'success')
    end
end, false)

-- ============================================================
-- Diagnostico
-- ============================================================

RegisterCommand('emoteguard', function()
    DumpInputGuard()
end, false)
