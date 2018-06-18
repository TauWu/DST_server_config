local MakePlayerCharacter = require "prefabs/player_common"
local reaper = require "workshop-380122571.reaper"
local appearance = reaper.GetModConfigData("appearance")
local lightAura = reaper.GetModConfigData("lightAura")
local HPamount = reaper.GetModConfigData("HPamount")
local sanityAmount = reaper.GetModConfigData("sanityAmount")
local Insomniac = reaper.GetModConfigData("Insomniac")
local MonsterMeat = reaper.GetModConfigData("MonsterMeat")
local SpeedBoost = reaper.GetModConfigData("SpeedBoost")

local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
        Asset( "ANIM", "anim/beard.zip" ),

		-- character's custom assets
        Asset( "ANIM", "anim/reaper.zip" ),
        Asset( "ANIM", "anim/reaperold.zip" ),
		Asset( "ANIM", "anim/ghost_reaper_build.zip" ),
		Asset( "SOUND", "sound/reaper.fsb"),
}

local prefabs = 

{
        "scythe",
		
}

local start_inv =
{
		"scythe",
		"reviver",
}

local common_postinit = function(inst)

	inst.soundsname = "reaper"
	inst.MiniMapEntity:SetIcon( "reaper.tex" )
	inst:AddTag("reaper")
	
end
	
local function lighton(inst, data) --light aura
if lightAura == "yes" and TheWorld.state.isnight  then
	local light = inst.entity:AddLight()
	inst.Light:Enable(true)
	inst.Light:SetRadius(0.5)
	inst.Light:SetFalloff(.4)
	inst.Light:SetIntensity(.5)
	inst.Light:SetColour(197/255, 197/255, 50/255)
	
elseif lightAura == "yes" and TheWorld.state.isday then
	local light = inst.entity:AddLight()
	inst.Light:SetRadius(0)
	light:Enable(false)
	
elseif lightAura == "yes" and  TheWorld.state.isdusk then
	local light = inst.entity:AddLight()
	inst.Light:SetRadius(0)
	light:Enable(false)
	
elseif lightAura == "no" and TheWorld.state.isnight then
	local light = inst.entity:AddLight()
	inst.Light:SetRadius(0)
	light:Enable(false)
	
elseif lightAura == "no" and TheWorld.state.isday then
	local light = inst.entity:AddLight()
	inst.Light:SetRadius(0)
	light:Enable(false)
	
elseif lightAura == "no" and TheWorld.state.isdusk then
	local light = inst.entity:AddLight()
	inst.Light:SetRadius(0)
	light:Enable(false)
	end
end

	-------
	
	local function IsValidVictim(victim)
    return victim ~= nil
        and not (victim:HasTag("prey") or
                victim:HasTag("veggie") or
                victim:HasTag("structure") or
                victim:HasTag("companion"))
        and victim.components.health ~= nil
        and victim.components.combat ~= nil
end
	-------
	local function onattack(inst, data) --get health and sanity when killing enemies
   local victim = data.target
    if not inst.components.health:IsDead() and IsValidVictim(victim) and not victim:HasTag("epic") then  --and victim.components.health:GetPercent() <= .20
		local healthdelta = 2 --(victim.components.combat.defaultdamage * .12)
        local sanitydelta = 3--(victim.components.combat.defaultdamage * .16)
        inst.components.health:DoDelta(healthdelta)
        inst.components.sanity:DoDelta(sanitydelta)
	elseif not inst.components.health:IsDead() and IsValidVictim(victim) and victim:HasTag("epic") then	
		local healthdelta = 3--(victim.components.combat.defaultdamage * .06)
        local sanitydelta = 4--(victim.components.combat.defaultdamage * .1)
        inst.components.health:DoDelta(healthdelta)
        inst.components.sanity:DoDelta(sanitydelta)
	end
end 


	-------
local function onnewstats(inst, data)
	if TheWorld.state.isday then
	inst.components.combat.damagemultiplier = 1.12
	elseif TheWorld.state.isdusk then
	inst.components.combat.damagemultiplier = 1.46
	elseif TheWorld.state.isnight then
	inst.components.combat.damagemultiplier = 1.8
end
end
	-------

local function onsetskin(inst)
 if appearance == "new" then
inst.AnimState:SetBuild("reaper")
elseif appearance == "old" then
inst.AnimState:SetBuild("reaperold")
end
end
	-------
	
local function master_postinit(inst)
	
	if HPamount == "130" then
		inst.components.health:SetMaxHealth(130)
	elseif HPamount == "115" then
		inst.components.health:SetMaxHealth(115)
	elseif HPamount == "95" then
		inst.components.health:SetMaxHealth(95)
	end
	
	inst.components.hunger:SetMax(225)
	
	if sanityAmount == "90" then
		inst.components.sanity:SetMax(90)
	elseif sanityAmount == "120" then
		inst.components.sanity:SetMax(120)
	elseif sanityAmount == "150" then
		inst.components.sanity:SetMax(150)
	elseif sanityAmount == "200" then
		inst.components.sanity:SetMax(200)
	end
	
	-----
	if SpeedBoost == "normal" then
		inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED)
		inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED)
	elseif SpeedBoost == "1.3" then
		inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.25)
		inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.3)
	end
	
	if MonsterMeat == "yes" then
	inst.components.eater.strongstomach = true
	elseif MonsterMeat == "no" then 
	inst.components.eater.strongstomach = false
	end 
	
	inst.components.combat.defaultdamage = 40
	inst.components.sanity.night_drain_mult = 0
--- inst.components.temperature.mintemp = 1 -- stop freezing
	inst.components.health.fire_damage_scale = 1.8
---	inst.components.temperature.hurtrate = 120 / TUNING.FREEZING_KILL_TIME * 0.3 --
	inst.components.temperature.inherentinsulation = TUNING.INSULATION_MED -- slower freezing
	inst.components.hunger.burnrate = 0.55
	inst.components.temperature.overheattemp = 66.5
	
	if Insomniac == "yes" then
	inst:AddTag("insomniac")
	elseif Insomniac == "no" then
	inst:RemoveTag("insomniac")
	end
	-----

	-----
	inst:ListenForEvent("sanitydelta", lighton)
	inst:ListenForEvent("playeractivated", lighton)
	inst:ListenForEvent("respawnfromghost")
    inst:ListenForEvent("newstate", onnewstats)
    inst:ListenForEvent("onattackother", onattack)
	inst:ListenForEvent("playeractivated", onsetskin)
	
 ---inst.components.locomotor:SetTriggersCreep(false)
 


inst.OnSetSkin = onsetskin


inst.components.sanity.custom_rate_fn = function() 
		if TheWorld.state.isnight then
	return 0
	elseif TheWorld.state.isday then
		return -4.98/60
	elseif TheWorld.state.isdusk then
		return 0
	end
end
	end
			
return MakePlayerCharacter("reaper", prefabs, assets, common_postinit, master_postinit, start_inv)