---@diagnostic disable: lowercase-global

-- ============================================================
-- Registro do plugin no mri_Qadmin
-- ============================================================
-- O Qadmin nao renderiza plugin a partir de schema: ele monta um <iframe>
-- apontando para cfx-nui-<resource>/<htmlPath>?embedded=1 e conversa com a
-- pagina por postMessage. Este manifest serve so para descoberta (card no hub)
-- e para o gate de permissao, que roda server-side antes do envio.
--
-- Drift control: o shape aceito esta em mri_Qadmin/server/plugins.lua:54-76.

local registered = false

local function registerPlugin()
    if GetResourceState('mri_Qadmin') ~= 'started' then return end

    local ok, result = pcall(function()
        return exports['mri_Qadmin']:RegisterPlugin({
            id            = Config.Plugin.id,
            label         = Config.Plugin.label,
            icon          = Config.Plugin.icon,
            resource      = GetCurrentResourceName(),
            htmlPath      = Config.Plugin.htmlPath,
            requiredPerms = Config.Plugin.perms,
            description   = Config.Plugin.description,
        })
    end)

    if not ok or result == false then
        lib.print.error(('Falha ao registrar plugin no mri_Qadmin: %s'):format(tostring(result)))
        return
    end

    registered = true

    if Config.Debug then
        lib.print.info(("Plugin '%s' registrado no mri_Qadmin."):format(Config.Plugin.id))
    end
end

-- Sinal oficial do Qadmin, emitido sempre que o registry fica pronto (inclusive
-- depois de um `ensure mri_Qadmin`). Cobre o caso do Qadmin subir depois de nos
-- e o de ele reiniciar com a gente ja de pe.
AddEventHandler('mri_Qadmin:server:pluginsReady', registerPlugin)

-- Caso inverso: nos reiniciarmos com o Qadmin ja no ar, quando o pluginsReady
-- desta sessao ja passou e nao vai se repetir.
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    registerPlugin()
end)

exports('IsPluginRegistered', function()
    return registered
end)
