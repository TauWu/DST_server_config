local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH
local STRINGS = GLOBAL.STRINGS
local CANCIENTALTAR = GetModConfigData("AncientStation")
local CTHULECITEFRAGMENTS = GetModConfigData("ThuleciteFragments")

PrefabFiles = {
	"altar",
}
local assets=
{
    Asset("ATLAS", "images/inventoryimages/altar.xml"),
    Asset("IMAGE", "images/inventoryimages/altar.tex"),
    Asset("ATLAS", "images/inventoryimages/altar_broken.xml"),
    Asset("IMAGE", "images/inventoryimages/altar_broken.tex"),
}
AddMinimapAtlas("images/inventoryimages/altar.xml")
AddMinimapAtlas("images/inventoryimages/altar_broken.xml")

if CANCIENTALTAR ~= "disabled" then
	if CANCIENTALTAR == "easy" then
		AddRecipe("altar", {Ingredient("moonrocknugget", 2), Ingredient("purplegem", 1), Ingredient("thulecite_pieces", 3)}, RECIPETABS.SCIENCE, TECH.MAGIC_TWO,
		"altar_placer", -- placer
		nil, -- min_spacing
		nil, -- nounlock
		nil, -- numtogive
		nil, -- builder_tag
		"images/inventoryimages/altar.xml", -- atlas
		"altar.tex") -- image
	else 
		
		if CANCIENTALTAR == "normal" then
			AddRecipe("altar_broken", {Ingredient("moonrocknugget", 6), Ingredient("purplegem", 2), Ingredient("thulecite_pieces", 6)}, RECIPETABS.SCIENCE, TECH.MAGIC_THREE, 
			"altar_broken_placer", -- placer
			nil, -- min_spacing
			nil, -- nounlock
			nil, -- numtogive
			nil, -- builder_tag
			"images/inventoryimages/altar_broken.xml", -- atlas
			"altar_broken.tex") -- image
		else
			AddRecipe("altar_broken", {Ingredient("moonrocknugget", 10), Ingredient("purplegem", 4), Ingredient("thulecite_pieces", 16)}, RECIPETABS.SCIENCE, TECH.MAGIC_THREE, 
			"altar_broken_placer", -- placer
			nil, -- min_spacing
			nil, -- nounlock
			nil, -- numtogive
			nil, -- builder_tag
			"images/inventoryimages/altar_broken.xml", -- atlas
			"altar_broken.tex") -- image
		end
	end
end

if CTHULECITEFRAGMENTS ~= "disabled" then
	if CTHULECITEFRAGMENTS == "easy" then
		AddRecipe("thulecite_pieces", { Ingredient("goldnugget", 1), Ingredient("nightmarefuel", 1)}, RECIPETABS.REFINE,  TECH.MAGIC_TWO)
	elseif CTHULECITEFRAGMENTS == "normal" then
		AddRecipe("thulecite_pieces", { Ingredient("transistor", 1), Ingredient("nightmarefuel", 1)}, RECIPETABS.REFINE,  TECH.MAGIC_THREE)
	else
		AddRecipe("thulecite_pieces", { Ingredient("transistor", 2), Ingredient("nightmarefuel", 2)}, RECIPETABS.REFINE,  TECH.MAGIC_THREE)
	end
end

STRINGS.NAMES.ALTAR = "Ancient Station" --It's name in-game
STRINGS.RECIPE_DESC.ALTAR = "Build the wonders of a lost age." --recipe description
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ALTAR = "An ancient and mysterious structure."
STRINGS.RECIPE_DESC.ALTAR_BROKEN = "Build some of the wonders of a lost age." --recipe description
STRINGS.NAMES.ALTAR_BROKEN = "Small Station" --It's name in-game
STRINGS.RECIPE_DESC.THULECITE_PIECES = "The precious material of the ancients." --recipe description