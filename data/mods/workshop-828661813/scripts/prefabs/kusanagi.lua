local assets =
{
    Asset("ANIM", "anim/kusanagi.zip"),
    Asset("ANIM", "anim/swap_kusanagi.zip"),
	
	Asset("ATLAS", "images/inventoryimages/kusanagi.xml"),
    Asset("IMAGE", "images/inventoryimages/kusanagi.tex"),
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_kusanagi", "swap_kusanagi")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "kusanagi.tex" )

    inst.AnimState:SetBank("kusanagi")
    inst.AnimState:SetBuild("kusanagi")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("sharp")

    inst.entity:SetPristine()
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "kusanagi.tex" )

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(45)
    -------

    inst:AddComponent("inspectable")
	
    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.WATHGRITHR_SPEAR_USES)
    inst.components.finiteuses:SetUses(TUNING.WATHGRITHR_SPEAR_USES)

    inst.components.finiteuses:SetOnFinished(inst.Remove)

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "kusanagi"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/kusanagi.xml"
	inst.components.inventoryitem.keepondeath = true

    inst:AddComponent("equippable")

    inst.components.equippable:SetOnEquip(onequip)

    inst.components.equippable:SetOnUnequip(onunequip)

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("kusanagi", fn, assets)