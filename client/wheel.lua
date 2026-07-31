---@diagnostic disable: lowercase-global

-- ============================================================
-- Roda de emotes (radial do ox_lib)
-- ============================================================
-- O jogador equipa emotes pelo nosso menu e usa pela roda do ox_lib, que neste
-- servidor abre no F1 (keybind `mri_ox_lib-radial`, em
-- resources/[ox]/ox_lib/resource/interface/client/radial.lua:307-343).
--
-- Tres limites do ox_lib que moldam este modulo, e que vieram do codigo dele:
--
--   1. Sao 6 itens por pagina. O `PAGE_ITEMS` e fixo em
--      ox_lib/web/src/features/menu/radial/index.tsx:120. Do 7o em diante o
--      slot 6 vira botao "mais" e come um lugar da roda.
--   2. Nao da para abrir um submenu direto: `showRadial` e local ao ox_lib, sem
--      export. Por isso os emotes ficam dentro de um item raiz — F1 abre a roda
--      e os emotes estao a um clique.
--   3. `lib.clearRadialItems()` e GLOBAL, apaga item de todo resource. O
--      qbx_radialmenu chama isso ao morrer e ao reviver
--      (qbx_radialmenu/client/main.lua:151,166) e no onResourceStop dele. Sem
--      reregistrar nesses momentos, a roda perde os emotes na primeira morte.

local registered = false

---Slots equipados. Posicao vazia e `false` e nao `nil`: array esparso vira
---objeto no json.encode e voltaria baguncado do banco.
---@return table
local function getWheel()
    local saved = GetSetting('wheel')
    local wheel = {}

    for i = 1, Config.WheelSlots do
        local value = (type(saved) == 'table') and saved[i] or nil
        wheel[i] = (type(value) == 'string' and value ~= '') and value or false
    end

    return wheel
end

---@return table
function GetWheel()
    return getWheel()
end

---Monta os itens do submenu. Slots vazios entram como placeholder para a roda
---manter sempre a mesma geometria — 6 setores, como no Fortnite.
local function buildItems()
    local wheel = getWheel()
    local items = {}

    for i = 1, Config.WheelSlots do
        local emote = wheel[i]

        if emote then
            items[i] = {
                label = GetEmoteDisplayName(emote),
                icon = Config.WheelItemIcon,
                onSelect = function()
                    EmoteCommandStart({ emote })
                end,
            }
        else
            items[i] = {
                label = locale('wheel_empty'),
                icon = 'plus',
                onSelect = function()
                    Notify(locale('wheel_empty_hint'))
                end,
            }
        end
    end

    return items
end

---Registra (ou reregistra) a roda. Idempotente: `registerRadial` com o mesmo id
---substitui o submenu inteiro, e `addRadialItem` com o mesmo id substitui o item
---no lugar — entao chamar de novo e a forma suportada de atualizar.
function RefreshWheel()
    if not Config.WheelEnabled then return end

    lib.registerRadial({
        id = Config.WheelMenuId,
        items = buildItems(),
    })

    lib.addRadialItem({
        id = Config.WheelRootId,
        label = locale('wheel_root'),
        icon = Config.WheelRootIcon,
        menu = Config.WheelMenuId,
    })

    registered = true
end

---Equipa um emote num slot. `emote` nil limpa o slot.
---@param slot integer
---@param emote string?
---@return boolean
function SetWheelSlot(slot, emote)
    -- Inteiro obrigatorio: um 1.5 passaria na faixa e gravaria em wheel[1.5],
    -- que o getWheel() (for i = 1, N) nunca le. O slot sumiria em silencio e
    -- ainda ocuparia espaco no JSON salvo.
    slot = math.tointeger(tonumber(slot)) or 0
    if slot < 1 or slot > Config.WheelSlots then return false end

    if emote ~= nil then
        if type(emote) ~= 'string' or not EmoteData[emote] then
            Notify(("'%s' %s"):format(tostring(emote), locale('notvalidemote')), 'error')
            return false
        end
    end

    local wheel = getWheel()
    wheel[slot] = emote or false
    SaveSetting('wheel', wheel)

    RefreshWheel()
    SendNUIMessage({ action = 'wheelUpdated', wheel = wheel })
    return true
end

---@param slot integer
---@return boolean
function ClearWheelSlot(slot)
    return SetWheelSlot(slot, nil)
end

-- ============================================================
-- Ciclo de vida
-- ============================================================

-- O qbx_radialmenu limpa TODOS os itens da roda (inclusive os nossos) ao morrer
-- e ao reviver. Reregistramos nas duas pontas.
RegisterNetEvent('radialmenu:client:deadradial', function()
    -- Espera o qbx terminar o clearRadialItems + setupRadialMenu dele.
    SetTimeout(500, RefreshWheel)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    SetTimeout(2000, RefreshWheel)
end)

-- Se o qbx_radialmenu reiniciar, o onResourceStop dele tambem limpa tudo.
AddEventHandler('onClientResourceStart', function(resource)
    if resource ~= 'qbx_radialmenu' then return end
    SetTimeout(1000, RefreshWheel)
end)

---@return boolean
function IsWheelRegistered()
    return registered
end
