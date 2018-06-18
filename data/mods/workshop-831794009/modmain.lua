_G = GLOBAL
local ACTIONS = _G.ACTIONS
local ActionHandler = _G.ActionHandler
local BufferedAction = _G.BufferedAction
local RPC = _G.RPC
local SendRPCToServer = _G.SendRPCToServer
local CONTROL_PRIMARY = _G.CONTROL_PRIMARY
local Sleep = _G.Sleep
local IsServer = _G.TheNet:GetIsServer()

local function whereItemAt(inst, item, slot)
	local itemInslot = inst.replica.inventory:GetItemInSlot(slot)
	if item == itemInslot then
		return inst.replica.inventory
	else
		if inst.replica.inventory:GetOverflowContainer() then
			itemInslot = inst.replica.inventory:GetOverflowContainer():GetItemInSlot(slot)
			if item == itemInslot then
				return inst.replica.inventory:GetOverflowContainer()
			end
		end
	end
	return nil
end
				
local function resetTrap(inst)
	inst.trapPos = nil
	if inst.newThread then
		inst.newThread:SetList(nil)
		inst.newThread = nil
	end	
end

local function notTrap(prefab)
	return prefab ~= "trap" and prefab ~= "birdtrap"
end

local function dropActiveTrap(inst, data)
	if data then
		if notTrap(data.item.prefab) then
			if not inst.replica.inventory:IsFull() then return end
			local item = inst.replica.inventory.classified._active:value()						
			if not item or notTrap(item.prefab) then
				return
			end
		end
					
		if inst.newThread then return end			
			
		inst.newThread = inst:StartThread(function()	
			Sleep(0.05)
			local activeItem = inst.replica.inventory.classified._active:value()
			if activeItem and notTrap(activeItem.prefab) then
				resetTrap(inst)
				return
			end
			local inv = whereItemAt(inst, data.item, data.slot)
			if not inv then		
				resetTrap(inst)
				return
			end
			inv:TakeActiveItemFromAllOfSlot(data.slot)
			activeItem = inst.replica.inventory.classified._active:value()				
				
			local position = nil
			if data.src_pos then 
				position = data.src_pos 
			else
				if inst.trapPos then 
					position = inst.trapPos
				end
			end				
									
			if position then
				local pc = inst.components.playercontroller
				local bufaction = BufferedAction(inst, nil , ACTIONS.DROP, activeItem, position)
				if pc.ismastersim then
					inst.components.combat:SetTarget(nil)
					pc:DoAction(bufaction) 
				else
					local controlmods = pc:EncodeControlMods()
					if pc.locomotor == nil then
						pc.remote_controls[CONTROL_PRIMARY] = 0
						SendRPCToServer(RPC.LeftClick, bufaction.action.code, position.x, position.z, nil, nil, nil, controlmods, bufaction.action.canforce) 
					elseif bufaction.action ~= ACTIONS.WALKTO and pc:CanLocomote() then
						bufaction.preview_cb = function()
							pc.remote_controls[CONTROL_PRIMARY] = 0
							local isreleased = false
							SendRPCToServer(RPC.LeftClick, bufaction.action.code, position.x, position.z, nil, nil, isreleased, controlmods, nil) 
						end
					end
					pc:DoAction(bufaction)					
				end					
			end
			resetTrap(inst)			
		end)
	end
	inst:RemoveEventCallback("gotnewitem", dropActiveTrap)
end

local state = "wilson_client"
if IsServer then
	state = "wilson"
end	

AddStategraphPostInit(state, function(sg)
	sg.actionhandlers[ACTIONS.CHECKTRAP] = ActionHandler(ACTIONS.CHECKTRAP, function(inst, action)					
		if action.target and action.target.AnimState ~= nil and (action.target.AnimState:IsCurrentAnimation("trap_loop") or
															action.target.AnimState:IsCurrentAnimation("side")) then
			inst.trapPos = action.target:GetPosition()
			inst:ListenForEvent("gotnewitem", dropActiveTrap)
		end
		return "doshortaction"
	end)
end)