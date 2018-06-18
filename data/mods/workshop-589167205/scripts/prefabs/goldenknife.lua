local assets =
{
	Asset("ANIM", "anim/goldenknife.zip"),
	Asset("ANIM", "anim/swap_goldenknife.zip"),

	Asset("ATLAS", "images/inventoryimages/goldenknife.xml"),
    Asset("IMAGE", "images/inventoryimages/goldenknife.tex"),
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_goldenknife", "goldenknife")
	owner.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold") 
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function onattack(inst, attacker, target)

        local playerAngle =  attacker.Transform:GetRotation()
        if playerAngle < 0 then playerAngle = playerAngle + 360 end 

        local targetAngle = target.Transform:GetRotation()
        if targetAngle < 0 then targetAngle = targetAngle + 360 end 

        local angleDiff = math.abs(targetAngle - playerAngle)
        if angleDiff > 180 then angleDiff = 360 - angleDiff end

        if angleDiff < 50 and attacker:HasTag("spy") then
            --Do backstab
			inst.components.weapon:SetDamage(TUNING.GOLDKNIFE_DAMAGE*TUNING.BACKSTAB_MULT) 
        else
			inst.components.weapon:SetDamage(TUNING.GOLDKNIFE_DAMAGE) 
        end 
--    end
	
end 

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()
	
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("goldenknife")
    inst.AnimState:SetBuild("goldenknife")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("goldenknife")
	inst:AddTag("sharp")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.GOLDKNIFE_DAMAGE)
	
	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.GOLDKNIFE_USES)
    inst.components.finiteuses:SetUses(TUNING.GOLDKNIFE_USES)

    inst.components.finiteuses:SetOnFinished(inst.Remove)
	
	MakeHauntableLaunch(inst)
	
	inst.components.weapon:SetOnAttack(onattack)
	
    inst:AddComponent("tradable")
	
    inst.entity:SetPristine()
    inst:AddComponent("inspectable")
    inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "goldenknife"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/goldenknife.xml"

    return inst
end

return Prefab("common/inventory/goldenknife", fn, assets)