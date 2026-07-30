---@diagnostic disable: lowercase-global

-- Particulas de emote (fumaca, faisca, etc). Porta rpemotes-reborn/client/PTFX.lua.
-- A sincronizacao entre players e por statebag: quem toca seta `ptfx` no proprio
-- bag e todo mundo reage no handler abaixo.

local PlayerParticles = {}

function PtfxThis(asset)
    local timeout = 2000
    while not HasNamedPtfxAssetLoaded(asset) and timeout > 0 do
        RequestNamedPtfxAsset(asset)
        Wait(10)
        timeout = timeout - 10
    end
    UseParticleFxAsset(asset)
end

function PtfxStart()
    LocalPlayer.state:set('ptfx', true, true)
end

function PtfxStop()
    LocalPlayer.state:set('ptfx', nil, true)
end

AddStateBagChangeHandler('ptfx', '', function(bagName, _key, value)
    local plyId = tonumber(bagName:gsub('player:', ''), 10)
    if not plyId then return end

    -- Ja esta no estado pedido: nada a fazer.
    if (PlayerParticles[plyId] and value) or (not PlayerParticles[plyId] and not value) then return end

    local ply = GetPlayerFromServerId(plyId)
    if ply <= 0 then return end

    local plyPed = GetPlayerPed(ply)
    if not DoesEntityExist(plyPed) then return end

    local stateBag = Player(plyId).state

    if value then
        if not stateBag.ptfxAsset or not stateBag.ptfxName then return end

        local boneIndex = stateBag.ptfxBone
            and GetPedBoneIndex(plyPed, stateBag.ptfxBone)
            or GetEntityBoneIndexByName(stateBag.ptfxName, 'VFX')

        local entityTarget = plyPed
        if stateBag.ptfxPropNet then
            local propObj = NetToObj(stateBag.ptfxPropNet)
            if DoesEntityExist(propObj) then
                entityTarget = propObj
            end
        end

        PtfxThis(stateBag.ptfxAsset)

        local offset = stateBag.ptfxOffset
        local rot = stateBag.ptfxRot
        if not offset or not rot then return end

        PlayerParticles[plyId] = StartNetworkedParticleFxLoopedOnEntityBone(
            stateBag.ptfxName, entityTarget,
            offset.x, offset.y, offset.z,
            rot.x, rot.y, rot.z,
            boneIndex, (stateBag.ptfxScale or 1) + 0.0, false, false, false)

        local color = stateBag.ptfxColor
        if color then
            if color[1] and type(color[1]) == 'table' then
                color = color[math.random(1, #color)]
            end
            SetParticleFxLoopedAlpha(PlayerParticles[plyId], color.A)
            SetParticleFxLoopedColour(PlayerParticles[plyId], color.R / 255, color.G / 255, color.B / 255, false)
        end
    else
        StopParticleFxLooped(PlayerParticles[plyId], false)
        if stateBag.ptfxAsset then
            RemoveNamedPtfxAsset(stateBag.ptfxAsset)
        end
        PlayerParticles[plyId] = nil
    end
end)
