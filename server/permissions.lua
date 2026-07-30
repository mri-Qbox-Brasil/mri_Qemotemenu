---@diagnostic disable: lowercase-global

-- Autorizacao para editar os padroes do servidor.
--
-- Preferencia pelo mri_Qadmin quando ele esta no ar (permissoes granulares do
-- painel); fallback para ACE, para o resource funcionar sozinho.

---@param source number
---@return boolean
function HasEmotePerms(source)
    if not source or source <= 0 then return false end

    if GetResourceState('mri_Qadmin') == 'started' then
        local ok, result = pcall(function()
            return exports['mri_Qadmin']:HasPerms(source, Config.Plugin.perms[1])
        end)
        if ok and result ~= nil then
            return result and true or false
        end
    end

    return IsPlayerAceAllowed(source, Config.AdminAce)
        or IsPlayerAceAllowed(source, 'command')
end
