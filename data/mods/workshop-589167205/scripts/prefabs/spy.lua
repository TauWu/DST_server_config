local MakePlayerCharacter = require ("prefabs/player_common")

local assets = {

	Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
        Asset( "ANIM", "anim/spy.zip" ),
        Asset( "ANIM", "anim/ghost_spy_build.zip" ),
}

local prefabs = { "inviswatch", "knife" }
local start_inv = { "inviswatch", "knife" }

local common_postinit = function(inst) 

	inst.soundsname = "wickerbottom"

    inst:AddTag("spy")
	
	inst.MiniMapEntity:SetIcon( "spy.tex" )
end

--Sanity gain from killing with his knives. The sanity bonus only applies to spies.
local smallScale = 0.5
local medScale = 0.7
local largeScale = 1.0

local function IsValidVictim(victim)
    return victim ~= nil
        and not (victim:HasTag("structure") or
                 victim:HasTag("wall"))
        and victim.components.health ~= nil
        and victim.components.combat ~= nil
end

local function onkilled(inst, data)
local hand = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	if hand then
if hand:HasTag("knife") then
    local victim = data.victim
    if IsValidVictim(victim) then
        inst.components.health:DoDelta(2)
        inst.components.sanity:DoDelta(20)
		
		        if not victim.components.health.nofadeout and (victim:HasTag("epic") or math.random() < .1) then
            local time = victim.components.health.destroytime or 2
            local x, y, z = victim.Transform:GetWorldPosition()
            local scale = (victim:HasTag("smallcreature") and smallScale)
                        or (victim:HasTag("largecreature") and largeScale)
                        or medScale
	end
	end
	end
	end
local hand = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	if hand then	
if hand:HasTag("goldenknife") then
    local victim = data.victim
    if IsValidVictim(victim) then
        inst.components.health:DoDelta(2)
        inst.components.sanity:DoDelta(30)

        if not victim.components.health.nofadeout and (victim:HasTag("epic") or math.random() < .1) then
            local time = victim.components.health.destroytime or 2
            local x, y, z = victim.Transform:GetWorldPosition()
            local scale = (victim:HasTag("smallcreature") and smallScale)
                        or (victim:HasTag("largecreature") and largeScale)
                        or medScale
        end
    end
end
end
local hand = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	if hand then	
if hand:HasTag("spykunai") then
    local victim = data.victim
    if IsValidVictim(victim) then
    local delta = victim.components.health.maxhealth * .33
            inst.components.health:DoDelta(delta, false)
			
			if inst.components.health ~= nil and not victim:HasTag("insect") then
			inst.components.health:DeltaPenalty(-0.15)
end
end
end
end

end

local master_postinit = function(inst)
	-- Stats
    inst.components.health:SetMaxHealth(125)	
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(130)
	
	inst:ListenForEvent("killed", onkilled)
	
	--Refuse to eat spoiled food
local spy_fancy = inst.components.eater.PrefersToEat
inst.components.eater.PrefersToEat = function(self, inst)
    if inst.components.perishable then
        if inst.components.perishable:IsStale() or inst.components.perishable:IsSpoiled() then
            return
        end
    end
    if inst.prefab == "spoiled_food" then
        return
    end
    return spy_fancy(self, inst)
end
	
end

return MakePlayerCharacter("spy", prefabs, assets, common_postinit, master_postinit, start_inv)