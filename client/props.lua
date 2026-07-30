---@diagnostic disable: lowercase-global

-- Props anexados ao ped durante um emote. Porta addProp/addProps/DestroyAllProps
-- e cleanScenarioObjects de rpemotes-reborn/client/Emote.lua.
--
-- Ha duas listas separadas: os props do player (networked, replicados) e os do
-- ped de preview (locais, nunca replicados). O preview roda ao mesmo tempo que
-- o player pode estar num emote, entao misturar as duas apagaria prop errado.

PlayerProps = {}
PreviewPedProps = {}

---@type number? ultimo prop criado — usado para sincronizar PTFX preso ao prop
AttachedProp = nil

-- Objetos que o jogo cria sozinho ao entrar em certos scenarios e nao remove ao
-- sair. Sem essa limpeza sobram xicaras/cigarros flutuando no chao.
local scenarioObjects = {
    `p_amb_coffeecup_01`, `p_amb_joint_01`, `p_cs_ciggy_01`, `p_cs_ciggy_01b_s`,
    `p_cs_clipboard`, `prop_curl_bar_01`, `p_cs_joint_01`, `p_cs_joint_02`,
    `prop_acc_guitar_01`, `prop_amb_ciggy_01`, `prop_amb_phone`,
    `prop_beggers_sign_01`, `prop_beggers_sign_02`, `prop_beggers_sign_03`,
    `prop_beggers_sign_04`, `prop_bongos_01`, `prop_cigar_01`, `prop_cigar_02`,
    `prop_cigar_03`, `prop_cs_beer_bot_40oz_02`, `prop_cs_paper_cup`,
    `prop_cs_trowel`, `prop_fib_clipboard`, `prop_fish_slice_01`,
    `prop_fishing_rod_01`, `prop_fishing_rod_02`, `prop_notepad_02`,
    `prop_parking_wand_01`, `prop_rag_01`, `prop_scn_police_torch`,
    `prop_sh_cigar_01`, `prop_sh_joint_01`, `prop_tool_broom`,
    `prop_tool_hammer`, `prop_tool_jackham`, `prop_tennis_rack_01`,
    `prop_weld_torch`, `w_me_gclub`, `p_amb_clipboard_01`,
}

---@param targetPed number
function CleanScenarioObjects(targetPed)
    if not targetPed or not DoesEntityExist(targetPed) then return end
    local coords = GetEntityCoords(targetPed)

    for i = 1, #scenarioObjects do
        local obj = GetClosestObjectOfType(coords.x, coords.y, coords.z, 1.0, scenarioObjects[i], false, true, true)
        if DoesEntityExist(obj) then
            SetEntityAsMissionEntity(obj, false, false)
            DeleteObject(obj)
        end
    end
end

---@param isClone? boolean
function DestroyAllProps(isClone)
    local list = isClone and PreviewPedProps or PlayerProps
    for _, prop in pairs(list) do
        if DoesEntityExist(prop) then
            DeleteEntity(prop)
        end
    end

    if isClone then
        PreviewPedProps = {}
    else
        PlayerProps = {}
    end
end

---@param data table
---@return boolean
local function addProp(data)
    if not data.prop1 or not data.bone then
        DebugPrint('addProp chamado sem prop1/bone')
        return false
    end

    local target = data.target
    if not target or not DoesEntityExist(target) then return false end

    if not IsModelValid(joaat(data.prop1)) then
        DebugPrint(('%s nao e um modelo valido'):format(tostring(data.prop1)))
        return false
    end

    LoadPropDict(data.prop1)

    local coords = GetEntityCoords(target)
    -- isNetwork = false no preview: o ped clonado e local, o prop tem que ser tambem.
    local prop = CreateObject(joaat(data.prop1), coords.x, coords.y, coords.z + 0.2, not data.isClone, true, true)

    if data.textureVariation ~= nil then
        SetObjectTextureVariation(prop, data.textureVariation)
    end

    if data.noCollision then
        SetEntityCollision(prop, false, false)
    end

    AttachEntityToEntity(prop, target, GetPedBoneIndex(target, data.bone),
        data.off1 or 0.0, data.off2 or 0.0, data.off3 or 0.0,
        data.rot1 or 0.0, data.rot2 or 0.0, data.rot3 or 0.0,
        true, true, false, true, 1, true)

    AttachedProp = prop

    if data.isClone then
        PreviewPedProps[#PreviewPedProps + 1] = prop
    else
        PlayerProps[#PlayerProps + 1] = prop
    end

    SetModelAsNoLongerNeeded(joaat(data.prop1))
    return true
end

---@param animOption table
---@param textureVariation? integer
---@param isClone? boolean
---@param targetPed? number
function AddProps(animOption, textureVariation, isClone, targetPed)
    local target = targetPed or (isClone and PreviewPed or cache.ped)
    local p1, p2, p3, p4, p5, p6 = table.unpack(animOption.PropPlacement)

    Wait(animOption.EmoteDuration or 0)

    if not addProp({
            prop1 = animOption.Prop,
            bone = animOption.PropBone,
            off1 = p1, off2 = p2, off3 = p3,
            rot1 = p4, rot2 = p5, rot3 = p6,
            textureVariation = textureVariation,
            isClone = isClone,
            target = target,
            noCollision = animOption.PropNoCollision,
        }) then
        return
    end

    if not animOption.SecondProp then return end

    local s1, s2, s3, s4, s5, s6 = table.unpack(animOption.SecondPropPlacement)
    if not addProp({
            prop1 = animOption.SecondProp,
            bone = animOption.SecondPropBone,
            off1 = s1, off2 = s2, off3 = s3,
            rot1 = s4, rot2 = s5, rot3 = s6,
            textureVariation = textureVariation,
            isClone = isClone,
            target = target,
            noCollision = animOption.SecondPropNoCollision,
        }) then
        DestroyAllProps(isClone)
    end
end
