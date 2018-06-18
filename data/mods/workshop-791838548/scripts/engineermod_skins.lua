local G = GLOBAL
local STRINGS = G.STRINGS

G.ENGINEERSKINS = {
	ENGINEER = {
		["blu"] = {
			builds = {
				normal_skin = "engineer_blu",
				ghost_skin = "ghost_engineer_build",
			},
		},
		["formal"] = {
			builds = {
				normal_skin = "engineer_formal",
				ghost_skin = "ghost_engineer_build",
			},
		},
		["survivor"] = {
			builds = {
				normal_skin = "engineer_survivor",
				ghost_skin = "ghost_engineer_build",
			},
		},
	   ["shadow"] = {
			builds = {
				normal_skin = "engineer_shadow",
				ghost_skin = "ghost_engineer_build",
			},
		},
		      }, 
--	ITEMS = {}
}
--[[
G.ENGINEERSKINS.ITEMS["tf2wrench"] = {
	"festive_tf2wrench",
--	"austrailium_tf2wrench",
	"clockwork_killer",
	"autumn_decoratedwrench",
	"topshelf_decoratedwrench",
	"airwolf_decoratedwrench"
}--]]

if G.SKIN_RARITY_COLORS.ModMade ~= nil then G.MakeModCharacterSkinnable("engineer") end