---@diagnostic disable: lowercase-global

-- Bootstrap do servidor.

-- Exports para outros resources lerem o estado dos atalhos sem falar com o banco.
exports('GetSlotDefaults', function()
    return GetDefaults()
end)

exports('SetSlotDefault', function(slot, emote, label)
    -- Chamada server-side de outro resource: sem source, sem gate de ACE.
    -- Quem chama e codigo do servidor, nao player.
    return SetDefault(0, slot, emote, label)
end)

CreateThread(function()
    -- Espera os defaults antes de anunciar, para nao existir janela em que um
    -- player conecta e recebe tabela vazia.
    local deadline = GetGameTimer() + 10000
    while not DefaultsReady() and GetGameTimer() < deadline do
        Wait(100)
    end

    if not DefaultsReady() then
        lib.print.error('Os padroes de atalho nao carregaram — verifique se o SQL de _INSTALL foi executado.')
        return
    end

    lib.print.info(('mri_Qemotemenu pronto (%d slots de atalho)'):format(#Config.FavoriteSlots))
end)
