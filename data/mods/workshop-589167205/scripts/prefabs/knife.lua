local assets =
{
	Asset("ANIM", "anim/knife.zip"),
	Asset("ANIM", "anim/swap_knife.zip"),

	Asset("ATLAS", "images/inventoryimages/knife.xml"),
    Asset("IMAGE", "images/inventoryimages/knife.tex"),
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_knife", "knife")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end
-- Cheap Math being used here, slippery spy
local function onattack(inst, attacker, target)

--	if attacker.prefab == "spy" then
        local playerAngle =  attacker.Transform:GetRotation()
        if playerAngle < 0 then playerAngle = playerAngle + 360 end 

        local targetAngle = target.Transform:GetRotation()
        if targetAngle < 0 then targetAngle = targetAngle + 360 end 

        local angleDiff = math.abs(targetAngle - playerAngle)
        if angleDiff > 180 then angleDiff = 360 - angleDiff end

        if angleDiff < 50 and attacker:HasTag("spy") then
            --Do backstab
			inst.components.weapon:SetDamage(TUNING.KNIFE_DAMAGE*TUNING.BACKSTAB_MULT) --5
			--attacker.components.combat.defaultdamage * 0.25
        else
            --inst.components.combat.damagemultiplier = 0
			inst.components.weapon:SetDamage(TUNING.KNIFE_DAMAGE) 
        end 
	
end 

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("knife")
    inst.AnimState:SetBuild("knife")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("knife")
	inst:AddTag("sharp")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.KNIFE_DAMAGE)
	
	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.KNIFE_USES)
    inst.components.finiteuses:SetUses(TUNING.KNIFE_USES)

    inst.components.finiteuses:SetOnFinished(inst.Remove)
	
	MakeHauntableLaunch(inst)
	
	inst.components.weapon:SetOnAttack(onattack)
	
    inst.entity:SetPristine()
    inst:AddComponent("inspectable")
    inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "knife"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/knife.xml"

    --inst:AddComponent("characterspecific")	
    --inst.components.characterspecific:SetOwner("spy")
    return inst
end

return Prefab("common/inventory/knife", fn, assets)