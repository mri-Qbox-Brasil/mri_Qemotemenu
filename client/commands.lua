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

-- Bancada do preview. O comportamento do ped dentro da scaleform do pause menu
-- nao e documentado e varia por gamebuild, entao em vez de chutar valores no
-- config e reiniciar o resource a cada tentativa, dá para alterná-los com o
-- menu aberto e ver o resultado na hora.
RegisterCommand('emotepreview', function(_source, args)
    local what = args[1] and tostring(args[1]):lower() or nil

    if what == 'sleep' then
        Config.PreviewSleepState = not Config.PreviewSleepState
        Notify(('SleepState = %s'):format(tostring(Config.PreviewSleepState)))
    elseif what == 'regive' then
        Config.PreviewRegiveOnPlay = not Config.PreviewRegiveOnPlay
        Notify(('RegiveOnPlay = %s'):format(tostring(Config.PreviewRegiveOnPlay)))
    elseif what == 'slot' then
        local slot = tonumber(args[2])
        if not slot then
            Notify('Uso: /emotepreview slot <numero>', 'error')
            return
        end
        Config.PreviewPedSlot = slot
        Notify(('PedSlot = %d'):format(slot))
    elseif what == 'replay' then
        local current = GetPreviewingEmote()
        if not current then
            Notify('Nenhum emote em preview. Passe o mouse por um antes.', 'error')
            return
        end
        PreviewEmote(current)
        Notify(('Reaplicado: %s'):format(current))
        return
    else
        NotifyLong(table.concat({
            'Bancada do preview:',
            '/emotepreview sleep   — alterna SetPauseMenuPedSleepState',
            '/emotepreview regive  — alterna a reentrega do ped apos a animacao',
            '/emotepreview slot N  — muda a posicao do ped na tela',
            '/emotepreview replay  — reaplica o ultimo emote em preview',
            ('Agora: sleep=%s regive=%s slot=%s'):format(
                tostring(Config.PreviewSleepState),
                tostring(Config.PreviewRegiveOnPlay),
                tostring(Config.PreviewPedSlot)),
        }, '\n'))
        return
    end

    -- Reaplica no ped que ja esta em preview, para o efeito ser imediato.
    local current = GetPreviewingEmote()
    if current then PreviewEmote(current) end
end, false)
