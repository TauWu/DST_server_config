require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/dispenser.zip"),
    Asset("ANIM", "anim/dispenser_meter.zip"),

    Asset("ANIM", "anim/esentry_item.zip"),
}

local prefabs =
{
    "collapse_small",
    "ehealfx",
    "scrap",
}

local fuel =
{
    twigs = 1,
    cutgrass = 1,
    log = 1,
    charcoal = .5,
}
local mineral =
{
    flint = 1,
    rocks = 1,
    nitre = .3,
    marble = .1,
}
local night =
{
    lightbulb = .2,
    wormlight = .1,
    nightmarefuel = .1,
}
local rare =
{
    goldnugget = 1,
    gunpowder = .5,
    gears = .3,
    livinglog = .1,
}

local function onbuilt(inst, builder)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle", true)
    inst.SoundEmitter:PlaySound("dontstarve/common/lightning_rod_craft")
    inst:DoTaskInTime(inst.AnimState:GetCurrentAnimationLength() / 3, function()
	inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
    end)
end

local function upgrade(inst)
    if inst.upgradelevel == 30 or inst.upgradelevel == 70 then
	inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup", "sound")
        inst:DoTaskInTime(.75, function()
	    inst.SoundEmitter:KillSound("sound")
        end)
    end
    if inst.upgradelevel >= 30 and inst.upgradelevel < 70 then
	inst:AddTag("lvl2")
	inst:RemoveTag("lvl1")
	inst.components.named:SetName("Dispenser lvl 2")
	inst.AnimState:PlayAnimation("upgrade2")
	inst.AnimState:PushAnimation("idle_2", true)
    end
    if inst.upgradelevel >= 70 then
	inst:AddTag("lvl3")
	inst:RemoveTag("lvl1")
	inst:RemoveTag("lvl2")
	inst.components.named:SetName("Dispenser lvl 3")
	inst.AnimState:PlayAnimation("upgrade3")
	inst.AnimState:PushAnimation("idle_3", true)
	inst.components.sanityaura.aura = TUNING.SANITYAURA_TINY
    end
end

local function setmeterlevl(inst)
    if inst.components.fueled.currentfuel == 0 then
	inst.AnimState:OverrideSymbol("placer", "dispenser_meter", 0)
    end
    if inst.components.fueled.currentfuel == 1 then
	inst.AnimState:OverrideSymbol("placer", "dispenser_meter", 25)
    end
    if inst.components.fueled.currentfuel == 2 then
	inst.AnimState:OverrideSymbol("placer", "dispenser_meter", 50)
    end
    if inst.components.fueled.currentfuel == 3 then
	inst.AnimState:OverrideSymbol("placer", "dispenser_meter", 75)
    end
    if inst.components.fueled.currentfuel == 4 then
	inst.AnimState:OverrideSymbol("placer", "dispenser_meter", 100)
    end
end

local function IsScrap(item)
    return item.prefab == "scrap"
end

local function workup(inst, worker)
    local scrapstack = worker.components.inventory:FindItem(IsScrap)
    if scrapstack ~= nil then
	worker.components.inventory:ConsumeByName("scrap", 1)
	inst.upgradelevel = inst.upgradelevel + 1
	if inst.upgradelevel == 30 or inst.upgradelevel == 70 then
	    upgrade(inst)
	end
    end
end

local function onhammered(inst)
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
    inst.healfx:Remove()
end

local function onhit(inst, worker)
    setmeterlevl(inst)
    if inst:HasTag("lvl1") then
	inst.AnimState:PlayAnimation("hit")
    end
    if inst:HasTag("lvl2") then
	inst.AnimState:PlayAnimation("hit_2")
    end
    if inst:HasTag("lvl3") then
	inst.AnimState:PlayAnimation("hit_3")
    end
    if worker.replica.inventory ~= nil and worker.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) ~= nil and worker.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).prefab == "tf2wrench" then
	worker.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.finiteuses:Use(1)
	inst.components.workable:SetWorkLeft(4)
	local scrapstack = worker.components.inventory:FindItem(IsScrap)
	if scrapstack ~= nil and inst.components.fueled.currentfuel ~= inst.components.fueled.maxfuel then
	    worker.components.inventory:ConsumeByName("scrap", 1)
	    if inst.components.fueled.currentfuel < inst.components.fueled.maxfuel then
		inst.SoundEmitter:PlaySound("dontstarve/common/birdcage_craft")
		inst.components.fueled.currentfuel = inst.components.fueled.currentfuel + 1
		setmeterlevl(inst)
		return
	    end
	end
	if not inst:HasTag("lvl3") then
	    inst.tick = 0
            while inst.tick ~= 5 and not inst:HasTag("lvl3") do
               workup(inst, worker)
	       inst.tick = inst.tick + 1
            end
	end
    end
end

local function dispenseitem(inst, phase, cavephase)
    local item = nil
    if inst.components.fueled.currentfuel ~= 0 then
        inst:DoTaskInTime(5, function()
	    if inst:HasTag("lvl1") then
	        if TheWorld.state.isday then
		    inst.components.lootdropper:SpawnLootPrefab("scrap")
		    inst.components.lootdropper:SpawnLootPrefab("scrap")
		    item = weighted_random_choice(fuel)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    item = weighted_random_choice(mineral)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    if math.random() < .33 then
			inst.components.lootdropper:SpawnLootPrefab("scrap")
		    end
		    inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")
		    inst.components.fueled.currentfuel = inst.components.fueled.currentfuel - 1
		    inst.AnimState:PlayAnimation("hit")
		    setmeterlevl(inst)
    	        end
	    end
	    if inst:HasTag("lvl2") then
	        if TheWorld.state.isday then
		    inst.components.lootdropper:SpawnLootPrefab("scrap")
		    inst.components.lootdropper:SpawnLootPrefab("scrap")
		    item = weighted_random_choice(fuel)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    item = weighted_random_choice(mineral)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    if math.random() < .33 then
			inst.components.lootdropper:SpawnLootPrefab("scrap")
			inst.components.lootdropper:SpawnLootPrefab("scrap")
		    end
		    inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")
		    inst.components.fueled.currentfuel = inst.components.fueled.currentfuel - 1
		    inst.AnimState:PlayAnimation("hit_2")
		    setmeterlevl(inst)
    	        end
	        if TheWorld.state.isdusk then
		    inst.components.lootdropper:SpawnLootPrefab("scrap")
		    inst.components.lootdropper:SpawnLootPrefab("scrap")
		    item = weighted_random_choice(fuel)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    item = weighted_random_choice(mineral)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    if math.random() < .33 then
			inst.components.lootdropper:SpawnLootPrefab("scrap")
			inst.components.lootdropper:SpawnLootPrefab("scrap")
		    end
		    inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")
	            inst.components.fueled.currentfuel = inst.components.fueled.currentfuel - 1
		    inst.AnimState:PlayAnimation("hit_2")
		    setmeterlevl(inst)
    	        end
	    end
	    if inst:HasTag("lvl3") then
	        if TheWorld.state.isday then
		    inst.components.lootdropper:SpawnLootPrefab("scrap")
		    inst.components.lootdropper:SpawnLootPrefab("scrap")
		    item = weighted_random_choice(fuel)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    item = weighted_random_choice(mineral)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    if math.random() < .33 then
		        item = weighted_random_choice(rare)
			inst.components.lootdropper:SpawnLootPrefab(item)
		    end
		    inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")
		    inst.components.fueled.currentfuel = inst.components.fueled.currentfuel - 1
		    inst.AnimState:PlayAnimation("hit_3")
		    setmeterlevl(inst)
    	        end
	        if TheWorld.state.isdusk then
		    inst.components.lootdropper:SpawnLootPrefab("scrap")
		    inst.components.lootdropper:SpawnLootPrefab("scrap")
		    item = weighted_random_choice(fuel)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    item = weighted_random_choice(mineral)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    if math.random() < .33 then
		        item = weighted_random_choice(rare)
			inst.components.lootdropper:SpawnLootPrefab(item)
		    end
		    inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")
		    inst.components.fueled.currentfuel = inst.components.fueled.currentfuel - 1
		    inst.AnimState:PlayAnimation("hit_3")
		    setmeterlevl(inst)
    	        end
	        if TheWorld.state.isnight then
		    inst.components.lootdropper:SpawnLootPrefab("scrap")
		    inst.components.lootdropper:SpawnLootPrefab("scrap")
		    item = weighted_random_choice(fuel)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    item = weighted_random_choice(mineral)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    inst.components.lootdropper:SpawnLootPrefab(item)
		    if math.random() < .33 then
			item = weighted_random_choice(night)
			inst.components.lootdropper:SpawnLootPrefab(item)
			inst.components.lootdropper:SpawnLootPrefab(item)
		        item = weighted_random_choice(rare)
			inst.components.lootdropper:SpawnLootPrefab(item)
		    end
		    inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")
		    inst.components.fueled.currentfuel = inst.components.fueled.currentfuel - 1
		    inst.AnimState:PlayAnimation("hit_3")
		    setmeterlevl(inst)
	        end
	    end
        end)
    end
end

local function onsave(inst, data)
    data.upgradelevel = inst.upgradelevel
end

local function onload(inst, data)
    inst.upgradelevel = data.upgradelevel 
    upgrade(inst)
    setmeterlevl(inst)
end

local function oninit(inst)
    local x,y,z = inst.Transform:GetWorldPosition()
    inst.healfx = SpawnPrefab("ehealfx")
    inst.healfx.Transform:SetPosition(x,1,z)
    inst.healfx:Hide()
end

local function fn(inst, self, range)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    MakeObstaclePhysics(inst, .5)

    inst.no_wet_prefix = true

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst.MiniMapEntity:SetIcon("dispenser.tex")

    inst:AddTag("structure")
    inst:AddTag("eyeturret")
    inst:AddTag("dispenser")
    inst:AddTag("lvl1")
    inst:AddTag("ebuild")

    inst.AnimState:SetBank("dispenser")
    inst.AnimState:SetBuild("dispenser")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:OverrideSymbol("placer", "dispenser_meter", 100)

    inst:AddComponent("inspectable")

    inst:AddComponent("lootdropper")

    inst:AddComponent("named")

    inst:AddComponent("engieworkable")
    inst.components.engieworkable:SetWorkAction(ACTIONS.ENGIEWORKABLE)

    inst:AddComponent("moisture")
    inst.components.moisture:SetInherentWaterproofness(1)
	
    inst.Light:Enable(false)
    inst.Light:SetRadius(.6)
    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(235/255,62/255,12/255)
	
    inst:AddComponent("sanityaura")
--  inst.components.sanityaura.aura = TUNING.SANITYAURA_TINY
	
    inst:AddComponent("fueled")
    inst.components.fueled.fueltype = FUELTYPE.PIGTORCH
    inst.components.fueled:InitializeFuelLevel(4)
    inst.components.fueled.accepting = false

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetMaxWork(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)       

    inst.upgradelevel = 0

    inst.OnSave = onsave
    inst.OnLoad = onload
    inst.OnBuiltFn = onbuilt

    inst:DoTaskInTime(0, oninit)

    inst:DoPeriodicTask(1, function()
	inst.healfx:Hide() 
	inst.Light:Enable(false)
	FindEntity(inst, TUNING.DISP_RANGE, function(guy)
	    if (guy and guy:HasTag("player")) or (guy and guy.components.follower and guy.components.follower.leader ~= nil and guy.components.follower.leader:HasTag("player")) then
		if guy.components.health and guy.components.health.currenthealth ~= guy.components.health.maxhealth then
		    inst.healfx:Show()
			inst.Light:Enable(true)
		    if inst:HasTag("lvl1") then
			guy.components.health:DoDelta(1 / TUNING.DISP_HEALING, true, nil, true)
		    end
		    if inst:HasTag("lvl2") then
			guy.components.health:DoDelta(2 / TUNING.DISP_HEALING, true, nil, true)
		    end
		    if inst:HasTag("lvl3") then
			guy.components.health:DoDelta(3 / TUNING.DISP_HEALING, true, nil, true)
		    end
		end
	    end
	end)
    end)

    if TheWorld:HasTag("cave") then
	inst:WatchWorldState("cavephase", dispenseitem)
    end
    if not TheWorld:HasTag("cave") then
	inst:WatchWorldState("phase", dispenseitem)
    end

    MakeHauntableFreeze(inst) 

    return inst
end

local function healfxfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddPhysics()
    inst.entity:AddNetwork()

    inst:AddTag("NOBLOCK")
    inst:AddTag("NOCLICK")
    inst:AddTag("FX")

    inst.AnimState:SetBank("fireflies")
    inst.AnimState:SetBuild("fireflies")
    inst.AnimState:PlayAnimation("swarm_loop", true)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    inst.persists = false
    inst.AnimState:SetMultColour( 200/255, 50/255, 50/255, 1 )

    return inst
end

return Prefab("common/dispenser", fn, assets, prefabs),
	Prefab("ehealfx", healfxfn, assets),
	MakePlacer("common/dispenser_placer", "esentry_item", "esentry_item", "idle")