local ScytheDamage = require "workshop-380122571.reaper"
local ScytheDamage = ScytheDamage.GetModConfigData("ScytheDamage")

local assets=
{
	Asset("ANIM", "anim/scythe.zip"),
    Asset("ANIM", "anim/swap_scythe.zip"), 

    Asset("ATLAS", "images/inventoryimages/scythe.xml"),
    Asset("IMAGE", "images/inventoryimages/scythe.tex"),
}

    local function OnEquip(inst, owner)
        owner.AnimState:OverrideSymbol("swap_object", "swap_scythe", "scythe")
        owner.AnimState:Show("ARM_carry") 
        owner.AnimState:Hide("ARM_normal") 
end

    local function OnUnequip(inst, owner) 
        owner.AnimState:Hide("ARM_carry") 
        owner.AnimState:Show("ARM_normal") 
    end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)


    inst.AnimState:SetBank("scythe")
    inst.AnimState:SetBuild("scythe")
    inst.AnimState:PlayAnimation("idle")
	
	    

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("inspectable")
	
	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(75)
    inst.components.finiteuses:SetUses(75)
    inst.components.finiteuses:SetOnFinished(inst.Remove)

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "scythe"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/scythe.xml"

	inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("weapon")
	
	if ScytheDamage == "42" then
    inst.components.weapon:SetDamage(42)
	elseif ScytheDamage == "57" then
    inst.components.weapon:SetDamage(57)
	elseif ScytheDamage == "64" then
    inst.components.weapon:SetDamage(64)
	end
	
	inst:AddTag("sharp")
	
	--inst:AddComponent("characterspecific")
    --inst.components.characterspecific:SetOwner("reaper")
	
    MakeHauntableLaunch(inst)

	return inst
end
	

return Prefab( "common/inventory/scythe", fn, assets) 