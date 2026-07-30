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


-- ============================================================
-- Bancada do preview
-- ============================================================
-- O enquadramento certo da camera do estudio so se acha olhando na tela. Em vez
-- de chutar valores no config e reiniciar o resource a cada tentativa, estes
-- subcomandos alteram tudo com o menu aberto e reaplicam na hora. O `dump`
-- fecha o ciclo: imprime o bloco pronto para colar no shared/config.lua.

local function reapplyPreview()
    RefreshPreviewCam()
    local current = GetPreviewingEmote()
    if current then PreviewEmote(current) end
end

local function previewStatus()
    local d = GetPreviewDiagnostics()

    -- Vai para o console (F8) e nao para notificacao: sao muitas linhas, e de la
    -- da para copiar o texto.
    lib.print.info(table.concat({
        '',
        '=== preview do mri_Qemotemenu ===',
        ('  modo            %s'):format(tostring(d.mode)),
        ('  preview ativo   %s'):format(tostring(d.previewActive)),
        ('  camera          handle=%s existe=%s renderizando=%s')
            :format(tostring(d.camHandle), tostring(d.camExists), tostring(d.camRendering)),
        ('  ped             handle=%s existe=%s visivel=%s')
            :format(tostring(d.pedHandle), tostring(d.pedExists), tostring(d.pedVisible)),
        ('  ped coords      %s'):format(d.pedCoords and
            ('%.2f, %.2f, %.2f'):format(d.pedCoords.x, d.pedCoords.y, d.pedCoords.z) or '-'),
        ('  emote           %s'):format(tostring(d.emote)),
        ('  dict / anim     %s / %s'):format(tostring(d.emoteDict), tostring(d.emoteAnim)),
        ('  dict carregado  %s'):format(tostring(d.dictLoaded)),
        ('  tocando a anim  %s'):format(tostring(d.playingAnim)),
        '',
        '  /emotepreview mode <studio|world>',
        '  /emotepreview cam <x> <y> <z>   offset da camera relativo ao ped',
        '  /emotepreview fov <n>',
        '  /emotepreview lateral <n>       empurra o ped para o lado do quadro',
        '  /emotepreview rot <graus>       gira o ped',
        '  /emotepreview tc <timecycle>    vazio limpa',
        '  /emotepreview dof               liga/desliga profundidade de campo',
        '  /emotepreview daytime           liga/desliga a luz de dia forcada',
        '  /emotepreview replay            reaplica o emote em preview',
        '  /emotepreview dump              imprime o config pronto para colar',
        '',
    }, '\n'))
end

RegisterCommand('emotepreview', function(_source, args)
    local what = args[1] and tostring(args[1]):lower() or nil

    if not what then
        previewStatus()
        Notify('Diagnostico do preview no console (F8).')
        return
    end

    if what == 'mode' then
        local wanted = args[2] and tostring(args[2]):lower() or nil
        if wanted ~= 'studio' and wanted ~= 'world' then
            Notify('Uso: /emotepreview mode <studio|world>', 'error')
            return
        end

        -- Precisa reabrir: os dois modos montam ped e camera de formas diferentes.
        local wasOpen = PreviewActive
        local current = GetPreviewingEmote()
        ClosePreview()
        Config.PreviewMode = wanted
        if wasOpen then
            OpenPreview()
            if current then PreviewEmote(current) end
        end

        Notify(('Modo do preview: %s'):format(wanted), 'success')
        return
    end

    if what == 'cam' then
        local x, y, z = tonumber(args[2]), tonumber(args[3]), tonumber(args[4])
        if not x or not y or not z then
            Notify('Uso: /emotepreview cam <x> <y> <z>', 'error')
            return
        end
        Config.StudioCamOffset = vec3(x, y, z)
        Notify(('Camera: %.2f, %.2f, %.2f'):format(x, y, z))
    elseif what == 'fov' then
        local n = tonumber(args[2])
        if not n then
            Notify('Uso: /emotepreview fov <n>', 'error')
            return
        end
        Config.StudioCamFov = n
        Notify(('FOV: %.1f'):format(n))
    elseif what == 'lateral' then
        local n = tonumber(args[2])
        if not n then
            Notify('Uso: /emotepreview lateral <n>', 'error')
            return
        end
        Config.StudioCamLateral = n
        Notify(('Offset lateral: %.2f'):format(n))
    elseif what == 'rot' then
        local n = tonumber(args[2])
        if not n then
            Notify('Uso: /emotepreview rot <graus>', 'error')
            return
        end
        Config.StudioHeading = n
        Notify(('Heading: %.1f'):format(n))
    elseif what == 'tc' then
        Config.StudioTimecycle = args[2] and tostring(args[2]) or ''
        if Config.StudioTimecycle == '' then
            ClearTimecycleModifier()
            Notify('Timecycle limpo.')
        else
            SetTimecycleModifier(Config.StudioTimecycle)
            SetTimecycleModifierStrength(1.0)
            Notify(('Timecycle: %s'):format(Config.StudioTimecycle))
        end
        return
    elseif what == 'dof' then
        Config.StudioDof = not Config.StudioDof
        Notify(('DOF: %s'):format(tostring(Config.StudioDof)))
    elseif what == 'daytime' then
        Config.StudioForceDaytime = not Config.StudioForceDaytime
        if Config.StudioForceDaytime then
            NetworkOverrideClockTime(12, 0, 0)
        else
            NetworkClearClockTimeOverride()
        end
        Notify(('Luz de dia forcada: %s'):format(tostring(Config.StudioForceDaytime)))
        return
    elseif what == 'replay' then
        local current = GetPreviewingEmote()
        if not current then
            Notify('Nenhum emote em preview. Passe o mouse por um antes.', 'error')
            return
        end
        PreviewEmote(current)
        return
    elseif what == 'dump' then
        local o = Config.StudioCamOffset
        lib.print.info(table.concat({
            '',
            '-- cole em shared/config.lua',
            ("Config.StudioCoords = vec3(%.2f, %.2f, %.2f)")
                :format(Config.StudioCoords.x, Config.StudioCoords.y, Config.StudioCoords.z),
            ("Config.StudioHeading = %.2f"):format(Config.StudioHeading),
            ("Config.StudioCamOffset = vec3(%.2f, %.2f, %.2f)"):format(o.x, o.y, o.z),
            ("Config.StudioCamFov = %.1f"):format(Config.StudioCamFov),
            ("Config.StudioCamLateral = %.2f"):format(Config.StudioCamLateral),
            ("Config.StudioDof = %s"):format(tostring(Config.StudioDof)),
            ("Config.StudioTimecycle = '%s'"):format(Config.StudioTimecycle),
            ("Config.StudioForceDaytime = %s"):format(tostring(Config.StudioForceDaytime)),
            '',
        }, '\n'))
        Notify('Config atual no console (F8).')
        return
    else
        previewStatus()
        return
    end

    reapplyPreview()
end, false)
