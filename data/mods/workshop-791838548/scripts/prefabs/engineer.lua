local MakePlayerCharacter = require("prefabs/player_common")

local assets = {

	    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
        Asset( "ANIM", "anim/engineer.zip" ),
        Asset( "ANIM", "anim/ghost_engineer_build.zip" ),
}

local prefabs = {"ehardhat", "tf2wrench", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap"}
local start_inv = {"tf2wrench", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap"}

local common_postinit = function(inst) 

    inst.soundsname = "woodie"
	
    inst:AddTag("engie")

    inst.MiniMapEntity:SetIcon( "engineer.tex" )
	
end

local master_postinit = function(inst)
	
	-- Stats	
	inst.components.health:SetMaxHealth(125)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(200)
	inst.components.builder.science_bonus = 1
    inst.components.combat.damagemultiplier = TUNING.ENGIE_DMGDEBUFF --20% less
	
	inst.OnNewSpawn = function(inst)
	local hardhat = SpawnPrefab("ehardhat")
    inst.components.inventory:Equip(hardhat)
	end
	
end

return MakePlayerCharacter("engineer", prefabs, assets, common_postinit, master_postinit, start_inv)