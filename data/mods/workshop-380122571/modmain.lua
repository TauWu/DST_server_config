local require = GLOBAL.require
local resolvefilepath = GLOBAL.resolvefilepath
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local STRINGS = GLOBAL.STRINGS
local ACTIONS = GLOBAL.ACTIONS
local Action = GLOBAL.Action
local TECH = GLOBAL.TECH

GLOBAL.package.loaded["workshop-380122571.reaper"] = env



PrefabFiles = {
	"reaper",
	"scythe",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/reaper.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/reaper.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/reaper.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/reaper.xml" ),

    Asset( "IMAGE", "bigportraits/reaper.tex" ),
    Asset( "ATLAS", "bigportraits/reaper.xml" ),
	
	Asset( "IMAGE", "bigportraits/reaper_none.tex" ),
    Asset( "ATLAS", "bigportraits/reaper_none.xml" ),
	
	Asset( "IMAGE", "images/map_icons/reaper.tex" ),
	Asset( "ATLAS", "images/map_icons/reaper.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_reaper.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_reaper.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_reaper.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_reaper.xml" ),
	
	Asset("ANIM", "anim/scythe.zip"),
	Asset("ANIM", "anim/swap_scythe.zip"),
	Asset("IMAGE", "images/inventoryimages/scythe.tex"),
	Asset("ATLAS", "images/inventoryimages/scythe.xml"),
	
    Asset("SOUNDPACKAGE", "sound/reaper.fev"),
    Asset("SOUND", "sound/reaper.fsb"),
}
-- Recipes

local ScytheRecipeCost = (GetModConfigData("ScytheRecipeCost"))
if ScytheRecipeCost == "llama" then
AddRecipe("scythe", {Ingredient("twigs", 1),Ingredient("flint", 1)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE, nil, nil, nil, nil, "reaper", "images/inventoryimages/scythe.xml")
elseif ScytheRecipeCost == "easy" then
AddRecipe("scythe", {Ingredient("twigs", 2),Ingredient("flint", 2),Ingredient("rocks", 1)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE, nil, nil, nil, nil, "reaper", "images/inventoryimages/scythe.xml")
elseif ScytheRecipeCost == "normal" then
AddRecipe("scythe",{Ingredient("twigs", 2),Ingredient("rope", 1),Ingredient("flint", 2)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE, nil, nil, nil, nil, "reaper", "images/inventoryimages/scythe.xml")
elseif ScytheRecipeCost == "hard" then
AddRecipe("scythe", {Ingredient("twigs", 4),Ingredient("rope", 2),Ingredient("goldnugget", 2)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE, nil, nil, nil, nil, "reaper", "images/inventoryimages/scythe.xml")

end
----
----
STRINGS.NAMES.SCYTHE = "Scythe"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SCYTHE = "Death's scythe"
STRINGS.RECIPE_DESC.SCYTHE = "Your portable powerful work tool!"
	---------
	

-- Custom sounds
RemapSoundEvent( "dontstarve/characters/reaper/death_voice", "reaper/characters/reaper/death_voice" )
RemapSoundEvent( "dontstarve/characters/reaper/hurt", "reaper/characters/reaper/hurt" )
RemapSoundEvent( "dontstarve/characters/reaper/talk_LP", "reaper/characters/reaper/talk_LP" )

-- The character select screen lines
STRINGS.CHARACTER_TITLES.reaper = "Anthropomorphic Personification"
STRINGS.CHARACTER_NAMES.reaper = "Reaper"
STRINGS.CHARACTER_DESCRIPTIONS.reaper = "*Has a very sharp sickle \n*Feel good in dark "
STRINGS.CHARACTER_QUOTES.reaper = "\"(...)I COULD MURDER A KEBAB.\""

-- Custom speech strings
STRINGS.CHARACTERS.REAPER = require "speech_reaper"

-- The character's name as appears in-game 
STRINGS.NAMES.REAPER = "Death"

STRINGS.NAMES.SCYTHE = "Death's Sickle"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SCYTHE = "Feel my power!"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.REAPER = 
{
	GENERIC = "Looks strangely",
	ATTACKER = "Looks suspicious...",
	MURDERER = "Murderer!",
	REVIVER = "Reaper, friend of ghosts.",
	GHOST = "It's nonsense",
}

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "reaper")

AddMinimapAtlas("images/map_icons/reaper.xml")
AddModCharacter("reaper")