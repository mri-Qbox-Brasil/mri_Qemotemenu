---@diagnostic disable: lowercase-global

-- Ponte NUI <-> Lua.
--
-- Regra do projeto: TODO RegisterNUICallback chama cb() em todos os caminhos,
-- inclusive nos de erro. Um cb esquecido trava a interface em loop.

local favorites = {}

---@return table
local function buildPayload()
    return {
        catalog   = CatalogIndex,
        slots     = ResolvedSlots,
        favorites = favorites,
        walk      = GetWalkStyle(),
        mood      = GetPlayerPedExpression(),
        isAdmin   = IsEmoteAdmin,
        arrows    = Config.ArrowControls,
    }
end

function OpenEmoteMenu()
    if MenuIsOpen then return end
    if not AwaitCatalog(5000) then
        Notify(locale('catalog_loading'), 'error')
        return
    end

    MenuIsOpen = true

    -- Ordem igual a da gh-arenapaintball (src/client/main.ts:11-33): foco da NUI
    -- primeiro, frontend do pause menu depois. OpenPreview tem um Wait(100)
    -- interno, entao inverter a ordem faz a tela demorar a aparecer.
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'setVisible', visible = true, data = buildPayload() })

    OpenPreview()
end

function CloseEmoteMenu()
    if not MenuIsOpen then return end

    MenuIsOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'setVisible', visible = false })
    ClosePreview()
end

function ToggleEmoteMenu()
    if MenuIsOpen then
        CloseEmoteMenu()
    else
        OpenEmoteMenu()
    end
end

-- ============================================================
-- Callbacks
-- ============================================================

RegisterNUICallback('hideFrame', function(_, cb)
    CloseEmoteMenu()
    cb({ ok = true })
end)

RegisterNUICallback('playEmote', function(data, cb)
    if type(data) ~= 'table' or type(data.name) ~= 'string' then
        cb({ ok = false, error = 'payload invalido' })
        return
    end

    CloseEmoteMenu()
    -- Passa pelo caminho do comando para herdar todas as validacoes
    -- (morto, nadando, variacao de textura, emote de animal).
    EmoteCommandStart({ data.name, data.variation })
    cb({ ok = true })
end)

RegisterNUICallback('previewEmote', function(data, cb)
    if type(data) ~= 'table' or type(data.name) ~= 'string' then
        cb({ ok = false })
        return
    end

    local ok = PreviewEmote(data.name, data.variation)
    cb({ ok = ok and true or false })
end)

RegisterNUICallback('clearPreview', function(_, cb)
    ClearPreviewEmote()
    cb({ ok = true })
end)

RegisterNUICallback('cancelEmote', function(_, cb)
    EmoteCancel()
    cb({ ok = true })
end)

RegisterNUICallback('setWalk', function(data, cb)
    if type(data) ~= 'table' then
        cb({ ok = false })
        return
    end

    local ok
    if data.name and data.name ~= '' then
        ok = SetWalkStyle(data.name, true)
    else
        ResetWalkStyle()
        ok = true
    end

    cb({ ok = ok and true or false })
end)

RegisterNUICallback('setMood', function(data, cb)
    if type(data) ~= 'table' then
        cb({ ok = false })
        return
    end

    local ok
    if data.name and data.name ~= '' then
        ok = SetPlayerPedExpression(data.name, true)
    else
        ResetPlayerPedExpression()
        ok = true
    end

    cb({ ok = ok and true or false })
end)

RegisterNUICallback('setSlot', function(data, cb)
    if type(data) ~= 'table' or type(data.slot) ~= 'string' then
        cb({ ok = false, error = 'slot invalido' })
        return
    end

    local ok = SetFavoriteSlot(data.slot, data.emote, data.label)
    cb({ ok = ok, slots = ResolvedSlots })
end)

RegisterNUICallback('toggleFavorite', function(data, cb)
    if type(data) ~= 'table' or type(data.name) ~= 'string' then
        cb({ ok = false })
        return
    end

    local index
    for i = 1, #favorites do
        if favorites[i] == data.name then
            index = i
            break
        end
    end

    if index then
        table.remove(favorites, index)
    else
        favorites[#favorites + 1] = data.name
    end

    SaveSetting('favorites', favorites)
    cb({ ok = true, favorites = favorites })
end)

RegisterNUICallback('adminSetDefault', function(data, cb)
    if type(data) ~= 'table' or type(data.slot) ~= 'string' then
        cb({ ok = false, error = 'slot invalido' })
        return
    end

    -- A autorizacao real acontece no server; aqui e so UX.
    local ok, err = lib.callback.await('mri_Qemotemenu:setDefault', false, {
        slot = data.slot,
        emote = data.emote,
        label = data.label,
    })

    cb({ ok = ok and true or false, error = err })
end)

RegisterNUICallback('getCatalog', function(_, cb)
    AwaitCatalog()
    cb(buildPayload())
end)

-- ============================================================
-- Estado vindo do servidor
-- ============================================================

RegisterNetEvent('mri_Qemotemenu:client:favoritesUpdated', function(list)
    if type(list) ~= 'table' then return end
    favorites = list
    SendNUIMessage({ action = 'favoritesUpdated', favorites = favorites })
end)

---@return string[]
function GetFavorites()
    return favorites
end

---@param list string[]
function SetFavoritesLocal(list)
    favorites = list or {}
end
