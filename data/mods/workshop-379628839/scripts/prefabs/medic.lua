
local MakePlayerCharacter = require("prefabs/player_common")

local assets = 
{
		Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
        Asset( "ANIM", "anim/medic.zip" ),
        Asset( "ANIM", "anim/ghost_medic_build.zip" ),
}
local prefabs = { "small_medkit" }
local start_inv = { "small_medkit", "small_medkit", "small_medkit", "small_medkit", "small_medkit", "reviver" }

local function EditCombat(inst)
	local self = inst.components.combat
	local _GetAttacked = self.GetAttacked
	self.GetAttacked = function(self, attacker, damage, weapon, stimuli)
		if attacker and damage then
			-- Take extra damage
			damage = damage * 1.3
		end
		return _GetAttacked(self, attacker, damage, weapon, stimuli)
	end
end

local common_postinit = function(inst) 
	inst.soundsname = "medic"
	inst:AddTag("medic")
	inst.MiniMapEntity:SetIcon( "medic.tex" )
end

local master_postinit = function(inst)
	-- Stats
    inst.components.health:SetMaxHealth(150)	
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(140)
	inst.components.health:StartRegen(1,TUNING.MEDICHP_REGEN,false)

	EditCombat(inst)
end

return MakePlayerCharacter("medic", prefabs, assets, common_postinit, master_postinit, start_inv)