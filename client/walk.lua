---@diagnostic disable: lowercase-global

-- Estilos de andar. Porta rpemotes-reborn/client/Walk.lua, trocando a
-- persistencia de KVP local para o banco (por citizenid, via server/players.lua).

local canChange = true
local unableMessage = nil

---@param name string?
---@param force? boolean
---@return boolean
function SetWalkStyle(name, force)
    if not canChange and not force then
        Notify(unableMessage or locale('walk_locked'), 'error')
        return false
    end

    if not name or name == '' then
        ResetWalkStyle()
        return true
    end

    local emote = EmoteData[name]
    if type(emote) ~= 'table' or emote.category ~= Category.WALKS then
        Notify(("'%s' %s"):format(tostring(name), locale('notvalidwalk')), 'error')
        return false
    end

    local clipset = emote.anim
    if not clipset then return false end

    if not RequestWalking(clipset) then
        DebugPrint('Timeout carregando anim set ' .. clipset)
        return false
    end

    SetPedMovementClipset(cache.ped, clipset, 0.2)
    RemoveAnimSet(clipset)

    if Config.PersistentWalk then
        SaveSetting('walk', name)
    end

    return true
end

function ResetWalkStyle()
    if not canChange then
        Notify(unableMessage or locale('walk_locked'), 'error')
        return
    end
    ResetPedMovementClipset(cache.ped, 0.0)
    SaveSetting('walk', nil)
end

---@return string?
function GetWalkStyle()
    return GetSetting('walk')
end

---Reaplica o walk salvo. Chamado no player load e no resource start.
function RestoreWalkStyle()
    if not (Config.WalkingStylesEnabled and Config.PersistentWalk) then return end
    if not AwaitCatalog() then return end

    local saved = GetSetting('walk')
    if not saved then return end

    local emote = EmoteData[saved]
    if type(emote) == 'table' and emote.category == Category.WALKS then
        SetWalkStyle(saved, true)
    else
        ResetPedMovementClipset(cache.ped, 0.0)
        SaveSetting('walk', nil)
    end
end

exports('toggleWalkstyle', function(state, message)
    canChange = state and true or false
    if message then unableMessage = message end
end)

exports('getWalkstyle', GetWalkStyle)
exports('setWalkstyle', SetWalkStyle)
