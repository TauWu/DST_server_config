local G = GLOBAL
local STRINGS = G.STRINGS

G.MEDICSKINS = {
	MEDIC = {
		["blu"] = {
			builds = {
				normal_skin = "medic_blu",
				ghost_skin = "ghost_medic_build",
			},
		},
		
		["survivor"] = {
			builds = {
				normal_skin = "medic_survivor",
				ghost_skin = "ghost_medic_build",
			},
		},
		["formal"] = {
			builds = {
				normal_skin = "medic_formal",
				ghost_skin = "ghost_medic_build",
			},
		},
	   ["shadow"] = {
			builds = {
				normal_skin = "medic_shadow",
				ghost_skin = "ghost_medic_build",
			},
		},
		      },
--	ITEMS = {}
}

if G.SKIN_RARITY_COLORS.ModMade ~= nil then G.MakeModCharacterSkinnable("medic") end