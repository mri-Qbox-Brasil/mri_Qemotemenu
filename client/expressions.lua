---@diagnostic disable: lowercase-global

-- Expressoes faciais (moods). Porta rpemotes-reborn/client/Expressions.lua.
--
-- Bug corrigido na passagem: o original gravava a KVP em "expression" mas o
-- reset do menu apagava "Expressions" (EmoteMenu.lua:503), entao resetar o mood
-- nunca limpava o valor salvo. Aqui ha uma chave so: settings.mood.

---@param expression string? nome do emote de expressao (ex: "Aiming")
---@param save? boolean
function SetPlayerPedExpression(expression, save)
    local emote = expression and EmoteData[expression]

    if emote and emote.category == Category.EXPRESSIONS then
        SetFacialIdleAnimOverride(cache.ped, emote.anim, 0)
        if Config.PersistentExpression and save then
            SaveSetting('mood', expression)
        end
        return true
    end

    ClearFacialIdleAnimOverride(cache.ped)
    if save then
        SaveSetting('mood', nil)
    end
    return false
end

function ResetPlayerPedExpression()
    ClearFacialIdleAnimOverride(cache.ped)
    SaveSetting('mood', nil)
end

---@return string?
function GetPlayerPedExpression()
    return GetSetting('mood')
end

---Reaplica o mood salvo. Chamado no player load e no resource start.
function RestoreExpression()
    if not (Config.ExpressionsEnabled and Config.PersistentExpression) then return end
    if not AwaitCatalog() then return end

    local saved = GetSetting('mood')
    if not saved then return end

    SetPlayerPedExpression(saved, false)
end

exports('getExpression', GetPlayerPedExpression)
exports('setExpression', function(name) return SetPlayerPedExpression(name, true) end)
exports('resetExpression', ResetPlayerPedExpression)
