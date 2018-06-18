PrefabFiles = {
	"weiss",
	"weiss_none",
	"myrtenaster",
	"cred",
	"cice",
	"cwind",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/weiss.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/weiss.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/weiss.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/weiss.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/weiss_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/weiss_silho.xml" ),

    Asset( "IMAGE", "bigportraits/weiss.tex" ),
    Asset( "ATLAS", "bigportraits/weiss.xml" ),
	
	Asset( "IMAGE", "images/map_icons/weiss.tex" ),
	Asset( "ATLAS", "images/map_icons/weiss.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_weiss.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_weiss.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_weiss.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_weiss.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_weiss.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_weiss.xml" ),
	
	Asset( "IMAGE", "images/names_weiss.tex" ),
    Asset( "ATLAS", "images/names_weiss.xml" ),
	
    Asset( "IMAGE", "bigportraits/weiss_none.tex" ),
    Asset( "ATLAS", "bigportraits/weiss_none.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH

-- The character select screen lines
STRINGS.CHARACTER_TITLES.weiss = "Weiss Schnee"
STRINGS.CHARACTER_NAMES.weiss = "Weiss"
STRINGS.CHARACTER_DESCRIPTIONS.weiss = "*MIRD. user\n\n"
STRINGS.CHARACTER_QUOTES.weiss = "\"It's a combat skirt!\""

GLOBAL.STRINGS.NAMES.CRED = "Fire Dust"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CRED = "It's fire dust."
STRINGS.RECIPE_DESC.CRED = "Manufactured by Schnee Dust Company."

GLOBAL.STRINGS.NAMES.CICE = "Ice Dust"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CICE = "It's ice dust."
STRINGS.RECIPE_DESC.CICE = "Manufactured by Schnee Dust Company."

GLOBAL.STRINGS.NAMES.CWIND = "Wind Dust"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CWIND = "It's wind dust."
STRINGS.RECIPE_DESC.CWIND = "Manufactured by Schnee Dust Company."

GLOBAL.STRINGS.NAMES.MYRTENASTER = "Myrtenaster"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MYRTENASTER = "MIRD"
STRINGS.RECIPE_DESC.MYRTENASTER = "Multi Action Dust Rapier."

-- Custom speech strings
STRINGS.CHARACTERS.WEISS = require "speech_weiss"

-- The character's name as appears in-game 
STRINGS.NAMES.WEISS = "Weiss"

AddMinimapAtlas("images/map_icons/weiss.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("weiss", "FEMALE")

local myrtenaster_recipe = AddRecipe("myrtenaster",{ Ingredient("gears", 1),Ingredient("flint", 4),Ingredient("transistor", 1)},
RECIPETABS.SCIENCE, TECH.SCIENCE_TWO, nil, nil, true, 1, "weiss_builder", "images/inventoryimages/myrtenaster.xml"
,  "myrtenaster.tex")

local cred_recipe = AddRecipe("cred",{ Ingredient("redgem", 1)},
RECIPETABS.SCIENCE, TECH.SCIENCE_TWO, nil, nil, true, 30, "weiss_builder", "images/inventoryimages/cred.xml"
,  "cred.tex")

local cice_recipe = AddRecipe("cice",{ Ingredient("bluegem", 1)},
RECIPETABS.SCIENCE, TECH.SCIENCE_TWO, nil, nil, true, 30, "weiss_builder", "images/inventoryimages/cice.xml"
,  "cice.tex")

local cred_recipe = AddRecipe("cwind",{ Ingredient("greengem", 1)},
RECIPETABS.SCIENCE, TECH.SCIENCE_TWO, nil, nil, true, 30, "weiss_builder", "images/inventoryimages/cwind.xml"
,  "cwind.tex")

-- Fireball action
local myfireball = AddAction("THROWFIREBALL", "Cast Fireball", function(act)
	act.invobject.components.fireattack:DoAttack(act.doer, act.target)
	act.invobject.components.container:ConsumeByName("cred", 1)
	act.doer.components.sanity:DoDelta(-3)
	return true
end)
myfireball.distance = 10

-- Fireball tossing action
AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(myfireball, "attack"))

-- Fireball action linked to equipped items with fireattack component
AddComponentAction("EQUIPPED", "fireattack", function(inst, doer, target, actions, right)
	if right and target.replica.health and not target:HasTag("player") then
		table.insert(actions, myfireball)
	end
end)

-- Iceball action
local myiceball = AddAction("THROWICEBALL", "Cast Iceball", function(act)
	act.invobject.components.iceattack:DoAttack(act.doer, act.target)
	act.invobject.components.container:ConsumeByName("cice", 1)
	act.doer.components.sanity:DoDelta(-1)
	return true
end)
myiceball.distance = 15

-- Iceball tossing action
AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(myiceball, "attack"))

-- Iceball action linked to equipped items with fireattack component
AddComponentAction("EQUIPPED", "iceattack", function(inst, doer, target, actions, right)
	if right and target.replica.health and not target:HasTag("player") then
		table.insert(actions, myiceball)
	end
end)