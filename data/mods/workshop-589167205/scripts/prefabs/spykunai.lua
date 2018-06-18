local assets =
{
	Asset("ANIM", "anim/spykunai.zip"),
	Asset("ANIM", "anim/swap_spykunai.zip"),

	Asset("ATLAS", "images/inventoryimages/spykunai.xml"),
    Asset("IMAGE", "images/inventoryimages/spykunai.tex"),
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_spykunai", "spykunai")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function onattack(inst, attacker, target)

--	if attacker and attacker:HasTag("spy") then
        local playerAngle =  attacker.Transform:GetRotation()
        if playerAngle < 0 then playerAngle = playerAngle + 360 end 

        local targetAngle = target.Transform:GetRotation()
        if targetAngle < 0 then targetAngle = targetAngle + 360 end 

        local angleDiff = math.abs(targetAngle - playerAngle)
        if angleDiff > 180 then angleDiff = 360 - angleDiff end

        if angleDiff < 50 and attacker:HasTag("spy") then
            --Do backstab
			inst.components.weapon:SetDamage(TUNING.CKUNAI_DAMAGE*TUNING.BACKSTAB_MULT) 
        else
			inst.components.weapon:SetDamage(TUNING.CKUNAI_DAMAGE) 
        end 
	
end 

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("spykunai")
    inst.AnimState:SetBuild("spykunai")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("spykunai")
	inst:AddTag("sharp")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("tradable")
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.CKUNAI_DAMAGE)
	
	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.CKUNAI_USES)
    inst.components.finiteuses:SetUses(TUNING.CKUNAI_USES)

    inst.components.finiteuses:SetOnFinished(inst.Remove)
	
	MakeHauntableLaunch(inst)
	
	inst.components.weapon:SetOnAttack(onattack)
	
    inst.entity:SetPristine()
    inst:AddComponent("inspectable")
    inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "spykunai"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/spykunai.xml"

    return inst
end

return Prefab("common/inventory/spykunai", fn, assets)