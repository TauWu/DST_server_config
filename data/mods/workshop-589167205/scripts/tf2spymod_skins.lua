local G = GLOBAL
local STRINGS = G.STRINGS

G.SPYSKINS = {
	SPY = {
		["blu"] = {
			builds = {
				normal_skin = "spy_blu",
				ghost_skin = "ghost_spy_build",
			},
		},
        ["rose"] = {
			builds = {
				normal_skin = "spy_rose",
				ghost_skin = "ghost_spy_build",
			},
		},
		      },
--	ITEMS = {}
}

--[[
G.SPYSKINS.ITEMS["knife"] = {
	"black_rose",
}--]]

if G.SKIN_RARITY_COLORS.ModMade ~= nil then G.MakeModCharacterSkinnable("spy") end