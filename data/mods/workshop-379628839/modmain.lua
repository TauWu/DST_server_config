PrefabFiles = {
	"medic",
	"medic_skins",
	"bonesaw",
	"ubersaw",
	"amputator",
	"vitasaw",
	"blowdart_health",
	"medickits",
}

Assets = {

    Asset( "IMAGE", "bigportraits/medic.tex" ),
    Asset( "ATLAS", "bigportraits/medic.xml" ),
	Asset( "IMAGE", "bigportraits/medic_none.tex" ),
    Asset( "ATLAS", "bigportraits/medic_none.xml" ),
	--Skins
	Asset( "IMAGE", "bigportraits/medic_blu.tex" ),
    Asset( "ATLAS", "bigportraits/medic_blu.xml" ),
	Asset( "IMAGE", "bigportraits/medic_survivor.tex" ),
    Asset( "ATLAS", "bigportraits/medic_survivor.xml" ),
	Asset( "IMAGE", "bigportraits/medic_formal.tex" ),
    Asset( "ATLAS", "bigportraits/medic_formal.xml" ),
	Asset( "IMAGE", "bigportraits/medic_shadow.tex" ),
    Asset( "ATLAS", "bigportraits/medic_shadow.xml" ),
	--
	Asset( "IMAGE", "images/map_icons/medic.tex" ),
	Asset( "ATLAS", "images/map_icons/medic.xml" ),
	Asset( "IMAGE", "images/avatars/avatar_medic.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_medic.xml" ),
	Asset( "IMAGE", "images/avatars/avatar_ghost_medic.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_medic.xml" ),
	Asset( "IMAGE", "images/avatars/self_inspect_medic.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_medic.xml" ),
	Asset( "IMAGE", "images/names_medic.tex" ),
    Asset( "ATLAS", "images/names_medic.xml" ),
	Asset( "IMAGE", "images/names_gold_medic.tex" ),
    Asset( "ATLAS", "images/names_gold_medic.xml" ),
	
    Asset("IMAGE", "images/map_icons/largemedkit.tex"),
	Asset("ATLAS", "images/map_icons/largemedkit.xml"),
	Asset("IMAGE", "images/map_icons/medimedkit.tex"),
	Asset("ATLAS", "images/map_icons/medimedkit.xml"),
	Asset("IMAGE", "images/map_icons/smallmedkit.tex"),
	Asset("ATLAS", "images/map_icons/smallmedkit.xml"),
	
	Asset("SOUNDPACKAGE", "sound/medic.fev"),
    Asset("SOUND", "sound/medic.fsb"),
	
}

local Recipe = GLOBAL.Recipe
local ACTIONS = GLOBAL.ACTIONS
local ActionHandler = GLOBAL.ActionHandler

TUNING.BONESAW_DAMAGE = GetModConfigData("bonesawdmg")
TUNING.UBERSAW_DAMAGE = GetModConfigData("ubersawdmg")
TUNING.UBERSAW_HEALTH = GetModConfigData("uberhealth")
TUNING.AMPUTATOR_DAMAGE = GetModConfigData("ampudmg")
TUNING.AMPUTATOR_HEALTH = GetModConfigData("ampuhealth")
TUNING.VITASAW_HEALTH = GetModConfigData("vitasawhpgrant")
TUNING.VITASAW_MIN_DAMAGE = GetModConfigData("vitadmg")
--TUNING.VITASAW_MAX_DAMAGE = GetModConfigData("maxvitadmg")
TUNING.MEDICDART_HEALTH = GetModConfigData("healthdartmedichp")
TUNING.BONESAW_USES = GetModConfigData("bonesawuses")
TUNING.UBERSAW_USES = GetModConfigData("ubersawuses")
TUNING.AMPUTATOR_USES = GetModConfigData("ampuuses")
TUNING.VITASAW_USES = GetModConfigData("vitauses")
TUNING.SMALLHEALTH_HEALTH = GetModConfigData("smedkithealth")
TUNING.MEDIUMHEALTH_HEALTH = GetModConfigData("medmedkithealth")
TUNING.LARGEHEALTH_HEALTH = GetModConfigData("lmedkithealth")
TUNING.MEDICHP_REGEN = GetModConfigData("medicregen")

modimport("scripts/strings.lua")
--Bonesaw
local recipe_difficulty = GetModConfigData("Bonesaw_Difficulty")
if recipe_difficulty == "default" then
local bonesawrecipe = AddRecipe("bonesaw", {Ingredient("boneshard", 5), Ingredient("flint", 3)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE, nil, nil, nil, nil, "medic", "images/inventoryimages/bonesaw.xml")
bonesawrecipe.sortkey = -4
elseif recipe_difficulty == "hard" then
local bonesawrecipe = AddRecipe("bonesaw", {Ingredient("boneshard", 6), Ingredient("flint", 5)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "medic", "images/inventoryimages/bonesaw.xml")
bonesawrecipe.sortkey = -4
elseif recipe_difficulty == "harder" then
local bonesawrecipe = AddRecipe("bonesaw", {Ingredient("boneshard", 6), Ingredient("flint", 6), Ingredient("twigs", 3)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/bonesaw.xml")
bonesawrecipe.sortkey = -4
elseif recipe_difficulty == "easy" then
local bonesawrecipe = AddRecipe("bonesaw", {Ingredient("boneshard", 3), Ingredient("flint", 2)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE, nil, nil, nil, nil, "medic", "images/inventoryimages/bonesaw.xml")
bonesawrecipe.sortkey = -4
end

-- Übersaw
local recipe_difficulty = GetModConfigData("Ubersaw_Difficulty")
if recipe_difficulty == "default" then
local ubersawrecipe = AddRecipe("ubersaw", {Ingredient("lifeinjector", 1), Ingredient("twigs", 4), Ingredient("flint", 1)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/ubersaw.xml")
ubersawrecipe.sortkey = -3
elseif recipe_difficulty == "hard" then
local ubersawrecipe = AddRecipe("ubersaw", {Ingredient("lifeinjector", 1), Ingredient("twigs", 5), Ingredient("red_cap", 3)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/ubersaw.xml")
ubersawrecipe.sortkey = -3
elseif recipe_difficulty == "harder" then
local ubersawrecipe = AddRecipe("ubersaw", {Ingredient("lifeinjector", 2), Ingredient("log", 3), Ingredient("healingsalve", 2)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/ubersaw.xml")
ubersawrecipe.sortkey = -3
elseif recipe_difficulty == "easy" then
local ubersawrecipe = AddRecipe("ubersaw", {Ingredient("healingsalve", 2), Ingredient("twigs", 3)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/ubersaw.xml")
ubersawrecipe.sortkey = -3
end

-- Amputator
local recipe_difficulty = GetModConfigData("Amputator_Difficulty")
if recipe_difficulty == "default" then
local amputatorrecipe = AddRecipe("amputator", {Ingredient("goldnugget", 2), Ingredient("flint", 5), Ingredient("healingsalve", 1)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.MAGIC_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/amputator.xml")
amputatorrecipe.sortkey = -1
elseif recipe_difficulty == "hard" then
local amputatorrecipe = AddRecipe("amputator", {Ingredient("goldnugget", 3), Ingredient("flint", 5), Ingredient("healingsalve", 2)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.MAGIC_THREE, nil, nil, nil, nil, "medic", "images/inventoryimages/amputator.xml")
amputatorrecipe.sortkey = -1
elseif recipe_difficulty == "harder" then
local amputatorrecipe = AddRecipe("amputator", {Ingredient("goldnugget", 5), Ingredient("flint", 5), Ingredient("small_medkit", 3, "images/inventoryimages/small_medkit.xml")}, GLOBAL.RECIPETABS.MAGIC, GLOBAL.TECH.MAGIC_THREE, nil, nil, nil, nil, "medic", "images/inventoryimages/amputator.xml")
amputatorrecipe.sortkey = -1
elseif recipe_difficulty == "easy" then
local amputatorrecipe = AddRecipe("amputator", {Ingredient("goldnugget", 2), Ingredient("flint", 4)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/amputator.xml")
amputatorrecipe.sortkey = -1
end

-- Vita-saw
local recipe_difficulty = GetModConfigData("Vitasaw_Difficulty")
if recipe_difficulty == "default" then
local vitasawrecipe = AddRecipe("vitasaw", {Ingredient("log", 1), Ingredient("stinger", 1), Ingredient("twigs", 5)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "medic", "images/inventoryimages/vitasaw.xml")
vitasawrecipe.sortkey = -2
elseif recipe_difficulty == "hard" then
local vitasawrecipe = AddRecipe("vitasaw", {Ingredient("small_medkit", 1, "images/inventoryimages/small_medkit.xml"), Ingredient("stinger", 2), Ingredient("twigs", 5)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/vitasaw.xml")
vitasawrecipe.sortkey = -2
elseif recipe_difficulty == "harder" then
local vitasawrecipe = AddRecipe("vitasaw", {Ingredient("log", 2), Ingredient("lifeinjector", 1), Ingredient("twigs", 5)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/vitasaw.xml")
vitasawrecipe.sortkey = -2
elseif recipe_difficulty == "easy" then
local vitasawrecipe = AddRecipe("vitasaw", {Ingredient("log", 1), Ingredient("stinger", 1), Ingredient("twigs", 1)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE, nil, nil, nil, nil, "medic", "images/inventoryimages/vitasaw.xml")
vitasawrecipe.sortkey = -2
end

-- Crusader's Crossbow
local recipe_difficulty = GetModConfigData("Medicblowdart_Difficulty")
if recipe_difficulty == "default" then
local blowdart_healthrecipe = AddRecipe("blowdart_health", {Ingredient("cutreeds", 2), Ingredient("spidergland", 1), Ingredient("feather_robin", 1)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "medic", "images/inventoryimages/blowdart_health.xml")
blowdart_healthrecipe.sortkey = -1
elseif recipe_difficulty == "hard" then
local blowdart_healthrecipe = AddRecipe("blowdart_health", {Ingredient("cutreeds", 2), Ingredient("small_medkit", 1, "images/inventoryimages/small_medkit.xml"), Ingredient("feather_robin", 1)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "medic", "images/inventoryimages/blowdart_health.xml")
blowdart_healthrecipe.sortkey = -1
elseif recipe_difficulty == "harder" then
local blowdart_healthrecipe = AddRecipe("blowdart_health", {Ingredient("cutreeds", 3), Ingredient("small_medkit", 2, "images/inventoryimages/small_medkit.xml"), Ingredient("feather_robin", 2)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/blowdart_health.xml")
blowdart_healthrecipe.sortkey = -1
elseif recipe_difficulty == "easy" then
local blowdart_healthrecipe = AddRecipe("blowdart_health", {Ingredient("cutreeds", 1), Ingredient("spidergland", 1)}, GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE, nil, nil, nil, nil, "medic", "images/inventoryimages/blowdart_health.xml")
blowdart_healthrecipe.sortkey = -1
end

--Med-kits:  3 Default, 2 Easy, 1 Easier, 4 Harder, 5 Even Harder, 6 Even More Harder, 7 "Extreme"
if GetModConfigData("medkitrecipes") == 3 then
local small_medkitrecipe = AddRecipe("small_medkit", {Ingredient("red_cap", 1), Ingredient("ash", 2)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.NONE, nil, nil, nil, nil, "medic", "images/inventoryimages/small_medkit.xml", "small_medkit.tex")
small_medkitrecipe.sortkey = -3
elseif GetModConfigData("medkitrecipes") == 1 then
local small_medkitrecipe = AddRecipe("small_medkit", {Ingredient("ash", 1)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.NONE, nil, nil, nil, nil, "medic", "images/inventoryimages/small_medkit.xml", "small_medkit.tex")
small_medkitrecipe.sortkey = -3
elseif GetModConfigData("medkitrecipes") == 2 then
local small_medkitrecipe = AddRecipe("small_medkit", {Ingredient("red_cap", 1)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.NONE, nil, nil, nil, nil, "medic", "images/inventoryimages/small_medkit.xml", "small_medkit.tex")
small_medkitrecipe.sortkey = -3
elseif GetModConfigData("medkitrecipes") == 4 then
local small_medkitrecipe = AddRecipe("small_medkit", {Ingredient("red_cap", 2), Ingredient("ash", 3)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.NONE, nil, nil, nil, nil, "medic", "images/inventoryimages/small_medkit.xml", "small_medkit.tex")
small_medkitrecipe.sortkey = -3
elseif GetModConfigData("medkitrecipes") == 5 then
local small_medkitrecipe = AddRecipe("small_medkit", {Ingredient("red_cap", 3), Ingredient("spidergland", 1)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.NONE, nil, nil, nil, nil, "medic", "images/inventoryimages/small_medkit.xml", "small_medkit.tex")
small_medkitrecipe.sortkey = -3
elseif GetModConfigData("medkitrecipes") == 6 then
local small_medkitrecipe = AddRecipe("small_medkit", {Ingredient("red_cap", 5), Ingredient("spidergland", 4), Ingredient("ash", 2)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "medic", "images/inventoryimages/small_medkit.xml", "small_medkit.tex")
small_medkitrecipe.sortkey = -3
elseif GetModConfigData("medkitrecipes") == 7 then
local small_medkitrecipe = AddRecipe("small_medkit", {Ingredient("blue_cap", 2), Ingredient("red_cap", 7), Ingredient("healingsalve", 1)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "medic", "images/inventoryimages/small_medkit.xml", "small_medkit.tex")
small_medkitrecipe.sortkey = -3
end
--Medium
if GetModConfigData("medkitrecipes") == 3 then
local med_medkitrecipe = AddRecipe("med_medkit", {Ingredient("small_medkit",3, "images/inventoryimages/small_medkit.xml"), Ingredient("twigs", 2)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "medic", "images/inventoryimages/med_medkit.xml", "med_medkit.tex")
med_medkitrecipe.sortkey = -2
elseif GetModConfigData("medkitrecipes") == 1 then
local med_medkitrecipe = AddRecipe("med_medkit", {Ingredient("small_medkit",1, "images/inventoryimages/small_medkit.xml")}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.NONE, nil, nil, nil, nil, "medic", "images/inventoryimages/med_medkit.xml", "med_medkit.tex")
med_medkitrecipe.sortkey = -2
elseif GetModConfigData("medkitrecipes") == 2 then
local med_medkitrecipe = AddRecipe("med_medkit", {Ingredient("small_medkit",1, "images/inventoryimages/small_medkit.xml"), Ingredient("twigs", 1)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "medic", "images/inventoryimages/med_medkit.xml", "med_medkit.tex")
med_medkitrecipe.sortkey = -2
elseif GetModConfigData("medkitrecipes") == 4 then
local med_medkitrecipe = AddRecipe("med_medkit", {Ingredient("small_medkit",3, "images/inventoryimages/small_medkit.xml"), Ingredient("twigs", 4)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "medic", "images/inventoryimages/med_medkit.xml", "med_medkit.tex")
med_medkitrecipe.sortkey = -2
elseif GetModConfigData("medkitrecipes") == 5 then
local med_medkitrecipe = AddRecipe("med_medkit", {Ingredient("small_medkit",4, "images/inventoryimages/small_medkit.xml"), Ingredient("twigs", 4), Ingredient("cutgrass", 2)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "medic", "images/inventoryimages/med_medkit.xml", "med_medkit.tex")
med_medkitrecipe.sortkey = -2
elseif GetModConfigData("medkitrecipes") == 6 then
local med_medkitrecipe = AddRecipe("med_medkit", {Ingredient("small_medkit",5, "images/inventoryimages/small_medkit.xml"), Ingredient("twigs", 4), Ingredient("cutgrass", 4)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/med_medkit.xml", "med_medkit.tex")
med_medkitrecipe.sortkey = -2
elseif GetModConfigData("medkitrecipes") == 7 then
local med_medkitrecipe = AddRecipe("med_medkit", {Ingredient("small_medkit",5, "images/inventoryimages/small_medkit.xml"), Ingredient("twigs", 5), Ingredient("bandage", 1)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/med_medkit.xml", "med_medkit.tex")
med_medkitrecipe.sortkey = -2
end
--Large
if GetModConfigData("medkitrecipes") == 3 then
local large_medkitrecipe = AddRecipe("large_medkit", {Ingredient("cutgrass", 1), Ingredient("med_medkit",1, "images/inventoryimages/med_medkit.xml"), Ingredient("twigs", 2)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/medkit_large.xml", "medkit_large.tex")
large_medkitrecipe.sortkey = -1
elseif GetModConfigData("medkitrecipes") == 1 then
local large_medkitrecipe = AddRecipe("large_medkit", {Ingredient("small_medkit",2, "images/inventoryimages/small_medkit.xml")}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "medic", "images/inventoryimages/medkit_large.xml", "medkit_large.tex")
large_medkitrecipe.sortkey = -1
elseif GetModConfigData("medkitrecipes") == 2 then
local large_medkitrecipe = AddRecipe("large_medkit", {Ingredient("twigs", 2), Ingredient("small_medkit", 2, "images/inventoryimages/small_medkit.xml")}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "medic", "images/inventoryimages/medkit_large.xml", "medkit_large.tex")
large_medkitrecipe.sortkey = -1
elseif GetModConfigData("medkitrecipes") == 4 then
local large_medkitrecipe = AddRecipe("large_medkit", {Ingredient("cutgrass", 3), Ingredient("med_medkit",1, "images/inventoryimages/med_medkit.xml"), Ingredient("twigs", 3)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/medkit_large.xml", "medkit_large.tex")
large_medkitrecipe.sortkey = -1
elseif GetModConfigData("medkitrecipes") == 5 then
local large_medkitrecipe = AddRecipe("large_medkit", {Ingredient("rocks", 3), Ingredient("med_medkit",1, "images/inventoryimages/med_medkit.xml"), Ingredient("cutgrass", 4)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/medkit_large.xml", "medkit_large.tex")
large_medkitrecipe.sortkey = -1
elseif GetModConfigData("medkitrecipes") == 6 then
local large_medkitrecipe = AddRecipe("large_medkit", {Ingredient("cutstone", 3), Ingredient("med_medkit",2, "images/inventoryimages/med_medkit.xml"), Ingredient("cutgrass", 5)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/medkit_large.xml", "medkit_large.tex")
large_medkitrecipe.sortkey = -1
elseif GetModConfigData("medkitrecipes") == 7 then
local large_medkitrecipe = AddRecipe("large_medkit", {Ingredient("healingsalve", 1), Ingredient("med_medkit",2, "images/inventoryimages/med_medkit.xml"), Ingredient("bandage", 1)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "medic", "images/inventoryimages/medkit_large.xml", "medkit_large.tex")
large_medkitrecipe.sortkey = -1
end

local TF2MEDHEAL = GLOBAL.Action({ priority=10, rmb=true, distance=10, mount_valid=false })	
TF2MEDHEAL.str = "Heal"
TF2MEDHEAL.id = "TF2MEDHEAL"
TF2MEDHEAL.fn = function(act)
    local obj = act.target or act.invobject
    if obj ~= nil and obj:HasTag("heftyheal") and obj.components.edible ~= nil and act.doer.components.eater ~= nil then
        return act.doer.components.eater:Eat(obj)
    end
end
AddAction(TF2MEDHEAL)
AddComponentAction("INVENTORY", "edible", function(inst, doer, actions, right)
    if inst:HasTag("heftyheal") then
        table.insert(actions, ACTIONS.TF2MEDHEAL)
    end
end)
local medickit_handler = ActionHandler(ACTIONS.TF2MEDHEAL, function(inst) 
	if inst:HasTag("medic") then
	    return "eat"
	end
	if not inst:HasTag("medic") then
	    return "eat"
	end
end)
AddStategraphActionHandler("wilson", medickit_handler)
AddStategraphActionHandler("wilson_client", medickit_handler)

AddMinimapAtlas("images/map_icons/medic.xml")
AddMinimapAtlas("images/map_icons/largemedkit.xml")
AddMinimapAtlas("images/map_icons/medimedkit.xml")
AddMinimapAtlas("images/map_icons/smallmedkit.xml")
AddModCharacter("medic", "MALE")
modimport("scripts/medicmod_skins.lua")
modimport ("scripts/amputator_play.lua")