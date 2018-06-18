local assets =
{
	Asset("ANIM", "anim/blowdart_health.zip"),
	Asset("ANIM", "anim/swap_blowdart_health.zip"),
	
	Asset("ATLAS", "images/inventoryimages/blowdart_health.xml"),
    Asset("IMAGE", "images/inventoryimages/blowdart_health.tex"),
}

local prefabs =
{
    "impact",
}

local function pipeequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_object", "swap_blowdart_health", "swap_blowdart_health")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_object")
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function onhit(inst, attacker, target)
    local impactfx = SpawnPrefab("impact")
    if impactfx ~= nil then
        local follower = impactfx.entity:AddFollower()
        follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, 0, 0)
        if attacker ~= nil then
            impactfx:FacePoint(attacker.Transform:GetWorldPosition())
        end
    end
	 if attacker and attacker.components.sanity then
		if target and target:HasTag("player") or target:HasTag("companion") or target:HasTag("pig") then
		if attacker.components.sanity.current > 130 then
			target.components.health:DoDelta(TUNING.MEDICDART_HEALTH)
		elseif attacker.components.sanity.current > 50 and attacker.components.sanity.current <= 130 then
		    target.components.health:DoDelta(TUNING.MEDICDART_HEALTH+20)
		elseif attacker.components.sanity.current > 30 and attacker.components.sanity.current <= 50 then
		    target.components.health:DoDelta(TUNING.MEDICDART_HEALTH+50)
		elseif attacker.components.sanity.current < 30 then
		    target.components.health:DoDelta(TUNING.MEDICDART_HEALTH+70)
		end
		end
	end
    inst:Remove()
end

local function pipethrown(inst)
    inst.AnimState:PlayAnimation("dart_pipe")
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function onthrown(inst, data)
    inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
end


local function fn(anim, tags, removephysicscolliders)
	local inst = CreateEntity()
	local anim = "idle_pipe"

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("blowdart_health")
    inst.AnimState:SetBuild("blowdart_health")
    inst.AnimState:PlayAnimation(anim)
	
	inst:AddTag("blowdart")
	inst:AddTag("sharp")
    inst:AddTag("projectile")
	
    if tags ~= nil then
        for i, v in ipairs(tags) do
            inst:AddTag(v)
        end
    end

    if removephysicscolliders then
        RemovePhysicsColliders(inst)
    end

    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(0)
    inst.components.weapon:SetRange(8, 10)
	
	inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(48) --20% less than 60, the usual blowdart speed
    inst.components.projectile:SetOnHitFn(onhit)
	inst.components.projectile:SetOnThrownFn(pipethrown)
    inst:ListenForEvent("onthrown", onthrown)
	
	inst:AddComponent("stackable")
    inst:AddComponent("inspectable")
    inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(pipeequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.equipstack = true --Problem

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "blowdart_health"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/blowdart_health.xml"
	
	MakeHauntableLaunch(inst)

    return inst
end

return Prefab("common/inventory/blowdart_health", fn, assets, prefabs)