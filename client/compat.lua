---@diagnostic disable: lowercase-global

-- ============================================================
-- Camada de compatibilidade
-- ============================================================
-- O fxmanifest declara `provide` para rpemotes, rpemotes-reborn, dpemotes e
-- scully_emotemenu, entao `exports['rpemotes-reborn']:X()` resolve para ca sem
-- ninguem editar nada.
--
-- ATENCAO — `provide` NAO faz GetResourceState('rpemotes-reborn') retornar
-- 'started'. Quem guarda a chamada com GetResourceState precisa aprender o nome
-- novo. No repo isso afeta:
--   [ultra]/gh-restaurants/bridge/emotes/loader.lua:10-13
--   [ultra]/ultra_utilities/client/braco.lua (ramos scully — inofensivo, ele ja
--   seta o statebag canEmote, que o input guard honra)
--
-- NAO EXISTE `DisableEmoteKeybinds` aqui, de proposito. Era o export que
-- obrigava todo resource com setas a avisar o menu de emotes. Quem resolve isso
-- agora e o client/inputguard.lua, sozinho.

-- CreateExport() vive em client/utils.lua: registra o export normal E o alias
-- legado `__cfx_export_rpemotes_*`.

-- ============================================================
-- rpemotes / rpemotes-reborn / dpemotes
-- ============================================================

CreateExport('EmoteCommandStart', function(emoteName, textureVariation)
    EmoteCommandStart({ emoteName, textureVariation })
end)

CreateExport('EmoteCancel', function(force)
    EmoteCancel(force)
end)

CreateExport('IsPlayerInAnim', function()
    return LocalPlayer.state.currentEmote
end)

CreateExport('getCurrentEmote', function()
    return GetCurrentEmote()
end)

CreateExport('CanCancelEmote', function(state)
    -- Deprecado ainda no rpemotes. Mantido funcional em vez de dar error(),
    -- porque error() num export derruba o caller.
    LocalPlayer.state:set('canCancel', state and true or false, true)
end)

RegisterNetEvent('animations:client:EmoteCommandStart', function(args)
    EmoteCommandStart(type(args) == 'table' and args or { args })
end)

RegisterNetEvent('animations:client:PlayEmote', function(args)
    EmoteCommandStart(type(args) == 'table' and args or { args })
end)

RegisterNetEvent('animations:client:EmoteCancel', function()
    EmoteCancel()
end)

RegisterNetEvent('animations:client:EmoteMenu', function()
    ToggleEmoteMenu()
end)

RegisterNetEvent('animations:client:Walk', function(args)
    local name = type(args) == 'table' and args[1] or args
    SetWalkStyle(name, true)
end)

RegisterNetEvent('animations:ToggleCanDoAnims', function(state)
    LocalPlayer.state:set('canEmote', state and true or false, true)
end)

-- Binds legados: o /emotebind antigo usava indice numerico 1..6.
RegisterNetEvent('animations:client:BindEmote', function(args)
    if type(args) ~= 'table' then return end
    local entry = Config.FavoriteSlots[tonumber(args[1]) or 0]
    if entry then
        SetFavoriteSlot(entry.slot, args[2] and tostring(args[2]):lower() or nil)
    end
end)

RegisterNetEvent('animations:client:EmoteDelete', function(args)
    local entry = Config.FavoriteSlots[tonumber(type(args) == 'table' and args[1] or args) or 0]
    if entry then
        SetFavoriteSlot(entry.slot, nil, nil)
    end
end)

-- ============================================================
-- scully_emotemenu
-- ============================================================
-- Contrato conferido no fork 1.9.9f em
-- C:\IT\repo\MRI-FRAMEWORK\mri_housing\resources\[standalone]\scully_emotemenu

local isActionsLimited = false
local registeredEmotes = {}

---@param command string
---@param variant? number
---@param ped? number toca num ped arbitrario (usado pelo mri_Qnpc)
local function playEmoteByCommand(command, variant, ped)
    if type(command) ~= 'string' then return end
    if isActionsLimited and not ped then return end
    if not AwaitCatalog(5000) then return end

    local emote = EmoteData[command:lower()]
    if not emote then
        Notify(("'%s' %s"):format(command, locale('notvalidemote')), 'error')
        return
    end

    if emote.category == Category.WALKS then return end

    if ped and ped ~= cache.ped then
        PlayEmoteOnPed(command:lower(), variant, ped)
        return
    end

    if emote.category == Category.SHARED then
        RequestSharedEmote(command:lower())
        return
    end

    EmoteCommandStart({ command:lower(), variant })
end

exports('playEmoteByCommand', playEmoteByCommand)
exports('playEmote', function(data, variation, ped)
    -- O scully aceita a tabela do emote; aqui aceitamos tabela com .Command/.name
    -- ou a string direta, que e como os consumidores reais chamam.
    local name = type(data) == 'table' and (data.Command or data.name) or data
    playEmoteByCommand(name, variation, ped)
end)

exports('cancelEmote', function(skipReset)
    -- No scully o parametro e `skipReset`; no rpemotes o equivalente e `force`.
    -- Semanticamente diferentes: aqui so cancelamos.
    EmoteCancel(skipReset)
end)

exports('setLimitation', function(limited)
    isActionsLimited = limited and true or false
    -- Espelha no statebag que o input guard le, para o bloqueio valer tambem
    -- para os atalhos de seta.
    LocalPlayer.state:set('canEmote', not isActionsLimited, true)
end)

exports('isLimited', function()
    return isActionsLimited
end)

exports('isInEmote', function()
    return IsInAnimation
end)

exports('getLastEmote', function()
    return CurrentAnimationName, CurrentTextureVariation
end)

exports('toggleMenu', ToggleEmoteMenu)
exports('closeMenu', CloseEmoteMenu)

exports('listEmotes', function(kind)
    local category = kind == 'Walks' and Category.WALKS
        or kind == 'DanceEmotes' and Category.DANCES
        or kind == 'PropEmotes' and Category.PROP_EMOTES
        or Category.EMOTES
    local names = {}
    for name, data in PairsByKeys(EmoteData) do
        if type(data) == 'table' and data.category == category then
            names[#names + 1] = name
        end
    end
    NotifyLong(table.concat(names, ', '))
end)

exports('setWalk', function(clipset)
    if type(clipset) ~= 'string' then return end

    -- O scully recebe o CLIPSET (`move_m@quick`), nao o nome do emote. Se bater
    -- com alguma entrada do catalogo usamos o caminho normal (que persiste);
    -- senao aplicamos o clipset cru.
    for name, data in pairs(EmoteData) do
        if data.category == Category.WALKS and data.anim == clipset then
            return SetWalkStyle(name, true)
        end
    end

    if RequestWalking(clipset) then
        SetPedMovementClipset(cache.ped, clipset, 0.2)
        RemoveAnimSet(clipset)
    end
end)

exports('resetWalk', ResetWalkStyle)
exports('getCurrentWalk', function()
    local saved = GetWalkStyle()
    if not saved then return 'default' end
    local emote = EmoteData[saved]
    return (emote and emote.anim) or saved
end)

exports('getCurrentExpression', function()
    local saved = GetPlayerPedExpression()
    if not saved then return 'default' end
    local emote = EmoteData[saved]
    return (emote and emote.anim) or saved
end)

exports('registerEmote', function(emote)
    if type(emote) ~= 'table' or type(emote.Name) ~= 'string' then return end
    registeredEmotes[emote.Name] = emote
end)

exports('playRegisteredEmote', function(name)
    local emote = registeredEmotes[name]
    if not emote then
        Notify(("'%s' %s"):format(tostring(name), locale('notvalidemote')), 'error')
        return
    end

    if emote.Type == 'Walks' and emote.Walk then
        exports[GetCurrentResourceName()]:setWalk(emote.Walk)
        return
    end

    playEmoteByCommand(emote.Command or emote.Name, emote.Variant)
end)

---Catalogo projetado no formato PascalCase do scully, para quem lia
---`require('@scully_emotemenu.data.animations.*')`.
exports('GetCatalog', function(category)
    return GetCatalogAsScully(category)
end)

-- Eventos net do scully (client/main.lua:1984-1996).
RegisterNetEvent('scully_emotemenu:playByCommand', playEmoteByCommand)
RegisterNetEvent('scully_emotemenu:play', function(data, variation, ped)
    local name = type(data) == 'table' and (data.Command or data.name) or data
    playEmoteByCommand(name, variation, ped)
end)
RegisterNetEvent('scully_emotemenu:cancelEmote', function() EmoteCancel() end)
-- O README e a doc do scully anunciam `cancelAnimation`, mas o codigo dele nunca
-- registrou esse nome. Registrar os dois e de graca e cobre quem seguiu a doc.
RegisterNetEvent('scully_emotemenu:cancelAnimation', function() EmoteCancel() end)
RegisterNetEvent('scully_emotemenu:closeMenu', function() CloseEmoteMenu() end)
RegisterNetEvent('scully_emotemenu:toggleMenu', function() ToggleEmoteMenu() end)
RegisterNetEvent('scully_emotemenu:setWalk', function(clipset)
    exports[GetCurrentResourceName()]:setWalk(clipset)
end)
RegisterNetEvent('scully_emotemenu:resetWalk', function() ResetWalkStyle() end)
RegisterNetEvent('scully_emotemenu:setExpression', function(name) SetPlayerPedExpression(name, true) end)
RegisterNetEvent('scully_emotemenu:resetExpression', function() ResetPlayerPedExpression() end)
RegisterNetEvent('scully_emotemenu:toggleLimitation', function(limited)
    exports[GetCurrentResourceName()]:setLimitation(limited)
end)
RegisterNetEvent('scully_emotemenu:registerEmote', function(emote)
    exports[GetCurrentResourceName()]:registerEmote(emote)
end)
RegisterNetEvent('scully_emotemenu:playRegisteredEmote', function(name)
    exports[GetCurrentResourceName()]:playRegisteredEmote(name)
end)
