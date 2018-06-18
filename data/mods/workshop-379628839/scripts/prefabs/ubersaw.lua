local assets =
{
	Asset("ANIM", "anim/ubersaw.zip"),
	Asset("ANIM", "anim/swap_ubersaw.zip"),

	Asset("ATLAS", "images/inventoryimages/ubersaw.xml"),
    Asset("IMAGE", "images/inventoryimages/ubersaw.tex"),
}

local function onattack(inst, owner, target)
    if owner.components.health and owner.components.health:GetPercent() < 1 and not target:HasTag("wall") then
	        owner.components.health:DoDelta(TUNING.UBERSAW_HEALTH)
	end
end

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_ubersaw", "ubersaw")
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
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("ubersaw")
    inst.AnimState:SetBuild("ubersaw")
    inst.AnimState:PlayAnimation("idle")
	
    inst:AddTag("ubersaw")
	inst:AddTag("sharp")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.UBERSAW_DAMAGE)
	inst.components.weapon:SetOnAttack(onattack)
	
	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.UBERSAW_USES)
    inst.components.finiteuses:SetUses(TUNING.UBERSAW_USES)

    inst.components.finiteuses:SetOnFinished(inst.Remove)
	
	MakeHauntableLaunch(inst)
	
    inst.entity:SetPristine()
    inst:AddComponent("inspectable")
    inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "ubersaw"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/ubersaw.xml"
	
    return inst
end

return Prefab("common/inventory/ubersaw", fn, assets)