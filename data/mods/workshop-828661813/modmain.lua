PrefabFiles = {
	"brian",
	"brian_none",
	"kusanagi",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/brian.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/brian.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/brian.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/brian.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/brian_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/brian_silho.xml" ),

    Asset( "IMAGE", "bigportraits/brian.tex" ),
    Asset( "ATLAS", "bigportraits/brian.xml" ),
	
	Asset( "IMAGE", "images/map_icons/brian.tex" ),
	Asset( "ATLAS", "images/map_icons/brian.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_brian.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_brian.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_brian.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_brian.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_brian.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_brian.xml" ),
	
	Asset( "IMAGE", "images/names_brian.tex" ),
    Asset( "ATLAS", "images/names_brian.xml" ),
	
    Asset( "IMAGE", "bigportraits/brian_none.tex" ),
    Asset( "ATLAS", "bigportraits/brian_none.xml" ),
	
	Asset( "IMAGE", "images/map_icons/kusanagi.tex" ),
	Asset( "ATLAS", "images/map_icons/kusanagi.xml" ),
	
	Asset("IMAGE", "images/inventoryimages/kusanagi.tex"),	
	Asset("ATLAS", "images/inventoryimages/kusanagi.xml"),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH

-- The character select screen lines
STRINGS.CHARACTER_TITLES.brian = "The silent killer"
STRINGS.CHARACTER_NAMES.brian = "Ninja Brian"
STRINGS.CHARACTER_DESCRIPTIONS.brian = "*NSP keyboardist\n*Fast and deadly\n*Rockin' Ninja"
STRINGS.CHARACTER_QUOTES.brian = "\"...\""

-- Custom speech strings
STRINGS.CHARACTERS.BRIAN = require "speech_brian"

-- The character's name as appears in-game 
STRINGS.NAMES.BRIAN = "Ninja Brian"

-- Prefab names and descriptions
GLOBAL.STRINGS.NAMES.KUSANAGI = "Brian's sword"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KUSANAGI = "I got cut just looking at it!"

--Recipe
local kusanagi_recipe = AddRecipe("kusanagi",{GLOBAL.Ingredient("flint", 3), GLOBAL.Ingredient("twigs", 2), GLOBAL.Ingredient("goldnugget", 2)},
RECIPETABS.WAR, TECH.NONE, nil, nil, nil, 1, "brian_builder", "images/inventoryimages/kusanagi.xml",  "kusanagi.tex")

	STRINGS.RECIPE_DESC.KUSANAGI = "That's one mighty sharp blade."
	
-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.brian = 
{
	GENERIC = "It's Brian!",
	ATTACKER = "That Brian looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Brian, friend of ghosts.",
	GHOST = "Brian could use a heart.",
}

AddMinimapAtlas("images/map_icons/brian.xml")
AddMinimapAtlas("images/map_icons/kusanagi.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("brian", "MALE")

