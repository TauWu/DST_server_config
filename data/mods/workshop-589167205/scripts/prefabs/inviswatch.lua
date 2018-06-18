local assets =
{
	Asset("ANIM", "anim/inviswatch.zip"),
	Asset("ATLAS", "images/inventoryimages/inviswatch.xml"),
}

local function DropTargets(owner)
	local x,y,z = owner.Transform:GetWorldPosition()	
	local ents = TheSim:FindEntities(x, y, z, 50)

	for k,v in pairs(ents) do
		if v.components.combat and v.components.combat.target == owner then
			v.components.combat.target = nil
		end
	end
end

local AGGR_TIME = 3

local function GoInvisible(inst)
	--print("GoInvisible ", inst.inviswatch_active)
	if inst.inviswatch_active then 
		return
	end
	inst.inviswatch_active = true
	inst.m_compatibility.UpdateAnim(inst,true) --true means only once
	inst.net_inviswatch_active:set(true)
	inst:AddTag("notarget")
	inst:RemoveTag("scarytoprey")
	
	-- Stop anyone from actively attacking spy (notarget tag will make it so you don't get re-targeted)
	local timer = 0
	inst.task_drop_targets = inst:DoPeriodicTask(0.2,function(inst)
		timer = timer + 0.2
		if timer > AGGR_TIME then
			DropTargets(inst)
		end
		if inst.task_drop_targets and (timer > AGGR_TIME or not inst.inviswatch_active)  then
			inst.task_drop_targets:Cancel()
			inst.task_drop_targets = nil
		end
	end)
end

local function GoVisible(inst)
	--print("GoVisible ", inst.inviswatch_active)
	if not inst.inviswatch_active then 
		return 
	end
	
	inst.inviswatch_active = false
	inst.m_compatibility.UpdateAnim(inst,true)
	inst.net_inviswatch_active:set(false)
	inst:RemoveTag("notarget")
    inst:AddTag("scarytoprey")

end

local function AmuletActiveTick(inst)
local hand = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	if hand then
        if hand:HasTag("inviswatch") then
            if inst.inviswatch_active then
        inst:DoTaskInTime(9,function() 
		GoVisible(inst)
		if inst.task_drop_targets then
			inst.task_drop_targets:Cancel()
			inst.task_drop_targets = nil
		end
    end)
end
end
end

	if inst and inst.components.sanity then
		if inst.inviswatch_active then
			if inst.components.sanity.current <= 0 then
				GoVisible(inst)
			end
		else
			if inst.components.sanity.current > 0 and GetTime() - inst.lastrevealed > 3.0 then
				GoInvisible(inst)
			end
		end
	end
end

local function OnAttackOther(inst, data)
	inst.lastrevealed = GetTime()

    if inst.inviswatch_active then
		GoVisible(inst)
    end
end

local function OnEquip(inst, owner)
	if owner ~= nil then
		owner.inviswatch_active = false
		if owner.lastrevealed == nil then
			owner.lastrevealed = 0
		end
	
		if inst.components.equippable and inst.components.equippable.dapperness then --RoG
			if owner.prefab == "spy" then
				inst.components.equippable.dapperness = TUNING.CRAZINESS_MED * 2 --was 3.20 which was around -40/min now it's -25/min 
			else
				-- Anyone that is not Spy will go insane quickly if they equip the watch.
				inst.components.equippable.dapperness = TUNING.CRAZINESS_MED * 4 --was 35.8 which was an overbearing -450/min now it's -50/min
			end
		elseif inst.components.dapperness then --non-RoG
			if owner.prefab == "spy" then
				inst.components.dapperness.dapperness = TUNING.CRAZINESS_MED * 2 
			else
				-- Anyone that is not Spy will go insane quickly if they equip the watch
				inst.components.dapperness.dapperness = TUNING.CRAZINESS_MED * 4
			end
		end
		
--		owner.AnimState:OverrideSymbol("swap_object", "swap_inviswatch", "inviswatch") Isn't seen, not needed
		owner:ListenForEvent("onattackother", OnAttackOther)
		
		if inst.task ~= nil then
			inst.task:Cancel()
		end
		inst.task = inst:DoPeriodicTask(0.1+math.random()*0.1, function() AmuletActiveTick(owner) end)
	end
end

local function OnUnequip(inst, owner)
	if inst.task ~= nil then
		inst.task:Cancel()
		inst.task = nil
	end
	
	if owner ~= nil then
        owner.AnimState:ClearOverrideSymbol("swap_object")	
		owner:RemoveEventCallback("onattackother", OnAttackOther)
	
		GoVisible(owner)
	end
end

local function inviswatch()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("inviswatch")
    inst.AnimState:SetBuild("inviswatch")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("inviswatch")
	
	inst:ListenForEvent("equip", OnEquip)
	inst:ListenForEvent("unequip", OnUnequip)
	
    if not TheWorld.ismastersim then
        return inst
    end
	
    inst.entity:SetPristine()
    inst:AddComponent("inspectable")
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)

	if inst.components.equippable.dapperness then
		inst.components.equippable.dapperness = TUNING.CRAZINESS_MED
	else
		inst:AddComponent("dapperness")
		inst.components.dapperness.dapperness = TUNING.CRAZINESS_MED
	end
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/inviswatch.xml"
	
    return inst
end

return Prefab("common/inventory/inviswatch", inviswatch, assets)