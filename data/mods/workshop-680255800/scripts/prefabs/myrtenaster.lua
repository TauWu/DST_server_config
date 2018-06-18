local assets =
{
    Asset("ANIM", "anim/myrtenaster.zip"),
    Asset("ANIM", "anim/swap_myrtenaster.zip"),
    Asset("ATLAS", "images/inventoryimages/myrtenaster.xml"),
    Asset("IMAGE", "images/inventoryimages/myrtenaster.tex"),
	Asset("ANIM", "anim/ui_r503_1x1.zip"), 
	
	-- Tornado
	Asset("ANIM", "anim/tornado.zip"),
    Asset("ANIM", "anim/tornado_stick.zip"),
    Asset("ANIM", "anim/swap_tornado_stick.zip"),
}

local prefabs = 
{
}

local function OnEquip(inst, owner)
	if owner:HasTag("weiss_buff") then
    owner.AnimState:OverrideSymbol("swap_object", "swap_myrtenaster", "swap_myrtenaster")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
	inst.components.container:Open(owner)
	else
            inst:DoTaskInTime(0, function()
                if owner and owner.components and owner.components.inventory then
                    owner.components.inventory:GiveItem(inst)
                    if owner.components.talker then
                        owner.components.talker:Say("I don't want to make Icequeen mad.")
                end
            end
        end)
	end
end
  
local function OnUnequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
	inst.components.container:Close(owner)
end


 
 local function itemtest(inst, item, slot)
	return item.prefab == "cred"
end


local function onattack_cred(inst, owner, target, attacker)
	inst.components.container:Open(owner)	
	if inst.components.container:Has("cred",1) then
		if target ~= nil and target.components.burnable and not target.components.burnable:IsBurning() then
			target.components.burnable:Ignite(nil, attacker)
			inst.components.weapon:SetDamage(30)
			inst.components.container:ConsumeByName("cred", 1)
			else if target.components.burnable:IsBurning() then
					inst.components.weapon:SetDamage(45)	
				end
		end
	else
		if inst.components.container:Has("cice",1) then
			if target.components.freezable ~= nil then --and not target.sg:HasStateTag("frozen") then
				inst.components.weapon:SetDamage(30)
				target.components.freezable:AddColdness(2)
				target.components.freezable:SpawnShatterFX()
				inst.components.container:ConsumeByName("cice", 1)
				else if target.sg:HasStateTag("frozen") or target.sg:HasStateTag("thaw")then
						inst.components.weapon:SetDamage(60)				
				end
			end
		end
	end
end		

local myrslot =
{
    widget =
    {
        slotpos = {	Vector3(0,64+32+8+4,0), 
					--Vector3(0,32+4,0),
					--Vector3(0,-(32+4),0), 
					--Vector3(0,-(64+32+8+4),0)
					},
        animbank = "ui_cookpot_1x4",
        animbuild = "ui_cookpot_1x4",
        pos = Vector3(300,-380,0)
    },
    type = "chest",
}
 
local containers = require("containers")
local widgetsetup_old = containers.widgetsetup
function containers.widgetsetup(container, prefab, data, ...)

 if container.inst.prefab == "myrtenaster" or prefab == "myrtenaster" then
  
      for k, v in pairs(myrslot) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        return
  
  end
      return widgetsetup_old(container, prefab, data, ...)
end

-- Tornado (OLD)

-- local function getspawnlocation(inst, target)
    -- local tarPos = target:GetPosition()
    -- local pos = inst:GetPosition()
    -- local vec = tarPos - pos
    -- vec = vec:Normalize()
    -- local dist = pos:Dist(tarPos)
    -- return pos + (vec * (dist * .15))
-- end

-- local function spawntornado(staff, target, pos)
    -- local tornado = SpawnPrefab("tornado")
    -- tornado.WINDSTAFF_CASTER = staff.components.inventoryitem.owner
    -- local spawnPos = staff:GetPosition() + TheCamera:GetDownVec()
    -- local totalRadius = target.Physics and target.Physics:GetRadius() or 0.5 + tornado.Physics:GetRadius() + 0.5
    -- local targetPos = target:GetPosition() + (TheCamera:GetDownVec() * totalRadius)
    -- tornado.Transform:SetPosition(getspawnlocation(staff, target):Get())
    -- tornado.components.knownlocations:RememberLocation("target", targetPos)
	-- staff.components.container:ConsumeByName("cwind", 1)
	-- staff.components.inventoryitem.owner.components.sanity:DoDelta(-5)
-- end

-- Tornado

local function getspawnlocation(inst, target)
    local x1, y1, z1 = inst.Transform:GetWorldPosition()
    local x2, y2, z2 = target.Transform:GetWorldPosition()
    return x1 + .15 * (x2 - x1), 0, z1 + .15 * (z2 - z1)
end

local function spawntornado(staff, target, pos)
    local tornado = SpawnPrefab("tornado")
    tornado.WINDSTAFF_CASTER = staff.components.inventoryitem.owner
    tornado.WINDSTAFF_CASTER_ISPLAYER = tornado.WINDSTAFF_CASTER ~= nil and tornado.WINDSTAFF_CASTER:HasTag("player")
    tornado.Transform:SetPosition(getspawnlocation(staff, target))
    tornado.components.knownlocations:RememberLocation("target", target:GetPosition())
	staff.components.container:ConsumeByName("cwind", 1)
	staff.components.inventoryitem.owner.components.sanity:DoDelta(-5)
	
    if tornado.WINDSTAFF_CASTER_ISPLAYER then
        tornado.overridepkname = tornado.WINDSTAFF_CASTER:GetDisplayName()
        tornado.overridepkpet = true
    end
end

local function fn()
  
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
     
    MakeInventoryPhysics(inst)   
      
    inst.AnimState:SetBank("myrtenaster")
    inst.AnimState:SetBuild("myrtenaster")
    inst.AnimState:PlayAnimation("idle")
	
    inst.MiniMapEntity:SetIcon("myrtenaster.tex")
 
    inst:AddTag("sharp")
	inst:AddTag("quickcast")
	inst.spelltype = "SCIENCE"
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(30)
	inst.components.weapon:SetOnAttack(onattack_cred)
	
    inst:AddComponent("inspectable")
	
	inst:AddComponent("finiteuses")
	inst.components.finiteuses:SetMaxUses(300)
	inst.components.finiteuses:SetUses(300)
	inst.components.finiteuses:SetOnFinished(inst.Remove)
	
	inst:AddComponent("container")
	inst.components.container:WidgetSetup("weiss", myrslot)
      
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "myrtenaster"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/myrtenaster.xml"
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	-- Fire
	inst:ListenForEvent("itemget", function(inst, data)
			if data.item.prefab == "cred" then 
				inst:AddComponent("fireattack")
			end
	end)
	
	inst:ListenForEvent("itemlose", function(inst, data)
			if not inst.components.container:Has("cred",1) then
				inst:RemoveComponent("fireattack")
			end
	end)
	
	-- Ice
	inst:ListenForEvent("itemget", function(inst, data)
			if data.item.prefab == "cice" then
				inst:AddComponent("iceattack")
			end
	end)
	
	inst:ListenForEvent("itemlose", function(inst, data)
			if not inst.components.container:Has("cice",1) then
				inst:RemoveComponent("iceattack")
			end
	end)
	
	-- Tornado
	inst:ListenForEvent("itemget", function(inst, data, owner)
			if data.item.prefab == "cwind" then
				inst:AddComponent("spellcaster")
				inst.components.spellcaster.canuseontargets = true
				inst.components.spellcaster.canusefrominventory = false
				inst.components.spellcaster:SetSpellFn(spawntornado)
				inst.components.spellcaster.castingstate = "castspell_tornado"
				inst.components.spellcaster.canonlyuseonworkable = true
				inst.components.spellcaster.canonlyuseoncombat = true
				inst.components.spellcaster.quickcast = true
				inst.components.spellcaster.actiontype = "SCIENCE"
			end
	end)
	
	inst:ListenForEvent("itemlose", function(inst, data, owner)
			if not inst.components.container:Has("cwind",1) then
				inst:RemoveComponent("spellcaster")
			end
	end)
	
    return inst
end

local brain = require("brains/tornadobrain")

local function ontornadolifetime(inst)
    inst.sg:GoToState("despawn")
end	

local function tornado_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("tornado")
    inst.AnimState:SetBuild("tornado")
    inst.AnimState:PlayAnimation("tornado_pre")
    inst.AnimState:PushAnimation("tornado_loop")

    inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/tornado", "spinLoop")

    MakeInventoryPhysics(inst)
    RemovePhysicsColliders(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:DoTaskInTime(TUNING.TORNADO_LIFETIME, ontornadolifetime)

    inst:AddComponent("knownlocations")

    inst:AddComponent("locomotor")
    inst.components.locomotor.walkspeed = TUNING.TORNADO_WALK_SPEED * 0.33
    inst.components.locomotor.runspeed = TUNING.TORNADO_WALK_SPEED

    inst:SetStateGraph("SGtornado")
    inst:SetBrain(brain)

    inst.WINDSTAFF_CASTER = nil

    return inst
end

return  Prefab("common/inventory/myrtenaster", fn, assets),
	Prefab("tornado", tornado_fn, assets)