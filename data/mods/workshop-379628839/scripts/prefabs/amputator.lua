local assets =
{
	Asset("ANIM", "anim/amputator.zip"),
	Asset("ANIM", "anim/swap_amputator.zip"),

	Asset("ATLAS", "images/inventoryimages/amputator.xml"),
    Asset("IMAGE", "images/inventoryimages/amputator.tex"),
}

local function HearAmputator(inst, musician, instrument)
    if inst ~= musician then
	if inst.components.health then
	  if
        (inst:HasTag("player") or (inst:HasTag("companion")) or (inst:HasTag("pig")) and not inst:HasTag("hostile")) then
		local currenthp = musician.components.health.currenthealth * 0.4
            inst.components.health:DoDelta(TUNING.AMPUTATOR_HEALTH + currenthp)
			inst.SoundEmitter:PlaySound("dontstarve/wilson/use_gemstaff") 
				local ampufx = SpawnPrefab("tf2shockfx")
	        ampufx.Transform:SetScale(.80, 0.5, .80)
	        ampufx.entity:AddFollower()
	        ampufx.Follower:FollowSymbol(inst.GUID, "swap_body", 0, 0, 0)
	  end
	end
			elseif musician:HasTag("player") then
			musician.components.health:DoDelta(TUNING.AMPUTATOR_HEALTH)
			local ampufx = SpawnPrefab("tf2shockfx")
	        ampufx.Transform:SetScale(.90, 0.5, .90)
	        ampufx.entity:AddFollower()
	        ampufx.Follower:FollowSymbol(musician.GUID, "swap_body", 0, 0, 0)
	end
end

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_amputator", "amputator")
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
	
	inst:AddTag("horn")
	inst:AddTag("amputator")

    inst.AnimState:SetBank("amputator")
    inst.AnimState:SetBuild("amputator")
    inst.AnimState:PlayAnimation("idle")
	inst.entity:AddSoundEmitter()

	inst:AddTag("sharp")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.AMPUTATOR_DAMAGE)
	
	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.AMPUTATOR_USES)
    inst.components.finiteuses:SetUses(TUNING.AMPUTATOR_USES)
    inst.components.finiteuses:SetOnFinished(inst.Remove)
	inst.components.finiteuses:SetConsumption(ACTIONS.PLAY, 10)
	
    inst.entity:SetPristine()
    inst:AddComponent("inspectable")
	inst:AddComponent("instrument")
    inst.components.instrument.range = TUNING.PANFLUTE_SLEEPRANGE
    inst.components.instrument:SetOnHeardFn(HearAmputator)
    inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.PLAY)

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "amputator"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/amputator.xml"
	
	MakeHauntableLaunch(inst)
    AddHauntableCustomReaction(inst, function(inst, haunter)
        if math.random() <= TUNING.HAUNT_CHANCE_HALF then
            if inst.components.finiteuses then
                inst.components.finiteuses:Use(5)
                inst.components.hauntable.hauntvalue = TUNING.HAUNT_MEDIUM
                return true
            end
        end
        return false
    end, true, false, true)

    return inst
end

local function tf2shockfxfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst:AddTag("NOCLICK")
    inst:AddTag("FX")

    inst.AnimState:SetBank("goosemoose_nest_fx")
    inst.AnimState:SetBuild("goosemoose_nest_fx")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetMultColour( 255/255,50/255,50/255,1.5 )

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    inst:ListenForEvent("animover", inst.Remove)

    return inst
end

return Prefab("common/inventory/amputator", fn, assets),
       Prefab("tf2shockfx", tf2shockfxfn, assets)