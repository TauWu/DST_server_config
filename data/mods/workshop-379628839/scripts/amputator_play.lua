AddStategraphPostInit("wilson", function(sg)
local state = sg.states["play_horn"]
local smallhorn_onenter = state.onenter
	state.onenter = function(inst)
		local bufaction = inst:GetBufferedAction()
		local is_amputator_play =
			bufaction
			and bufaction.action == GLOBAL.ACTIONS.PLAY
			and bufaction.invobject
			and bufaction.invobject:HasTag("amputator")
	if is_amputator_play then
	inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("staff_pre")
            inst.AnimState:PushAnimation("staff", false)
			inst.SoundEmitter:PlaySound("dontstarve/wilson/use_gemstaff") 
	            inst.AnimState:Hide("ARM_normal") 
	            inst.AnimState:Show("ARM_carry")
if inst.components.inventory.activeitem and inst.components.inventory.activeitem.components.instrument then
inst.components.inventory:ReturnActiveItem()
       end
	else
	smallhorn_onenter(inst)
	end
	end
	end)
