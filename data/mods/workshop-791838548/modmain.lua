PrefabFiles = {
	"scrap",
	"engineer",
	"engineer_skins",
	"esentry",
	"dispenser",
	"eteleporter",
	"eteleporter_exit",
	"tf2wrench",
	"gibus",
	"ehardhat",
	"esentry_bullet",
	"esentry_rocket",
}

Assets = {

    Asset( "IMAGE", "bigportraits/engineer.tex" ),
    Asset( "ATLAS", "bigportraits/engineer.xml" ),
	--Skins
	Asset( "IMAGE", "bigportraits/engineer_blu.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_blu.xml" ),
	
	Asset( "IMAGE", "bigportraits/engineer_formal.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_formal.xml" ),
	
	Asset( "IMAGE", "bigportraits/engineer_survivor.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_survivor.xml" ),
	
	Asset( "IMAGE", "bigportraits/engineer_shadow.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_shadow.xml" ),
	--
    Asset( "IMAGE", "images/minimap/engineer.tex" ),
    Asset( "ATLAS", "images/minimap/engineer.xml" ),
	
    Asset( "IMAGE", "images/avatars/avatar_engineer.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_engineer.xml" ),
	
    Asset( "IMAGE", "images/avatars/avatar_ghost_engineer.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_engineer.xml" ),
	
    Asset( "IMAGE", "images/avatars/self_inspect_engineer.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_engineer.xml" ),
	
    Asset( "IMAGE", "images/names_engineer.tex" ),
    Asset( "ATLAS", "images/names_engineer.xml" ),
	
    Asset( "IMAGE", "bigportraits/engineer_none.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_none.xml" ),

    Asset("ATLAS", "images/inventoryimages/esentry_item.xml"),
    Asset("IMAGE", "images/inventoryimages/esentry_item.tex"),
	
    Asset("ATLAS", "images/inventoryimages/esentry.xml"),
    Asset("IMAGE", "images/inventoryimages/esentry.tex"),
	
    Asset("ATLAS", "images/inventoryimages/scrap.xml"),
    Asset("IMAGE", "images/inventoryimages/scrap.tex"),

    Asset("IMAGE", "images/minimap/esentry.tex"),
    Asset("ATLAS", "images/minimap/esentry.xml"),
	
    Asset("ATLAS", "images/inventoryimages/dispenser_item.xml"),
    Asset("IMAGE", "images/inventoryimages/dispenser_item.tex"),
	
    Asset("ATLAS", "images/inventoryimages/dispenser.xml"),
    Asset("IMAGE", "images/inventoryimages/dispenser.tex"),
	
    Asset("IMAGE", "images/minimap/dispenser.tex"),
    Asset("ATLAS", "images/minimap/dispenser.xml"),
	
    Asset("IMAGE", "images/minimap/eteleporter.tex"),
    Asset("ATLAS", "images/minimap/eteleporter.xml"),
	
    Asset("ATLAS", "images/inventoryimages/eteleporter_item.xml"),
    Asset("IMAGE", "images/inventoryimages/eteleporter_item.tex"),
	
    Asset("ATLAS", "images/inventoryimages/eteleporter.xml"),
    Asset("IMAGE", "images/inventoryimages/eteleporter.tex"),
	
    Asset("ATLAS", "images/inventoryimages/eteleporter_exit_item.xml"),
    Asset("IMAGE", "images/inventoryimages/eteleporter_exit_item.tex"),
	
    Asset("ATLAS", "images/inventoryimages/gibus.xml"),
    Asset("IMAGE", "images/inventoryimages/gibus.tex"),
	
    Asset("ATLAS", "images/inventoryimages/ehardhat.xml"),
    Asset("IMAGE", "images/inventoryimages/ehardhat.tex"),

    Asset("ATLAS", "images/hud/engietab.xml" ),
    Asset("ATLAS", "images/hud/engietab.xml" ),
    Asset("IMAGE", "images/hud/engietab.tex"),
	
	Asset( "ANIM", "anim/emote_rancho.zip" ),
	
}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local RECIPETABS = GLOBAL.RECIPETABS

TUNING.ENGIE_DMGDEBUFF = GetModConfigData("engiedmgdebuff")

TUNING.TF2WRENCH_DAMAGE = GetModConfigData("tf2wrenchdmg")
TUNING.TF2WRENCH_USES = GetModConfigData("tf2wrenchuses")
TUNING.ARMOR_HARDHAT_ABSORPTION = GetModConfigData("hardhatabsorb")
TUNING.ARMOR_EHARDHAT = GetModConfigData("ehardhatdura")

TUNING.DISP_RANGE = GetModConfigData("disprange")
TUNING.DISP_HEALING = GetModConfigData("dispenserhealingrate")

GLOBAL.SENTRY_RANGE = GetModConfigData("Sentry_Range")
GLOBAL.SENTRY_DAMAGE = GetModConfigData("Sentry_Damage")
GLOBAL.SENTRY_ROF = GetModConfigData("Sentry_ROF")
GLOBAL.SENTRY_HEALTH = GetModConfigData("Sentry_Health")

GLOBAL.STRINGS.NAMES.ENGINEER = "Engineer"
GLOBAL.STRINGS.CHARACTER_TITLES.engineer = "The Amiable Texan"
GLOBAL.STRINGS.CHARACTER_NAMES.engineer = "Dell Conagher"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.engineer = "*Can build his various contraptions\n*Brings his own wrench and hard hat\n*Loves science"
GLOBAL.STRINGS.CHARACTER_QUOTES.engineer = "\"I solve practical problems.\""
GLOBAL.STRINGS.CHARACTERS.ENGINEER = require "speech_engineer"

GLOBAL.STRINGS.SKIN_QUOTES.engineer_blu = "Use a gun. And if that don't work... use more gun."
GLOBAL.STRINGS.SKIN_NAMES.engineer_blu = "BLU"

GLOBAL.STRINGS.SKIN_QUOTES.engineer_formal = "Life of Reilly!"
GLOBAL.STRINGS.SKIN_NAMES.engineer_formal = "Guest of Honor"

GLOBAL.STRINGS.SKIN_QUOTES.engineer_survivor = "Hell boys, we better Mann up in a big damn hurry."
GLOBAL.STRINGS.SKIN_NAMES.engineer_survivor = "The Survivor"

GLOBAL.STRINGS.SKIN_QUOTES.engineer_shadow = "I was gonna invent the Death-Dispenser, looks like I ought to now." --Half of a canon quote, let me have this
GLOBAL.STRINGS.SKIN_NAMES.engineer_shadow = "The Triumphant"

local engietab = AddRecipeTab("Construction", 999, "images/hud/engietab.xml", "engietab.tex", "engie")

--Scrap
STRINGS.NAMES.SCRAP = "Scrap Metal"
STRINGS.RECIPE_DESC.SCRAP = "Scrapped Metal."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SCRAP = "Messy metallic fuel parts."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.SCRAP = "Bits and pieces, pieces and bits."
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.SCRAP = "Is junk?"
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.SCRAP = "They have been abandoned and worn out by the world."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.SCRAP = "OH NO. WHAT HAS HAPPENED?"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.SCRAP = "Various bits of rusted metal and pipes."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.SCRAP = "All busted up."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.SCRAP = "Junk thrown out for a reason."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.SCRAP = "These might make unique accessories to my helmet."
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.SCRAP = "They're stuck together."
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.SCRAP = "Now that's junk!"
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.SCRAP = "This is mine now!"
end
end)

local recipe_difficulty = GetModConfigData("Scrap_Difficulty")
if recipe_difficulty == "default" then
local scrap = AddRecipe("scrap", {Ingredient("flint", 2), Ingredient("twigs", 2)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, 5, "engie", "images/inventoryimages/scrap.xml", "scrap.tex")
elseif recipe_difficulty == "easy" then 
local scrap = AddRecipe("scrap", {Ingredient("flint", 1), Ingredient("twigs", 1)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, 6, "engie", "images/inventoryimages/scrap.xml", "scrap.tex")
elseif recipe_difficulty == "easier" then 
local scrap = AddRecipe("scrap", {Ingredient("flint", 1)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, 5, "engie", "images/inventoryimages/scrap.xml", "scrap.tex")
elseif recipe_difficulty == "hard" then 
local scrap = AddRecipe("scrap", {Ingredient("flint", 3), Ingredient("twigs", 3), Ingredient("goldnugget", 1)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, 5, "engie", "images/inventoryimages/scrap.xml", "scrap.tex")
elseif recipe_difficulty == "harder" then 
local scrap = AddRecipe("scrap", {Ingredient("flint", 4), Ingredient("twigs", 4), Ingredient("goldnugget", 2)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, 5, "engie", "images/inventoryimages/scrap.xml", "scrap.tex")
end

--Hard Hat
GLOBAL.STRINGS.NAMES.EHARDHAT = "Hard Hat"
GLOBAL.STRINGS.RECIPE_DESC.EHARDHAT = "It's hard and it's a hat."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.EHARDHAT = "Pretty hard hat, that."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.EHARDHAT = "Gross, I'm not a construction worker!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.EHARDHAT = "To protect head!"
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.EHARDHAT = "Its protection is only temporary. It will not last."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.EHARDHAT = "DUMB HAT"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.EHARDHAT = "Protective gear for building endeavors."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.EHARDHAT = "Will this give me hockey hair?"
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.EHARDHAT = "I'm better than this."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.EHARDHAT = "The mighty helm of the construction worker! Hard as ever!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.EHARDHAT = "Hey! It's not that hard for a hard hat!"
        if GLOBAL.STRINGS.CHARACTERS.MEDIC then
GLOBAL.STRINGS.CHARACTERS.MEDIC.DESCRIBE.EHARDHAT = "Protection, for your head! Fascinating!"
end
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.EHARDHAT = "Aye, that's hefty."
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.EHARDHAT = "Get this crap out of my face!"
end
end)

local recipe_difficulty = GetModConfigData("EHat_Difficulty")
if recipe_difficulty == "default" then
local ehardhat = AddRecipe("ehardhat", {Ingredient("scrap", 4, "images/inventoryimages/scrap.xml"), Ingredient("goldnugget", 2)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, nil, "engie", "images/inventoryimages/ehardhat.xml", "ehardhat.tex")
elseif recipe_difficulty == "easy" then 
local ehardhat = AddRecipe("ehardhat", {Ingredient("scrap", 2, "images/inventoryimages/scrap.xml"), Ingredient("goldnugget", 1)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, nil, "engie", "images/inventoryimages/ehardhat.xml", "ehardhat.tex")
elseif recipe_difficulty == "hard" then 
local ehardhat = AddRecipe("ehardhat", {Ingredient("scrap", 6, "images/inventoryimages/scrap.xml"), Ingredient("goldnugget", 2)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, nil, "engie", "images/inventoryimages/ehardhat.xml", "ehardhat.tex")
elseif recipe_difficulty == "harder" then 
local ehardhat = AddRecipe("ehardhat", {Ingredient("scrap", 8, "images/inventoryimages/scrap.xml"), Ingredient("goldnugget", 2), Ingredient("strawhat", 1)}, engietab, GLOBAL.TECH.ONE, nil, nil, nil, nil, "engie", "images/inventoryimages/ehardhat.xml", "ehardhat.tex")
end

--Sentry
GLOBAL.STRINGS.RECIPE_DESC.ESENTRY = "Buildin' a sentry!"
GLOBAL.STRINGS.NAMES.ESENTRY = "Sentry Gun"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ESENTRY = "I hope it doesn't turn on me!"
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.ESENTRY = "I wish it lit things on fire instead."
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ESENTRY = "Mighty structure will help me fight!"
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.ESENTRY = "It's hard to protect yourself from this world."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.ESENTRY = "FIGHT FOR ME INSTEAD, BROTHER"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ESENTRY = "It's some sort of high-tech turret weapon."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.ESENTRY = "That'll drive the hosers off."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ESENTRY = "I could've thought up a much better design."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.ESENTRY = "An ancient red box of protection!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.ESENTRY = "It smells a lot like gunpowder."
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.ESENTRY = "Go on and build more o' yer little guns. I'll shove every one of them up yer arse!"
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.ESENTRY = "Stop hiding behind your little toys and fight like a man!"
end
end)

local recipe_difficulty = GetModConfigData("Sentry_Difficulty")
if recipe_difficulty == "default" then
local esentry_item = AddRecipe("esentry", {Ingredient("scrap", 20, "images/inventoryimages/scrap.xml"), Ingredient("gears", 3)}, engietab, GLOBAL.TECH.SCIENCE_ONE, "esentry_placer", 3, nil, nil, "engie", "images/inventoryimages/esentry.xml", "esentry.tex")
elseif recipe_difficulty == "hard" then
local esentry_item = AddRecipe("esentry", {Ingredient("scrap", 30, "images/inventoryimages/scrap.xml"), Ingredient("gears", 5), Ingredient("cutstone",5)}, engietab, GLOBAL.TECH.SCIENCE_ONE, "esentry_placer", 3, nil, nil, "engie", "images/inventoryimages/esentry.xml", "esentry.tex")
elseif recipe_difficulty == "harder" then
local esentry_item = AddRecipe("esentry", {Ingredient("scrap", 40, "images/inventoryimages/scrap.xml"), Ingredient("gears", 5), Ingredient("goldnugget",5)}, engietab, GLOBAL.TECH.SCIENCE_TWO, "esentry_placer", 3, nil, nil, "engie", "images/inventoryimages/esentry.xml", "esentry.tex")
elseif recipe_difficulty == "easy" then
local esentry_item = AddRecipe("esentry", {Ingredient("scrap", 15, "images/inventoryimages/scrap.xml"), Ingredient("gears", 1)}, engietab, GLOBAL.TECH.SCIENCE_ONE, "esentry_placer", 3, nil, nil, "engie", "images/inventoryimages/esentry.xml", "esentry.tex")
end

--Dispenser
GLOBAL.STRINGS.RECIPE_DESC.DISPENSER = "Erecting a Dispenser!"
GLOBAL.STRINGS.NAMES.DISPENSER = "Dispenser"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DISPENSER = "Seems healthy enough."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.DISPENSER = "Burn, not heal!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.DISPENSER = "Structure make Wolfgang feel strong!"
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.DISPENSER = "It's not built to last."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.DISPENSER = "WHY DO YOU HEAL FLESHINGS?"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.DISPENSER = "It's a machine built to heal and supply."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.DISPENSER = "Healthcare comes without a price."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.DISPENSER = "If it helps, it helps."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.DISPENSER = "Providing support for the toughest of battles."
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.DISPENSER = "It's a soothing machine."
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.DISPENSER = "That's a right pretty bra-washer ya built, ya big ugly girl!"
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.DISPENSER = "I am healed now!"
end
end)

local recipe_difficulty = GetModConfigData("Dispenser_Difficulty")
if recipe_difficulty == "default" then
local dispenser_item = AddRecipe("dispenser", {Ingredient("scrap", 15, "images/inventoryimages/scrap.xml"), Ingredient("redgem", 3)}, engietab, GLOBAL.TECH.SCIENCE_TWO, "dispenser_placer", 3, nil, nil, "engie", "images/inventoryimages/dispenser.xml", "dispenser.tex")
elseif recipe_difficulty == "hard" then
local dispenser_item = AddRecipe("dispenser", {Ingredient("scrap", 25, "images/inventoryimages/scrap.xml"), Ingredient("redgem", 5), Ingredient("transistor",5)}, engietab, GLOBAL.TECH.SCIENCE_TWO, "dispenser_placer", 3, nil, nil, "engie", "images/inventoryimages/dispenser.xml", "dispenser.tex")
elseif recipe_difficulty == "harder" then
local dispenser_item = AddRecipe("dispenser", {Ingredient("scrap", 35, "images/inventoryimages/scrap.xml"), Ingredient("redgem", 5), Ingredient("gears",5)}, engietab, GLOBAL.TECH.SCIENCE_TWO, "dispenser_placer", 3, nil, nil, "engie", "images/inventoryimages/dispenser.xml", "dispenser.tex")
elseif recipe_difficulty == "easy" then
local dispenser_item = AddRecipe("dispenser", {Ingredient("scrap", 10, "images/inventoryimages/scrap.xml"), Ingredient("redgem", 1)}, engietab, GLOBAL.TECH.SCIENCE_TWO, "dispenser_placer", 3, nil, nil, "engie", "images/inventoryimages/dispenser.xml", "dispenser.tex")

end

--Teleporter
GLOBAL.STRINGS.RECIPE_DESC.ETELEPORTER = "Teleporter goin' up!"
GLOBAL.STRINGS.NAMES.ETELEPORTER = "Teleporter Entrance"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ETELEPORTER = "Teleportation can be so useful."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.ETELEPORTER = "I can feel the magic!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ETELEPORTER = "Tiny object gives me a headache."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.ETELEPORTER = "With each use the entrant dies and is reborn."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.ETELEPORTER = "COUSIN, YOU DO NOT HAVE TO TAKE ORDERS FROM FLESHLINGS"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ETELEPORTER = "Handy for travelling specific distances."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.ETELEPORTER = "This will help me get around quickly."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ETELEPORTER = "Magic power can do amazing things for people."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.ETELEPORTER = "I will ride through the air!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.ETELEPORTER = "Even with all our legs, a little teleportation is nice."
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.ETELEPORTER = "Move it, lads!"
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.ETELEPORTER = "Move out!"
end
end)

local recipe_difficulty = GetModConfigData("Teleporter_Difficulty")
if recipe_difficulty == "default" then
local eteleporter_item = AddRecipe("eteleporter", {Ingredient("scrap", 15, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel", 10)}, engietab, GLOBAL.TECH.MAGIC_TWO, "eteleporter_placer", 2, nil, nil, "engie", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
elseif recipe_difficulty == "hard" then
local eteleporter_item = AddRecipe("eteleporter", {Ingredient("scrap", 20, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel", 10), Ingredient("marble",5)}, engietab, GLOBAL.TECH.MAGIC_TWO, "eteleporter_placer", 2, nil, nil, "engie", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
elseif recipe_difficulty == "harder" then
local eteleporter_item = AddRecipe("eteleporter", {Ingredient("scrap", 25, "images/inventoryimages/scrap.xml"), Ingredient("purplegem", 1), Ingredient("marble",10)}, engietab, GLOBAL.TECH.MAGIC_TWO, "eteleporter_placer", 2, nil, nil, "engie", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
elseif recipe_difficulty == "easy" then
local eteleporter_item = AddRecipe("eteleporter", {Ingredient("scrap", 10, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel",6)}, engietab, GLOBAL.TECH.SCIENCE_TWO, "eteleporter_placer", 2, nil, nil, "engie", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
end

--Exit
GLOBAL.STRINGS.RECIPE_DESC.ETELEPORTER_EXIT = "Teleporter comin' right up!"
GLOBAL.STRINGS.NAMES.ETELEPORTER_EXIT = "Teleporter Exit"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ETELEPORTER_EXIT = "Teleportation can be so useful."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.ETELEPORTER_EXIT = "I can feel the magic!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ETELEPORTER_EXIT = "Tiny object gives me a headache."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.ETELEPORTER_EXIT = "The entrant is reborn here, much to their dismay."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.ETELEPORTER_EXIT = "COUSIN, YOU DO NOT HAVE TO TAKE ORDERS FROM FLESHLINGS"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ETELEPORTER_EXIT = "Handy for travelling specific distances."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.ETELEPORTER_EXIT = "Gets ya put one place when you're from another."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ETELEPORTER_EXIT = "Magic power can do amazing things for people."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.ETELEPORTER_EXIT = "Teleportation, the magic from times ahead!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.ETELEPORTER_EXIT = "Even with all our legs, a little teleportation is nice."
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.ETELEPORTER_EXIT = "Aye! Thanks fer the toys, lad."
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.ETELEPORTER_EXIT = "To the front!"
end
end)

local recipe_difficulty = GetModConfigData("Teleporter_Difficulty")
if recipe_difficulty == "default" then
local eteleporter_exit_item = AddRecipe("eteleporter_exit", {Ingredient("scrap", 15, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel", 10)}, engietab, GLOBAL.TECH.MAGIC_TWO, "eteleporter_exit_placer", 2, nil, nil, "engie", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
elseif recipe_difficulty == "hard" then
local eteleporter_exit_item = AddRecipe("eteleporter_exit", {Ingredient("scrap", 20, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel", 10), Ingredient("marble",5)}, engietab, GLOBAL.TECH.MAGIC_TWO, "eteleporter_exit_placer", 2, nil, nil, "engie", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
elseif recipe_difficulty == "harder" then
local eteleporter_exit_item = AddRecipe("eteleporter_exit", {Ingredient("scrap", 25, "images/inventoryimages/scrap.xml"), Ingredient("purplegem", 1), Ingredient("marble",10)}, engietab, GLOBAL.TECH.MAGIC_TWO, "eteleporter_exit_placer", 2, nil, nil, "engie", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
elseif recipe_difficulty == "easy" then
local eteleporter_exit_item = AddRecipe("eteleporter_exit", {Ingredient("scrap", 10, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel", 6)}, engietab, GLOBAL.TECH.SCIENCE_TWO, "eteleporter_exit_placer", 2, nil, nil, "engie", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
end

--Wrench
GLOBAL.STRINGS.NAMES.TF2WRENCH = "Wrench"
GLOBAL.STRINGS.RECIPE_DESC.TF2WRENCH = "Take it like a man, shorty"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.TF2WRENCH = "It's a wrench, for fixing things."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.TF2WRENCH = "Why fix things when you can burn them?"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.TF2WRENCH = "Fix broken thing."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.TF2WRENCH = "Repair what is worn out so it can become worn out again."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.TF2WRENCH = "CONSTRUCTION"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.TF2WRENCH = "A worker's tool."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.TF2WRENCH = "Fix your mistakes."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.TF2WRENCH = "It doesn't feel right fixing other's mistakes."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.TF2WRENCH = "More fit for labor than battle."
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.TF2WRENCH = "We can fix things with this!"
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.TF2WRENCH = "You come wide at me again, boy, I'll stick this wrench right up yer arse!"
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.TF2WRENCH = "You have lost your tools, grease monkey!"
end
end)

local recipe_difficulty = GetModConfigData("tf2Wrench_Difficulty")
if recipe_difficulty == "default" then
local tf2wrench = AddRecipe("tf2wrench", {Ingredient("scrap", 5, "images/inventoryimages/scrap.xml"), Ingredient("twigs", 2), Ingredient("goldnugget", 1)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, nil, "engie", "images/inventoryimages/tf2wrench.xml")
elseif recipe_difficulty == "harder" then
local tf2wrench = AddRecipe("tf2wrench", {Ingredient("scrap", 7, "images/inventoryimages/scrap.xml"), Ingredient("twigs", 4), Ingredient("goldnugget", 2)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, nil, "engie", "images/inventoryimages/tf2wrench.xml")
elseif recipe_difficulty == "easier" then
local tf2wrench = AddRecipe("tf2wrench", {Ingredient("scrap", 5, "images/inventoryimages/scrap.xml"), Ingredient("twigs", 2)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, nil, "engie", "images/inventoryimages/tf2wrench.xml")
end

--Gibus
GLOBAL.STRINGS.NAMES.GIBUS = "Ghostly Gibus"
GLOBAL.STRINGS.RECIPE_DESC.GIBUS = "Not the classiest hat of all."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.GIBUS = "What a weird hat."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.GIBUS = "It smells like silk and incompetence."
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.GIBUS = "Is torn."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.GIBUS = "Worn by the poor."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.GIBUS = "MILDLY SOPHISTICATED"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.GIBUS = "The open top isn't the best choice of design."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.GIBUS = "This hat is a bust."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.GIBUS = "Fit for the dead."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.GIBUS = "This does not match my costume."
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.GIBUS = "It's all used."
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.GIBUS = "Cast your eyes on this!"
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.GIBUS = "Do you call that a hat? That is a pile of nonsense!"
end
end)

-- Craftable for everyone for all your Gibus needs.
local gibus = AddRecipe("gibus", {Ingredient("silk", 2), Ingredient("charcoal", 2)}, GLOBAL.RECIPETABS.DRESS, GLOBAL.TECH.SCIENCE_NONE, nil, nil, nil, nil, nil, "images/inventoryimages/gibus.xml")

GLOBAL.MATERIALS.SCRAP = "SCRAP"
local scrap = {"scrap", }

-- Actions ------------------------------

AddAction("ENGIETELEPORT", "Teleport", function(act)
	if act.doer ~= nil and act.target ~= nil and act.doer:HasTag("player") and act.target.components.engieteleporter then
		act.target.components.engieteleporter.boundEntrance = act.target
		act.target.components.engieteleporter:TeleportAction(act.doer)
		return true
	end
end)

AddAction("ENGIEWORKABLE", "Repair/Reload", function(act)
	if act.doer ~= nil and act.target ~= nil and act.doer:HasTag("player") and act.target.components.engieworkable then
		act.target.components.workable:WorkedBy(act.doer, 0)
		return true
	end
end)

-- Component actions ---------------------

AddComponentAction("SCENE", "engieteleporter", function(inst, doer, actions, right)
	if right then
		table.insert(actions, GLOBAL.ACTIONS.ENGIETELEPORT)
	end
end)

AddComponentAction("SCENE", "engieworkable", function(inst, doer, actions, right)
	if (inst:HasTag("dispenser") and doer.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) ~= nil and doer.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS).prefab == "tf2wrench") then
	    if inst:HasTag("lvl1") or inst:HasTag("lvl2") then
	        if right then
	            GLOBAL.STRINGS.ACTIONS.ENGIEWORKABLE = "Refuel/Upgrade"
		    table.insert(actions, GLOBAL.ACTIONS.ENGIEWORKABLE)
	       end
	    end
	    if inst:HasTag("lvl3") then
	        if right then
	            GLOBAL.STRINGS.ACTIONS.ENGIEWORKABLE = "Refuel"
		    table.insert(actions, GLOBAL.ACTIONS.ENGIEWORKABLE)
	       end
	    end
	end

	if (inst:HasTag("esentry") and doer.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) ~= nil and doer.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS).prefab == "tf2wrench") then
	    if inst:HasTag("lvl1") or inst:HasTag("lvl2") then
	        if right then
	            GLOBAL.STRINGS.ACTIONS.ENGIEWORKABLE = "Reload/Upgrade"
		    table.insert(actions, GLOBAL.ACTIONS.ENGIEWORKABLE)
	       end
	    end
	    if inst:HasTag("lvl3") then
	        if right then
	            GLOBAL.STRINGS.ACTIONS.ENGIEWORKABLE = "Reload"
		    table.insert(actions, GLOBAL.ACTIONS.ENGIEWORKABLE)
	       end
	    end
	end
end)

-- Stategraph ----------------------------

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ENGIETELEPORT, "doshortaction")) --ENGIDESTINATION
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ENGIETELEPORT, "doshortaction"))

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ENGIEWORKABLE, --Workaround for previous hammer conflicts ect
        function(inst)
            if inst:HasTag("beaver") then
                return not inst.sg:HasStateTag("gnawing") and "gnaw" or nil
            end
            return not inst.sg:HasStateTag("prehammer")
                and (inst.sg:HasStateTag("hammering") and
                    "hammer" or
                    "hammer_start")
                or nil
        end))

AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ENGIEWORKABLE,
        function(inst)
            if inst:HasTag("beaver") then
                return not inst.sg:HasStateTag("gnawing") and "gnaw" or nil
            end
            return not inst.sg:HasStateTag("prehammer") and "hammer_start" or nil
        end))

-- Emote
local ranchocommands = { "ranchorelaxo", "relaxo", "engineer" }

GLOBAL.AddModUserCommand("ranchorelaxo", "rancho", {
	aliases = ranchocommands,
	prettyname = function(command) return "engineer emote" end,
	desc = function() return "Perform an emote!" end,
	permission = "USER",
	params = {},
	emote = true,
	slash = true,
	usermenu = false,
	servermenu = false,
	vote = false,
    serverfn = function(params, caller)
		local player = GLOBAL.UserToPlayer(caller.userid)
		if player ~= nil and player.prefab == "engineer" then
		if player.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) == nil then --Lazy cheat, don't replicate this
				player:PushEvent("emote", { anim = { "pre_rancho", "loop_rancho" }, loop = true })
			end
		end
		if player ~= nil and player.prefab == "engineer" then
		if player.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) ~= nil then
		player:PushEvent("emote", { anim = { "pre_rancho_carry", "loop_rancho_carry" }, loop = true })
			end
		end
    end,
    localfn = function(params, caller)
		local player = GLOBAL.UserToPlayer(caller.userid)
		if player ~= nil and player.prefab == "engineer" then
		if player.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) == nil then
				player:PushEvent("emote", { anim = { "pre_rancho", "loop_rancho" }, loop = true })
			end
		end
		if player ~= nil and player.prefab == "engineer" then
		if player.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) ~= nil then
		player:PushEvent("emote", { anim = { "pre_rancho_carry", "loop_rancho_carry" }, loop = true })
			end
		end
    end,
})

local anim = "emote_rancho.zip"

--

GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ENGINEER = 
{
	GENERIC = "Greetings, %s!",
	ATTACKER = "%s is holding that wrench pretty tightly...",
	MURDERER = "Murderer!",
	REVIVER = "%s, always there to support.",
	GHOST = "Better concoct a revival device. Can't leave another man of science floating.",
	FIRESTARTER = "Burning that wasn't very scientific, %s.",
}
--More characters
--<default>'s TF2 characters
AddPrefabPostInit("forest", function(inst)
    if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.ENGINEER = 
{
	GENERIC = "That %s is a bloody spy!",
	ATTACKER = "That %s is a bloody traitor!",
	MURDERER = "Cold-blooded murderer!",
	REVIVER = "%s, I didn't need yer help, you know.",
	GHOST = "You're weak. I'm strong. and I win, toymaker!",
	FIRESTARTER = "If you were huntin' trouble, lad, ya found it.",
}
end
    if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.ENGINEER = 
{
	GENERIC = "That %s is a spy!",
	ATTACKER = "Stop hiding behind your little toys and fight like a man!",
	MURDERER = "I will eat your ribs, I will eat them up!",
	REVIVER = "You have served me well, Engie.",
	GHOST = "That's where books get you, professor!",
	FIRESTARTER = "Go back to Calgary, ya cow-herdin' fire-startin' Canadian!",
}
end
end)

GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.ENGINEER = 
{
	GENERIC = "Hi, %s!",
	ATTACKER = "Your goggles fogged, %s?",
	MURDERER = "Burn! Both you and your machines!",
	REVIVER = "%s won't leave anyone behind.",
	GHOST = "I better get a heart for %s.",
	FIRESTARTER = "%s! That's a good start, but now build a fire machine!",
}
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ENGINEER = 
{
	GENERIC = "Is tiny egghead-man, %s! Hello!",
	ATTACKER = "Does weak builder man want to fight?",
	MURDERER = "%s is killer!",
	REVIVER = "%s smell like oil and kindness.",
	GHOST = "Ha ha! Big brain did not save you. I will go get heart.",
	FIRESTARTER = "%s is lighting burny fires!",
}
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.ENGINEER = 
{
	GENERIC = "How do you do, %s?",
	ATTACKER = "%s's machines are not to be trusted.",
	MURDERER = "I'll send you some place much nicer than this, %s.",
	REVIVER = "Abigail likes you, %s.",
	GHOST = "Did one of your machines turn? ...I'll get a heart.",
	FIRESTARTER = "Are you building a new fire-related machine, %s?",
}
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.ENGINEER = 
{
	GENERIC = "DETECTING... %s!",
	ATTACKER = "I WILL RECLAIM MY FAMILY FROM YOUR MEATY HANDS, %s!",
	MURDERER = "YOUR MEATBRAIN IS OBSOLETE, %s! DIE!",
	REVIVER = "THIS DOES NOT MAKE UP FOR HOGGING MY FAMILY, %s",
	GHOST = "WHERE ARE YOUR METAL PROTECTION UNITS NOW, %s? HA. HA.",
	FIRESTARTER = "NEEDLESS DESTRUCTION? CHECK. HOMEWRECKER? CHECK.",
}
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ENGINEER = 
{
	GENERIC = "Ah, greetings dear %s!",
	ATTACKER = "Don't go building up trouble, %s!",
	MURDERER = "Let's see whose brains comes out on top, %s!",
	REVIVER = "Building up trust, %s.",
	GHOST = "%s, those metal parts can be sharp. Let me get the hearts.",
	FIRESTARTER = "Are you burning metal, %s? I hope you know what you are doing.",
}
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.ENGINEER = 
{
	GENERIC = "It's my builder buddy, %s!",
	ATTACKER = "%s could be a bit more considerate...",
	MURDERER = "This is gonna be a clear cut!",
	REVIVER = "That's some good work ya did, %s.",
	GHOST = "You know where I can get a heart, %s?",
	FIRESTARTER = "As long as you keep burning metal and not wood, we're good.",
}
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ENGINEER = 
{
	GENERIC = "Good day to you, Mr %s.",
	ATTACKER = "%s is preparing his machinery...",
	MURDERER = "Do not start fights you cannot win single-handedly!",
	REVIVER = "%s has excellent command of construction.",
	GHOST = "Do you desire a heart, %s?",
	FIRESTARTER = "I feel as if construction does not involve burning your creations down.",
}
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.ENGINEER = 
{
	GENERIC = "Wisdom and construction guide you, %s!",
	ATTACKER = "Your honor wavers, %s.",
	MURDERER = "%s! Let us settle this in battle!",
	REVIVER = "%s protects our people.",
	GHOST = "A heart shall wrench %s back from the jaws of death!",
	FIRESTARTER = "I'll not question your process, %s.",
}
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.ENGINEER = 
{
	GENERIC = "Hi %s! Have you been polishing your helmet?",
	ATTACKER = "Why are you being so mean, %s?",
	MURDERER = "We won't let you hurt our friends!",
	REVIVER = "%s is very smart and likes to build cool stuff!",
	GHOST = "Don't worry %s, we'll get you a heart!",
	FIRESTARTER = "Um. I think you lit a fire, %s.",
}

AddMinimapAtlas("images/minimap/engineer.xml")
AddMinimapAtlas("images/minimap/esentry.xml")
AddMinimapAtlas("images/minimap/dispenser.xml")
AddMinimapAtlas("images/minimap/eteleporter.xml")
AddModCharacter("engineer", "MALE")
modimport("scripts/engineermod_skins.lua")