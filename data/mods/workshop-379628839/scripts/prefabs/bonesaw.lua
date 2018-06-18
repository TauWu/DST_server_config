local assets =
{
	Asset("ANIM", "anim/bonesaw.zip"),
	Asset("ANIM", "anim/swap_bonesaw.zip"),

	Asset("ATLAS", "images/inventoryimages/bonesaw.xml"),
    Asset("IMAGE", "images/inventoryimages/bonesaw.tex"),
}

local function IsValidVictim(victim)
    return victim ~= nil
        and not (victim:HasTag("veggie") or
                victim:HasTag("structure") or
                victim:HasTag("wall"))
        and victim.components.health ~= nil
        and victim.components.combat ~= nil
end

local function bonesawbones(inst, data, doer)
	local victim = data.victim
    if IsValidVictim(victim) then
	    LaunchAt(SpawnPrefab("boneshard"), inst, doer, .2, 1, 1)
    end
end

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_bonesaw", "bonesaw")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
	if owner then
		owner:ListenForEvent("killed", bonesawbones)
	end
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
	if owner then
		owner:RemoveEventCallback("killed", bonesawbones)
	end
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("bonesaw")
    inst.AnimState:SetBuild("bonesaw")
    inst.AnimState:PlayAnimation("idle")

	inst:AddTag("sharp")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.BONESAW_DAMAGE)
	
	inst:ListenForEvent("killed", bonesawbones)
	
	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.BONESAW_USES)
    inst.components.finiteuses:SetUses(TUNING.BONESAW_USES)

    inst.components.finiteuses:SetOnFinished(inst.Remove)
	
	MakeHauntableLaunch(inst)
	
	inst:AddComponent("lootdropper")
	
    inst.entity:SetPristine()
    inst:AddComponent("inspectable")
    inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "bonesaw"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/bonesaw.xml"

    return inst
end

return Prefab("common/inventory/bonesaw", fn, assets)