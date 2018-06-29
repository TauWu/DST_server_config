-----------
local require = GLOBAL.require
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
Recipe = GLOBAL.Recipe
local STRINGS = GLOBAL.STRINGS
local ACTIONS = GLOBAL.ACTIONS
TECH = GLOBAL.TECH
local IsServer = GLOBAL.TheNet:GetIsServer()
local containers = require("containers")

ACTIONS.GIVE.priority = 2
ACTIONS.ADDFUEL.priority = 4
ACTIONS.COOK.priority = 3
ACTIONS.USEITEM.priority = 2

local ThePlayer = GLOBAL.ThePlayer
-----------
local TheInput = GLOBAL.TheInput
-----------sleep--------
local Badge_type = GetModConfigData("badge_type")
local Difficult = GetModConfigData("difficultover")
local DifficultHealth = GetModConfigData("difficulthealth")
local DifficultDamage = GetModConfigData("difficultdamage")
local DifficultDamage_Range = GetModConfigData("difficultdamage_range")
local DifficultSanity = GetModConfigData("difficultsanity")
local death_penalty = GetModConfigData("deathPenalty")
local Loud_Lightning = GetModConfigData("loudlightning")
local Difficult_Recipe = GetModConfigData("difficultrecipe")
local Gem_Recipe = GetModConfigData("craftgems")
local avisual_Musha = GetModConfigData("avisual_musha")
local avisual_Princess = GetModConfigData("avisual_princess")
local avisual_Pirate = GetModConfigData("avisual_pirate")
local avisual_Pirate_Armor = GetModConfigData("avisual_pirate_armor")
local butterfly_shield = GetModConfigData("on_butterfly_shield")
local moontree_stop = GetModConfigData("stop_spawning")
local frostblade3rd = GetModConfigData("frostblade3rd")
local extra_backpack = GetModConfigData("extrabackpack")
local Smart = GetModConfigData("smartmusha")
local Diet = GetModConfigData("dietmusha")
local Dislike = GetModConfigData("favoritemusha")
local PuppyPrincess = GetModConfigData("princess_taste")
local Dtired = GetModConfigData("difficulttired")
local Dsleep = GetModConfigData("difficultsleep")
local Dmusic = GetModConfigData("difficultmusic")
local bodyguard_wilson = GetModConfigData("bodyguardwilson")
local share_item = GetModConfigData("shareitems")
local in_container =  GetModConfigData("incontainer")
local musha_in_container =  GetModConfigData("musha_incontainer")
local Mod_language =  GetModConfigData("modlanguage")
--in container
if in_container == 1 then
ACTIONS.RUMMAGE.priority = 1
ACTIONS.MOUNT.priority = 2
end
local Widget = require("widgets/widget")
local Image = require("widgets/image")
local Text = require("widgets/text")
local PlayerBadge = require("widgets/playerbadge")
local Badge = require("widgets/badge")

modimport("libs/env.lua")
-----------specific
use "data/actions/pickup"
use "data/components/inits"

 -----------
PrefabFiles = {
"musha",
"mushasword_frost",
"mushasword_base",
"mushasword",
"frosthammer",
"tentacle_frost",
"tentacle_shadow",
"broken_frosthammer",
"armor_mushaa",
"armor_mushab",
"hat_mprincess",
"hat_mbunny",
"hat_mphoenix",
"musha_flute",

"musha_small",
"musha_egg",
"musha_egg1",
"musha_egg2",
"musha_egg3",
"musha_eggs1",
"musha_eggs2",
"musha_eggs3",
"musha_egg8",

"ghosthound",	
"ghosthound2",	
"shadowmusha",

"cristal",
"forcefieldfxx",
"lightning2",
"lightning_blue",
"glowdust",
"exp",

"tent_musha",
	
"musha_egg_arong",	
"arong",
"arom",
"arong_baby",
"moontree",
"moonnutdrake",
"moonnutdrake2",
"moonbush",
"moonlight_plant",
"musha_egg_random",
"forge_musha",
"mushasword4",

"musha_spores",
"musha_spores2",
"musha_spores_fire",
"pirateback",
"musha_hut",
"assasin_wilson",

"musha_oven",
"musha_ovenfire",
"musha_ovenfire_cold",

"musha_treasure2",
"musha_hidden_egg",

"green_apple_plant",
"green_fruit",
"greenworm",
"tunacan",
	"bowm",
	"bowm_projectile",
	"arrowm",
	"poisonbubble2",
	"debuff",
	"phoenixspear",
	"hat_mwildcat",
	"green_ferns",
	"light_ferns",
	"musha_ferns",
	"apple_berry",
	"musha_spin_fx",
	"arrowm_broken",
	"musha_berry",
	"musha_bulb",
	"hat_mbunnya",
	"stalker_shield_musha",
	"portion_e",
	"musha_debuff",
	"sporecloud2",
	
}

Assets = {
Asset("SOUNDPACKAGE", "sound/bowm.fev"),
Asset("SOUND", "sound/bowm_sounds.fsb"),

 Asset( "ANIM", "anim/willow.zip"),
 Asset( "ANIM", "anim/wathgrithr.zip"),
  Asset( "ANIM", "anim/musha_spin_fx.zip"),
  
Asset( "ANIM", "anim/spellpower.zip" ),
Asset( "ANIM", "anim/stamina.zip" ),
Asset( "ANIM", "anim/fatigue.zip" ),

Asset( "ANIM", "anim/musha_normal.zip"),
Asset( "ANIM", "anim/musha_battle.zip"),
Asset( "ANIM", "anim/musha.zip"),
Asset( "ANIM", "anim/musha_hunger.zip"),

Asset( "ANIM", "anim/musha_full_sw2.zip"),
Asset( "ANIM", "anim/musha_normal_sw2.zip"),
Asset( "ANIM", "anim/musha_battle_sw2.zip"),
Asset( "ANIM", "anim/musha_hunger_sw2.zip"),
----
Asset( "ANIM", "anim/musha_normal_k.zip"),
Asset( "ANIM", "anim/musha_battle_k.zip"),
Asset( "ANIM", "anim/musha_full_k.zip"),
Asset( "ANIM", "anim/musha_hunger_k.zip"),
Asset( "ANIM", "anim/musha_old.zip"),
Asset( "ANIM", "anim/musha_normal_old.zip"),
Asset( "ANIM", "anim/musha_battle_old.zip"),
Asset( "ANIM", "anim/musha_hunger_old.zip"),
--Asset( "ANIM", "anim/musha_full_p_old.zip"),
--Asset( "ANIM", "anim/musha_normal_p_old.zip"),
--Asset( "ANIM", "anim/musha_battle_p_old.zip"),
--Asset( "ANIM", "anim/musha_hunger_p_old.zip"),
----
Asset("ANIM", "anim/player_actions_telescope.zip"),
Asset("ANIM", "anim/player_actions_uniqueitem_2.zip"),
Asset("ANIM", "anim/swap_telescope.zip"),
Asset("ANIM", "anim/messagebottle.zip"),
Asset( "ANIM", "anim/player_actions_speargun.zip" ),

--bow	
	Asset("ANIM", "anim/arrowm.zip"),
	Asset("ANIM", "anim/bowm.zip"),
    Asset("ANIM", "anim/swap_bowm.zip"),
	Asset("ANIM", "anim/swap_bowm2.zip"),
	Asset("ANIM", "anim/swap_bowm_boost.zip"),
	Asset("ANIM", "anim/swap_bowm_broken.zip"),
    Asset("ATLAS", "images/inventoryimages/bowm.xml"),
    Asset("IMAGE", "images/inventoryimages/bowm.tex"),
    Asset("ATLAS", "images/inventoryimages/arrowm.xml"),
    Asset("IMAGE", "images/inventoryimages/arrowm.tex"),
	Asset("ATLAS", "images/inventoryimages/dummy_arrow0.xml"),
    Asset("IMAGE", "images/inventoryimages/dummy_arrow0.tex"),
	Asset("ATLAS", "images/inventoryimages/dummy_arrow1.xml"),
    Asset("IMAGE", "images/inventoryimages/dummy_arrow1.tex"),
	Asset("ATLAS", "images/inventoryimages/dummy_arrow2.xml"),
    Asset("IMAGE", "images/inventoryimages/dummy_arrow2.tex"),
	Asset("ATLAS", "images/inventoryimages/dummy_arrow3.xml"),
    Asset("IMAGE", "images/inventoryimages/dummy_arrow3.tex"),
	Asset("ATLAS", "images/inventoryimages/dummy_arrow4.xml"),
    Asset("IMAGE", "images/inventoryimages/dummy_arrow4.tex"),
	Asset("ATLAS", "images/inventoryimages/arrowm_broken.xml"),
    Asset("IMAGE", "images/inventoryimages/arrowm_broken.tex"),
	
	Asset("ANIM", "anim/poison.zip"),
	Asset("ANIM", "anim/debuff_spark.zip"),
	Asset("ANIM", "anim/debuff_frozen.zip"),
	Asset("ANIM", "anim/debuff_spark_0.zip"),
	Asset("ANIM", "anim/sleep_debuff_30.zip"),
	Asset("ANIM", "anim/sleep_debuff_50.zip"),
	Asset("ANIM", "anim/sleep_debuff_70.zip"),
	Asset("ANIM", "anim/sleep_debuff_90.zip"),
	Asset("ANIM", "anim/tired_debuff_30.zip"),
	Asset("ANIM", "anim/tired_debuff_50.zip"),
	Asset("ANIM", "anim/tired_debuff_70.zip"),
	Asset("ANIM", "anim/tired_debuff_90.zip"),
	Asset("ANIM", "anim/sporecloud2.zip"),
----

Asset("ANIM", "anim/musha_egg_random.zip"),
Asset("ANIM", "anim/musha_egg8.zip"),
Asset("ANIM", "anim/musha_egg.zip"),
Asset("ANIM", "anim/musha_egg1.zip"),
Asset("ANIM", "anim/musha_egg2.zip"),
Asset("ANIM", "anim/musha_egg3.zip"),
Asset("ANIM", "anim/musha_eggs1.zip"),
Asset("ANIM", "anim/musha_eggs2.zip"),
Asset("ANIM", "anim/musha_eggs3.zip"),
Asset("ANIM", "anim/musha_ice.zip"),
Asset("ANIM", "anim/musha_small.zip"),
Asset("ANIM", "anim/musha_teen.zip"),
Asset("ANIM", "anim/musha_tall.zip"),
Asset("ANIM", "anim/musha_tall2.zip"),
Asset("ANIM", "anim/musha_tall3.zip"),
Asset("ANIM", "anim/musha_tall4.zip"),
Asset("ANIM", "anim/musha_tall5.zip"),

Asset("ANIM", "anim/frosthammer.zip"),
Asset("ANIM", "anim/swap_frosthammer.zip"),
Asset("ANIM", "anim/swap_frosthammer2.zip"),
Asset("ANIM", "anim/broken_frosthammer.zip"),
Asset("ANIM", "anim/swap_frostback.zip"),
Asset("ANIM", "anim/swap_frostpocket.zip"),
Asset("ANIM", "anim/hat_mwildcat.zip"),
Asset("ANIM", "anim/hat_mwildcat2.zip"),
  Asset("ATLAS", "images/inventoryimages/hat_mwildcat.xml"),
  Asset("IMAGE", "images/inventoryimages/hat_mwildcat.tex"),
Asset("ANIM", "anim/hat_mbunny.zip"),
Asset("ANIM", "anim/hat_mbunny2.zip"),
Asset("ANIM", "anim/hat_mbunnya.zip"),
Asset("ANIM", "anim/hat_mbunnya2.zip"),
Asset("ANIM", "anim/hat_mphoenix.zip"),
Asset("ANIM", "anim/hat_mphoenix2.zip"),
Asset("ANIM", "anim/hat_mcrown.zip"),
Asset("ANIM", "anim/hat_mprincess.zip"),
Asset("ANIM", "anim/ghosthound.zip"),
Asset("ANIM", "anim/armor_mushaa.zip"),
Asset("ANIM", "anim/armor_mushab.zip"),

Asset( "ANIM", "anim/tent_musha.zip"),
Asset( "ANIM", "anim/tent_musha_on.zip"),
Asset( "ANIM", "anim/tent_musha_broken.zip"),

Asset( "ANIM", "anim/forge_musha.zip"),
Asset( "ANIM", "anim/forge_musha_on.zip"),
Asset( "ANIM", "anim/forge_musha_broken.zip"),

Asset( "ANIM", "anim/musha_hut.zip"),
Asset( "ANIM", "anim/musha_hut_shdw.zip"),

Asset( "ANIM", "anim/armor_butterfly_s.zip"),
Asset( "ANIM", "anim/armor_butterfly.zip"),
Asset( "ANIM", "anim/armor_butterfly_blue_s.zip"),
Asset( "ANIM", "anim/armor_butterfly_blue.zip"),
Asset( "ANIM", "anim/armor_butterfly_green_s.zip"),
Asset( "ANIM", "anim/armor_butterfly_pink_s.zip"),
Asset( "ANIM", "anim/musha_backpack.zip"),
Asset( "ANIM", "anim/musha_backpack2.zip"),
Asset( "ANIM", "anim/musha_backpack3.zip"),
Asset( "ANIM", "anim/musha_backpack4_mini.zip"),
Asset( "ANIM", "anim/musha_backpack5_mini.zip"),
Asset( "ANIM", "anim/armor_frostar.zip"),
Asset( "ANIM", "anim/armor_pirate.zip"),

Asset("ANIM", "anim/ui_chest_yamche0.zip"),
Asset("ANIM", "anim/ui_chest_yamche1.zip"),
Asset("ANIM", "anim/ui_chest_yamche2.zip"),
Asset("ANIM", "anim/hat_yamche.zip"),
Asset("ANIM", "anim/hat_yamche_on.zip"),
Asset("ANIM", "anim/hat_house.zip"),
Asset("ANIM", "anim/ui_frostsmall.zip"),
Asset("ANIM", "anim/ui_chest_frosthammer.zip"),
Asset("ANIM", "anim/ui_chest_frosthammer2.zip"),
Asset("ANIM", "anim/ui_mushab_2x3.zip"),

Asset("ANIM", "anim/lightning_blue.zip"),
Asset("ANIM", "anim/forcefieldx.zip"),
Asset("ANIM", "anim/glowdust.zip"),
Asset("ANIM", "anim/portion_e.zip"),
Asset("ANIM", "anim/cristal.zip"),
Asset("ANIM", "anim/exp.zip"),
Asset("ANIM", "anim/musha_flute.zip"),
Asset("ANIM", "anim/mushasword_base.zip"),
Asset("ANIM", "anim/mushasword_frost.zip"),
Asset("ANIM", "anim/mushasword.zip"),
Asset("ANIM", "anim/mushasword2.zip"),
Asset("ANIM", "anim/mushasword3.zip"),
Asset("ANIM", "anim/mushasword4.zip"),
Asset("ANIM", "anim/swap_mushasword_base.zip"),
Asset("ANIM", "anim/swap_mushasword_frost1.zip"),
Asset("ANIM", "anim/swap_mushasword_frost2.zip"),
Asset("ANIM", "anim/swap_mushasword_frost3.zip"),
Asset("ANIM", "anim/swap_mushasword.zip"),
Asset("ANIM", "anim/swap_mushasword2.zip"),
Asset("ANIM", "anim/swap_mushasword3.zip"),
Asset("ANIM", "anim/swap_phoenixaxe.zip"),
Asset("ANIM", "anim/swap_phoenixaxe2.zip"),
Asset("ANIM", "anim/swap_phoenixaxe_broken.zip"),
	Asset("ANIM", "anim/phoenixspear.zip"),
	Asset("ANIM", "anim/swap_phoenixspear.zip"),
	Asset("ANIM", "anim/swap_phoenixspear2.zip"),
	Asset("ANIM", "anim/swap_phoenixspear_2r.zip"),
	Asset("ANIM", "anim/swap_phoenixspear_broken.zip"),
Asset("ANIM", "anim/tentacle_frost.zip"),

Asset("ANIM", "anim/swap_mushasword_frost1_boost.zip"),
Asset("ANIM", "anim/swap_mushasword_frost2_boost.zip"),
Asset("ANIM", "anim/swap_mushasword_frost3_boost.zip"),
Asset("ANIM", "anim/swap_phoenixspear3rd.zip"),
Asset("ANIM", "anim/swap_mushasword_boost.zip"),
Asset("ANIM", "anim/swap_mushasword2_boost.zip"),
Asset("ANIM", "anim/swap_mushasword3_boost.zip"),


Asset("ANIM", "anim/arong_build.zip"),
Asset("ANIM", "anim/arom_build.zip"),
Asset("ANIM", "anim/musha_egg_arong.zip"),

 	Asset("ANIM", "anim/arong_baby_build.zip"),
	Asset("ANIM", "anim/arong_mini1_build.zip"),
	Asset("ANIM", "anim/arong_mini2_build.zip"),
	Asset("ANIM", "anim/arong_mini3_build.zip"),
	Asset("ANIM", "anim/arong_mini4_build.zip"),
	Asset("ANIM", "anim/arong_mini4_v_build.zip"),
	Asset("ANIM", "anim/arong_grow1_v_build.zip"),
	Asset("ANIM", "anim/arong_grow1_build.zip"),

Asset("ANIM", "anim/arom_personality_pudgy.zip"),
Asset("ANIM", "anim/arom_personality_ornery.zip"),
Asset("ANIM", "anim/arom_personality_docile.zip"),

Asset("ANIM", "anim/arong_personality_pudgy.zip"),
Asset("ANIM", "anim/arong_personality_ornery.zip"),
Asset("ANIM", "anim/arong_personality_docile.zip"),

Asset("ANIM", "anim/leif_moon_spring_build.zip"),
Asset("ANIM", "anim/leif_moon_build.zip"),
Asset("ANIM", "anim/leif_moon_fall_build.zip"),
Asset("ANIM", "anim/leif_moon_winter_build.zip"),

Asset("ANIM", "anim/apple_glowberry.zip"),
Asset("ANIM", "anim/green_ferns.zip"),
Asset("ANIM", "anim/light_ferns.zip"),
Asset("ANIM", "anim/moonbush.zip"),
Asset("ANIM", "anim/moondrake_build.zip"),
Asset("ANIM", "anim/moondrake2_build.zip"),

Asset("ANIM", "anim/swap_pirate_booty_bag.zip"),
Asset("ANIM", "anim/swap_pirate_musha_bag.zip"),
	Asset( "IMAGE", "images/inventoryimages/pirateback.tex" ),
	Asset( "ATLAS", "images/inventoryimages/pirateback.xml" ),	
	
Asset("ANIM", "anim/musha_oven.zip"),
Asset("ANIM", "anim/musha_oven_open.zip"),
Asset("ANIM", "anim/musha_oven_fire.zip"),
Asset("ANIM", "anim/musha_oven_fire_cold.zip"),
Asset("ATLAS", "images/inventoryimages/musha_oven.xml"),

	Asset("ANIM", "anim/x_marks_spot.zip"),
	Asset("IMAGE", "images/inventoryimages/x_mark.tex"),
	Asset("ATLAS", "images/inventoryimages/x_mark.xml"),		
	--Asset("IMAGE", "images/inventoryimages/musha_mark.tex"),
	--Asset("ATLAS", "images/inventoryimages/musha_mark.xml"),
	Asset("IMAGE", "images/inventoryimages/musha_treasure2.tex"),
	Asset("ATLAS", "images/inventoryimages/musha_treasure2.xml"),
	Asset("ANIM", "anim/green_apple.zip"),
	Asset("ANIM", "anim/green_fruit.zip"),	
	Asset("ANIM", "anim/green_fruit_cooked.zip"),	
	Asset("IMAGE", "images/inventoryimages/green_fruit.tex"),
	Asset("ATLAS", "images/inventoryimages/green_fruit.xml"),
	Asset("IMAGE", "images/inventoryimages/lesserf.tex"),
	Asset("ATLAS", "images/inventoryimages/lesserf.xml"),
	Asset("ATLAS", "images/inventoryimages/green_fruit_cooked.xml"),
	Asset("IMAGE", "images/inventoryimages/green_fruit_cooked.tex"),
	Asset("ANIM", "anim/swap_tunacan.zip"),
	Asset("ANIM", "anim/tuna.zip"),	
	Asset("IMAGE", "images/inventoryimages/tunacan.tex"),
	Asset("ATLAS", "images/inventoryimages/tunacan.xml"),	
	Asset("IMAGE", "images/inventoryimages/tunacan_open.tex"),
	Asset("ATLAS", "images/inventoryimages/tunacan_open.xml"),	

--yamche

Asset("IMAGE", "images/inventoryimages/musha_small.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teen.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teenice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrr5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrr5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrr6.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrr6.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tallrrrrrice.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp4.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp5.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp6.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rp7.tex"),
Asset("IMAGE", "images/inventoryimages/musha_rpice.tex"),

Asset("ATLAS", "images/inventoryimages/musha_small.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teen.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teenice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrr5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrr5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrr6.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrr6.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tallrrrrrice.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp5.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp6.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rp7.xml"),
Asset("ATLAS", "images/inventoryimages/musha_rpice.xml"),
	
-------------------------------musha_egg_random
Asset("IMAGE", "images/inventoryimages/musha_egg_random.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_eggs1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_eggs2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_eggs3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_random_cracked.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_cracked.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_cracked1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_cracked2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_cracked3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_crackeds1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_crackeds2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_crackeds3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_cooked.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg8.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_cracked8.tex"),

Asset("IMAGE", "images/inventoryimages/frosthammer.tex"),
Asset("IMAGE", "images/inventoryimages/broken_frosthammer.tex"),
Asset("IMAGE", "images/inventoryimages/frostback.tex"),
Asset("IMAGE", "images/inventoryimages/hat_mbunny.tex"),
Asset("IMAGE", "images/inventoryimages/hat_mbunnya.tex"),
Asset("IMAGE", "images/inventoryimages/hat_mphoenix.tex"),
Asset("IMAGE", "images/inventoryimages/hat_mcrown.tex"),
Asset("IMAGE", "images/inventoryimages/hat_mprincess.tex"),
Asset("IMAGE", "images/inventoryimages/armor_mushaa.tex"),
Asset("IMAGE", "images/inventoryimages/armor_mushab.tex"),
Asset("IMAGE", "images/inventoryimages/musha_flute.tex"),
Asset("IMAGE", "images/inventoryimages/mushasword_base.tex"),
Asset("IMAGE", "images/inventoryimages/mushasword_frost.tex"),
Asset("IMAGE", "images/inventoryimages/mushasword.tex"),
Asset("IMAGE", "images/inventoryimages/mushasword2.tex"),
Asset("IMAGE", "images/inventoryimages/mushasword3.tex"),
Asset("IMAGE", "images/inventoryimages/mushasword4.tex"),
Asset("IMAGE", "images/inventoryimages/phoenixspear.tex"),
Asset("ATLAS", "images/inventoryimages/phoenixspear.xml"),
Asset("IMAGE", "images/inventoryimages/blade_b.tex"),
Asset("IMAGE", "images/inventoryimages/blade_1.tex"),
Asset("IMAGE", "images/inventoryimages/blade_2.tex"),
Asset("IMAGE", "images/inventoryimages/blade_3.tex"),
--Asset("IMAGE", "images/inventoryimages/blade_4.tex"),
Asset("IMAGE", "images/inventoryimages/blade_f.tex"),
Asset("IMAGE", "images/inventoryimages/glowdust.tex"),
Asset("IMAGE", "images/inventoryimages/portion_e.tex"),
Asset("ATLAS", "images/inventoryimages/portion_e.xml"),
Asset("IMAGE", "images/inventoryimages/cristal.tex"),
Asset("IMAGE", "images/inventoryimages/exp.tex"),
Asset("IMAGE", "images/mushatab.tex"),
Asset("ATLAS", "images/mushatab.xml"),
Asset("ATLAS", "images/inventoryimages/frosthammer.xml"),
Asset("ATLAS", "images/inventoryimages/broken_frosthammer.xml"),
Asset("ATLAS", "images/inventoryimages/hat_mbunny.xml"),
Asset("ATLAS", "images/inventoryimages/hat_mcrown.xml"),
Asset("ATLAS", "images/inventoryimages/hat_mprincess.xml"),
Asset("ATLAS", "images/inventoryimages/armor_mushaa.xml"),
Asset("ATLAS", "images/inventoryimages/armor_mushab.xml"),
Asset("ATLAS", "images/inventoryimages/musha_flute.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword_base.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword2.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword3.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword4.xml"),
Asset("ATLAS", "images/inventoryimages/blade_f.xml"),
Asset("ATLAS", "images/inventoryimages/blade_b.xml"),
Asset("ATLAS", "images/inventoryimages/blade_1.xml"),
Asset("ATLAS", "images/inventoryimages/blade_2.xml"),
Asset("ATLAS", "images/inventoryimages/blade_3.xml"),
--Asset("ATLAS", "images/inventoryimages/blade_4.xml"),
Asset("ATLAS", "images/musha.xml"),
Asset("ATLAS", "images/mushas.xml"),
Asset( "ATLAS", "images/saveslot_portraits/musha.xml" ),
Asset( "ATLAS", "images/selectscreen_portraits/musha.xml" ),
Asset( "ATLAS", "images/selectscreen_portraits/musha_silho.xml" ),
Asset( "ATLAS", "bigportraits/musha.xml" ),
Asset("ATLAS", "images/inventoryimages/frosthammer.xml"),
Asset("ATLAS", "images/inventoryimages/broken_frosthammer.xml"),
Asset("ATLAS", "images/inventoryimages/frostback.xml"),
Asset("ATLAS", "images/inventoryimages/hat_mbunny.xml"),
Asset("ATLAS", "images/inventoryimages/hat_mphoenix.xml"),
Asset("ATLAS", "images/inventoryimages/hat_mcrown.xml"),
Asset("ATLAS", "images/inventoryimages/hat_mprincess.xml"),
Asset("ATLAS", "images/inventoryimages/armor_mushaa.xml"),
Asset("ATLAS", "images/inventoryimages/armor_mushab.xml"),
Asset("ATLAS", "images/inventoryimages/musha_flute.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword_base.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword_frost.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword2.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword3.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword4.xml"),
Asset("ATLAS", "images/inventoryimages/blade_b.xml"),
Asset("ATLAS", "images/inventoryimages/blade_1.xml"),
Asset("ATLAS", "images/inventoryimages/blade_2.xml"),
Asset("ATLAS", "images/inventoryimages/blade_3.xml"),
--Asset("ATLAS", "images/inventoryimages/blade_4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg8.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_cracked8.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_random.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_random_cracked.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_cracked.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_cracked1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_cracked2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_cracked3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_eggs1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_eggs2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_eggs3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_cracked.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_crackeds1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_crackeds2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_crackeds3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_cooked.xml"),

Asset("ATLAS", "images/inventoryimages/glowdust.xml"),
Asset("ATLAS", "images/inventoryimages/cristal.xml"),
Asset("ATLAS", "images/inventoryimages/exp.xml"),
Asset("ATLAS", "images/inventoryimages/tent_musha.xml"),
Asset("ATLAS", "images/inventoryimages/forge_musha.xml"),
Asset("ATLAS", "images/inventoryimages/musha_hut.xml"),	
-----------------
Asset( "IMAGE", "images/saveslot_portraits/musha.tex"),
Asset( "ATLAS", "images/saveslot_portraits/musha.xml"),
Asset( "IMAGE", "images/saveslot_portraits/musha.tex" ),
Asset( "ATLAS", "images/saveslot_portraits/musha.xml" ),
Asset( "IMAGE", "images/selectscreen_portraits/musha.tex" ),
Asset( "ATLAS", "images/selectscreen_portraits/musha.xml" ),
Asset( "IMAGE", "bigportraits/musha.tex" ),
Asset( "ATLAS", "bigportraits/musha.xml" ),
Asset( "IMAGE", "images/musha.tex" ),
Asset( "ATLAS", "images/musha.xml" ),
Asset( "IMAGE", "images/musha_mapicon.tex" ),
Asset( "ATLAS", "images/musha_mapicon.xml" ),
Asset( "IMAGE", "images/avatars/avatar_musha.tex" ),
Asset( "ATLAS", "images/avatars/avatar_musha.xml" ),
Asset( "IMAGE", "images/avatars/avatar_ghost_musha.tex" ),
Asset( "ATLAS", "images/avatars/avatar_ghost_musha.xml" ),
Asset( "IMAGE", "images/avatars/self_inspect_musha.tex" ),
Asset( "ATLAS", "images/avatars/self_inspect_musha.xml" ),
Asset( "IMAGE", "images/inventoryimages/musha_egg_arong.tex" ),
Asset( "ATLAS", "images/inventoryimages/musha_egg_arong.xml" ),
Asset( "IMAGE", "images/inventoryimages/musha_egg_cracked_arong.tex" ),
Asset( "ATLAS", "images/inventoryimages/musha_egg_cracked_arong.xml" ),
Asset( "IMAGE", "images/inventoryimages/arong.tex" ),
Asset( "ATLAS", "images/inventoryimages/arong.xml" ),
Asset( "IMAGE", "images/inventoryimages/arom.tex" ),
Asset( "ATLAS", "images/inventoryimages/arom.xml" ),
Asset( "IMAGE", "images/inventoryimages/arongbaby.tex" ),
Asset( "ATLAS", "images/inventoryimages/arongbaby.xml" ),
Asset( "IMAGE", "images/inventoryimages/moontree.tex" ),
Asset( "ATLAS", "images/inventoryimages/moontree.xml" ),
	
}

AddMinimapAtlas("images/inventoryimages/hat_mwildcat.xml")
AddMinimapAtlas("images/inventoryimages/hat_mphoenix.xml")
AddMinimapAtlas("images/inventoryimages/hat_mbunny.xml")
AddMinimapAtlas("images/inventoryimages/hat_mprincess.xml")
AddMinimapAtlas("images/inventoryimages/armor_mushaa.xml")
AddMinimapAtlas("images/inventoryimages/armor_mushab.xml")
AddMinimapAtlas("images/musha.xml")
AddMinimapAtlas("images/musha_mapicon.xml")
AddMinimapAtlas("images/mushas.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_random.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_random_cracked.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg8.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked8.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg1.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked1.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg2.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked2.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg3.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked3.xml")
AddMinimapAtlas("images/inventoryimages/musha_eggs1.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_crackeds1.xml")
AddMinimapAtlas("images/inventoryimages/musha_eggs2.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_crackeds2.xml")
AddMinimapAtlas("images/inventoryimages/musha_eggs3.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_crackeds3.xml")
AddMinimapAtlas("images/inventoryimages/musha_small.xml")
AddMinimapAtlas("images/inventoryimages/musha_teen.xml")
AddMinimapAtlas("images/inventoryimages/musha_tall.xml")
AddMinimapAtlas("images/inventoryimages/frosthammer.xml")
AddMinimapAtlas("images/inventoryimages/broken_frosthammer.xml")
AddMinimapAtlas("images/inventoryimages/mushasword_base.xml")
AddMinimapAtlas("images/inventoryimages/mushasword.xml")
AddMinimapAtlas("images/inventoryimages/mushasword4.xml")
AddMinimapAtlas("images/inventoryimages/blade_f.xml")
AddMinimapAtlas("images/inventoryimages/blade_b.xml")
AddMinimapAtlas("images/inventoryimages/blade_1.xml")
--AddMinimapAtlas("images/inventoryimages/blade_4.xml")
AddMinimapAtlas("images/inventoryimages/cristal.xml")
AddMinimapAtlas("images/inventoryimages/exp.xml")
AddMinimapAtlas("images/inventoryimages/tent_musha.xml")
AddMinimapAtlas("images/inventoryimages/forge_musha.xml")
AddMinimapAtlas("images/inventoryimages/arong.xml")
AddMinimapAtlas("images/inventoryimages/arom.xml")
AddMinimapAtlas("images/inventoryimages/arongbaby.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_arong.xml")
AddMinimapAtlas("images/inventoryimages/moontree.xml")
AddMinimapAtlas("images/inventoryimages/pirateback.xml")
AddMinimapAtlas("images/inventoryimages/musha_hut.xml")
AddMinimapAtlas("images/inventoryimages/musha_oven.xml")
AddMinimapAtlas("images/inventoryimages/x_mark.xml")
AddMinimapAtlas("images/inventoryimages/musha_treasure2.xml")
AddMinimapAtlas("images/inventoryimages/bowm.xml")
-----------
--translation

if Mod_language == "auto" then
	
	--ENG
	 KOR = 0
	 CHA = 0
	 RUS = 0
	
	for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
	 language = GLOBAL.KnownModIndex:GetModInfo(moddir).name
	if language == "한글 모드 서버 버전" or language == "한글 모드 클라이언트 버전" then 
	KOR = 1
	elseif language == "Chinese Language Pack" or language == "Chinese Plus" then
	CHA = 1
	elseif language == "Russian Language Pack" or language == "Russification Pack for DST" or language == "Russian For Mods (Client)" then
	RUS = 1
	end 
	end 

	if KOR == 1 then
	modimport("scripts/strings_musha_ko.lua")
	STRINGS.CHARACTERS.MUSHA = require "speech_musha_ko"
	elseif CHA == 1 then
	modimport("scripts/strings_musha_cn.lua")
	STRINGS.CHARACTERS.MUSHA = require "speech_musha_cn"
	elseif RUS == 1 then
	modimport("scripts/strings_musha_ru.lua")
	STRINGS.CHARACTERS.MUSHA = require "speech_musha_ru"
	else
	modimport("scripts/strings_musha_en.lua")
	STRINGS.CHARACTERS.MUSHA = require "speech_musha_en"
	end

elseif Mod_language == "korean" then
	modimport("scripts/strings_musha_ko.lua")
	STRINGS.CHARACTERS.MUSHA = require "speech_musha_ko"
elseif Mod_language == "chinese" then
	modimport("scripts/strings_musha_cn.lua")
	STRINGS.CHARACTERS.MUSHA = require "speech_musha_cn"
elseif Mod_language == "russian" then
	modimport("scripts/strings_musha_ru.lua")
	STRINGS.CHARACTERS.MUSHA = require "speech_musha_ru"
elseif Mod_language == "english" then
	modimport("scripts/strings_musha_en.lua")
	STRINGS.CHARACTERS.MUSHA = require "speech_musha_en"	

end

--STRINGS.CHARACTERS.MUSHA.DESCRIBE.MUSHA = {"pretty!", "A pretty dog..", "Resembles me.."}


--changed action 
--compatible with MyPet

ACTIONS.RUMMAGE.fn = function(act)
    local targ = act.target or act.invobject
	

    if targ ~= nil and targ.components.container ~= nil and not targ:HasTag("critter") and not targ:HasTag("yamcheb") then
 
        if targ.components.container:IsOpenedBy(act.doer) then
            targ.components.container:Close()
            act.doer:PushEvent("closecontainer", { container = targ })
            return true
        elseif targ.components.container:IsOpen() then
            return false, "INUSE"
        elseif targ.components.container.canbeopened then
            --Silent fail for opening containers in the dark
            if GLOBAL.CanEntitySeeTarget(act.doer, targ) then
                act.doer:PushEvent("opencontainer", { container = targ })
                targ.components.container:Open(act.doer)
            end
            return true
        end
		
	elseif targ ~= nil and targ.components.container ~= nil and (targ:HasTag("critter") or targ:HasTag("yamcheb")) then
		local owner = act.target.components.follower.leader
	if act.doer == owner then
 
        if targ.components.container:IsOpenedBy(act.doer) then
            targ.components.container:Close()
            act.doer:PushEvent("closecontainer", { container = targ })
            return true
        elseif targ.components.container:IsOpen() then
            return false, "INUSE"
        elseif targ.components.container.canbeopened then
            --Silent fail for opening containers in the dark
            if GLOBAL.CanEntitySeeTarget(act.doer, targ) then
                act.doer:PushEvent("opencontainer", { container = targ })
                targ.components.container:Open(act.doer)
            end
            return true
        end
	else
		return false
		
		end

	
end	
end

ACTIONS.PICKUP.fn = function(act)
if not act.doer:HasTag("critter") and not act.doer:HasTag("yamcheb") then
    if act.doer.components.inventory ~= nil and
        act.target ~= nil and
        act.target.components.inventoryitem ~= nil and
        (act.target.components.inventoryitem.canbepickedup or
        (act.target.components.inventoryitem.canbepickedupalive and not act.doer:HasTag("player"))) and
        not (act.target:IsInLimbo() or
            (act.target.components.burnable ~= nil and act.target.components.burnable:IsBurning()) or
            (act.target.components.projectile ~= nil and act.target.components.projectile:IsThrown())) then

		if act.doer.components.itemtyperestrictions ~= nil and not act.doer.components.itemtyperestrictions:IsAllowed(act.target) then
			return false, "restriction"
		end

        act.doer:PushEvent("onpickupitem", { item = act.target })

        --special case for trying to carry two backpacks
        if not act.target.components.inventoryitem.cangoincontainer and act.target.components.equippable and act.doer.components.inventory:GetEquippedItem(act.target.components.equippable.equipslot) then
            local item = act.doer.components.inventory:GetEquippedItem(act.target.components.equippable.equipslot)
            if item.components.inventoryitem and item.components.inventoryitem.cangoincontainer then
                
                --act.doer.components.inventory:SelectActiveItemFromEquipSlot(act.target.components.equippable.equipslot)
                act.doer.components.inventory:GiveItem(act.doer.components.inventory:Unequip(act.target.components.equippable.equipslot))
            else
                act.doer.components.inventory:DropItem(act.doer.components.inventory:GetEquippedItem(act.target.components.equippable.equipslot))
            end
            act.doer.components.inventory:Equip(act.target)
            return true
        end

        if act.doer:HasTag("player") and
            (   act.target.components.equippable ~= nil and
                not act.doer.components.inventory:GetEquippedItem(act.target.components.equippable.equipslot) or
                act.doer.components.inventory:GetNumSlots() <= 0
            ) then
            act.doer.components.inventory:Equip(act.target)
        else
            act.doer.components.inventory:GiveItem(act.target, nil, act.target:GetPosition())
        end
        return true
    end
elseif act.doer:HasTag("critter") or act.doer:HasTag("yamcheb") then	
	if act.doer.components.container ~= nil and
        act.target ~= nil and
        act.target.components.inventoryitem ~= nil and
        (act.target.components.inventoryitem.canbepickedup or
        (act.target.components.inventoryitem.canbepickedupalive )) and
        not (act.target:IsInLimbo() or
            (act.target.components.burnable ~= nil and act.target.components.burnable:IsBurning()) or
            (act.target.components.projectile ~= nil and act.target.components.projectile:IsThrown())) then

		if act.doer.components.itemtyperestrictions ~= nil and not act.doer.components.itemtyperestrictions:IsAllowed(act.target) then
			return false, "restriction"
		end

        act.doer:PushEvent("onpickupitem", { item = act.target })

    act.doer.components.container:GiveItem(act.target, nil, act.target:GetPosition())
        end
        return true
    


end
end

ACTIONS.HARVEST.fn = function(act)
    if act.target.components.crop ~= nil then
        local harvested = act.target.components.crop:Harvest(act.doer)
        return harvested
    elseif act.target.components.harvestable ~= nil then
        return act.target.components.harvestable:Harvest(act.doer)
    elseif act.target.components.stewer ~= nil then
        return act.target.components.stewer:Harvest(act.doer)
    elseif act.target.components.dryer ~= nil then
        return act.target.components.dryer:Harvest(act.doer)
    elseif act.target.components.occupiable ~= nil and act.target.components.occupiable:IsOccupied() then
        local item = act.target.components.occupiable:Harvest(act.doer)
        if item ~= nil then
			if not act.doer:HasTag("critter") and not act.doer:HasTag("yamcheb") then
			act.doer.components.inventory:GiveItem(item)
			elseif act.doer:HasTag("critter") or act.doer:HasTag("yamcheb") then
			act.doer.components.container:GiveItem(item)
			end
			return true
        end
    end
end


---adds state
local FRAMES = GLOBAL.FRAMES
local TimeEvent = GLOBAL.TimeEvent
local EventHandler = GLOBAL.EventHandler
local EQUIPSLOTS = GLOBAL.EQUIPSLOTS

local function DoMountSound(inst, mount, sound)
    if mount ~= nil and mount.sounds ~= nil then
        inst.SoundEmitter:PlaySound(mount.sounds[sound], nil, nil, true)
    end
end

local function DoTalkSound(inst)
    if inst.talksoundoverride ~= nil then
        inst.SoundEmitter:PlaySound(inst.talksoundoverride, "talk")
        return true
    elseif not inst:HasTag("mime") and not inst.keep_check then
        inst.SoundEmitter:PlaySound((inst.talker_path_override or "dontstarve/characters/")..(inst.soundsname or inst.prefab).."/talk_LP", "talk")
        return true
    end
end

local mtalk = GLOBAL.State(
{
        name = "talk",
        tags = { "idle", "talking" },

        onenter = function(inst, noanim)
			if not noanim and inst.keep_check and inst:HasTag("musha") then
			for k = 1, math.random(2, 3) do
                local aname = "mime" .. tostring(math.random(7))
                if k == 1 then
                    inst.AnimState:PlayAnimation(aname, false)
                else
                    inst.AnimState:PushAnimation(aname, false)
                end
            end
       
            elseif not noanim and not inst.keep_check then
                inst.AnimState:PlayAnimation(
                    inst.components.inventory:IsHeavyLifting() and
                    not (inst.components.rider ~= nil and inst.components.rider:IsRiding()) and
                    "heavy_dial_loop" or
                    "dial_loop",
                    true)
            end
            DoTalkSound(inst)
			if inst.keep_check then
			--inst.SoundEmitter:KillSound("talk")
			end
            inst.sg:SetTimeout(1.5 + math.random() * .5)
        end,

        ontimeout = function(inst)
            inst.sg:GoToState("idle")
        end,

        events =
        {
            EventHandler("donetalking", function(inst)
                inst.sg:GoToState("idle")
            end),
        },

        onexit = function(inst)
            inst.SoundEmitter:KillSound("talk")
        end,
    }
	)
AddStategraphState("wilson", mtalk)	
	
local shovel_start = GLOBAL.State(
{
        name = "dig_start",
        tags = { "predig", "working" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("shovel_pre")
			local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
			if weapon and weapon:HasTag("frost_spear") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixspear_2r", "phoenixspear")
			inst.AnimState:Show("ARM_carry") 
			inst.AnimState:Hide("ARM_normal")
			end
        end,

        events =
        {
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("dig")
                end
            end),
        },
		onexit = function(inst)
 			local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
			if weapon and weapon:HasTag("frost_spear") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixspear2", "phoenixspear")
			inst.AnimState:Show("ARM_carry") 
			inst.AnimState:Hide("ARM_normal")
			end
        end
    }
	)
AddStategraphState("wilson", shovel_start)

local shovel = GLOBAL.State(
{
        name = "dig",
        tags = { "predig", "digging", "working" },

        onenter = function(inst)
			local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
			if weapon and weapon:HasTag("frost_spear") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixspear_2r", "phoenixspear")
			inst.AnimState:Show("ARM_carry") 
			inst.AnimState:Hide("ARM_normal")
			end
            inst.AnimState:PlayAnimation("shovel_loop")
            inst.sg.statemem.action = inst:GetBufferedAction()
        end,

        timeline =
        {
            TimeEvent(15 * FRAMES, function(inst)
                inst:PerformBufferedAction() 
                inst.sg:RemoveStateTag("predig") 
                inst.SoundEmitter:PlaySound("dontstarve/wilson/dig")
            end),

            TimeEvent(35 * FRAMES, function(inst)
                if inst.components.playercontroller ~= nil and
                    inst.components.playercontroller:IsAnyOfControlsPressed(
                        CONTROL_SECONDARY,
                        CONTROL_ACTION,
                        CONTROL_CONTROLLER_ACTION) and
                    inst.sg.statemem.action ~= nil and
                    inst.sg.statemem.action:IsValid() and
                    inst.sg.statemem.action.target ~= nil and
                    inst.sg.statemem.action.target.components.workable ~= nil and
                    inst.sg.statemem.action.target.components.workable:CanBeWorked() and
                    inst.sg.statemem.action.target:IsActionValid(inst.sg.statemem.action.action, true) and
                    CanEntitySeeTarget(inst, inst.sg.statemem.action.target) then
                    inst:ClearBufferedAction()
                    inst:PushBufferedAction(inst.sg.statemem.action)
                end
            end),
        },

        events =
        {
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.AnimState:PlayAnimation("shovel_pst")
                    local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
					if weapon and weapon:HasTag("frost_spear") then
					inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixspear2", "phoenixspear")
			inst.AnimState:Show("ARM_carry") 
			inst.AnimState:Hide("ARM_normal")
					end
					inst.sg:GoToState("idle", true)
				
                end
            end),
        },
		onexit = function(inst)
			local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
			if weapon and weapon:HasTag("frost_spear") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixspear2", "phoenixspear")
			inst.AnimState:Show("ARM_carry") 
			inst.AnimState:Hide("ARM_normal")
			end
        end
    }
)
AddStategraphState("wilson", shovel)

local flute2 = GLOBAL.State(
	{
        name = "play_flute2",
        tags = { "doing", "playing" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PushAnimation("flute", false)
            inst.AnimState:OverrideSymbol("pan_flute01", "pan_flute", "pan_flute01")
            inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
            inst.components.inventory:ReturnActiveActionItem(inst.bufferedaction ~= nil and inst.bufferedaction.invobject or nil)
        end,

        timeline =
        {
            TimeEvent(30*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/wilson/flute_LP", "flute")
                inst:PerformBufferedAction()
            end),
            TimeEvent(85*FRAMES, function(inst)
                inst.SoundEmitter:KillSound("flute")
            end),
        },

        events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },

        onexit = function(inst)
            inst.SoundEmitter:KillSound("flute")
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
        end
    }
	)
	AddStategraphState("wilson", flute2)

	
	local horn2 = GLOBAL.State(
	{
        name = "play_horn2",
        tags = { "doing", "playing" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PushAnimation("horn", false)
            inst.AnimState:OverrideSymbol("horn01", "horn", "horn01")
            --inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
            inst.components.inventory:ReturnActiveActionItem(inst.bufferedaction ~= nil and inst.bufferedaction.invobject or nil)
        end,

        timeline =
        {
            TimeEvent(21*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/common/horn_beefalo")
                inst:PerformBufferedAction()
            end),
        },

        events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },

        onexit = function(inst)
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
        end,
    }
	)
	AddStategraphState("wilson", horn2)
	
local peer = GLOBAL.State(
		{
        name = "peertelescope2",
        tags = {"doing", "busy", "canrotate", "notalking"},

        onenter = function(inst)
  			local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) 
		   	   if item and item.components.equippable then
				item.components.equippable:Unequip(inst)
				end
            inst:ForceFacePoint(inst.x, inst.y, inst.z)
            inst.components.playercontroller:Enable(false)
			inst.components.health:SetInvincible(true)
			inst.components.locomotor:Stop()
			inst.AnimState:OverrideSymbol("swap_object", "swap_telescope", "swap_object")
			inst.AnimState:Show("ARM_carry") 
            inst.AnimState:Hide("ARM_normal")
			
            inst.AnimState:PlayAnimation("telescope", false)
            inst.AnimState:PushAnimation("telescope_pst", false)

        end,

        timeline = 
        {
            TimeEvent(2*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold") end),
			TimeEvent(20*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/smallbird/blink") end),
        },

        onexit = function(inst)
            inst.components.playercontroller:Enable(true)
			inst.components.health:SetInvincible(false)
	           if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
				else
				inst.AnimState:Hide("ARM_carry") 
				inst.AnimState:Show("ARM_normal")
				end
        end,

        events = {
            EventHandler("animover", function(inst)
                inst:PerformBufferedAction()
            end ),
            EventHandler("animqueueover", function(inst)
   
                inst.sg:GoToState("idle")

            end ),
        },
    }
	)
AddStategraphState("wilson", peer)

local map = GLOBAL.State(
		{
        name = "map",
        tags = {"doing", "notalking"},
        
        onenter = function(inst)
            inst.components.playercontroller:Enable(false)
			inst.components.health:SetInvincible(true)
			inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("scroll", false)
            inst.AnimState:OverrideSymbol("scroll", "messagebottle", "scroll")
            inst.AnimState:PushAnimation("scroll_pst", false)
            
            --inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
            if inst.components.inventory.activeitem and inst.components.inventory.activeitem.components.book then
                inst.components.inventory:ReturnActiveItem()
            end
        end,
        
        onexit = function(inst)
		 inst.components.playercontroller:Enable(true)
		 inst.components.health:SetInvincible(false)
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
        end,
        
        timeline=
        {
			--TimeEvent(3*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/use_book") end)
            TimeEvent(24*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/use_book_light") end),
            TimeEvent(58*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/use_book_close") end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst:PerformBufferedAction()
            end),


            EventHandler("animqueueover", function(inst)
                inst.sg:GoToState("idle")
            end),

            
        },
    }
	)
AddStategraphState("wilson", map)

local book2 = GLOBAL.State(
		{
        name = "book2",
        tags = { "doing", "busy", "notalking" },

        onenter = function(inst)
		--[[if inst.components.playercontroller then
		inst.components.playercontroller:Enable(false)
		end]]
		 inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PushAnimation("book", true)
			--Moved to player_common because these symbols are never cleared
            --inst.AnimState:OverrideSymbol("book_open", "player_actions_uniqueitem", "book_open")
            --inst.AnimState:OverrideSymbol("book_closed", "player_actions_uniqueitem", "book_closed")
            --inst.AnimState:OverrideSymbol("book_open_pages", "player_actions_uniqueitem", "book_open_pages")
            --inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
            inst.components.inventory:ReturnActiveActionItem(inst.bufferedaction ~= nil and (inst.bufferedaction.target or inst.bufferedaction.invobject) or nil)
		inst.sg:SetTimeout(3)   
		
				--shield --------
	local x,y,z = inst.Transform:GetWorldPosition()
	local ents = TheSim:FindEntities(x,y,z, 20, {"player"})
	for k,v in pairs(ents) do	
		if v ~= nil and not v:HasTag("musha") and v.components.combat and (v.components.combat.target ~= inst) and v.components.health and not v.components.health:IsDead() then
		v.components.health:SetInvincible(true)		
			
		v.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
		local fx = SpawnPrefab("forcefieldfxx")

        fx.entity:SetParent(v.entity)
		if v.components.rider ~= nil and v.components.rider:IsRiding() then
		fx.Transform:SetScale(2, 2, 2)
		else
		fx.Transform:SetScale(0.8, 0.8, 0.8)
		end
        fx.Transform:SetPosition(0, 0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
			end
        fx:ListenForEvent("blocked", fx_hitanim, v)
			v:DoTaskInTime( 11, function()
			
            fx:RemoveEventCallback("blocked", fx_hitanim, v)
			v.components.health:SetInvincible(false)
			inst.casting = false
            if v:IsValid() then
            fx.kill_fx(fx) end
			end)
		end	
		end	
		-------- --------
   
		end,

        timeline =
        {
            TimeEvent(0, function(inst)
                local fxtoplay = inst.components.rider ~= nil and inst.components.rider:IsRiding() and "book_fx_mount" or "book_fx"
                local fx = SpawnPrefab(fxtoplay)
                fx.entity:SetParent(inst.entity)
                fx.Transform:SetPosition(0, 0.2, 0)
                inst.sg.statemem.book_fx = fx
            end),

            TimeEvent(28 * FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/common/use_book_light")
            end),

            TimeEvent(54 * FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/common/use_book_close")
				inst.sg:RemoveStateTag("busy")
            end),

            TimeEvent(58 * FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/common/book_spell")
                inst:PerformBufferedAction()
                inst.sg.statemem.book_fx = nil
            end),
        },

		 events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },
	
		ontimeout = function(inst)
		inst.sg:RemoveStateTag("doing")
		inst.sg:RemoveStateTag("notalking")
		inst:ClearBufferedAction()
            if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
	        end
        end,
	
        onexit = function(inst)
			--inst.components.playercontroller:Enable(true)
			inst:ClearBufferedAction()
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
            if inst.sg.statemem.book_fx then
                inst.sg.statemem.book_fx:Remove()
                inst.sg.statemem.book_fx = nil
            end
        end,
    }
	)
AddStategraphState("wilson", book2)

local bowm = GLOBAL.State(
		{
        name = "blowdart",
        tags = { "attack", "notalking", "abouttoattack", "autopredict" },

        onenter = function(inst)
		inst.components.locomotor:Stop()
			local buffaction = inst:GetBufferedAction()
            local target = buffaction ~= nil and buffaction.target or nil
			
            inst.components.combat:SetTarget(target)
            inst.components.combat:StartAttack()
              local cooldown = math.max(inst.components.combat.min_attack_period + .5 * FRAMES, 20 * FRAMES)

			--local weapon = inst.components.combat ~= nil and inst.components.combat:GetWeapon() or nil
			local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
			if weapon and weapon:HasTag("bowm") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm2", "bowm")
			inst.AnimState:PlayAnimation("speargun")
			else
			inst.AnimState:PlayAnimation("dart")
			end
			
            inst.sg:SetTimeout(cooldown)

            if target ~= nil and target:IsValid() then
                inst:FacePoint(target.Transform:GetWorldPosition())
                inst.sg.statemem.attacktarget = target
            end
        end,

        timeline =
        {
            TimeEvent(8 * FRAMES, function(inst)
			local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
				if weapon and weapon:HasTag("bowm") then
				else
                inst.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_shoot", nil, nil, true)
				end
            end),
            TimeEvent(10 * FRAMES, function(inst)
                inst:PerformBufferedAction()
                inst.sg:RemoveStateTag("abouttoattack")
				local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
				if weapon and weapon:HasTag("bowm") then
				if math.random() < 0.55 then
				inst.SoundEmitter:PlaySound("bowm/musha/bowm/bow", nil, nil, true)
				else
				inst.SoundEmitter:PlaySound("bowm/musha/bowm/bow2", nil, nil, true)
				end
				else
                inst.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_shoot", nil, nil, true)
				end
            end),
        },

        ontimeout = function(inst)
            inst.sg:RemoveStateTag("attack")
            inst.sg:AddStateTag("idle")
        end,

        events =
        {
            EventHandler("equip", function(inst) inst.sg:GoToState("idle") end),
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
	            end
            end),
        },

        onexit = function(inst)
            inst.components.combat:SetTarget(nil)
            if inst.sg:HasStateTag("abouttoattack") then
                inst.components.combat:CancelAttack()
            end
			
			local weapon = inst.components.combat and inst.components.combat:GetWeapon()
			if weapon and weapon:HasTag("bowm") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm_boost", "bowm")
			elseif weapon and not weapon:HasTag("bowm") and weapon:HasTag("musha_items") and not weapon.broken then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm", "bowm")
			elseif weapon and not weapon:HasTag("bowm") and weapon:HasTag("musha_items") and weapon.broken then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm_broken", "bowm")

			end
        end,
    }
	)
AddStategraphState("wilson", bowm)

local function SetSleeperAwakeState(inst)
    if inst.components.grue ~= nil then
        inst.components.grue:RemoveImmunity("sleeping")
    end
    if inst.components.talker ~= nil then
        inst.components.talker:StopIgnoringAll("sleeping")
    end
    if inst.components.firebug ~= nil then
        inst.components.firebug:Enable()
    end
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:EnableMapControls(true)
        inst.components.playercontroller:Enable(true)
    end
    inst:OnWakeUp()
    inst.components.inventory:Show()
    inst:ShowActions(true)
end
local function SetSleeperSleepState(inst)
    if inst.components.grue ~= nil then
        inst.components.grue:AddImmunity("sleeping")
    end
    if inst.components.talker ~= nil then
        inst.components.talker:IgnoreAll("sleeping")
    end
    if inst.components.firebug ~= nil then
        inst.components.firebug:Disable()
    end
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:EnableMapControls(false)
        inst.components.playercontroller:Enable(false)
    end
    inst:OnSleepIn()
    inst.components.inventory:Hide()
    inst:PushEvent("ms_closepopups")
    inst:ShowActions(false)
end

local bedroll2 = GLOBAL.State(
		{
        name = "bedroll2",
        tags = { "bedroll", "busy", "nomorph" },

        onenter = function(inst)
            inst.components.locomotor:Stop()

            local failreason =
                (TheWorld.state.isday and
                    (TheWorld:HasTag("cave") and "ANNOUNCE_NODAYSLEEP_CAVE" or "ANNOUNCE_NODAYSLEEP")
                )
               -- or (IsNearDanger(inst) and "ANNOUNCE_NODANGERSLEEP")
                -- you can still sleep if your hunger will bottom out, but not absolutely
               -- or (inst.components.hunger.current < TUNING.CALORIES_MED and "ANNOUNCE_NOHUNGERSLEEP")
                or (inst.components.beaverness ~= nil and inst.components.beaverness:IsStarving() and "ANNOUNCE_NOHUNGERSLEEP")
                or nil

            if failreason ~= nil then
                inst:PushEvent("performaction", { action = inst.bufferedaction })
                inst:ClearBufferedAction()
                inst.sg:GoToState("idle")
                if inst.components.talker ~= nil then
                    inst.components.talker:Say(GetString(inst, failreason))
                end
                return
            end

            inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PushAnimation("bedroll", false)

            SetSleeperSleepState(inst)
        end,

        timeline =
        {
            TimeEvent(20 * FRAMES, function(inst) 
                inst.SoundEmitter:PlaySound("dontstarve/wilson/use_bedroll")
            end),
        },

        events =
        {
            EventHandler("firedamage", function(inst)
                if inst.sg:HasStateTag("sleeping") then
                    inst.sg.statemem.iswaking = true
                    inst.sg:GoToState("wakeup")
                end
            end),
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    if TheWorld.state.isday or
                        (inst.components.health ~= nil and inst.components.health.takingfiredamage) or
                        (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
                        inst:PushEvent("performaction", { action = inst.bufferedaction })
                        inst:ClearBufferedAction()
                        inst.sg.statemem.iswaking = true
                        inst.sg:GoToState("wakeup")
                    elseif inst:GetBufferedAction() then
                        inst:PerformBufferedAction() 
                        if inst.components.playercontroller ~= nil then
                            inst.components.playercontroller:Enable(true)
                        end
                        inst.sg:AddStateTag("sleeping")
                        inst.sg:AddStateTag("silentmorph")
                        inst.sg:RemoveStateTag("nomorph")
                        inst.sg:RemoveStateTag("busy")
                        inst.AnimState:PlayAnimation("bedroll_sleep_loop", true)
                    else
                        inst.sg.statemem.iswaking = true
                        inst.sg:GoToState("wakeup")
                    end
                end
            end),
        },

        onexit = function(inst)
            if inst.sleepingbag ~= nil then
                --Interrupted while we are "sleeping"
                inst.sleepingbag.components.sleepingbag:DoWakeUp(true)
                inst.sleepingbag = nil
                SetSleeperAwakeState(inst)
            elseif not inst.sg.statemem.iswaking then
                --Interrupted before we are "sleeping"
                SetSleeperAwakeState(inst)
            end
        end,
    }
	)
AddStategraphState("wilson", bedroll2)

local attack_frosthammer = GLOBAL.State(
	 {
        name = "attack2",
        tags = {"prehammer", "attack", "notalking", "abouttoattack", "autopredict", "doing", "busy"},
        
        onenter = function(inst)
	
			inst.f_attack = true
			--inst:DoTaskInTime(1.6, function(inst) inst.f_attack = false end )
			if inst:HasTag("musha") and not inst.on_sparkshield and not inst.light_shield then
			inst.components.health:SetAbsorptionAmount(0.5)
			end
            local buffaction = inst:GetBufferedAction()
            local target = buffaction ~= nil and buffaction.target or nil
            local equip = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
			local cooldown = inst.components.combat.min_attack_period + .5 * FRAMES
            inst.components.combat:SetTarget(target)
            inst.components.combat:StartAttack()
            inst.components.locomotor:Stop()
			if target ~= nil and target.components.locomotor then
			target.components.locomotor:Stop()
			end
            local weapon = inst.components.combat and inst.components.combat:GetWeapon()
		
		if weapon and not inst.components.rider:IsRiding() then
                inst.AnimState:PlayAnimation("pickaxe_pre")
				--inst.AnimState:PushAnimation("pickaxe_lag", false)
				cooldown = math.max(cooldown, 6 * FRAMES)
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_icestaff")
                    --inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon")
					
		elseif inst.components.rider:IsRiding() then
            local cooldown = inst.components.combat.min_attack_period + .5 * FRAMES
                if equip ~= nil and (equip.components.projectile ~= nil or equip:HasTag("rangedweapon")) then
                    inst.AnimState:PlayAnimation("player_atk_pre")
                    inst.AnimState:PushAnimation("player_atk", false)
                    inst.SoundEmitter:PlaySound(
                        (equip:HasTag("icestaff") and "dontstarve/wilson/attack_icestaff") or
                        (equip:HasTag("firestaff") and "dontstarve/wilson/attack_firestaff") or
                        "dontstarve/wilson/attack_weapon",
                        nil, nil, true
                    )
                    cooldown = math.max(cooldown, 13 * FRAMES)
                else
                    inst.AnimState:PlayAnimation("atk_pre")
                    inst.AnimState:PushAnimation("atk", false)
                    DoMountSound(inst, inst.components.rider:GetMount(), "angry", true)
                    cooldown = math.max(cooldown, 16 * FRAMES)
                end		
					
            else
				inst.sg.statemem.slow = true
                inst.AnimState:PlayAnimation("punch")
                --inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh")
            end
				--inst.sg:SetTimeout(cooldown)
			    inst:PerformPreviewBufferedAction()
		end,
		timeline =
        {
            TimeEvent(6 * FRAMES, function(inst)
				if not inst.components.rider:IsRiding() then
                inst.sg:RemoveStateTag("prehammer")
				end
            end),
			TimeEvent(8 * FRAMES, function(inst)
                if inst.components.rider:IsRiding() then
                    inst:PerformBufferedAction()
                    inst.sg:RemoveStateTag("abouttoattack")
                end
            end),
		},
					
		ontimeout = function(inst)
		if not inst.components.rider:IsRiding() then
		inst:ClearBufferedAction()
		inst.sg:RemoveStateTag("prehammer")
		elseif inst.components.rider:IsRiding() then
		inst.sg:RemoveStateTag("attack")
            inst.sg:AddStateTag("idle")
		end
        end,
		
        events =
        {
		
			EventHandler("equip", function(inst) 
			if inst.components.rider:IsRiding() then
			inst.sg:GoToState("idle") end 
			end),
			
            EventHandler("unequip", function(inst)  
			if not inst.components.rider:IsRiding() then
			inst:ClearBufferedAction()
            inst.AnimState:PlayAnimation("pickaxe_pst")
			inst.AnimState:PushAnimation("pickaxe_lag", false)
            inst.sg:GoToState("idle", true) 
			inst.f_attack = false
			end
			end),
			
			EventHandler("animqueueover", function(inst)
			if inst.components.rider:IsRiding() then
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
			end	
            end),
			
            EventHandler("animover", function(inst)
			if not inst.components.rider:IsRiding() then
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("attacking")
					inst.sg:SetTimeout(cooldown)
                end
			end	
            end),
		
        },
	
        onexit = function(inst)
		if inst.components.rider:IsRiding() then
            inst.components.combat:SetTarget(nil)
            if inst.sg:HasStateTag("abouttoattack") then
                inst.components.combat:CancelAttack()
            end
		end	
        end,
    	
    }
	)
AddStategraphState("wilson", attack_frosthammer)

local attack_frosthammer2 = GLOBAL.State(

	{
        name = "attacking",
        tags = { "prehammer", "attack", "notalking", "abouttoattack", "autopredict", "doing" },

        onenter = function(inst)
			
            local buffaction = inst:GetBufferedAction()
            local target = buffaction ~= nil and buffaction.target or nil
            local equip = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            inst.components.combat:SetTarget(target)
            inst.components.combat:StartAttack()
            inst.components.locomotor:Stop()
            local cooldown = inst.components.combat.min_attack_period + .5 * FRAMES
            if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
                inst.AnimState:PlayAnimation("atk_pre")
                inst.AnimState:PushAnimation("atk", false)
                DoMountSound(inst, inst.components.rider:GetMount(), "angry", true)
                cooldown = math.max(cooldown, 16 * FRAMES)
            elseif equip ~= nil --[[and equip:HasTag("frost_hammer")]] then
				inst.AnimState:PlayAnimation("pickaxe_loop")
				local weapon = inst.components.combat ~= nil and inst.components.combat:GetWeapon() or nil
                if weapon and weapon:HasTag("phoenix_axe") then
				inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_firestaff", nil, nil, true)
				else
				inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_icestaff", nil, nil, true)
				end
                cooldown = math.max(cooldown, 13 * FRAMES)
            else
                inst.AnimState:PlayAnimation("punch")
                inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh", nil, nil, true)
                cooldown = math.max(cooldown, 24 * FRAMES)
            end

            inst.sg:SetTimeout(cooldown)

            if target ~= nil then
                inst.components.combat:BattleCry()
                if target:IsValid() then
                    inst:FacePoint(target:GetPosition())
                    inst.sg.statemem.attacktarget = target
                end
            end
        end,

        timeline =
        {
            TimeEvent(10 * FRAMES, function(inst)
				inst.sg:RemoveStateTag("prehammer")
                    inst:PerformBufferedAction()
                    inst.sg:RemoveStateTag("abouttoattack")
            end),
        },

        ontimeout = function(inst)
		inst.sg:RemoveStateTag("prehammer")
            inst.sg:RemoveStateTag("attack")
            inst.sg:AddStateTag("idle")
			inst.f_attack = false
        end,

        events =
        {
            EventHandler("equip", function(inst) inst.sg:GoToState("idle") 
			inst.f_attack = false
			end),
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") 
			inst.f_attack = false
			end),
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.AnimState:PlayAnimation("pickaxe_pst")
                    inst.sg:GoToState("idle", true)
					inst.f_attack = false
                end
            end),
        },

        onexit = function(inst)
            inst.components.combat:SetTarget(nil)
            if inst.sg:HasStateTag("abouttoattack") then
                inst.components.combat:CancelAttack()
				inst.f_attack = false
            end
        end,
    }
	)
AddStategraphState("wilson", attack_frosthammer2)


local sanityidle = GLOBAL.State(
State{
        name = "funnyidle",
        tags = { "idle", "canrotate" },

        onenter = function(inst)
            if inst.components.temperature:GetCurrent() < 5 then
                inst.AnimState:PlayAnimation("idle_shiver_pre")
                inst.AnimState:PushAnimation("idle_shiver_loop")
                inst.AnimState:PushAnimation("idle_shiver_pst", false)
            elseif inst.components.temperature:GetCurrent() > TUNING.OVERHEAT_TEMP - 10 then
                inst.AnimState:PlayAnimation("idle_hot_pre")
                inst.AnimState:PushAnimation("idle_hot_loop")
                inst.AnimState:PushAnimation("idle_hot_pst", false)
            elseif inst.components.hunger:GetPercent() < TUNING.HUNGRY_THRESH then
                inst.AnimState:PlayAnimation("hungry")
                inst.SoundEmitter:PlaySound("dontstarve/wilson/hungry")    
            elseif inst.components.sanity:GetPercent() < .5 and not inst:HasTag("musha") then
                inst.AnimState:PlayAnimation("idle_inaction_sanity")
			elseif inst.components.sanity:GetPercent() < .1 and inst:HasTag("musha") then
                inst.AnimState:PlayAnimation("idle_inaction_sanity")	
            elseif inst:HasTag("groggy") then
                inst.AnimState:PlayAnimation("idle_groggy01_pre")
                inst.AnimState:PushAnimation("idle_groggy01_loop")
                inst.AnimState:PushAnimation("idle_groggy01_pst", false)
            else
                inst.AnimState:PlayAnimation("idle_inaction")
            end
        end,

        events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },
    }
	)
	AddStategraphState("wilson", sanityidle)
-----------
-----------
-----------
-----------client

local shovel_start_c = GLOBAL.State(
 State
    {
        name = "dig_start",
        tags = { "predig", "working" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
			local weapon = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
			if weapon and weapon:HasTag("frost_spear") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixspear_2r", "phoenixspear")
			inst.AnimState:Show("ARM_carry") 
			inst.AnimState:Hide("ARM_normal")
			end

            inst:PerformPreviewBufferedAction()
            inst.sg:SetTimeout(TIMEOUT)
        end,

        onupdate = function(inst)
            if inst:HasTag("working") then
                if inst.entity:FlattenMovementPrediction() then
                inst.sg:GoToState("idle", "noanim")
                end
            elseif inst.bufferedaction == nil then
                inst.AnimState:PlayAnimation("shovel_pst")
                inst.sg:GoToState("idle", true)
            end
        end,

        ontimeout = function(inst)
            inst:ClearBufferedAction()
            inst.AnimState:PlayAnimation("shovel_pst")
			local weapon = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
			if weapon and weapon:HasTag("frost_spear") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_phoenixspear2", "phoenixspear")
			inst.AnimState:Show("ARM_carry") 
			inst.AnimState:Hide("ARM_normal")
			end
            inst.sg:GoToState("idle", true)
        end,
		
    })
--AddStategraphState("wilson_client", shovel_start_c)

local bedroll2_c = GLOBAL.State(
    {
        name = "bedroll2",
        tags = { "bedroll", "busy" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PushAnimation("action_uniqueitem_lag", false)

            inst:PerformPreviewBufferedAction()
           -- inst.sg:SetTimeout(TIMEOUT)
        end,

        onupdate = function(inst)
            if inst:HasTag("busy") or inst:HasTag("sleeping") then
                if inst.entity:FlattenMovementPrediction() then
                    inst.sg:GoToState("idle", "noanim")
                end
            elseif inst.bufferedaction == nil then
                inst.sg:GoToState("idle")
            end
        end,

        ontimeout = function(inst)
            inst:ClearBufferedAction()
            inst.sg:GoToState("idle")
        end,
    }
	)
AddStategraphState("wilson_client", bedroll2_c)

local book2_c = GLOBAL.State(
    {
        name = "book2",
        tags = { "doing", "busy", "notalking" },

        onenter = function(inst)
		--[[if inst.components.playercontroller then
		inst.components.playercontroller:Enable(false)
		end]]
		if inst.replica.health then
		inst.replica.health:SetInvincible(true)
		end
		inst.replica.locomotor:Stop()
		-------- --------
            inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PushAnimation("action_uniqueitem_lag", false)
	      --inst.AnimState:PushAnimation("book", false)
            inst:PerformPreviewBufferedAction()
            inst.sg:SetTimeout(3)   
				--shield --------
		--[[inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")

		local fx = SpawnPrefab("forcefieldfxx")
        fx.entity:SetParent(inst.entity)
		if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
		fx.Transform:SetScale(2, 2, 2)
		else
		fx.Transform:SetScale(0.8, 0.8, 0.8)
		end
        fx.Transform:SetPosition(0, 0.2, 0)
        local fx_hitanim = function()
            fx.AnimState:PlayAnimation("hit")
            fx.AnimState:PushAnimation("idle_loop")
			end
        fx:ListenForEvent("blocked", fx_hitanim, inst)
			inst:DoTaskInTime( 3, function()
		
				inst.sg:RemoveStateTag("busy") end)
			inst:DoTaskInTime( 5, function()
            fx:RemoveEventCallback("blocked", fx_hitanim, inst)
			inst.replica.health:SetInvincible(false)
			inst.casting = false
            if inst:IsValid() then
            fx.kill_fx(fx) end
			end)
			]]
        end,

        timeline =
        {
            TimeEvent(0, function(inst)
                local fxtoplay = inst.replica.rider ~= nil and inst.replica.rider:IsRiding() and "book_fx_mount" or "book_fx"
                local fx = SpawnPrefab(fxtoplay)
                fx.entity:SetParent(inst.entity)
                fx.Transform:SetPosition(0, 0.2, 0)
                inst.sg.statemem.book_fx = fx
            end),

            TimeEvent(28 * FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/common/use_book_light")
            end),

            TimeEvent(54 * FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/common/use_book_close")
				inst.sg:RemoveStateTag("busy")
            end),

            TimeEvent(58 * FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/common/book_spell")
                inst:PerformBufferedAction()
                inst.sg.statemem.book_fx = nil
            end),
        },
       events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },
		
		onupdate = function(inst)
            if inst:HasTag("doing") then
                if inst.entity:FlattenMovementPrediction() then
                    inst.sg:GoToState("idle", "noanim")
                end
            elseif inst.bufferedaction == nil then
                inst.sg:GoToState("idle")
            end
        end,
		
		ontimeout = function(inst)
            inst:ClearBufferedAction()
            if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
					--inst.components.playercontroller:Enable(true) 
            end
        end,

        --[[onexit = function(inst)
			
            if inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
            if inst.sg.statemem.book_fx then
                inst.sg.statemem.book_fx:Remove()
                inst.sg.statemem.book_fx = nil
            end
        end,]]
    }
	)
AddStategraphState("wilson_client", book2_c)

local bowm_c = GLOBAL.State(
	{
        name = "blowdart",
        tags = { "attack", "notalking", "abouttoattack" },

        onenter = function(inst)
            if inst.replica.combat ~= nil then
                inst.replica.combat:StartAttack()
                inst.sg:SetTimeout(math.max(20 * FRAMES, inst.replica.combat:MinAttackPeriod() + .5 * FRAMES))
            end
            inst.components.locomotor:Stop()
			
			local weapon = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
			if weapon and weapon:HasTag("bowm") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm2", "bowm")
			inst.AnimState:PlayAnimation("speargun")
			else
			inst.AnimState:PlayAnimation("dart")
			end
		
            local buffaction = inst:GetBufferedAction()
            if buffaction ~= nil then
                inst:PerformPreviewBufferedAction()

                if buffaction.target ~= nil and buffaction.target:IsValid() then
                    inst:FacePoint(buffaction.target:GetPosition())
                    inst.sg.statemem.attacktarget = buffaction.target
                end
            end
        end,

        timeline =
        {
            TimeEvent(8 * FRAMES, function(inst)
			local weapon = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
                if weapon and weapon:HasTag("bowm") then
				else
                inst.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_shoot", nil, nil, true)
				end
            end),
            TimeEvent(10 * FRAMES, function(inst)
                inst:ClearBufferedAction()
                inst.sg:RemoveStateTag("abouttoattack")
				local weapon = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
    			if weapon and weapon:HasTag("bowm") then
				if math.random() < 0.55 then
				inst.SoundEmitter:PlaySound("bowm/musha/bowm/bow", nil, nil, true)
				else
				inst.SoundEmitter:PlaySound("bowm/musha/bowm/bow2", nil, nil, true)
				end
				else
                inst.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_shoot", nil, nil, true)
				end
            end),
        },

        ontimeout = function(inst)
            inst.sg:RemoveStateTag("attack")
            inst.sg:AddStateTag("idle")
        end,

        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },

        onexit = function(inst)
            if inst.sg:HasStateTag("abouttoattack") and inst.replica.combat ~= nil then
                inst.replica.combat:CancelAttack()
            end
			local weapon = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
			if weapon and weapon:HasTag("bowm") then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm_boost", "bowm")
			elseif weapon and not weapon:HasTag("bowm") and weapon:HasTag("musha_items") and not weapon.broken then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm", "bowm")
			elseif weapon and not weapon:HasTag("bowm") and weapon:HasTag("musha_items") and weapon.broken then
			inst.AnimState:OverrideSymbol("swap_object", "swap_bowm_broken", "bowm")	
			end
        end,
    }
	)
AddStategraphState("wilson_client", bowm_c)


local attack_frosthammer_c = GLOBAL.State(
	 {
        name = "attack2",
        tags = {"prehammer", "attack", "notalking", "abouttoattack", "autopredict", "doing", "busy"},
        
        onenter = function(inst)
			inst.f_attack = true
						--inst:DoTaskInTime(1.6, function(inst) inst.f_attack = false end )
            local buffaction = inst:GetBufferedAction()
            local target = buffaction ~= nil and buffaction.target or nil
            local equip = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            --inst.replica.combat:SetTarget(target)
            --inst.replica.combat:StartAttack()
			local cooldown = inst.replica.combat:MinAttackPeriod() + .5 * FRAMES
            if inst.replica.combat ~= nil then
                inst.replica.combat:StartAttack()
            end
			
            inst.components.locomotor:Stop()
            local weapon = inst.replica.combat and inst.replica.combat:GetWeapon()
			local rider = inst.replica.rider
			
			if rider ~= nil and rider:IsRiding() then
			local cooldown = 0
            if inst.replica.combat ~= nil then
                inst.replica.combat:StartAttack()
                cooldown = inst.replica.combat:MinAttackPeriod() + .5 * FRAMES
            end
			
                if equip ~= nil and (equip:HasTag("rangedweapon") or equip:HasTag("projectile")) then
                    inst.AnimState:PlayAnimation("player_atk_pre")
                    inst.AnimState:PushAnimation("player_atk", false)
                    inst.SoundEmitter:PlaySound(
                        (equip:HasTag("icestaff") and "dontstarve/wilson/attack_icestaff") or
                        (equip:HasTag("firestaff") and "dontstarve/wilson/attack_firestaff") or
                        "dontstarve/wilson/attack_weapon",
                        nil, nil, true
                    )
                    if cooldown > 0 then
                        cooldown = math.max(cooldown, 13 * FRAMES)
                    end
                else
                    inst.AnimState:PlayAnimation("atk_pre")
                    inst.AnimState:PushAnimation("atk", false)
                    DoMountSound(inst, rider:GetMount(), "angry")
                    if cooldown > 0 then
                        cooldown = math.max(cooldown, 16 * FRAMES)
                    end
                end
				
			else
            if weapon and not rider:IsRiding() then
                inst.AnimState:PlayAnimation("pickaxe_pre")
				--inst.AnimState:PushAnimation("pickaxe_lag", false)
				cooldown = math.max(cooldown, 6 * FRAMES)
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_icestaff")
                    --inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon")

            else
				inst.sg.statemem.slow = true
                inst.AnimState:PlayAnimation("punch")
                --inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh")
            end
				--inst.sg:SetTimeout(cooldown)
			    inst:PerformPreviewBufferedAction()
		end	
        end,
		
		timeline =
        {
            TimeEvent(6 * FRAMES, function(inst)
				local rider = inst.replica.rider
				if not rider:IsRiding() then
                inst.sg:RemoveStateTag("prehammer")
				end
            end),
			
			 TimeEvent(8 * FRAMES, function(inst)
                local rider = inst.replica.rider
				if rider ~= nil and rider:IsRiding() then
                    inst:ClearBufferedAction()
                    inst.sg:RemoveStateTag("abouttoattack")
                end
            end),
		},
		ontimeout = function(inst)
		--inst:ClearBufferedAction()
		local rider = inst.replica.rider
		if rider ~= nil and rider:IsRiding() then
		inst.sg:RemoveStateTag("attack")
            inst.sg:AddStateTag("idle")
		else
		inst.sg:RemoveStateTag("prehammer")
		end
        end,
		
        events =
        {
            EventHandler("unequip", function(inst) 
			local rider = inst.replica.rider			
			if not rider:IsRiding() then
			inst:ClearBufferedAction()
            inst.AnimState:PlayAnimation("pickaxe_pst")
			inst.AnimState:PushAnimation("pickaxe_lag", false)
            inst.sg:GoToState("idle", true) 
			inst.f_attack = false
			end
			end),
			
            EventHandler("animover", function(inst)
			local rider = inst.replica.rider
			if not rider:IsRiding() then
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("attacking")
					inst.sg:SetTimeout(cooldown)
                end
			end	
            end),
			
			EventHandler("animqueueover", function(inst)
			local rider = inst.replica.rider
			if rider:IsRiding() then
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
			end	
            end),
			
        },
		
		onexit = function(inst)
		local rider = inst.replica.rider
		if rider:IsRiding() then
            if inst.sg:HasStateTag("abouttoattack") and inst.replica.combat ~= nil then
                inst.replica.combat:CancelAttack()
            end
		end	
        end,
		
    }
	)
AddStategraphState("wilson_client", attack_frosthammer_c)

local attack_frosthammer2_c = GLOBAL.State(

	{
        name = "attacking",
        tags = { "prehammer", "attack", "notalking", "abouttoattack", "autopredict", "doing" },

        onenter = function(inst)
		
            local cooldown = inst.replica.combat:MinAttackPeriod() + .5 * FRAMES
            if inst.replica.combat ~= nil then
                inst.replica.combat:StartAttack()
                --cooldown = inst.replica.combat:MinAttackPeriod() + .5 * FRAMES
            end
            inst.components.locomotor:Stop()
            local equip = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            local rider = inst.replica.rider
            if rider ~= nil and rider:IsRiding() then
                inst.AnimState:PlayAnimation("atk_pre")
                inst.AnimState:PushAnimation("atk", false)
                DoMountSound(inst, rider:GetMount(), "angry")
                if cooldown > 0 then
                    cooldown = math.max(cooldown, 16 * FRAMES)
                end
             elseif equip ~= nil --[[and equip:HasTag("frost_hammer")]] then
                inst.AnimState:PlayAnimation("pickaxe_loop")
				--inst.AnimState:PushAnimation("atk", false)
                local weapon = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
                if weapon and weapon:HasTag("phoenix_axe") then
				inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_firestaff", nil, nil, true)
				else
				inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_icestaff", nil, nil, true)
				end
                if cooldown > 0 then
                    cooldown = math.max(cooldown, 13 * FRAMES)
                end
				if inst.components.playercontroller then
				inst.components.playercontroller:Enable(false)
				end
            else
                inst.AnimState:PlayAnimation("punch")
                inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh", nil, nil, true)
                if cooldown > 0 then
                    cooldown = math.max(cooldown, 24 * FRAMES)
                end
            end
			
				--inst.sg:SetTimeout(cooldown)
			    inst:PerformPreviewBufferedAction()
							
            local buffaction = inst:GetBufferedAction()
            if buffaction ~= nil then
                inst:PerformPreviewBufferedAction()
				--inst.sg:SetTimeout(TIMEOUT)
                if buffaction.target ~= nil and buffaction.target:IsValid() then
                    inst:FacePoint(buffaction.target:GetPosition())
                    inst.sg.statemem.attacktarget = buffaction.target
                end
            end

            if cooldown > 0 then
                inst.sg:SetTimeout(cooldown)
            end
			
        end,

        timeline =
        {
            TimeEvent(10 * FRAMES, function(inst)
			inst.sg:RemoveStateTag("prehammer")
                    inst:ClearBufferedAction()
                    inst.sg:RemoveStateTag("abouttoattack")
            end),
            
        },

        ontimeout = function(inst)
		inst:ClearBufferedAction()
		inst.sg:RemoveStateTag("prehammer")
            inst.sg:RemoveStateTag("attack")
            inst.sg:AddStateTag("idle")
			inst.f_attack = false
        end,

        events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.AnimState:PlayAnimation("pickaxe_pst")
					--inst.AnimState:PushAnimation("pickaxe_lag", false)
					inst.sg:GoToState("idle", true)
					inst.f_attack = false
                end
            end),
        },

        onexit = function(inst)
            if inst.sg:HasStateTag("abouttoattack") and inst.replica.combat ~= nil then
                inst.replica.combat:CancelAttack()
				inst.f_attack = false
            end
        end,
    }
	
	)
AddStategraphState("wilson_client", attack_frosthammer2_c)


--------------------------------------



--addaction

 AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.EAT,
        function(inst, action)
            if inst.sg:HasStateTag("busy") then
                return
            end
            local obj = action.target or action.invobject
            if obj == nil or obj.components.edible == nil then
                return
            elseif not inst.components.eater:PrefersToEat(obj) then
                inst:PushEvent("wonteatfood", { food = obj })
                return
            end
            return (inst:HasTag("beaver") and "beavereat")
                or (obj.components.edible.foodtype == FOODTYPE.MEAT and "eat")
				or (inst:HasTag("musha") and (inst.dis_veggie_taste or inst.dis_meat_taste or inst.veggie_taste or inst.meat_taste) and obj.components.edible.foodtype == "VEGGIE" and obj.components.edible.hungervalue >= 25 and "eat")
                or "quickeat"
        end)
		)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.ATTACK,
        function(inst, action)
            inst.sg.mem.localchainattack = not action.forced or nil
            if not inst.components.health:IsDead() and not inst.sg:HasStateTag("attack") then
                local weapon = inst.components.combat ~= nil and inst.components.combat:GetWeapon() or nil
                return (weapon == nil and "attack")
                    or (weapon:HasTag("blowdart") and "blowdart")
                    or (weapon:HasTag("thrown") and "throw")
					or (weapon:HasTag("frost_hammer") and "attack2")
					or (weapon:HasTag("phoenix_axe") and "attack2")
					or (weapon:HasTag("frost_spear") and "attack2")
					or inst.sneaka and (weapon == nil and "attack2")
                    or "attack"
            end
        end)
		)

AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.ATTACK,
        function(inst)
            if not (inst.replica.health:IsDead() or inst.sg:HasStateTag("attack")) then
                local equip = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
                if equip == nil then
                    return "attack"
                end
                local inventoryitem = equip.replica.inventoryitem
				--local weapon = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
                return (not (inventoryitem ~= nil and inventoryitem:IsWeapon()) and "attack")
                    or (equip:HasTag("blowdart") and "blowdart")
                    or (equip:HasTag("thrown") and "throw")
					or (equip:HasTag("frost_hammer") and "attack2")
					or (equip:HasTag("phoenix_axe") and "attack2")
					or (equip:HasTag("frost_spear") and "attack2")
					or inst.sneaka and (equip == nil and "attack2")
                    or "attack"
            end
        end)
		)
local function DoHurtSound(inst)
    if inst.hurtsoundoverride ~= nil then
        inst.SoundEmitter:PlaySound(inst.hurtsoundoverride, nil, inst.hurtsoundvolume)
    elseif not inst:HasTag("mime") then
        inst.SoundEmitter:PlaySound((inst.talker_path_override or "dontstarve/characters/")..(inst.soundsname or inst.prefab).."/hurt", nil, inst.hurtsoundvolume)
    end
end
AddStategraphEvent("wilson", EventHandler("attacked", 
		function(inst, data)
        if not inst.components.health:IsDead() then
		if inst.on_sparkshield or inst.f_attack or inst.light_shield then
			inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/spark")
			else
            if data.weapon ~= nil and data.weapon:HasTag("tranquilizer") and (inst.sg:HasStateTag("bedroll") or inst.sg:HasStateTag("knockout")) then
                return --Do nothing
            elseif inst.sg:HasStateTag("transform") or inst.sg:HasStateTag("dismounting") then
                -- don't interrupt transform or when bucked in the air
                inst.SoundEmitter:PlaySound("dontstarve/wilson/hit")
                DoHurtSound(inst)
            elseif inst.sg:HasStateTag("sleeping") then
                inst.SoundEmitter:PlaySound("dontstarve/wilson/hit")
                DoHurtSound(inst)
                if inst.sleepingbag ~= nil then
                    inst.sleepingbag.components.sleepingbag:DoWakeUp()
                    inst.sleepingbag = nil
                else
                    inst.sg.statemem.iswaking = true
                    inst.sg:GoToState("wakeup")
                end
            elseif data.attacker ~= nil
                and data.attacker:HasTag("groundspike")
                and not inst.components.rider:IsRiding()
                and not inst:HasTag("beaver") then
                inst.sg:GoToState("hit_spike", data.attacker)
            elseif data.attacker ~= nil
                and data.attacker.sg ~= nil
                and data.attacker.sg:HasStateTag("pushing") then
                inst.sg:GoToState("hit_push")
            elseif inst.sg:HasStateTag("shell") then
                inst.sg:GoToState("shell_hit")
            elseif inst.components.pinnable ~= nil and inst.components.pinnable:IsStuck() then
                inst.sg:GoToState("pinned_hit")
            elseif data.stimuli == "darkness" then
                inst.sg:GoToState("hit_darkness")
            elseif data.stimuli == "electric" and not inst.components.inventory:IsInsulated() then
                inst.sg:GoToState("electrocute")
            elseif inst.sg:HasStateTag("nointerrupt") then
                inst.SoundEmitter:PlaySound("dontstarve/wilson/hit")
                DoHurtSound(inst)
            else
                local t = GetTime()
                local stunlock =
                    data.stimuli ~= "stun" and
                    data.attacker ~= nil and
                    --V2C: skip stunlock protection when idle
                    -- gjans: we transition to idle for 1 frame after being hit, hence the timeinstate check
                    not (inst.sg:HasStateTag("idle") and inst.sg.timeinstate > 0) and
                    data.attacker.components.combat ~= nil and
                    data.attacker.components.combat.playerstunlock or
                    nil
                if stunlock ~= nil and
                    t - (inst.sg.mem.laststuntime or 0) <
                    (   (stunlock == PLAYERSTUNLOCK.NEVER and math.huge) or
                        (stunlock == PLAYERSTUNLOCK.RARELY and TUNING.STUNLOCK_TIMES.RARELY) or
                        (stunlock == PLAYERSTUNLOCK.SOMETIMES and TUNING.STUNLOCK_TIMES.SOMETIMES) or
                        (stunlock == PLAYERSTUNLOCK.OFTEN and TUNING.STUNLOCK_TIMES.OFTEN) or
                        0 --unsupported case
                    ) then
                    -- don't go to full hit state, just play sounds
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/hit")
                    DoHurtSound(inst)
                else
                    inst.sg.mem.laststuntime = t
                    inst.sg:GoToState("hit", data.noimpactsound and "noimpactsound" or nil)
                end
            end
        end
		end
    end)
	)
	
	
-----------
local oldwidgetsetup = containers.widgetsetup
containers.widgetsetup = function(container, prefab)
if not prefab and container.inst.prefab == "armor_mushaa" then
prefab = "backpack" end
if not prefab and container.inst.prefab == "broken_frosthammer" then
--prefab = "icepack" end
prefab = "backpack" end
if not prefab and container.inst.prefab == "armor_mushab" then
prefab = "piggyback" end
if not prefab and container.inst.prefab == "pirateback" then
prefab = "krampus_sack" end
  if not prefab and container.inst.prefab == "musha_tall3" then  prefab = "chester" end   if not prefab and container.inst.prefab == "musha_tallrrr1" then  prefab = "chester" end   if not prefab and container.inst.prefab == "musha_tallrrr2" then  prefab = "chester" end   if not prefab and container.inst.prefab == "musha_tallrrr3" then  prefab = "chester" end   if not prefab and container.inst.prefab == "musha_tallrrr4" then  prefab = "chester" end   if not prefab and container.inst.prefab == "musha_tallrrr5" then  prefab = "chester" end   if not prefab and container.inst.prefab == "musha_tallrrrice" then  prefab = "chester" end 
oldwidgetsetup(container, prefab)
end

---------------
-------------comfortable extra equip slot

local extraequipslot = 0
for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "Extra Equip Slots" or GLOBAL.KnownModIndex:GetModInfo(moddir).name == "Extra Equip Slots API Edition" then
		extraequipslot = 1
   end end 
   
if extraequipslot == 1 then
ACTIONS.RUMMAGE.strfn = function(act)
    local targ = act.target or act.invobject
    return targ ~= nil
        and (   targ.replica.container ~= nil and
                targ.replica.container:IsOpenedBy(act.doer) and
                "CLOSE" or
                (   act.target ~= nil and
                    act.target:HasTag("winter_tree") and
                    "DECORATE"
                ) or
                (   act.target ~= nil and
                    act.target:HasTag("musha_items") 
                )
            )
        or nil
end
end
  
   
   function mushaa_armor(inst)
    if IsServer then
    inst:AddComponent("container")
	inst.components.container:WidgetSetup("mushaa")
    end end	
	
    function armor_frostback(inst)
    if IsServer then
    inst:AddComponent("container")
    --inst.components.container:WidgetSetup("frostback")
	inst.components.container:WidgetSetup("mushaa")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    end end	
	
	function armor_princess(inst)
    if IsServer then
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("princess")
    end end	

 
   function backpack_armor_postinit(inst)
    if extraequipslot == 1 and IsServer then
        inst.components.equippable.equipslot = GLOBAL.EQUIPSLOTS.BACK or GLOBAL.EQUIPSLOTS.BODY
    end 
	end
	
	if extraequipslot == 1 then
       AddPrefabPostInit("pirateback", backpack_armor_postinit)  
	end
	
--bodyguard wilson
function bodyguardwilson(inst)
if IsServer then
  if bodyguard_wilson == 1 then
	inst.no_bodyguard = true
 end end
end
AddPrefabPostInit("musha", bodyguardwilson)

--share
function share_items(inst)
if IsServer then
	if share_item == 0 then
 	inst:AddComponent("characterspecific_musha")	
	inst.components.characterspecific_musha:SetOwner("musha")
	inst.components.characterspecific_musha:SetStorable(false)
	end
	if share_item == 1 then
	inst.share_item = true
	end 
 end
end
AddPrefabPostInit("mushasword_base", share_items) 
AddPrefabPostInit("mushasword", share_items)
AddPrefabPostInit("mushasword_frost", share_items)
AddPrefabPostInit("mushasword4", share_items)
AddPrefabPostInit("phoenixspear", share_items)
AddPrefabPostInit("bowm", share_items)
AddPrefabPostInit("frosthammer", share_items)

AddPrefabPostInit("hat_mbunny", share_items)
AddPrefabPostInit("hat_mbunnya", share_items)
AddPrefabPostInit("hat_mphoenix", share_items)
AddPrefabPostInit("hat_mprincess", share_items)
AddPrefabPostInit("hat_mwildcat", share_items)

AddPrefabPostInit("broken_frosthammer", share_items)
AddPrefabPostInit("armor_mushaa", share_items)
AddPrefabPostInit("armor_mushab", share_items)
AddPrefabPostInit("pirateback", share_items)

--in container
function backpack_incontainer(inst)
if IsServer then
	if in_container == 1 then
	if inst.components.inventoryitem then
	inst.components.inventoryitem.cangoincontainer = true
	end
	end
end
end
AddPrefabPostInit("backpack", backpack_incontainer)
--AddPrefabPostInit("piggyback", backpack_incontainer)
AddPrefabPostInit("icepack", backpack_incontainer)
--AddPrefabPostInit("krampus_sack", backpack_incontainer)
--AddPrefabPostInit("thatchpack", backpack_incontainer)

function musha_incontainer(inst)
if IsServer then
	if musha_in_container == 0 then
	if inst.components.inventoryitem then
	inst.components.inventoryitem.cangoincontainer = false
	end
	elseif musha_in_container == 1 then
	if inst.components.inventoryitem then
	inst.components.inventoryitem.cangoincontainer = true
	end
	end
end
end
AddPrefabPostInit("armor_mushaa", musha_incontainer)
AddPrefabPostInit("armor_mushab", musha_incontainer)
AddPrefabPostInit("broken_frosthammer", musha_incontainer)
AddPrefabPostInit("pirateback", musha_incontainer)

	---------------
if extraequipslot == 0 then
--musha armor 
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "mushaa"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end

local function mushaa()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_backpack_2x4",
            animbuild = "ui_backpack_2x4",
            pos = GLOBAL.Vector3(-5, -70, 0),
            side_align_tip = 160,
        },
		 issidewidget = true,
			type = "pack",
    }
 
	for y = 0, 3 do
    table.insert(container.widget.slotpos, GLOBAL.Vector3(-162, -75 * y + 114, 0))
    table.insert(container.widget.slotpos, GLOBAL.Vector3(-162 + 75, -75 * y + 114, 0))
end
    return container
end

params.mushaa = mushaa()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "mushaa" then
                container.type = "pack"
            end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)
AddPrefabPostInit("armor_mushaa", mushaa_armor) 
AddPrefabPostInit("broken_frosthammer", mushaa_armor) 
end

--musha armor with extra slot
if extraequipslot == 1 then
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "mushaa"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end

local function mushaa()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_backpack_2x4",
            animbuild = "ui_backpack_2x4",
            pos = GLOBAL.Vector3(-5, -70, 0),
            side_align_tip = 160,
        },
		 issidewidget = true,
			type = "backpack",
    }
 
	for y = 0, 3 do
    table.insert(container.widget.slotpos, GLOBAL.Vector3(-162, -75 * y + 114, 0))
    table.insert(container.widget.slotpos, GLOBAL.Vector3(-162 + 75, -75 * y + 114, 0))
end
    return container
end

params.mushaa = mushaa()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "mushaa" then
                container.type = "pack"
            end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)
AddPrefabPostInit("armor_mushaa", mushaa_armor)
AddPrefabPostInit("broken_frosthammer", mushaa_armor)
end

if extraequipslot == 0 then
--princess armor 
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "princess"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function princess()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_piggyback_2x6",
            animbuild = "ui_piggyback_2x6",
            pos = GLOBAL.Vector3(-5, -50, 0),
            side_align_tip = 160,
        },
		 issidewidget = true,
        type = "pack",
    }

	for y = 0, 5 do
    table.insert(container.widget.slotpos, GLOBAL.Vector3(-162, -75 * y + 170, 0))
    table.insert(container.widget.slotpos, GLOBAL.Vector3(-162 + 75, -75 * y + 170, 0))
end
    return container
end

params.princess = princess()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "princess" then
                container.type = "pack"
            end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)
AddPrefabPostInit("armor_mushab", armor_princess)
end

--princess armor with extra slot 
if extraequipslot == 1 then
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "princess"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function princess()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_piggyback_2x6",
            animbuild = "ui_piggyback_2x6",
            pos = GLOBAL.Vector3(-5, -50, 0),
            side_align_tip = 160,
        },
		 issidewidget = true,
        type = "backpack", --"chest"
    }

	for y = 0, 5 do
    table.insert(container.widget.slotpos, GLOBAL.Vector3(-162, -75 * y + 170, 0))
    table.insert(container.widget.slotpos, GLOBAL.Vector3(-162 + 75, -75 * y + 170, 0))
end
    return container
end

params.princess = princess()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "princess" then
                container.type = "pack"
            end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)

AddPrefabPostInit("armor_mushab", armor_princess)
end


--small icebox1
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "frostsmall"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function frostsmall()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_backpack_2x4",
            animbuild = "ui_chest_frosthammer",
            pos = GLOBAL.Vector3(-5, 100, 0),
            side_align_tip = 160,
        },
		 issidewidget = true,
        type = "chest",
    }
    
	for y = 0, 1 do
		table.insert(container.widget.slotpos, GLOBAL.Vector3(-126, -y*75 + 114 ,-126 +75, -y*75 + 114 ))

end
    return container
end
params.frostsmall = frostsmall()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "frostsmall" then
                container.type = "chest"
            end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)

--[[function params.frostsmall.itemtestfn(container, item, slot)
    return not item:HasTag("heatrock") 
end]]
--------------------------------------------------

--------------------------------------------------

--box1
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "chest_yamche0"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function chest_yamche0()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_chest_3x3",
            animbuild = "ui_chest_yamche0",
            pos = GLOBAL.Vector3(0, 150, 0),
            side_align_tip = 160,
        },
        type = "chest",
    }
    for y = 1, 0, -1 do
        table.insert(container.widget.slotpos, GLOBAL.Vector3(74*y-74*2+70, 0))
 
end
    return container
end
params.chest_yamche0 = chest_yamche0()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "chest_yamche0" then
                container.type = "chest"
            end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)
---------------------------------------------------------------
--box2
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "chest_yamche1"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function chest_yamche1()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_chest_3x3",
            animbuild = "ui_chest_yamche1",
            pos = GLOBAL.Vector3(0, 150, 0),
            side_align_tip = 160,
        },
        type = "chest",
    }
 for y = 1, 0, -1 do
    for x = 0, 1 do
        table.insert(container.widget.slotpos, GLOBAL.Vector3(80*x-80*2+78, 80*y-80*2+80,0))
    end
end
    return container
end
params.chest_yamche1 = chest_yamche1()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "chest_yamche1" then
                container.type = "chest"
            end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)
---------------------------------------------------------------
--box3
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "chest_yamche2"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function chest_yamche2()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_chest_3x3",
            animbuild = "ui_chest_yamche2",
            pos = GLOBAL.Vector3(0, 180, 0),
            side_align_tip = 160,
        },
        type = "chest",
    }
		
for y = 2, 0, -1 do
    for x = 0, 1 do
        table.insert(container.widget.slotpos, GLOBAL.Vector3(80*x-76*2+78, 80*y-78*2+78,0))
    end
end
    return container
end
params.chest_yamche2 = chest_yamche2()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "chest_yamche2" then
                container.type = "chest"
        end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)
---------------------------------------------------------------
--box5
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "chest_yamche4"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function chest_yamche4()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_chest_3x3",
            animbuild = "ui_chest_3x3",
            pos = GLOBAL.Vector3(0, 180, 0),
            side_align_tip = 160,
        },
        type = "chest",
    }
for y = 3, 0, -1 do
    for x = 0, 3 do
        table.insert(container.widget.slotpos, GLOBAL.Vector3(60*x-60*2+30, 60*y-60*2+30,0))
    end
end
    return container
end
params.chest_yamche4 = chest_yamche4()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "chest_yamche4" then
                container.type = "chest"
    end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)

---------------------------------------------------------------
---------------------------------------------------------------
--box6-1
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "chest_yamche5"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
function chest_yamche5()
    local container =
    {
        widget =
        {
            slotpos = {},
			animbank = "ui_chester_shadow_3x4",
			animbuild = "ui_chester_shadow_3x4",
            pos = GLOBAL.Vector3(0, 180, 0),
            side_align_tip = 160,
        },
        type = "chest",
    }
for y = 4, 0, -1 do
    for x = 0, 3 do
        table.insert(container.widget.slotpos, GLOBAL.Vector3(60*x-60*2+30, 60*y-60*2+2,0))
    end
end
    return container
end
params.chest_yamche5 = chest_yamche5()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "chest_yamche5" then
                container.type = "chest"
    end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)

---------------------------------------------------------------
---------------------------------------------------------------
--box7
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "chest_yamche6"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function chest_yamche6()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_chest_3x3",
            animbuild = "",--"ui_chest_moon",
            pos = GLOBAL.Vector3(0, 180, 0),
            side_align_tip = 160,
        },
        type = "chest",
    }
for y = 5, 0, -1 do
    for x = 0, 14 do
        table.insert(container.widget.slotpos, GLOBAL.Vector3(60*x-60*2+-150, 60*y-60*2+10,0))
    end
end
    return container
end
params.chest_yamche6 = chest_yamche6()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "chest_yamche6" then
                container.type = "chest"
    end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)

---------------------------------------------------------------
-----------[[--recipe--]]-----------

local bladeb = Ingredient( "mushasword_base", 1)
bladeb.atlas = "images/inventoryimages/mushasword_base.xml"
local armora = Ingredient( "armor_mushaa", 1)
armora.atlas = "images/inventoryimages/armor_mushaa.xml"
local phoenixb = Ingredient( "mushasword", 1)
phoenixb.atlas = "images/inventoryimages/mushasword.xml"
local phoenixf = Ingredient( "mushasword_frost", 1)
phoenixf.atlas = "images/inventoryimages/mushasword_frost.xml"

local phoenix_egg = Ingredient( "musha_egg", 1)
phoenix_egg.atlas = "images/inventoryimages/musha_egg.xml"
local phoenix_eggs1 = Ingredient( "musha_eggs1", 1)
phoenix_eggs1.atlas = "images/inventoryimages/musha_eggs1.xml"
local phoenix_eggs2 = Ingredient( "musha_eggs2", 1)
phoenix_eggs2.atlas = "images/inventoryimages/musha_eggs2.xml"
local phoenix_eggs3 = Ingredient( "musha_eggs3", 1)
phoenix_eggs3.atlas = "images/inventoryimages/musha_eggs3.xml"
local phoenix_egg1 = Ingredient( "musha_egg1", 1)
phoenix_egg1.atlas = "images/inventoryimages/musha_egg1.xml"
local phoenix_egg2 = Ingredient( "musha_egg2", 1)
phoenix_egg2.atlas = "images/inventoryimages/musha_egg2.xml"
local phoenix_egg3 = Ingredient( "musha_egg3", 1)
phoenix_egg3.atlas = "images/inventoryimages/musha_egg3.xml"
local phoenix_egg8 = Ingredient( "musha_egg8", 1)
phoenix_egg8.atlas = "images/inventoryimages/musha_egg8.xml"
local arong_egg = Ingredient( "musha_egg_arong", 1)
arong_egg.atlas = "images/inventoryimages/musha_egg_arong.xml"
local glowdust = Ingredient( "glowdust", 1)
glowdust.atlas = "images/inventoryimages/glowdust.xml"
local glowdust2 = Ingredient( "glowdust", 2)
glowdust2.atlas = "images/inventoryimages/glowdust.xml"
local glowdust3 = Ingredient( "glowdust", 3)
glowdust3.atlas = "images/inventoryimages/glowdust.xml"
local glowdust5 = Ingredient( "glowdust", 5)
glowdust5.atlas = "images/inventoryimages/glowdust.xml"
local glowdust10 = Ingredient( "glowdust", 10)
glowdust10.atlas = "images/inventoryimages/glowdust.xml"
local glowdust15 = Ingredient( "glowdust", 15)
glowdust15.atlas = "images/inventoryimages/glowdust.xml"
local glowdust20 = Ingredient( "glowdust", 20)
glowdust20.atlas = "images/inventoryimages/glowdust.xml"
local crystal = Ingredient( "cristal", 1)
crystal.atlas = "images/inventoryimages/cristal.xml"
local crystal2 = Ingredient( "cristal", 2)
crystal2.atlas = "images/inventoryimages/cristal.xml"
local crystal3 = Ingredient( "cristal", 3)
crystal3.atlas = "images/inventoryimages/cristal.xml"
local greenf = Ingredient( "green_fruit", 1)
greenf.atlas = "images/inventoryimages/green_fruit.xml"
local greenfk = Ingredient( "green_fruit_cooked", 1)
greenfk.atlas = "images/inventoryimages/green_fruit_cooked.xml"
local broken_arrow = Ingredient( "arrowm_broken", 1)
broken_arrow.atlas = "images/inventoryimages/arrowm_broken.xml"
--local broken_arrow2 = Ingredient( "arrowm_broken", 2)
--broken_arrow2.atlas = "images/inventoryimages/arrowm_broken.xml"

local bunny_scout = Ingredient( "hat_mbunny", 1)
bunny_scout.atlas = "images/inventoryimages/hat_mbunny.xml"
local iron_cat = Ingredient( "hat_mwildcat", 1)
iron_cat.atlas = "images/inventoryimages/hat_mwildcat.xml"

--local fish = Ingredient( "fish", 1)
----

GLOBAL.STRINGS.TABS.MUSHA = "MushA"
GLOBAL.RECIPETABS['MUSHA'] = {str = "MUSHA", sort=12, icon = "mushatab.tex", icon_atlas = "images/mushatab.xml"}

----BOOK----

if Smart == "normal" then

AddRecipe("book_birds", {Ingredient("papyrus", 2), Ingredient("bird_egg", 2)}, CUSTOM_RECIPETABS.BOOKS, TECH.NONE, nil, nil, nil, nil, "bookbuilder")
AddRecipe("book_gardening", {Ingredient("papyrus", 2), Ingredient("seeds", 1), Ingredient("poop", 1)}, CUSTOM_RECIPETABS.BOOKS, TECH.SCIENCE_ONE, nil, nil, nil, nil, "bookbuilder")
AddRecipe("book_sleep", {Ingredient("papyrus", 2), Ingredient("nightmarefuel", 2)}, CUSTOM_RECIPETABS.BOOKS, TECH.MAGIC_TWO, nil, nil, nil, nil, "bookbuilder")
AddRecipe("book_brimstone", {Ingredient("papyrus", 2), Ingredient("redgem", 1)}, CUSTOM_RECIPETABS.BOOKS, TECH.MAGIC_THREE, nil, nil, nil, nil, "bookbuilder")
AddRecipe("book_tentacles", {Ingredient("papyrus", 2), Ingredient("tentaclespots", 1)}, CUSTOM_RECIPETABS.BOOKS, TECH.SCIENCE_TWO, nil, nil, nil, nil, "bookbuilder")

elseif Smart ~= "normal" then
AddRecipe("book_birds", {Ingredient("papyrus", 2), Ingredient("bird_egg", 2)}, CUSTOM_RECIPETABS.BOOKS, TECH.NONE, nil, nil, nil, nil, "bookbuilder")
AddRecipe("book_gardening", {Ingredient("papyrus", 2), Ingredient("seeds", 1), Ingredient("poop", 1)}, CUSTOM_RECIPETABS.BOOKS, TECH.SCIENCE_ONE, nil, nil, nil, nil, "bookbuilder")
AddRecipe("book_sleep", {Ingredient("papyrus", 2), Ingredient("nightmarefuel", 2)}, CUSTOM_RECIPETABS.BOOKS, TECH.MAGIC_TWO, nil, nil, nil, nil, "bookbuilder")
AddRecipe("book_brimstone", {Ingredient("papyrus", 2), Ingredient("redgem", 1)}, CUSTOM_RECIPETABS.BOOKS, TECH.MAGIC_THREE, nil, nil, nil, nil, "bookbuilder")
AddRecipe("book_tentacles", {Ingredient("papyrus", 2), Ingredient("tentaclespots", 1)}, CUSTOM_RECIPETABS.BOOKS, TECH.SCIENCE_THREE, nil, nil, nil, nil, "bookbuilder")
end

if Gem_Recipe == "color" then
AddRecipe("bluegem", {Ingredient( "redgem",1),glowdust}, RECIPETABS.MUSHA, {SCIENCE=0},nil, nil, nil, nil, "musha")
AddRecipe("redgem", {Ingredient( "bluegem",1),glowdust}, RECIPETABS.MUSHA, {SCIENCE=0},nil, nil, nil, nil, "musha")
AddRecipe("greengem",  {Ingredient("purplegem", 8),Ingredient( "goldnugget",15),glowdust5}, RECIPETABS.MUSHA, {SCIENCE=2},nil, nil, nil, nil, "musha")
AddRecipe("yellowgem", {Ingredient("purplegem", 8),Ingredient( "goldnugget",15),glowdust5}, RECIPETABS.MUSHA, {SCIENCE=2},nil, nil, nil, nil, "musha")
AddRecipe("orangegem", {Ingredient("purplegem", 8),Ingredient( "goldnugget",15),glowdust5}, RECIPETABS.MUSHA, {SCIENCE=2},nil, nil, nil, nil, "musha")
end
if Gem_Recipe == "craft_basic" then
AddRecipe("bluegem", {Ingredient( "goldnugget",10),Ingredient("feather_robin_winter", 2),glowdust}, RECIPETABS.MUSHA, {SCIENCE=0})
AddRecipe("redgem", {Ingredient( "goldnugget",10),Ingredient("feather_robin", 2),glowdust}, RECIPETABS.MUSHA, {SCIENCE=0})
end

if Difficult_Recipe == "easy" then
--glow berry
--[[local lesserf = AddRecipe("wormlight_lesser", { greenf, GLOBAL.Ingredient("berries", 1)}, RECIPETABS.MUSHA, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/lesserf.xml", "lesserf.tex" )
lesserf.tagneeded = false
lesserf.builder_tag ="musha"]]
--glowdust
local glowdusts = AddRecipe("glowdust", { GLOBAL.Ingredient("ash", 1),GLOBAL.Ingredient("honey", 2), greenfk}, RECIPETABS.MUSHA, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/glowdust.xml", "glowdust.tex" )
glowdusts.tagneeded = false
glowdusts.builder_tag ="musha"

--energy drink

--arrows
--local arrowm = AddRecipe("arrowm", {Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/arrowm.xml", "arrowm.tex" )
--arrowm.tagneeded = false
--arrowm.builder_tag ="musha"

local dummy_arrow0 = AddRecipe("dummy_arrow0", {Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/dummy_arrow0.xml", "dummy_arrow0.tex" )
dummy_arrow0.tagneeded = false
dummy_arrow0.builder_tag ="musha"
local dummy_arrow1 = AddRecipe("dummy_arrow1", {Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/dummy_arrow1.xml", "dummy_arrow1.tex" )
dummy_arrow1.tagneeded = false
dummy_arrow1.builder_tag ="musha"
local dummy_arrow2 = AddRecipe("dummy_arrow2", {Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin_winter", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/dummy_arrow2.xml", "dummy_arrow2.tex" )
dummy_arrow2.tagneeded = false
dummy_arrow2.builder_tag ="musha"
local dummy_arrow4 = AddRecipe("dummy_arrow4", {Ingredient("stinger", 3), Ingredient("twigs", 3), Ingredient("feather_canary", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil,  "images/inventoryimages/dummy_arrow4.xml", "dummy_arrow4.tex" )
dummy_arrow4.tagneeded = false
dummy_arrow4.builder_tag ="musha"
local dummy_arrow3 = AddRecipe("arrowm", {broken_arrow, Ingredient("twigs", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/dummy_arrow3.xml", "dummy_arrow3.tex" )
dummy_arrow3.tagneeded = false
dummy_arrow3.builder_tag ="musha"

--tuna
local tunacan = AddRecipe("tunacan", { GLOBAL.Ingredient("fish_cooked", 1),GLOBAL.Ingredient("charcoal", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/tunacan.xml", "tunacan.tex" )
tunacan.tagneeded = false
tunacan.builder_tag ="musha"
--grass hut
local musha_hut = AddRecipe("musha_hut", { GLOBAL.Ingredient("log", 2), Ingredient("cutgrass", 3), Ingredient("rope", 2), }, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, "musha_hut_placer" ) 
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
musha_hut.tagneeded = false
musha_hut.builder_tag ="musha"
--dall
local moontree = AddRecipe("moontree", { glowdust10,GLOBAL.Ingredient("livinglog", 10),arong_egg }, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, "moontree_placer" ) 
moontree.atlas = "images/inventoryimages/moontree.xml"
moontree.tagneeded = false
moontree.builder_tag ="musha"
--oven
local musha_oven = AddRecipe("musha_oven", { glowdust3, GLOBAL.Ingredient("rocks", 10), GLOBAL.Ingredient("froglegs", 5), GLOBAL.Ingredient("purplegem", 1) }, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, "musha_oven_placer" ) 
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
musha_oven.tagneeded = false
musha_oven.builder_tag ="musha"
--forge
local forge_musha = AddRecipe("forge_musha", { crystal, GLOBAL.Ingredient("gears", 3), GLOBAL.Ingredient("transistor", 3), GLOBAL.Ingredient("livinglog", 5) }, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, "forge_musha_placer" ) 
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
forge_musha.tagneeded = false
forge_musha.builder_tag ="musha"
--tent
local tent_musha = AddRecipe("tent_musha", { glowdust3, Ingredient("fireflies", 1), Ingredient("papyrus", 3), Ingredient("cutgrass", 15), }, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, "tent_musha_placer" ) 
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"
tent_musha.tagneeded = false
tent_musha.builder_tag ="musha"
----
local mushasword_base = AddRecipe("mushasword_base", { glowdust, GLOBAL.Ingredient("goldnugget", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mushasword_base.xml", "mushasword_base.tex" )
mushasword_base.tagneeded = false
mushasword_base.builder_tag ="musha"

local mushasword = AddRecipe("mushasword", {bladeb, GLOBAL.Ingredient("redgem", 2), glowdust}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/mushasword.xml", "mushasword.tex" )
mushasword.tagneeded = false
mushasword.builder_tag ="musha"

local mushasword_frost = AddRecipe("mushasword_frost", {bladeb, GLOBAL.Ingredient("bluegem", 2), glowdust}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/mushasword_frost.xml", "mushasword_frost.tex" )
mushasword_frost.tagneeded = false
mushasword_frost.builder_tag ="musha"
--bow
local bowm = AddRecipe("bowm", {phoenixb, GLOBAL.Ingredient("spidergland", 6), glowdust}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/bowm.xml", "bowm.tex" )
bowm.tagneeded = false
bowm.builder_tag ="musha"
--spear
local phoenixspear = AddRecipe("phoenixspear", {phoenixb, phoenixf, GLOBAL.Ingredient("goldnugget", 20), glowdust2}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/phoenixspear.xml", "phoenixspear.tex" )
phoenixspear.tagneeded = false
phoenixspear.builder_tag ="musha"
--
local mushasword4 = AddRecipe("mushasword4", {Ingredient("goldnugget", 80), Ingredient("purplegem", 6), GLOBAL.Ingredient("greengem", 6), crystal}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mushasword4.xml", "mushasword4.tex" )
mushasword4.tagneeded = false
mushasword4.builder_tag ="musha"

local frosthammer = AddRecipe("frosthammer", {GLOBAL.Ingredient( "deerclops_eyeball", 1), GLOBAL.Ingredient( "bluegem", 12), GLOBAL.Ingredient("livinglog", 5), GLOBAL.Ingredient("gears", 3)}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/frosthammer.xml", "frosthammer.tex" )
frosthammer.tagneeded = false
frosthammer.builder_tag ="musha"

local armor_mushaa = AddRecipe("armor_mushaa", {glowdust, GLOBAL.Ingredient("goldnugget", 10), Ingredient("rope", 2)}, RECIPETABS.MUSHA, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/armor_mushaa.xml", "armor_mushaa.tex" )
armor_mushaa.tagneeded = false
armor_mushaa.builder_tag ="musha"

local broken_frosthammer = AddRecipe("broken_frosthammer", {armora, GLOBAL.Ingredient("bluegem", 5), GLOBAL.Ingredient("butterfly", 5),GLOBAL.Ingredient("gears", 2)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/broken_frosthammer.xml", "broken_frosthammer.tex" )
broken_frosthammer.tagneeded = false
broken_frosthammer.builder_tag ="musha"	

local pirateback = AddRecipe("pirateback", {armora, GLOBAL.Ingredient("goldnugget", 30), GLOBAL.Ingredient("yellowgem", 2),GLOBAL.Ingredient("livinglog", 4)}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/pirateback.xml", "pirateback.tex" )
pirateback.tagneeded = false
pirateback.builder_tag ="musha"	

local armor_mushab = AddRecipe("armor_mushab", {armora, GLOBAL.Ingredient("goose_feather", 10), GLOBAL.Ingredient("orangegem", 3),GLOBAL.Ingredient("bearger_fur", 2)}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/armor_mushab.xml", "armor_mushab.tex" )
armor_mushab.tagneeded = false
armor_mushab.builder_tag ="musha"	

--rabbit and cat
local hat_mbunny = AddRecipe("hat_mbunny", {GLOBAL.Ingredient("cutgrass", 8), GLOBAL.Ingredient("redgem", 1), GLOBAL.Ingredient("goggleshat", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/hat_mbunny.xml", "hat_mbunny.tex" )
hat_mbunny.tagneeded = false
hat_mbunny.builder_tag ="musha"

local hat_mwildcat = AddRecipe("hat_mwildcat", { bunny_scout, GLOBAL.Ingredient("purplegem", 2), GLOBAL.Ingredient("gears", 2)}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/hat_mwildcat.xml", "hat_mwildcat.tex" )
hat_mwildcat.tagneeded = false
hat_mwildcat.builder_tag ="musha"

local hat_mbunnya = AddRecipe("hat_mbunnya", {bunny_scout, GLOBAL.Ingredient("deserthat", 1), GLOBAL.Ingredient("walrus_tusk", 1) }, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/hat_mbunnya.xml", "hat_mbunnya.tex" )
hat_mbunnya.tagneeded = false
hat_mbunnya.builder_tag ="musha"

local hat_mprincess = AddRecipe("hat_mprincess", {glowdust3, GLOBAL.Ingredient("purplegem", 2), GLOBAL.Ingredient("amulet", 1) }, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/hat_mprincess.xml", "hat_mprincess.tex" )
hat_mprincess.tagneeded = false
hat_mprincess.builder_tag ="musha"	
--phoenixb
local hat_mphoenix = AddRecipe("hat_mphoenix", { GLOBAL.Ingredient("panflute", 1), GLOBAL.Ingredient("dragon_scales", 1), GLOBAL.Ingredient("yellowgem", 1), GLOBAL.Ingredient("greengem", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/hat_mphoenix.xml", "hat_mphoenix.tex" )
hat_mphoenix.tagneeded = false
hat_mphoenix.builder_tag ="musha"
--magic
--flute
local musha_flute = AddRecipe("musha_flute", { glowdust5, GLOBAL.Ingredient("horn", 1), GLOBAL.Ingredient("spidergland", 20)}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/musha_flute.xml", "musha_flute.tex" )
musha_flute.tagneeded = false
musha_flute.builder_tag ="musha"

--crystal
local cristal = AddRecipe("cristal", { glowdust5}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/cristal.xml", "cristal.tex" )
cristal.tagneeded = false
cristal.builder_tag ="musha"

--arong egg
local musha_egg_arong = AddRecipe("musha_egg_arong", { glowdust5, GLOBAL.Ingredient("amulet", 1), GLOBAL.Ingredient("beefalowool", 30), GLOBAL.Ingredient("purplegem", 4) }, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg_arong.xml", "musha_egg_arong.tex" )
musha_egg_arong.tagneeded = false
musha_egg_arong.builder_tag ="musha"

--random egg
local musha_egg_random = AddRecipe("musha_egg_random", { phoenix_egg, glowdust3}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg_random.xml", "musha_egg_random.tex" )
musha_egg_random.tagneeded = false
musha_egg_random.builder_tag ="musha"

--yamche egg
local musha_egg = AddRecipe("musha_egg", { GLOBAL.Ingredient("amulet", 1), GLOBAL.Ingredient("redgem", 7), GLOBAL.Ingredient("bluegem", 7)}, RECIPETABS.MUSHA, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg.xml", "musha_egg.tex" )
musha_egg.tagneeded = false
musha_egg.builder_tag ="musha"

local musha_eggs1 = AddRecipe("musha_eggs1", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 2)}, RECIPETABS.MUSHA, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/musha_eggs1.xml", "musha_eggs1.tex" )
musha_eggs1.tagneeded = false
musha_eggs1.builder_tag ="musha"

local musha_eggs2 = AddRecipe("musha_eggs2", { phoenix_eggs1, GLOBAL.Ingredient("goldnugget", 5) }, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/musha_eggs2.xml", "musha_eggs2.tex" )
musha_eggs2.tagneeded = false
musha_eggs2.builder_tag ="musha"

local musha_eggs3 = AddRecipe("musha_eggs3", { phoenix_eggs2, GLOBAL.Ingredient("goldnugget", 10) }, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/musha_eggs3.xml", "musha_eggs3.tex" )
musha_eggs3.tagneeded = false
musha_eggs3.builder_tag ="musha"

local musha_egg1 = AddRecipe("musha_egg1", { phoenix_eggs3, GLOBAL.Ingredient("goldnugget", 15), glowdust}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg1.xml", "musha_egg1.tex" )
musha_egg1.tagneeded = false
musha_egg1.builder_tag ="musha"

local musha_egg2 = AddRecipe("musha_egg2", { phoenix_egg1, GLOBAL.Ingredient("goldnugget", 20), GLOBAL.Ingredient("purplegem", 1), glowdust3 }, RECIPETABS.MUSHA, TECH.MAGIC_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg2.xml", "musha_egg2.tex" )
musha_egg2.tagneeded = false
musha_egg2.builder_tag ="musha"

local musha_egg3 = AddRecipe("musha_egg3", { phoenix_egg2, GLOBAL.Ingredient("goldnugget", 30), GLOBAL.Ingredient("purplegem", 2), glowdust5}, RECIPETABS.MUSHA, TECH.MAGIC_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg3.xml", "musha_egg3.tex" )
musha_egg3.tagneeded = false
musha_egg3.builder_tag ="musha"

local musha_egg8 = AddRecipe("musha_egg8", { phoenix_egg3, GLOBAL.Ingredient("goldnugget", 40), GLOBAL.Ingredient("purplegem", 5), glowdust10}, RECIPETABS.MUSHA, TECH.MAGIC_THREE, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg8.xml", "musha_egg8.tex" )
musha_egg8.tagneeded = false
musha_egg8.builder_tag ="musha"

end 

if Difficult_Recipe == "normal" then
--glow berry
--[[local lesserf = AddRecipe("wormlight_lesser", { greenf, GLOBAL.Ingredient("berries", 2), GLOBAL.Ingredient("ash", 1)}, RECIPETABS.MUSHA, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/lesserf.xml", "lesserf.tex" )
lesserf.tagneeded = false
lesserf.builder_tag ="musha"]]

--glowdust
local glowdusts = AddRecipe("glowdust", { GLOBAL.Ingredient("ash", 1),GLOBAL.Ingredient("honey", 5),greenfk}, RECIPETABS.MUSHA, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/glowdust.xml", "glowdust.tex" )
glowdusts.tagneeded = false
glowdusts.builder_tag ="musha"

--energy drink


--arrows
--local arrowm = AddRecipe("arrowm", {Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/arrowm.xml", "arrowm.tex" )
--arrowm.tagneeded = false
--arrowm.builder_tag ="musha"
local dummy_arrow0 = AddRecipe("dummy_arrow0", {Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_crow", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/dummy_arrow0.xml", "dummy_arrow0.tex" )
dummy_arrow0.tagneeded = false
dummy_arrow0.builder_tag ="musha"
local dummy_arrow1 = AddRecipe("dummy_arrow1", {Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/dummy_arrow1.xml", "dummy_arrow1.tex" )
dummy_arrow1.tagneeded = false
dummy_arrow1.builder_tag ="musha"
local dummy_arrow2 = AddRecipe("dummy_arrow2", {Ingredient("stinger", 1), Ingredient("twigs", 1), Ingredient("feather_robin_winter", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/dummy_arrow2.xml", "dummy_arrow2.tex" )
dummy_arrow2.tagneeded = false
dummy_arrow2.builder_tag ="musha"
local dummy_arrow4 = AddRecipe("dummy_arrow4", {Ingredient("stinger", 3), Ingredient("twigs", 3), Ingredient("feather_canary", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil,  "images/inventoryimages/dummy_arrow4.xml", "dummy_arrow4.tex" )
dummy_arrow4.tagneeded = false
dummy_arrow4.builder_tag ="musha"
local dummy_arrow3 = AddRecipe("arrowm", {broken_arrow, Ingredient("twigs", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/dummy_arrow3.xml", "dummy_arrow3.tex" )
dummy_arrow3.tagneeded = false
dummy_arrow3.builder_tag ="musha"

--tuna
local tunacan = AddRecipe("tunacan", { GLOBAL.Ingredient("fish_cooked", 1),GLOBAL.Ingredient("charcoal", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/tunacan.xml", "tunacan.tex" )
tunacan.tagneeded = false
tunacan.builder_tag ="musha"
--grass hut
local musha_hut = AddRecipe("musha_hut", { GLOBAL.Ingredient("log", 4), Ingredient("cutgrass", 6), Ingredient("rope", 3), }, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, "musha_hut_placer" ) 
musha_hut.atlas = "images/inventoryimages/musha_hut.xml"
musha_hut.tagneeded = false
musha_hut.builder_tag ="musha"
--dall
local moontree = AddRecipe("moontree", { glowdust20,GLOBAL.Ingredient("livinglog", 25),arong_egg }, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, "moontree_placer" ) 
moontree.atlas = "images/inventoryimages/moontree.xml"
moontree.tagneeded = false
moontree.builder_tag ="musha"
--oven
local musha_oven = AddRecipe("musha_oven", { glowdust5, GLOBAL.Ingredient("rocks", 20), GLOBAL.Ingredient("froglegs", 10), GLOBAL.Ingredient("purplegem", 2) }, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, "musha_oven_placer" ) 
musha_oven.atlas = "images/inventoryimages/musha_oven.xml"
musha_oven.tagneeded = false
musha_oven.builder_tag ="musha"
--forge
local forge_musha = AddRecipe("forge_musha", { crystal, GLOBAL.Ingredient("gears", 6), GLOBAL.Ingredient("transistor", 6), GLOBAL.Ingredient("livinglog", 10) }, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, "forge_musha_placer" ) 
forge_musha.atlas = "images/inventoryimages/forge_musha.xml"
forge_musha.tagneeded = false
forge_musha.builder_tag ="musha"
--tent
local tent_musha = AddRecipe("tent_musha", { glowdust5, Ingredient("fireflies", 1), Ingredient("papyrus", 6), Ingredient("cutgrass", 30), }, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, "tent_musha_placer" ) 
tent_musha.atlas = "images/inventoryimages/tent_musha.xml"
tent_musha.tagneeded = false
tent_musha.builder_tag ="musha"
----
local mushasword_base = AddRecipe("mushasword_base", { glowdust, GLOBAL.Ingredient("goldnugget", 2)}, RECIPETABS.MUSHA, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/mushasword_base.xml", "mushasword_base.tex" )
mushasword_base.tagneeded = false
mushasword_base.builder_tag ="musha"

local mushasword = AddRecipe("mushasword", {bladeb, GLOBAL.Ingredient("redgem", 4), glowdust}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/mushasword.xml", "mushasword.tex" )
mushasword.tagneeded = false
mushasword.builder_tag ="musha"

local mushasword_frost = AddRecipe("mushasword_frost", {bladeb, GLOBAL.Ingredient("bluegem", 4), glowdust}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/mushasword_frost.xml", "mushasword_frost.tex" )
mushasword_frost.tagneeded = false
mushasword_frost.builder_tag ="musha"
--bow
local bowm = AddRecipe("bowm", {phoenixb, GLOBAL.Ingredient("spidergland", 12), glowdust3}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/bowm.xml", "bowm.tex" )
bowm.tagneeded = false
bowm.builder_tag ="musha"
--spear
local phoenixspear = AddRecipe("phoenixspear", {phoenixb, phoenixf, GLOBAL.Ingredient("goldnugget", 30), glowdust3}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/phoenixspear.xml", "phoenixspear.tex" )
phoenixspear.tagneeded = false
phoenixspear.builder_tag ="musha"
--
local mushasword4 = AddRecipe("mushasword4", {Ingredient("goldnugget", 160), Ingredient("purplegem", 12), GLOBAL.Ingredient("greengem", 12), cristal}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mushasword4.xml", "mushasword4.tex" )
mushasword4.tagneeded = false
mushasword4.builder_tag ="musha"

local frosthammer = AddRecipe("frosthammer", {GLOBAL.Ingredient( "deerclops_eyeball", 1), GLOBAL.Ingredient( "bluegem", 24), GLOBAL.Ingredient("livinglog", 10), GLOBAL.Ingredient("gears", 6)}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/frosthammer.xml", "frosthammer.tex" )
frosthammer.tagneeded = false
frosthammer.builder_tag ="musha"

local armor_mushaa = AddRecipe("armor_mushaa", {glowdust3, GLOBAL.Ingredient("goldnugget", 20), Ingredient("rope", 3)}, RECIPETABS.MUSHA, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/armor_mushaa.xml", "armor_mushaa.tex" )
armor_mushaa.tagneeded = false
armor_mushaa.builder_tag ="musha"

local broken_frosthammer = AddRecipe("broken_frosthammer", {armora, GLOBAL.Ingredient("bluegem", 10), GLOBAL.Ingredient("butterfly", 10),GLOBAL.Ingredient("gears", 4)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/broken_frosthammer.xml", "broken_frosthammer.tex" )
broken_frosthammer.tagneeded = false
broken_frosthammer.builder_tag ="musha"	

local pirateback = AddRecipe("pirateback", {armora, GLOBAL.Ingredient("goldnugget", 60), GLOBAL.Ingredient("yellowgem", 3),GLOBAL.Ingredient("livinglog", 8)}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/pirateback.xml", "pirateback.tex" )
pirateback.tagneeded = false
pirateback.builder_tag ="musha"	

local armor_mushab = AddRecipe("armor_mushab", {armora, GLOBAL.Ingredient("goose_feather", 20), GLOBAL.Ingredient("orangegem", 5),GLOBAL.Ingredient("bearger_fur", 4)}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/armor_mushab.xml", "armor_mushab.tex" )
armor_mushab.tagneeded = false
armor_mushab.builder_tag ="musha"	

--rabbit and cat 2
local hat_mbunny = AddRecipe("hat_mbunny", {GLOBAL.Ingredient("cutgrass", 12), GLOBAL.Ingredient("redgem", 2), GLOBAL.Ingredient("goggleshat", 1)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/hat_mbunny.xml", "hat_mbunny.tex" )
hat_mbunny.tagneeded = false
hat_mbunny.builder_tag ="musha"

local hat_mwildcat = AddRecipe("hat_mwildcat", { bunny_scout, GLOBAL.Ingredient("purplegem", 4), GLOBAL.Ingredient("gears", 4)}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/hat_mwildcat.xml", "hat_mwildcat.tex" )
hat_mwildcat.tagneeded = false
hat_mwildcat.builder_tag ="musha"

local hat_mbunnya = AddRecipe("hat_mbunnya", {bunny_scout, GLOBAL.Ingredient("deserthat", 1), GLOBAL.Ingredient("walrus_tusk", 2) }, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/hat_mbunnya.xml", "hat_mbunnya.tex" )
hat_mbunnya.tagneeded = false
hat_mbunnya.builder_tag ="musha"

local hat_mprincess = AddRecipe("hat_mprincess", {glowdust5, GLOBAL.Ingredient("purplegem", 4), GLOBAL.Ingredient("amulet", 1) }, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/hat_mprincess.xml", "hat_mprincess.tex" )
hat_mprincess.tagneeded = false
hat_mprincess.builder_tag ="musha"	
--phoenixb
local hat_mphoenix = AddRecipe("hat_mphoenix", { GLOBAL.Ingredient("panflute", 1), GLOBAL.Ingredient("dragon_scales", 1), GLOBAL.Ingredient("yellowgem", 2), GLOBAL.Ingredient("greengem", 2)}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/hat_mphoenix.xml", "hat_mphoenix.tex" )
hat_mphoenix.tagneeded = false
hat_mphoenix.builder_tag ="musha"
--magic
--flute
local musha_flute = AddRecipe("musha_flute", { glowdust10, GLOBAL.Ingredient("horn", 1), GLOBAL.Ingredient("spidergland", 40)}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/musha_flute.xml", "musha_flute.tex" )
musha_flute.tagneeded = false
musha_flute.builder_tag ="musha"

--crystal
local cristal = AddRecipe("cristal", { glowdust10}, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/cristal.xml", "cristal.tex" )
cristal.tagneeded = false
cristal.builder_tag ="musha"

--arong egg
local musha_egg_arong = AddRecipe("musha_egg_arong", { glowdust5, GLOBAL.Ingredient("amulet", 1), GLOBAL.Ingredient("beefalowool", 60), GLOBAL.Ingredient("purplegem", 8) }, RECIPETABS.MUSHA, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg_arong.xml", "musha_egg_arong.tex" )
musha_egg_arong.tagneeded = false
musha_egg_arong.builder_tag ="musha"

--random egg
local musha_egg_random = AddRecipe("musha_egg_random", { phoenix_egg, crystal, glowdust3}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg_random.xml", "musha_egg_random.tex" )
musha_egg_random.tagneeded = false
musha_egg_random.builder_tag ="musha"

--yamche egg
local musha_egg = AddRecipe("musha_egg", { GLOBAL.Ingredient("amulet", 1), GLOBAL.Ingredient("redgem", 15), GLOBAL.Ingredient("bluegem", 15)}, RECIPETABS.MUSHA, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg.xml", "musha_egg.tex" )
musha_egg.tagneeded = false
musha_egg.builder_tag ="musha"

local musha_eggs1 = AddRecipe("musha_eggs1", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 4), glowdust}, RECIPETABS.MUSHA, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/musha_eggs1.xml", "musha_eggs1.tex" )
musha_eggs1.tagneeded = false
musha_eggs1.builder_tag ="musha"

local musha_eggs2 = AddRecipe("musha_eggs2", { phoenix_eggs1, GLOBAL.Ingredient("goldnugget", 10), glowdust}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/musha_eggs2.xml", "musha_eggs2.tex" )
musha_eggs2.tagneeded = false
musha_eggs2.builder_tag ="musha"

local musha_eggs3 = AddRecipe("musha_eggs3", { phoenix_eggs2, GLOBAL.Ingredient("goldnugget", 20), glowdust}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/musha_eggs3.xml", "musha_eggs3.tex" )
musha_eggs3.tagneeded = false
musha_eggs3.builder_tag ="musha"

local musha_egg1 = AddRecipe("musha_egg1", { phoenix_eggs3, GLOBAL.Ingredient("goldnugget", 30), glowdust3}, RECIPETABS.MUSHA, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg1.xml", "musha_egg1.tex" )
musha_egg1.tagneeded = false
musha_egg1.builder_tag ="musha"

local musha_egg2 = AddRecipe("musha_egg2", { phoenix_egg1, GLOBAL.Ingredient("goldnugget", 40), GLOBAL.Ingredient("purplegem", 1), glowdust10 }, RECIPETABS.MUSHA, TECH.MAGIC_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg2.xml", "musha_egg2.tex" )
musha_egg2.tagneeded = false
musha_egg2.builder_tag ="musha"

local musha_egg3 = AddRecipe("musha_egg3", { phoenix_egg2, GLOBAL.Ingredient("goldnugget", 60), GLOBAL.Ingredient("purplegem", 5), glowdust15}, RECIPETABS.MUSHA, TECH.MAGIC_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg3.xml", "musha_egg3.tex" )
musha_egg3.tagneeded = false
musha_egg3.builder_tag ="musha"

local musha_egg8 = AddRecipe("musha_egg8", { phoenix_egg3, GLOBAL.Ingredient("goldnugget", 80), GLOBAL.Ingredient("purplegem", 10), glowdust20}, RECIPETABS.MUSHA, TECH.MAGIC_THREE, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg8.xml", "musha_egg8.tex" )
musha_egg8.tagneeded = false
musha_egg8.builder_tag ="musha"
end 

function musha_verysmart(inst)
if IsServer then
inst.components.builder.science_bonus = 2
end end
function musha_smart(inst)
if IsServer then
inst.components.builder.science_bonus = 1
end end
function musha_normal(inst)
if IsServer then
inst.components.builder.science_bonus = 0
end end

if Smart == "verysmart" then
AddPrefabPostInit("musha", musha_verysmart)
end
if Smart == "smart" then
AddPrefabPostInit("musha", musha_smart)
end
if Smart == "normal" then
AddPrefabPostInit("musha", musha_normal)
end

function exp_type_meat(inst)
if IsServer then
inst:AddComponent("edible")
    inst.components.edible.foodtype = FOODTYPE.MEAT
	
	
end end
 function exp_type_veggie(inst)
if IsServer then
inst:AddComponent("edible")
    inst.components.edible.foodtype = FOODTYPE.VEGGIE
end end
	
function musha_princess_taste(inst)
if IsServer then
inst.princess_taste = true
end end	
if PuppyPrincess == "princess" then
AddPrefabPostInit("musha", musha_princess_taste)
end

function musha_dis_meat(inst)
if IsServer then
inst.dis_meat_taste = true
end end
function musha_dis_veggie(inst)
if IsServer then
inst.dis_veggie_taste = true
end end
function musha_normal(inst)
if IsServer then
inst.normal_taste = true
end end
function musha_meat(inst)
if IsServer then
inst.meat_taste = true
end end
function musha_veggie(inst)
if IsServer then
inst.veggie_taste = true
end end



if Dislike == "dis_meat" then
AddPrefabPostInit("musha", musha_dis_meat)
end
if Dislike == "dis_veggie" then
AddPrefabPostInit("musha", musha_dis_veggie)
end

if Diet == "normal" then
AddPrefabPostInit("musha", musha_normal)
end
if Diet == "meat" then
AddPrefabPostInit("musha", musha_meat)
--AddPrefabPostInit("exp", exp_type_meat)
end
if Diet == "veggie" then
AddPrefabPostInit("musha", musha_veggie)
--AddPrefabPostInit("exp", exp_type_veggie)
end


function tentacle_arm(inst)
if IsServer then
inst:AddTag("no_exp")
end end
AddPrefabPostInit("tentacle_pillar_arm", tentacle_arm)

function yamche_blue(inst)
if IsServer then
inst:AddTag("icecream")
end  end
AddPrefabPostInit("icecream", yamche_blue)
--end
--AddPrefabPostInit("musha", rockss)
--elemental
local function elemental( inst )
inst:AddComponent("fuel")
inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL
--inst.components.fuel.fuelvalue = TUNING.MED_LARGE_FUEL
inst.components.fuel.fueltype = "CHEMICAL"
inst:AddTag("elements")
end
local function elemental_ore( inst )
inst:AddComponent("fuel")
inst.components.fuel.fuelvalue = TUNING.MED_LARGE_FUEL
inst.components.fuel.fueltype = "CHEMICAL"
inst:AddTag("elements")
end
local function elemental_gold( inst )
inst:AddComponent("fuel")
inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
inst.components.fuel.fueltype = "CHEMICAL"
inst:AddTag("elements")
end

AddPrefabPostInit("goldnugget",elemental_gold)
AddPrefabPostInit("thulecite",elemental_gold)
AddPrefabPostInit("rocks",elemental_ore)
AddPrefabPostInit("flint",elemental_ore)
AddPrefabPostInit("marble",elemental_ore)
AddPrefabPostInit("moonrocknugget",elemental_ore)
AddPrefabPostInit("thulecite_pieces",elemental_ore)
AddPrefabPostInit("boneshard",elemental_ore)
AddPrefabPostInit("stinger",elemental)
AddPrefabPostInit("spidergland",elemental)
AddPrefabPostInit("houndstooth",elemental)
AddPrefabPostInit("snakeskin",elemental)
AddPrefabPostInit("slurtle_shellpieces",elemental)
AddPrefabPostInit("silk",elemental)

local function musha_wildness(inst)
if inst:HasTag("musha") then
if not inst.ghostenabled then
	inst.yamche_egg_hunted = true
end end
end
AddPrefabPostInit("musha",musha_wildness)

modimport("scripts/mypower_musha_1.lua")
modimport("scripts/widgets/spellpower_statusdisplays.lua")
modimport("scripts/widgets/fatigue_sleep_statusdisplays.lua")
modimport("scripts/widgets/stamina_sleep_statusdisplays.lua")

--active key
-- Import the lib use.
modimport("libs/use.lua")

-- Import the mod environment as our environment.
use "libs/mod_env"(env)
-- Imports to keep the keyhandler from working while typing in chat.
use "data/widgets/controls"
use "data/screens/chatinputscreen"
use "data/screens/consolescreen"

GLOBAL.TUNING.MUSHA = {}
GLOBAL.TUNING.MUSHA.KEY = GetModConfigData("key") or 108  --L
GLOBAL.TUNING.MUSHA.KEY2 = GetModConfigData("key2") or 114  --R
GLOBAL.TUNING.MUSHA.KEY3 = GetModConfigData("key3") or 99  --C
GLOBAL.TUNING.MUSHA.KEY4 = GetModConfigData("key4") or 120  --X  
GLOBAL.TUNING.MUSHA.KEY5 = GetModConfigData("key5") or 107  --K
GLOBAL.TUNING.MUSHA.KEY6 = GetModConfigData("key6") or 122  --Z
GLOBAL.TUNING.MUSHA.KEY7 = GetModConfigData("key7") or 112  --P
GLOBAL.TUNING.MUSHA.KEY15 = GetModConfigData("key15") or 111  --O
GLOBAL.TUNING.MUSHA.KEY8 = GetModConfigData("key8") or 118  --V
GLOBAL.TUNING.MUSHA.KEY9 = GetModConfigData("key9") or 98  --B
GLOBAL.TUNING.MUSHA.KEY10 = GetModConfigData("key10") or 110  --N
GLOBAL.TUNING.MUSHA.KEY11 = GetModConfigData("key11") or 103  --G
GLOBAL.TUNING.MUSHA.KEY12 = GetModConfigData("key12") or 116  --T
GLOBAL.TUNING.MUSHA.KEY13 = GetModConfigData("key13") or 282  --F1
GLOBAL.TUNING.MUSHA.KEY14 = GetModConfigData("key14") or 283  --F2
GLOBAL.TUNING.MUSHA.KEY16 = GetModConfigData("key16") or 285  --F3


local function visual_back_musha(inst)
if avisual_Musha == "Bmm" then
inst.Bmm = true
elseif avisual_Musha == "BT" then
inst.BT = true
elseif avisual_Musha == "BS" then
inst.BS = true
elseif avisual_Musha == "BM" then
inst.BL = true
elseif avisual_Musha == "BL" then
inst.BL = true
elseif avisual_Musha == "WSP" then
inst.WSP = true
elseif avisual_Musha == "WSR" then
inst.WSR = true
elseif avisual_Musha == "WSB" then
inst.WSB = true
elseif avisual_Musha == "WSH" then
inst.WSH = true
elseif avisual_Musha == "WLR" then
inst.WLR = true
elseif avisual_Musha == "WLB" then
inst.WLB = true
end
end
AddPrefabPostInit("armor_mushaa", visual_back_musha)

local function visual_back_princess(inst)
if avisual_Princess == "Bmm" then
inst.Bmm = true
elseif avisual_Princess == "BT" then
inst.BT = true
elseif avisual_Princess == "BS" then
inst.BS = true
elseif avisual_Princess == "BM" then
inst.BL = true
elseif avisual_Princess == "BL" then
inst.BL = true
elseif avisual_Princess == "WSP" then
inst.WSP = true
elseif avisual_Princess == "WSR" then
inst.WSR = true
elseif avisual_Princess == "WSB" then
inst.WSB = true
elseif avisual_Princess == "WSH" then
inst.WSH = true
elseif avisual_Princess == "WLR" then
inst.WLR = true
elseif avisual_Princess == "WLB" then
inst.WLB = true
end
end
AddPrefabPostInit("armor_mushab", visual_back_princess)

local function visual_back_pirate(inst)
if avisual_Pirate == "Bmm" then
inst.Bmm = true
elseif avisual_Pirate == "BT" then
inst.BT = true
elseif avisual_Pirate == "BS" then
inst.BS = true
elseif avisual_Pirate == "BM" then
inst.BL = true
elseif avisual_Pirate == "BL" then
inst.BL = true
elseif avisual_Pirate == "WSP" then
inst.WSP = true
elseif avisual_Pirate == "WSR" then
inst.WSR = true
elseif avisual_Pirate == "WSB" then
inst.WSB = true
elseif avisual_Pirate == "WSH" then
inst.WSH = true
elseif avisual_Pirate == "WLR" then
inst.WLR = true
elseif avisual_Pirate == "WLB" then
inst.WLB = true
end
end
AddPrefabPostInit("pirateback", visual_back_pirate)


local function visual_armor_pirate(inst)
if avisual_Pirate_Armor == "pirate" then
inst.Pirate = true
elseif avisual_Pirate_Armor == "green" then
inst.Green = true
elseif avisual_Pirate_Armor == "pink" then
inst.Pink = true
elseif avisual_Pirate_Armor == "blue" then
inst.Blue = true
elseif avisual_Pirate_Armor == "chest" then
inst.Chest = true
end
end
AddPrefabPostInit("pirateback", visual_armor_pirate)


local function frostarmor_shield(inst)
if butterfly_shield == 2 then
inst.no_butterfly_shield = true

end
end
AddPrefabPostInit("broken_frosthammer", frostarmor_shield)

local function moontree_spawn(inst)

if moontree_stop == 2 then
inst.radius_spawning = true
end
if moontree_stop == 3 then
inst.stop_spawning = true

end
end
AddPrefabPostInit("moontree", moontree_spawn)

local function frostblade_3rdbooster(inst)
if frostblade3rd == 2 then
inst.frostblade3rd_spear = true
end
if frostblade3rd == 3 then
inst.frostblade3rd_spear = true
inst.frostblade3rd_spear_range = true
end
end
AddPrefabPostInit("mushasword_frost", frostblade_3rdbooster)

---------------
 function on_yamcheinfo(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"yamche"})
for k,v in pairs(ents) do
if inst.components.leader:IsFollower(v) and v.components.follower.leader then 
v.yamcheinfo = true
end
end end
 function on_critterinfo(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"critter"})
for k,v in pairs(ents) do
if inst.components.leader:IsFollower(v) and v.components.follower.leader then 
v.yamcheinfo = true
end
end end
 function INFO(inst)
--Active info level?
inst.writing = false
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 1, {"_writeable"})
for k,v in pairs(ents) do
inst.writing = true
end 
if not inst.writing then
local TheInput = TheInput
local max_exp = 999997000
local level = math.min(inst.level, max_exp)
	local max_stamina = 100
	local min_stamina = 0
	local max_fatigue = 100
	local min_fatigue = 0	
	local max_music = 100
	local min_music = 0	
	local max_treasure = 100
	local min_treasure = 0	
	local stamina_sleep = inst.components.stamina_sleep.current
	local fatigue_sleep = inst.components.fatigue_sleep.current
			local mx=math.floor(max_stamina-min_stamina)
			local cur=math.floor(stamina_sleep-min_stamina)
			local mx2=math.floor(max_fatigue-min_fatigue)
			local cur2=math.floor(fatigue_sleep-min_fatigue)
			local mxx=math.floor(max_music-min_music)
			local curr=math.floor(inst.music-min_music)
			local mxt=math.floor(max_treasure-min_treasure)
			local curt=math.floor(inst.treasure-min_treasure)
		
			sleep = ""..math.floor(cur*100/mx).."%"
			sleepy = ""..math.floor(cur2*100/mx2).."%"
			musics = ""..math.floor(curr*100/mxx).."%"
			treasures = ""..math.floor(curt*100/mxt).."%"
inst.keep_check = false			
if not inst.keep_check then		
inst.keep_check = true	
--inst.sg:AddStateTag("notalking")

inst.components.talker:Say("["..STRINGS.MUSHA_LEVEL_NEXT_LEVEL_UP.."] "..STRINGS.MUSHA_LEVEL_EXP..":" .. (inst.level) .."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
on_yamcheinfo(inst)
on_critterinfo(inst)
if inst.level <5 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "1 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 5".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=5 and inst.level <9  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "2 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 10".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=10 and inst.level <29  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "3 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 30".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=30 and inst.level <49  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "4 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 50".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=50 and inst.level <79  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "5 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 80".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=80 and inst.level <124  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "6 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 125".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=125 and inst.level <199  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "7 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 200".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=200 and inst.level <339  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "8 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 340".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=340 and inst.level <429  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "9 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 430".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=430 and inst.level <529  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "10 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 530".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=530 and inst.level <639  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "11 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 640".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=640 and inst.level <759  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "12 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 760".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=760 and inst.level <889  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "13 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 890".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=890 and inst.level <1029  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "14 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 1030".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=1030 and inst.level <1179  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "15 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 1180".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=1180 and inst.level <1339  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "16 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 1340".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=1340 and inst.level <1509  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "17 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 1510".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=1510 and inst.level <1689  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "18 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 1690".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=1690 and inst.level <1879  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "19 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 1880".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=1880 and inst.level <2079  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "20 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 2080".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=2080 and inst.level <2289  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "21 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 2289".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=2290 and inst.level <2499  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "22 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 2500".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=2500 and inst.level <2849  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "23 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 2850".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=2850 and inst.level <3199  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "24 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 3200".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=3200 and inst.level <3699  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "25 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 3700".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=3700 and inst.level <4199  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "26 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 4200".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=4200 and inst.level <4699  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "27 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 4700".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=4700 and inst.level <5499 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "28 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 5500".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=5500 and inst.level <6999 then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "29 "..STRINGS.MUSHA_LEVEL_EXP..": ".. (inst.level) .."/ 7000".."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	
elseif inst.level >=7000  then
inst.components.talker:Say(STRINGS.MUSHA_LEVEL_LEVEL.. "30 \n[MAX]\n Extra EXP ".. (inst.level -7000).."\n["..STRINGS.MUSHA_LEVEL_SLEEP.."]: "..(sleep).."   ["..STRINGS.MUSHA_LEVEL_TIRED.."]: "..(sleepy).."\n["..STRINGS.MUSHA_LEVEL_MUSIC.."]: "..(musics).."   ["..STRINGS.MUSHA_LEVEL_SNIFF.."]: "..(treasures))	

end
elseif inst.keep_check then		
inst.keep_check = false	
--inst.components.talker:ShutUp()
--inst.sg:RemoveStateTag("notalking")
end
inst:DoTaskInTime( 0.5, function()
if inst.keep_check then
inst.keep_check = false
--inst.sg:RemoveStateTag("notalking") 
end end)
----inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
end 
end
AddModRPCHandler("musha", "INFO", INFO)
-------------------------
-------------------------
--active skill?  --skill_info
 function INFO2(inst)
inst.writing = false
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 1, {"_writeable"})
for k,v in pairs(ents) do
inst.writing = true
end 
if not inst.writing then
local TheInput = TheInput
local max_exp = 999997000
local level = math.min(inst.level, max_exp)
inst.keep_check = false			
if not inst.keep_check then		
inst.keep_check = true
--inst.sg:AddStateTag("notalking")
if inst.level >=0 and inst.level <=4 then --level[1]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[0/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[1/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[0/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[0/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[0/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[0/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[0/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >4 and inst.level <10 then --level[2]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[0/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[1/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[0/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[0/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[0/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[1/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[0/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >10 and inst.level <30  then --level[3]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[1/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[1/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[0/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[1/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[0/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[1/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[0/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=30 and inst.level <50  then --level[4]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[1/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[1/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[0/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[1/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[0/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[1/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[1/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=50 and inst.level <80  then --level[5]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[1/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[1/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[1/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[2/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[0/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[1/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[1/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=80 and inst.level <124  then --level[6]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[1/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[1/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[1/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[2/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[0/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[2/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[1/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=125 and inst.level <200  then --level[7]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[1/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[1/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[1/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[2/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[1/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[2/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[1/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=200 and inst.level <340  then --level[8]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[1/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[1/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[1/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[3/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[1/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[2/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[1/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=340 and inst.level <430  then --level[9]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[1/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[1/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[1/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[4/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[1/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[2/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[1/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=430 and inst.level <530  then --level[10]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[2/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[2/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[2/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[4/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[1/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[3/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[1/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=530 and inst.level <640  then --level[11]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[2/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[2/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[2/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[4/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[1/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[3/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[2/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=640 and inst.level <760  then --level[12]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[2/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[2/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[2/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[4/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[1/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[3/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[3/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=760 and inst.level <890  then --level[13]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[2/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[2/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[2/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[5/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[1/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[3/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[3/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=890 and inst.level <1030  then --level[14]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[2/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[2/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[2/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[6/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[1/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[3/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[3/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=1030 and inst.level <1180  then --level[15]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[2/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[2/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[3/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[6/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[1/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[4/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[3/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=1180 and inst.level <1340  then --level[16]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[2/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[2/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[3/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[6/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[1/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[4/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[4/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")	
elseif inst.level >=1340 and inst.level <1510  then --level[17]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[2/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[2/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[3/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[7/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[1/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[4/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[4/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")	
elseif inst.level >=1510 and inst.level <1690  then --level[18]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[2/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[2/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[3/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[8/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[1/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[4/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[4/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")	
elseif inst.level >=1690 and inst.level <1880  then --level[19]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[2/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[2/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[3/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[8/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[2/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[4/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[4/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")	
elseif inst.level >=1880 and inst.level <2080  then --level[20]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[3/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[3/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[4/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[8/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[2/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[4/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[5/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")	
elseif inst.level >=2080 and inst.level <2290  then --level[21]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[3/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[3/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[4/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[8/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[2/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[5/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[5/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")	
elseif inst.level >=2290 and inst.level <2500  then --level[22]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[3/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[3/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[4/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[9/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[2/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[5/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[5/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")	
elseif inst.level >=2500 and inst.level <2850  then --level[23]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[3/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[3/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[4/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[10/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[2/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[5/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[5/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")	
elseif inst.level >=2850 and inst.level <3200  then --level[24]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[3/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[3/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[4/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[10/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[3/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[5/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[5/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=3200 and inst.level <3700  then --level[25]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[3/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[3/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[5/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[10/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[3/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[5/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[6/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")
elseif inst.level >=3700 and inst.level <4200  then --level[26]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[3/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[3/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[5/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[11/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[3/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[5/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[6/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")	
elseif inst.level >=4200 and inst.level <4700  then --level[27]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[3/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[3/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[5/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[11/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[3/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[5/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[7/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")	
elseif inst.level >=4700 and inst.level <5500 then --level[28]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[3/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[3/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[5/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[12/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[3/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[5/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[7/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")	
elseif inst.level >=5500 and inst.level <7000 then --level[29]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[3/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[3/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[5/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[13/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[3/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[5/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[7/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[0/1]")	
elseif inst.level >=7000  then --level[30]
inst.components.talker:Say(STRINGS.MUSHA_SKILL_ACTIVE.."\n[*]"..STRINGS.MUSHA_SKILL_SLEEP.."[1/1]-(T)\n[*]"..STRINGS.MUSHA_SKILL_POWER.."[4/4]-(R)\n[*]"..STRINGS.MUSHA_SKILL_SHIELD.."[4/4]-(C)\n[*]"..STRINGS.MUSHA_SKILL_MUSIC.."[1/1]-(X)\n[*]"..STRINGS.MUSHA_SKILL_SHADOW.."[6/6]-(G)\n"..STRINGS.MUSHA_SKILL_PASSIVE.."\n[*]"..STRINGS.MUSHA_SKILL_VALKYR.."[14/14] \n[*]"..STRINGS.MUSHA_SKILL_BERSERK.."[3/3] \n[*]"..STRINGS.MUSHA_SKILL_ELECTRA.."[5/5] \n[*]"..STRINGS.MUSHA_SKILL_CRITIC.."[7/7] \n[*]"..STRINGS.MUSHA_SKILL_DOUBLE.."[1/1]")	
end
elseif inst.keep_check then		
inst.keep_check = false	
--inst.components.talker:ShutUp()
--inst.sg:RemoveStateTag("notalking")
end
inst:DoTaskInTime( 0.5, function()
if inst.keep_check then
inst.keep_check = false
--inst.sg:RemoveStateTag("notalking") 
end end)
----inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
end
end
AddModRPCHandler("musha", "INFO2", INFO2)

--active lightning strike
 function on_hitLightnings_9(inst, data)

local other = data.target
if not other:HasTag("smashable") and not other:HasTag("shadowminion") and not other:HasTag("alignwall") then
inst.SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
inst.lightning_spell_cost = false
if other and other.components.health and inst.level <=430  then
if inst.loud_1 or inst.loud_2 or inst.loud_3 then
SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
end
SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())

SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
local fx = SpawnPrefab("firering_fx")
	  fx.Transform:SetScale(0.6, 0.6, 0.6)
  	  fx.Transform:SetPosition(other:GetPosition():Get())
other.components.health:DoDelta(-40)
inst.components.sanity:DoDelta(-5)
inst.components.combat:SetRange(2)
other.burn = false
inst.AnimState:SetBloomEffectHandle( "" )
if inst.in_shadow then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	inst.in_shadow = false
end
inst.switch = false
inst:RemoveEventCallback("onhitother", on_hitLightnings_9)
if inst.frost and other.components.freezable then
other.components.freezable:AddColdness(1.5)
other.components.health:DoDelta(-5)
elseif inst.fire and other.components.burnable then
other.components.burnable:Ignite()
other.components.health:DoDelta(-15)
end
elseif other and other.components.health and inst.level > 430 and inst.level <= 1880  then
if inst.loud_1 or inst.loud_2 or inst.loud_3 then
SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
end
SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())
SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
local fx = SpawnPrefab("firering_fx")
	  fx.Transform:SetScale(0.6, 0.6, 0.6)
  	  fx.Transform:SetPosition(other:GetPosition():Get())
other.components.health:DoDelta(-60)
inst.components.sanity:DoDelta(-5)
inst.components.combat:SetRange(2)
other.burn = false
inst.AnimState:SetBloomEffectHandle( "" )
	if inst.in_shadow then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	inst.in_shadow = false
	end
inst.switch = false
inst:RemoveEventCallback("onhitother", on_hitLightnings_9)
if inst.frost and other.components.freezable then
other.components.freezable:AddColdness(2)
other.components.health:DoDelta(-10)
elseif inst.fire and other.components.burnable then
other.components.burnable:Ignite()
other.components.health:DoDelta(-30)
end
elseif other and other.components.health and inst.level > 1880 and inst.level <= 6999  then
if inst.loud_1 or inst.loud_2 or inst.loud_3 then
SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
end
SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())
SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
local fx = SpawnPrefab("firering_fx")
	  fx.Transform:SetScale(0.6, 0.6, 0.6)
  	  fx.Transform:SetPosition(other:GetPosition():Get())
other.components.health:DoDelta(-80)
inst.components.sanity:DoDelta(-5)
inst.components.combat:SetRange(2)
other.burn = false
inst.AnimState:SetBloomEffectHandle( "" )
	if inst.in_shadow then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	inst.in_shadow = false
	end
inst.switch = false  
inst:RemoveEventCallback("onhitother", on_hitLightnings_9)
if inst.frost and other.components.freezable then
other.components.freezable:AddColdness(2.5)
other.components.health:DoDelta(-15)
elseif inst.fire and other.components.burnable then
other.components.burnable:Ignite()
other.components.health:DoDelta(-45)
end
elseif other and other.components.health and inst.level >= 7000  then
if inst.loud_1 or inst.loud_2 or inst.loud_3 then
SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
end
SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())
SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
local fx = SpawnPrefab("firering_fx")
	  fx.Transform:SetScale(0.6, 0.6, 0.6)
  	  fx.Transform:SetPosition(other:GetPosition():Get())
other.components.health:DoDelta(-100)
inst.components.sanity:DoDelta(-5)
inst.components.combat:SetRange(2)
other.burn = false
inst.AnimState:SetBloomEffectHandle( "" )
	if inst.in_shadow then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	inst.in_shadow = false
	end
inst.switch = false  
inst:RemoveEventCallback("onhitother", on_hitLightnings_9)
if inst.frost and other.components.freezable then
other.components.freezable:AddColdness(3)
other.components.health:DoDelta(-20)
elseif inst.fire and other.components.burnable then
other.components.burnable:Ignite()
other.components.health:DoDelta(-60)
end
end 

--debuff with power lightning

if other:HasTag("burn") then
	other:DoTaskInTime(0.3, function() SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get()) 
	SpawnPrefab("lightning2").Transform:SetPosition(other:GetPosition():Get())
	other:DoTaskInTime(0.4, function() SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get()) 
	local fx_3 = SpawnPrefab("groundpoundring_fx")
		fx_3.Transform:SetScale(0.3, 0.3, 0.3)
		fx_3.Transform:SetPosition(other:GetPosition():Get())
	  end)
	
	other.slow = true 
			if not other:HasTag("slow") then
			other:AddTag("slow") 
			end

	other.burn = false other.bloom = false 
	other:RemoveTag("burn")
		if not other:HasTag("lightninggoat") then
		other.AnimState:SetBloomEffectHandle( "" ) 
		other.bloom = false 
		end
	

	if other:HasTag("slow") then
	
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(other:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(other.GUID, other.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end	
		
		if not other.shocked then
		other.components.health:DoDelta(-25)
		elseif other.shocked then
		SpawnPrefab("explode_small").Transform:SetPosition(other:GetPosition():Get())
		other.components.health:DoDelta(-50)
		other.shocked = false
		end
	
		local debuff = SpawnPrefab("debuff_short")
		debuff.Transform:SetPosition(other:GetPosition():Get())
		if debuff and other:HasTag("slow") then
		local follower = debuff.entity:AddFollower()
		if not other:HasTag("cavedweller") then
			follower:FollowSymbol(other.GUID, other.components.combat.hiteffectsymbol, 0, -50, 0.5 )
			else
			follower:FollowSymbol(other.GUID, "body", 0, -50, 0.5 )
			end
		TheWorld:DoPeriodicTask(2, function() 
		if other:HasTag("slow") and not other.components.health:IsDead() then 
			other.components.health:DoDelta(-8)
			--other.components.combat:GetAttacked(inst, 8)
			
		end	end)
		end	
		TheWorld:DoTaskInTime(15, function() if other.components.locomotor then other.components.locomotor.groundspeedmultiplier = 1 other.slow = false other:RemoveTag("slow") debuff:Remove() end end)
	end
	end)
end

if other:HasTag("lightninggoat") and not other:HasTag("charged") then
--other.charged = true
--other:AddTag("charged")
end
--if other:HasTag("lightninggoat") then
--	other.sg:GoToState("shocked")
--end
--[[if other.components.freezable and other.components.freezable:IsFrozen() and other:HasTag("dragonfly") then
      inst:DoTaskInTime( 1.5, function()  other.components.freezable:Unfreeze() end)
end]]
if other.components.burnable and other.components.burnable:IsBurning() then
        other.components.burnable:Extinguish()
end

local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
if weapon and weapon.components.weapon and weapon:HasTag("musha_items") then
weapon.components.weapon.stimuli = nil 
end
--[[local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 2, {"musha_items"})
for k,v in pairs(ents) do
if v.components.weapon then
v.components.weapon.stimuli = nil end
end]]
if inst.switch and inst.frosthammer2 then
    inst.AnimState:OverrideSymbol("swap_object", "swap_frosthammer2", "frosthammer")
    inst.AnimState:Show("ARM_carry") 
    inst.AnimState:Hide("ARM_normal") 
elseif not inst.switch and inst.frosthammer2 then
	inst.AnimState:OverrideSymbol("swap_object", "swap_frosthammer", "frosthammer")
    inst.AnimState:Show("ARM_carry") 
    inst.AnimState:Hide("ARM_normal") 
end
end
end
 
  function InShadow(inst, data)
if inst.sneaka then	
if inst.active_valkyrie or inst.switch then
inst.components.combat:SetRange(2)
inst.switch = false
end
local player = GLOBAL.ThePlayer
local x,y,z = inst.Transform:GetWorldPosition()	
local ents = TheSim:FindEntities(x, y, z, 12)
for k,v in pairs(ents) do
if v.components.health and not v.components.health:IsDead() and v.components.combat and v.components.combat.target == inst and not (v:HasTag("berrythief") or v:HasTag("prey") or v:HasTag("bird") or v:HasTag("butterfly")) then
		v.components.combat.target = nil
 end
 end end
 end
--old book skill

 function Call_lightining_on(inst, data)

local x,y,z = inst.Transform:GetWorldPosition()	
local ents = TheSim:FindEntities(x, y, z, 12)
for k,v in pairs(ents) do	
	if v:IsValid() and v.entity:IsVisible() and v.components.health and not v.components.health:IsDead() and not (v:HasTag("berrythief") or v:HasTag("bird") or v:HasTag("butterfly")) and not v:HasTag("groundspike") and not v:HasTag("player") and not v:HasTag("stalkerminion") and not v:HasTag("yamche") and not v:HasTag("companion") and not inst.components.rider ~= nil and not inst.components.rider:IsRiding() and not inst.sg:HasStateTag("moving") and not inst.sg:HasStateTag("attack") and not v:HasTag("structure") and v.components.combat and (v.components.combat.target == inst or v:HasTag("monster") or v:HasTag("burn") or v:HasTag("werepig") or v:HasTag("frog")) then		
			
	inst.components.locomotor:Stop()
if --[[inst.switch and inst.active_valkyrie and]] not inst.casting then 
----------------------------------------------------
--[[local fx_1 = SpawnPrefab("stalker_shield_musha")
	  fx_1.Transform:SetScale(0.5, 0.5, 0.5)
  	  fx_1.Transform:SetPosition(inst:GetPosition():Get())]]
	if not inst.casting then 
	inst.casting = true 
	if inst.components.spellpower.current > 0 then
	inst.components.spellpower:DoDelta(-3)
	end
	inst.sg:GoToState("book2") 
	end 
	
if inst.level < 430 then

	
	inst.SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
	if inst.loud_2 or inst.loud_3 then
	SpawnPrefab("lightning").Transform:SetPosition(v:GetPosition():Get())
	else
	SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	end
	
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
	local fx_2 = SpawnPrefab("groundpoundring_fx")
		fx_2.Transform:SetScale(0.4, 0.4, 0.4)
		fx_2.Transform:SetPosition(inst:GetPosition():Get())
	  
	v:DoTaskInTime(0.3, function() SpawnPrefab("shock_fx").Transform:SetPosition(v:GetPosition():Get())  
	SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	v:DoTaskInTime(0.4, function() SpawnPrefab("shock_fx").Transform:SetPosition(v:GetPosition():Get()) 
	local fx_3 = SpawnPrefab("groundpoundring_fx")
		fx_3.Transform:SetScale(0.3, 0.3, 0.3)
		fx_3.Transform:SetPosition(v:GetPosition():Get())
	  end)
		if v:HasTag("burn") then
			v.slow = true 
			if not v:HasTag("slow") then
			v:AddTag("slow") 
			end
		else	
		v.components.health:DoDelta(-10)
		--v.components.combat:GetAttacked(inst, 10)
			
		end
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
	v.burn = false v.bloom = false 
	v:RemoveTag("burn")
		if not v:HasTag("lightninggoat") then
		v.AnimState:SetBloomEffectHandle( "" ) 
		v.bloom = false 
		end
	

	if v:HasTag("slow") then
	
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end	
		
		if not v.shocked then
		v.components.health:DoDelta(-25)
		--v.components.combat:GetAttacked(inst, 20)
		elseif v.shocked then
		SpawnPrefab("explode_small").Transform:SetPosition(v:GetPosition():Get())
		v.components.health:DoDelta(-40)
		--v.components.combat:GetAttacked(inst, 40)
		v.shocked = false
		end
	
		local debuff = SpawnPrefab("debuff_short")
		debuff.Transform:SetPosition(v:GetPosition():Get())
		if debuff and v:HasTag("slow") then
		local follower = debuff.entity:AddFollower()
			if not v:HasTag("cavedweller") then
			follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, -50, 0.5 )
			else
			follower:FollowSymbol(v.GUID, "body", 0, -50, 0.5 )
			end
		TheWorld:DoPeriodicTask(2, function() 
		if v:HasTag("slow") and not v.components.health:IsDead() then 
			v.components.health:DoDelta(-2)
			--
		end	end)
		end	
		TheWorld:DoTaskInTime(15, function() if v.components.locomotor then v.components.locomotor.groundspeedmultiplier = 1 v.slow = false v:RemoveTag("slow") debuff:Remove() end end)
	elseif not v:HasTag("slow")	then
	v:AddTag("burn")	
	end
	end)
	
elseif inst.level >= 430 and inst.level < 1880 then

	
	inst.SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
	if inst.loud_2 or inst.loud_3 then
	
	SpawnPrefab("lightning").Transform:SetPosition(v:GetPosition():Get())
	else
	SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	end
	
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
	local fx_2 = SpawnPrefab("groundpoundring_fx")
		fx_2.Transform:SetScale(0.4, 0.4, 0.4)
		fx_2.Transform:SetPosition(inst:GetPosition():Get())
	  
	v:DoTaskInTime(0.3, function() SpawnPrefab("shock_fx").Transform:SetPosition(v:GetPosition():Get())  
	SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	v:DoTaskInTime(0.4, function() SpawnPrefab("shock_fx").Transform:SetPosition(v:GetPosition():Get()) 
	local fx_3 = SpawnPrefab("groundpoundring_fx")
		fx_3.Transform:SetScale(0.3, 0.3, 0.3)
		fx_3.Transform:SetPosition(v:GetPosition():Get())
	  end)
		if v:HasTag("burn") then
			v.slow = true 
			if not v:HasTag("slow") then
			v:AddTag("slow") 
			end
		else	
		
		v.components.health:DoDelta(-15)
		--v.components.combat:GetAttacked(inst, 15)
		end
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
	v.burn = false v.bloom = false 
	v:RemoveTag("burn")
		if not v:HasTag("lightninggoat") then
		v.AnimState:SetBloomEffectHandle( "" ) 
		v.bloom = false 
		end
	

	if v:HasTag("slow") then
	
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end	
		
		if not v.shocked then
		v.components.health:DoDelta(-30)
		--v.components.combat:GetAttacked(inst, 30)
		elseif v.shocked then
		SpawnPrefab("explode_small").Transform:SetPosition(v:GetPosition():Get())
		v.components.health:DoDelta(-50)
		--v.components.combat:GetAttacked(inst, 50)
		v.shocked = false
		end
	
		local debuff = SpawnPrefab("debuff_short")
		debuff.Transform:SetPosition(v:GetPosition():Get())
		if debuff and v:HasTag("slow") then
		local follower = debuff.entity:AddFollower()
		if not v:HasTag("cavedweller") then
			follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, -50, 0.5 )
			else
			follower:FollowSymbol(v.GUID, "body", 0, -50, 0.5 )
			end
		TheWorld:DoPeriodicTask(2, function() 
		if v:HasTag("slow") and not v.components.health:IsDead() then 
			v.components.health:DoDelta(-4)
			--
		end	end)
		end	
		TheWorld:DoTaskInTime(15, function() if v.components.locomotor then v.components.locomotor.groundspeedmultiplier = 1 v.slow = false v:RemoveTag("slow") debuff:Remove() end end)
	elseif not v:HasTag("slow")	then
	v:AddTag("burn")	
	end
	end)
	
elseif inst.level >= 1880 and inst.level < 7000 then

	 
	inst.SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
	if inst.loud_2 or inst.loud_3 then
	
	SpawnPrefab("lightning").Transform:SetPosition(v:GetPosition():Get())
	else
	SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	end
	
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
	local fx_2 = SpawnPrefab("groundpoundring_fx")
		fx_2.Transform:SetScale(0.4, 0.4, 0.4)
		fx_2.Transform:SetPosition(inst:GetPosition():Get())
	  
	v:DoTaskInTime(0.3, function() SpawnPrefab("shock_fx").Transform:SetPosition(v:GetPosition():Get())  
	SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	v:DoTaskInTime(0.4, function() SpawnPrefab("shock_fx").Transform:SetPosition(v:GetPosition():Get()) 
	local fx_3 = SpawnPrefab("groundpoundring_fx")
		fx_3.Transform:SetScale(0.3, 0.3, 0.3)
		fx_3.Transform:SetPosition(v:GetPosition():Get())
	  end)
		if v:HasTag("burn") then
			v.slow = true 
			if not v:HasTag("slow") then
			v:AddTag("slow") 
			end
		else	
		
		v.components.health:DoDelta(-20)
		--v.components.combat:GetAttacked(inst, 20)
		end
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
	v.burn = false v.bloom = false 
	v:RemoveTag("burn")
		if not v:HasTag("lightninggoat") then
		v.AnimState:SetBloomEffectHandle( "" ) 
		v.bloom = false 
		end
	

	if v:HasTag("slow") then
	
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end	
		
		if not v.shocked then
		v.components.health:DoDelta(-35)
		--v.components.combat:GetAttacked(inst, 35)
		elseif v.shocked then
		SpawnPrefab("explode_small").Transform:SetPosition(v:GetPosition():Get())
		v.components.health:DoDelta(-60)
		--v.components.combat:GetAttacked(inst, 60)
		v.shocked = false
		end
	
		local debuff = SpawnPrefab("debuff_short")
		debuff.Transform:SetPosition(v:GetPosition():Get())
		if debuff and v:HasTag("slow") then
		local follower = debuff.entity:AddFollower()
			if not v:HasTag("cavedweller") then
			follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, -50, 0.5 )
			else
			follower:FollowSymbol(v.GUID, "body", 0, -50, 0.5 )
			end
		TheWorld:DoPeriodicTask(2, function() 
		if v:HasTag("slow") and not v.components.health:IsDead() then 
			v.components.health:DoDelta(-6)
			--
		end	end)
		end	
		TheWorld:DoTaskInTime(15, function() if v.components.locomotor then v.components.locomotor.groundspeedmultiplier = 1 v.slow = false v:RemoveTag("slow") debuff:Remove() end end)
	elseif not v:HasTag("slow")	then
	v:AddTag("burn")
		
	end
	end)
	
elseif inst.level >= 7000 then

			

	inst.SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
	if inst.loud_2 or inst.loud_3 then
	
	SpawnPrefab("lightning").Transform:SetPosition(v:GetPosition():Get())
	else
	SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	end
	
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
	local fx_2 = SpawnPrefab("groundpoundring_fx")
		fx_2.Transform:SetScale(0.4, 0.4, 0.4)
		fx_2.Transform:SetPosition(inst:GetPosition():Get())
	  
	v:DoTaskInTime(0.3, function() SpawnPrefab("shock_fx").Transform:SetPosition(v:GetPosition():Get())  
	SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	v:DoTaskInTime(0.4, function() SpawnPrefab("shock_fx").Transform:SetPosition(v:GetPosition():Get()) 
	local fx_3 = SpawnPrefab("groundpoundring_fx")
		fx_3.Transform:SetScale(0.3, 0.3, 0.3)
		fx_3.Transform:SetPosition(v:GetPosition():Get())
	  end)
		if v:HasTag("burn") then
			v.slow = true 
			if not v:HasTag("slow") then
			v:AddTag("slow") 
			end
		else	
		
		v.components.health:DoDelta(-25)
		--v.components.combat:GetAttacked(inst, 25)
		end
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
	v.burn = false v.bloom = false 
	v:RemoveTag("burn")
		if not v:HasTag("lightninggoat") then
		v.AnimState:SetBloomEffectHandle( "" ) 
		v.bloom = false 
		end
	

	if v:HasTag("slow") then
	
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end	
		
		if not v.shocked then
		v.components.health:DoDelta(-40)
		--v.components.combat:GetAttacked(inst, 40)
		elseif v.shocked then
		SpawnPrefab("explode_small").Transform:SetPosition(v:GetPosition():Get())
		v.components.health:DoDelta(-70)
		--v.components.combat:GetAttacked(inst, 70)
		v.shocked = false
		end
	
		local debuff = SpawnPrefab("debuff_short")
		debuff.Transform:SetPosition(v:GetPosition():Get())
		if debuff and v:HasTag("slow") then
		local follower = debuff.entity:AddFollower()
		if not v:HasTag("cavedweller") then
			follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, -50, 0.5 )
			else
			follower:FollowSymbol(v.GUID, "body", 0, -50, 0.5 )
			end
		TheWorld:DoPeriodicTask(2, function() 
		if v:HasTag("slow") and not v.components.health:IsDead() then 
			v.components.health:DoDelta(-8)
			--
		end	end)
		end	
		TheWorld:DoTaskInTime(15, function() if v.components.locomotor then v.components.locomotor.groundspeedmultiplier = 1 v.slow = false v:RemoveTag("slow") debuff:Remove() end end)
	elseif not v:HasTag("slow")	then
	v:AddTag("burn")	
	end
	end)
	
		end 
	end
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
		end
	end
end	
--power lightning

 function Lightning_a(inst)
inst.writing = false
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 1, {"_writeable"})
for k,v in pairs(ents) do
inst.writing = true
end 
if inst.sneaka then
--inst.components.talker:Say("Be quiet..")
	if not inst.poison_sneaka then
		if inst.components.sanity.current > 10 then
		inst.components.talker:Say(STRINGS.MUSHA_TALK_READY_POISON)
		inst.components.sanity:DoDelta(-25)
		inst.poison_sneaka = true
			local poison_sneaka = SpawnPrefab("shadowbomb_r")
			if poison_sneaka then
			poison_sneaka.entity:SetParent(inst.entity)
			poison_sneaka.Follower:FollowSymbol(inst.GUID, "headbase", -5, -225, 0.5)
			end
		elseif inst.components.sanity.current <= 25 then
		inst.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SANITY)
		end
	elseif inst.poison_sneaka then	
	inst.components.talker:Say(STRINGS.MUSHA_TALK_CANCEL_POISON)
		inst.poison_sneaka = false
		inst.components.sanity:DoDelta(25)
	end
	
else
if not inst.writing and inst.berserk then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GRRR)
local fx = SpawnPrefab("stalker_shield_musha")
	  fx.Transform:SetScale(0.5, 0.5, 0.5)
  	  fx.Transform:SetPosition(inst:GetPosition():Get())
	local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(inst:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		--inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		follower:FollowSymbol(inst.GUID, inst.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end	
	local x,y,z = inst.Transform:GetWorldPosition()	
	local ents = TheSim:FindEntities(x, y, z, 10)
	for k,v in pairs(ents) do	
	if v:IsValid() and v.entity:IsVisible() and v.components.health and not v.components.health:IsDead() and not v.components.health:IsDead() and not (v:HasTag("berrythief") or v:HasTag("bird") or v:HasTag("butterfly")) and not v:HasTag("groundspike") and not v:HasTag("player") and not v:HasTag("stalkerminion") and not v:HasTag("structure") and not v:HasTag("groundspike") and not v:HasTag("stalkerminion") and v.components.locomotor and not v.ghost_spark and v.components.combat and (v.components.combat.target == inst or v:HasTag("monster") or v:HasTag("burn") or v:HasTag("werepig") or v:HasTag("frog")) then

	v.ghost_spark = true
	if inst.loud_1 or inst.loud_2 then
	SpawnPrefab("lightning").Transform:SetPosition(v:GetPosition():Get())
	else
	SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	end
	inst:DoTaskInTime(0.6, function() SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get()) end)
	local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		--inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end	
		-- lightning skill cost
		inst.components.sanity:DoDelta(-3)
	if v:HasTag("burn") and v.components.combat ~= nil then
			
		SpawnPrefab("explode_small").Transform:SetPosition(v:GetPosition():Get())
			if not v:HasTag("slow") then
			v:AddTag("slow") 
			end
		if v:HasTag("slow") then
	
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end	
		
		if not v.shocked then
		v.components.health:DoDelta(-25)
		--v.components.combat:GetAttacked(inst, 40)
		elseif v.shocked then
		SpawnPrefab("explode_small").Transform:SetPosition(v:GetPosition():Get())
		v.components.health:DoDelta(-35)
		--v.components.combat:GetAttacked(inst, 65)
		v.shocked = false
		
		end
	
		local debuff = SpawnPrefab("debuff_short")
		debuff.Transform:SetPosition(v:GetPosition():Get())
		if debuff and v:HasTag("slow") then
		local follower = debuff.entity:AddFollower()
		if not v:HasTag("cavedweller") then
			follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, -50, 0.5 )
			else
			follower:FollowSymbol(v.GUID, "body", 0, -50, 0.5 )
			end
		TheWorld:DoPeriodicTask(2, function() 
		if v:HasTag("slow") and not v.components.health:IsDead() then 
			v.components.health:DoDelta(-2)
			--
		end	end)
		end	
		TheWorld:DoTaskInTime(15, function() if v.components.locomotor then v.components.locomotor.groundspeedmultiplier = 1 v.slow = false v:RemoveTag("slow") debuff:Remove() end end)
			end
	else
		v.components.health:DoDelta(-15)
		--v.components.combat:GetAttacked(inst, 30)
	end		
				--[[if v.ghost_spark and v:HasTag("spider") then
					v.sg:GoToState("hit_stunlock")
				else
					v.sg:GoToState("hit")
				end]]
				if v.components.combat and not v:HasTag("companion") then
				v.components.combat:SuggestTarget(inst)
				end
		v:DoTaskInTime(3, function() v.ghost_spark = false end)
	end
	end

elseif not inst.writing and not inst.berserk then
if inst.stamina  >= 20 and inst.components.sanity.current >= 0 and not inst.components.health:IsDead() and not inst.active_valkyrie and not inst.switch and inst.valkyrie_on then
inst.active_valkyrie = true

--inst:DoTaskInTime( 60, function() inst.active_valkyrie = false SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) end) 
elseif (inst.components.stamina_sleep.current < 20 or inst.components.sanity.current <= 0) and not inst.active_valkyrie and inst.valkyrie_on then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GRRR)
if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
inst.sg:GoToState("repelled")
else
inst.sg:GoToState("mindcontrolled")
end
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
if inst.in_shadow then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	inst.in_shadow = false
	end
inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
inst.switch = false
inst.active_valkyrie = false
 
elseif inst.components.sanity.current <= 0 and inst.active_valkyrie and inst.valkyrie_on then 
inst.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SANITY)
if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
inst.sg:GoToState("repelled")
else
inst.sg:GoToState("mindcontrolled")
end
 inst.components.combat:SetRange(2)
inst:RemoveEventCallback("onhitother", on_hitLightnings_9)

inst.AnimState:SetBloomEffectHandle( "" )
if inst.in_shadow then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	inst.in_shadow = false
end
inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.switch = false
inst.active_valkyrie = false
--inst.components.sanity:DoDelta(4)
end
if inst.stamina  >= 20 and not inst.switch and inst.components.sanity.current > 0 and inst.level < 430  and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not ( inst.vl1 or inst.vl2 or inst.vl3 or inst.vl4 or inst.vl5 or inst.vl6 or inst.vl7 or inst.vl8) and inst.valkyrie_on then
	if inst.components.spellpower.current > 5 then
	inst.components.spellpower:DoDelta(-5) inst.lightning_spell_cost = true
inst.components.combat:SetRange(10,12)
inst:ListenForEvent("onhitother", on_hitLightnings_9)

inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
local fx = SpawnPrefab("groundpoundring_fx")
	  fx.Transform:SetScale(0.3, 0.3, 0.3)
  	  fx.Transform:SetPosition(inst:GetPosition():Get())
		if not inst.sneak_pang then
		inst:DoTaskInTime(2, function() if inst.switch then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end end)
		end
	end
inst.switch = true

local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(inst:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(inst.GUID, inst.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		
		end	
--Call_lightining_on(inst)
inst.components.sanity:DoDelta(-2)
elseif inst.stamina  >= 20 and not inst.switch and inst.components.sanity.current > 0 and inst.level >= 430 and inst.level < 1880  and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not ( inst.vl1 or inst.vl2 or inst.vl3 or inst.vl4 or inst.vl5 or inst.vl6 or inst.vl7 or inst.vl8) and inst.valkyrie_on then
	if inst.components.spellpower.current > 5 then
	inst.components.spellpower:DoDelta(-5) inst.lightning_spell_cost = true
inst.components.combat:SetRange(10,12)
inst:ListenForEvent("onhitother", on_hitLightnings_9)

inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
local fx = SpawnPrefab("groundpoundring_fx")
	  fx.Transform:SetScale(0.3, 0.3, 0.3)
  	  fx.Transform:SetPosition(inst:GetPosition():Get())
	 	if not inst.sneak_pang then
		inst:DoTaskInTime(2, function() if inst.switch then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end end)
		end
	end
inst.switch = true

local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(inst:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(inst.GUID, inst.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		
		end	
--Call_lightining_on(inst)
inst.components.sanity:DoDelta(-2)
if not inst.berserk then
--inst.components.talker:Say("Valkyrie!") 
end
elseif inst.stamina  >= 20 and not inst.switch and inst.components.sanity.current > 0 and inst.level >= 1880 and inst.level < 7000  and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not ( inst.vl1 or inst.vl2 or inst.vl3 or inst.vl4 or inst.vl5 or inst.vl6 or inst.vl7 or inst.vl8) and inst.valkyrie_on then
	if inst.components.spellpower.current > 5 then
	inst.components.spellpower:DoDelta(-5) inst.lightning_spell_cost = true
inst.components.combat:SetRange(10,12)
inst:ListenForEvent("onhitother", on_hitLightnings_9)

inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
local fx = SpawnPrefab("groundpoundring_fx")
	  fx.Transform:SetScale(0.3, 0.3, 0.3)
  	  fx.Transform:SetPosition(inst:GetPosition():Get())
		if not inst.sneak_pang then
		inst:DoTaskInTime(2, function() if inst.switch then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end end)
		end
	end
inst.switch = true

local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(inst:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(inst.GUID, inst.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		
		end	
--Call_lightining_on(inst)
inst.components.sanity:DoDelta(-2)
if not inst.berserk then
--inst.components.talker:Say("Valkyrie!") 
end
elseif inst.stamina  >= 20 and not inst.switch and inst.components.sanity.current > 0 and inst.level >= 7000 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not ( inst.vl1 or inst.vl2 or inst.vl3 or inst.vl4 or inst.vl5 or inst.vl6 or inst.vl7 or inst.vl8) and inst.valkyrie_on then
	if inst.components.spellpower.current > 5 then
	inst.components.spellpower:DoDelta(-5) inst.lightning_spell_cost = true
inst.components.combat:SetRange(10,12)
inst:ListenForEvent("onhitother", on_hitLightnings_9)

inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
local fx = SpawnPrefab("groundpoundring_fx")
	  fx.Transform:SetScale(0.3, 0.3, 0.3)
  	  fx.Transform:SetPosition(inst:GetPosition():Get())
		if not inst.sneak_pang then
		inst:DoTaskInTime(2, function() if inst.switch then inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) end end)
		end
	end
inst.switch = true

local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(inst:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(inst.GUID, inst.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		
		end	
--Call_lightining_on(inst)
inst.components.sanity:DoDelta(-2)

elseif not inst.switch and not inst.components.health:IsDead() and ( inst.vl1 or inst.vl2 or inst.vl3 or inst.vl4 or inst.vl5 or inst.vl6 or inst.vl7 or inst.vl8) and inst.valkyrie_on then
inst.components.combat:SetRange(2)
inst:RemoveEventCallback("onhitother", on_hitLightnings_9)

inst.AnimState:SetBloomEffectHandle( "" )
if inst.in_shadow then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	inst.in_shadow = false
end
inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.switch = false
inst.active_valkyrie = false
--inst.components.sanity:DoDelta(6)
	if inst.lightning_spell_cost then
	inst.components.spellpower:DoDelta(5)
	end
elseif inst.switch and not inst.components.health:IsDead() and inst.valkyrie_on then
inst.components.combat:SetRange(2)
inst:RemoveEventCallback("onhitother", on_hitLightnings_9)

inst.AnimState:SetBloomEffectHandle( "" )
if inst.in_shadow then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	inst.in_shadow = false
end
inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.switch = false
inst.active_valkyrie = false
inst.components.sanity:DoDelta(1)
	if inst.lightning_spell_cost then
	inst.components.spellpower:DoDelta(5)
	end
elseif not inst.switch and inst.components.sanity.current <= 0 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.valkyrie_on then
inst.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SANITY)
elseif inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_REVENGE)

local x,y,z = inst.Transform:GetWorldPosition()	
local ents = TheSim:FindEntities(x, y, z, 10)
for k,v in pairs(ents) do	
	if v:IsValid() and v.entity:IsVisible() and v.components.health and not v.components.health:IsDead() and not v.ghost_spark and not (v:HasTag("berrythief") or v:HasTag("bird") or v:HasTag("butterfly")) and not v:HasTag("groundspike") and not v:HasTag("player") and not v:HasTag("stalkerminion") and not inst.components.rider ~= nil and not inst.components.rider:IsRiding() and not inst.sg:HasStateTag("moving") and not inst.sg:HasStateTag("attack") and not v:HasTag("structure") and v.components.combat and (v.components.combat.target == inst or v:HasTag("monster") or v:HasTag("burn") or v:HasTag("werepig") or v:HasTag("frog")) then
	v.ghost_spark = true
	SpawnPrefab("lightning2").Transform:SetPosition(v:GetPosition():Get())
	local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end	
		v.components.health:DoDelta(-10)
				if v.ghost_spark and v:HasTag("spider") and not v:HasTag("spiderqueen") then
					v.sg:GoToState("hit_stunlock")
				elseif v.ghost_spark and v:HasTag("hound") then
					v.sg:GoToState("hit")
				end
		v:DoTaskInTime(3, function() v.ghost_spark = false end)
		
end
end

end 
--inst:ListenForEvent("killed", onkilll)
if not inst.valkyrie_on and not inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_NEED_EXP.."\n[REQUIRE]: level 3")
end
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 40, {"yamcheb"})
for k,v in pairs(ents) do
if inst.components.leader:IsFollower(v) and not inst.switch then
v.yamche_lightning = false
elseif inst.components.leader:IsFollower(v) and inst.switch then
v.yamche_lightning = true
end end

local weapon = inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
if inst.switch and weapon and weapon.components.weapon then 
weapon.components.weapon.stimuli = "electric"
elseif not inst.switch and weapon and weapon.components.weapon and not weapon:HasTag("electric_weapon") then
weapon.components.weapon.stimuli = nil
end

----inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
end 
end
if inst.switch and inst.frosthammer2 then
    inst.AnimState:OverrideSymbol("swap_object", "swap_frosthammer2", "frosthammer")
    inst.AnimState:Show("ARM_carry") 
    inst.AnimState:Hide("ARM_normal") 
elseif not inst.switch and inst.frosthammer2 then
	inst.AnimState:OverrideSymbol("swap_object", "swap_frosthammer", "frosthammer")
    inst.AnimState:Show("ARM_carry") 
    inst.AnimState:Hide("ARM_normal") 
end
end
AddModRPCHandler("musha", "Lightning_a", Lightning_a)

--shield
--active shield
 function shield_go(inst, attacked, data)
	
if not inst.components.health:IsDead() and inst.level < 430 and not inst.activec0 and inst.shield_level1 then
--inst.components.talker:Say("Shield on!!")
inst.components.health:SetAbsorptionAmount(1)
local fx = SpawnPrefab("forcefieldfxx")
inst.on_sparkshield = true

inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
fx.entity:SetParent(inst.entity)
		if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
		fx.Transform:SetScale(2, 2, 2)
		else
		fx.Transform:SetScale(0.8, 0.8, 0.8)
		end
fx.Transform:SetPosition(0, 0.2, 0)
local fx_hitanim = function()
fx.AnimState:PlayAnimation("hit")
fx.AnimState:PushAnimation("idle_loop")
end
fx:ListenForEvent("blocked", fx_hitanim, inst)
inst.activec0 = true
inst.timec1 = true
inst:DoTaskInTime(--[[Duration]] 12, function()
fx:RemoveEventCallback("blocked", fx_hitanim, inst)

if inst:IsValid() then
fx.kill_fx(fx)
--inst.components.health:SetAbsorptionAmount(0)
inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_COOL_90)
inst.on_sparkshield = false

inst:DoTaskInTime(--[[Cooldown]] 90, function() inst.activec0 = false inst.timec1 = false inst.casting = false end)
end end) 
end 
if not inst.components.health:IsDead() and inst.level >= 430 and inst.level < 1880 and not inst.activec0 and inst.shield_level2 then
--inst.components.talker:Say("Shield on!!")
inst.components.health:SetAbsorptionAmount(1)
local fx = SpawnPrefab("forcefieldfxx")
inst.on_sparkshield = true

inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
fx.entity:SetParent(inst.entity)
if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
		fx.Transform:SetScale(2, 2, 2)
		else
		fx.Transform:SetScale(0.8, 0.8, 0.8)
		end
fx.Transform:SetPosition(0, 0.2, 0)
local fx_hitanim = function()
fx.AnimState:PlayAnimation("hit")
fx.AnimState:PushAnimation("idle_loop")
end
fx:ListenForEvent("blocked", fx_hitanim, inst)
inst.activec0 = true
inst.timec2 = true
inst:DoTaskInTime(--[[Duration]] 12, function()
fx:RemoveEventCallback("blocked", fx_hitanim, inst)
if inst:IsValid() then
fx.kill_fx(fx)
--inst.components.health:SetAbsorptionAmount(0)
inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_COOL_80)
inst.on_sparkshield = false
inst:DoTaskInTime(--[[Cooldown]] 80, function() inst.activec0 = false inst.timec2 = false end)
end end) 
end 
if not inst.components.health:IsDead() and inst.level >= 1880 and inst.level < 7000 and not inst.activec0 and inst.shield_level3 then
--inst.components.talker:Say("Shield on!!")
inst.components.health:SetAbsorptionAmount(1)
local fx = SpawnPrefab("forcefieldfxx")
inst.on_sparkshield = true

inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
fx.entity:SetParent(inst.entity)
if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
		fx.Transform:SetScale(2, 2, 2)
		else
		fx.Transform:SetScale(0.8, 0.8, 0.8)
		end
fx.Transform:SetPosition(0, 0.2, 0)
local fx_hitanim = function()
fx.AnimState:PlayAnimation("hit")
fx.AnimState:PushAnimation("idle_loop")
end
fx:ListenForEvent("blocked", fx_hitanim, inst)
inst.activec0 = true
inst.timec3 = true
inst:DoTaskInTime(--[[Duration]] 12, function()
fx:RemoveEventCallback("blocked", fx_hitanim, inst)
if inst:IsValid() then
fx.kill_fx(fx)
--inst.components.health:SetAbsorptionAmount(0)
inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_COOL_70)
inst.on_sparkshield = false
inst:DoTaskInTime(--[[Cooldown]] 70, function() inst.activec0 = false inst.timec3 = false end)
end end) 
end 
if not inst.components.health:IsDead() and inst.level >= 7000 and not inst.activec0 and inst.shield_level4 then
--inst.components.talker:Say("Shield on!!")
inst.components.health:SetAbsorptionAmount(1)
local fx = SpawnPrefab("forcefieldfxx")
inst.on_sparkshield = true

inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
fx.entity:SetParent(inst.entity)
if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
		fx.Transform:SetScale(2, 2, 2)
		else
		fx.Transform:SetScale(0.8, 0.8, 0.8)
		end
fx.Transform:SetPosition(0, 0.2, 0)
local fx_hitanim = function()
fx.AnimState:PlayAnimation("hit")
fx.AnimState:PushAnimation("idle_loop")
end
fx:ListenForEvent("blocked", fx_hitanim, inst)
inst.activec0 = true
inst.timec4 = true
inst:DoTaskInTime(--[[Duration]] 12, function()
fx:RemoveEventCallback("blocked", fx_hitanim, inst)
if inst:IsValid() then
fx.kill_fx(fx)
--inst.components.health:SetAbsorptionAmount(0)
inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_COOL_60)
inst.on_sparkshield = false

	if  inst.berserk and inst.berserk_armor_1 and not inst.music_armor then
	inst.components.health:SetAbsorptionAmount(0.15)
	elseif  inst.berserk and inst.berserk_armor_2 and not inst.music_armor then
	inst.components.health:SetAbsorptionAmount(0.3)	
	elseif  inst.berserk and inst.berserk_armor_3 and not inst.music_armor then
	inst.components.health:SetAbsorptionAmount(0.45)
	elseif  inst.valkyrie and not (inst.valkyrie_armor_1 or inst.valkyrie_armor_2 or inst.valkyrie_armor_3 or inst.valkyrie_armor_4) and not inst.music_armor then
	inst.components.health:SetAbsorptionAmount(0.1)
	elseif  inst.valkyrie and inst.valkyrie_armor_1 and not inst.music_armor then
	inst.components.health:SetAbsorptionAmount(0.1)
	elseif  inst.valkyrie and inst.valkyrie_armor_2 and not inst.music_armor then
	inst.components.health:SetAbsorptionAmount(0.2)	
	elseif  inst.valkyrie and inst.valkyrie_armor_3 and not inst.music_armor then
	inst.components.health:SetAbsorptionAmount(0.25)	
	elseif  inst.valkyrie and inst.valkyrie_armor_4 and not inst.music_armor then
	inst.components.health:SetAbsorptionAmount(0.3)
	else
	inst.components.health:SetAbsorptionAmount(0)
	end	
inst:DoTaskInTime(--[[Cooldown]] 60, function() inst.activec0 = false inst.timec4 = false end)
end end) 
end 
----inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
end

---
 function shieldgo(inst)
if not inst.activec0 and not inst.timec1 and inst.level < 430  then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_FULL)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.timec1 = true
elseif not inst.activec0 and not inst.timec2 and inst.level >= 430 and inst.level < 1880  then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_FULL)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.timec2 = true
elseif not inst.activec0 and not inst.timec3 and inst.level >= 1880 and inst.level < 7000  then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_FULL)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.timec3 = true
elseif not inst.activec0 and not inst.timec4 and inst.level >= 7000 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SHIELD_FULL)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.timec4 = true
end 
----inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
end
 function on_shield_act(inst)

inst.writing = false
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 1, {"_writeable"})
for k,v in pairs(ents) do
inst.writing = true
end 
if not inst.writing then
if inst.components.health ~=nil and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst:ListenForEvent("hungerdelta", shieldgo )
--inst:ListenForEvent("attacked", Sparkshield_1)
if inst.level < 430 then
inst.shield_level1 = true
elseif inst.level >= 430 and inst.level < 1880 then
inst.shield_level2 = true
inst.shield_level1 = false
elseif inst.level >= 1880 and inst.level < 7000 then
inst.shield_level3 = true
inst.shield_level2 = false
inst.shield_level1 = false
elseif inst.level >= 7000 then
inst.shield_level4 = true
inst.shield_level3 = false
inst.shield_level2 = false
inst.shield_level1 = false
end

if not inst.activec0 and inst.components.spellpower.current >= 30 then
--[[local fx_1 = SpawnPrefab("stalker_shield_musha")
	  fx_1.Transform:SetScale(0.4, 0.4, 0.4)
  	  fx_1.Transform:SetPosition(inst:GetPosition():Get())]]
	  inst.components.locomotor:Stop()
		if not inst.casting and not inst.components.rider:IsRiding() and not inst.sg:HasStateTag("moving") and not inst.sg:HasStateTag("attack") then 
		inst.casting = true 
		inst.sg:GoToState("book2") 
		inst.on_sparkshield = true
		end 
			
	local shocking_self = SpawnPrefab("musha_spin_fx")
		shocking_self.Transform:SetPosition(inst:GetPosition():Get())
		if shocking_self then
		local follower = shocking_self.entity:AddFollower()
		follower:FollowSymbol(inst.GUID, inst.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end	

	local x,y,z = inst.Transform:GetWorldPosition()	
	local ents = TheSim:FindEntities(x, y, z, 10)
for k,v in pairs(ents) do	
if inst.components.sanity and v:IsValid() and v.entity:IsVisible() and v.components.health and not v.components.health:IsDead() and not (v:HasTag("berrythief") or v:HasTag("bird") or v:HasTag("butterfly")) and not v:HasTag("groundspike") and not v:HasTag("player") and not v:HasTag("companion") and not v:HasTag("stalkerminion") and not v:HasTag("structure") and v.components.combat ~= nil and (v.components.combat.target == inst or v:HasTag("monster") or v:HasTag("burn")) then
		
	SpawnPrefab("sparks").Transform:SetPosition(v:GetPosition():Get())
	--SpawnPrefab("shock_fx").Transform:SetPosition(v:GetPosition():Get())
		local shocking = SpawnPrefab("musha_spin_fx")
		shocking.Transform:SetPosition(v:GetPosition():Get())
		if shocking then
		local follower = shocking.entity:AddFollower()
		follower:FollowSymbol(v.GUID, v.components.combat.hiteffectsymbol, 0, 0, 0.5 )
		end
		
	if v.components.locomotor and not v:HasTag("ghost") then
        v.components.locomotor:StopMoving()
		if v:HasTag("spider") and not v:HasTag("spiderqueen") then
			v.sg:GoToState("hit_stunlock")
		else
			v.sg:GoToState("hit")
		end
	end
		v.components.health:DoDelta(-20)
		--v.components.combat:GetAttacked(inst, 10)
	
	if v.components.combat and not v:HasTag("companion") then
        v.components.combat:SuggestTarget(inst)
    end
end
end
		
elseif inst.activec0 or inst.components.spellpower.current < 30 then
if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
inst.sg:GoToState("repelled")
else
inst.sg:GoToState("mindcontrolled")
end
end

if inst.level < 430 and not inst.activec0 and inst.components.spellpower.current >= 30 then
--inst.components.talker:Say("Shield on!!")
shield_go(inst)
	if inst.components.spellpower then
	inst.components.spellpower:DoDelta(-30) 
	end
elseif inst.level >= 430 and inst.level < 1880 and not inst.activec0 and inst.components.spellpower.current >= 30 then
--inst.components.talker:Say("Shield on!!")
shield_go(inst)
	if inst.components.spellpower then
	inst.components.spellpower:DoDelta(-30) 
	end
elseif inst.level >= 1880 and inst.level < 7000 and not inst.activec0 and inst.components.spellpower.current >= 30 then
--inst.components.talker:Say("Shield on!!")
shield_go(inst)
	if inst.components.spellpower then
	inst.components.spellpower:DoDelta(-30) 
	end
elseif inst.level >= 7000 and not inst.activec0 and inst.components.spellpower.current >= 30 then
--inst.components.talker:Say("Shield on!!")
shield_go(inst)
	if inst.components.spellpower then
	inst.components.spellpower:DoDelta(-30) 
	end
elseif inst.components.spellpower.current < 30 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SPELLPOWER.."\n(30)")
--inst.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SLEEPY)
  
elseif inst.activec0 then

inst.shield_level1 = false
inst.shield_level2 = false
inst.shield_level3 = false
inst.shield_level4 = false

end
----inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
elseif inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_OOOOH)
end
end
end
 
AddModRPCHandler("musha", "on_shield_act", on_shield_act)

--treasure hunt

	
 function musha_egghunt(inst, data)
		-- egghunt -- 
		
if not inst.yamche_egg_hunted then
		local pos1 = inst:GetPosition()
		local offset1 = FindWalkableOffset(pos1, math.random() * 2 * math.pi, math.random(5, 10), 10)
		local spawn_pos1 = pos1 + offset1
    
		if offset1 then 
		local hidden_egg = SpawnPrefab("musha_hidden_egg")
		hidden_egg.Transform:SetPosition(spawn_pos1:Get())
		local puff = SpawnPrefab("small_puff")
		puff.Transform:SetPosition(spawn_pos1:Get())
		local shovel = SpawnPrefab("shovel")
		shovel.Transform:SetPosition(spawn_pos1:Get())
		hidden_egg:SetTreasureHunt()
			inst.yamche_egg_hunted = true	
			inst:DoTaskInTime(0.5, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FIRST) 
			inst:DoTaskInTime(2, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_YAMCHE) 
			end) end)

		elseif not offset1 then 
		inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FAILED)
			inst.treasure = inst.treasure + 95
	end		
end	
	
end	
	
	
 function musha_treasurehunt(inst, isload)

if not inst.yamche_egg_hunted then
musha_egghunt(inst)
--elseif not inst.arong_egg_hunted then
--musha_egghunt(inst)
elseif inst.yamche_egg_hunted --[[and inst.arong_egg_hunted]] then
	
		local pos1 = inst:GetPosition()
		local offset1 = FindWalkableOffset(pos1, math.random() * 800 * math.pi, math.random(900, 1000), 500)
		local offset2 = FindWalkableOffset(pos1, math.random() * 200 * math.pi, math.random(250, 300), 180)
		local offset3 = FindWalkableOffset(pos1, math.random() * 3 * math.pi, math.random(25, 30), 18)
		local guard1 = FindWalkableOffset(pos1, math.random() * 1 * math.pi, math.random(2, 4), 3)
		local guard2 = FindWalkableOffset(pos1, math.random() * 1 * math.pi, math.random(3, 5), 3)
		local guard3 = FindWalkableOffset(pos1, math.random() * 1 * math.pi, math.random(1, 2), 3)	
	--test
	--[[
			if offset3 then
		inst.treasure3 = true
		inst:DoTaskInTime(0.5, function() inst.components.talker:Say("It is near !!") end)
			local spawn_pos3 = pos1 + offset3
			local treasure3 = SpawnPrefab("musha_treasure2")
			treasure3.Transform:SetPosition(spawn_pos3:Get())
			treasure3:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos3:Get())
			treasure3:AddTag("treasure")
			inst.treasure = inst.treasure + 100 end
		]]
	
		if math.random() < 0.5 and offset1 then
		inst.treasure1 = true
		inst:DoTaskInTime(1, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FAR) end)		
			local spawn_pos1 = pos1 + offset1
			local treasure1 = SpawnPrefab("musha_treasure2")
			treasure1.Transform:SetPosition(spawn_pos1:Get())
			treasure1:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos1:Get())
			--treasure1:AddTag("treasure")
		-- green worm
		if math.random() < 0.5 and guard1 then
		local spawn_pos1_gw = pos1 + offset1 + guard1
		local gworm = SpawnPrefab("greenworm")
		gworm.Transform:SetPosition(spawn_pos1_gw:Get())
		gworm.sg:GoToState("lure_enter")
		end
		-- green fruit
		if math.random() < 0.5 and guard2 then
		local spawn_pos1_gw = pos1 + offset1 + guard2
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos1_gw:Get())
		end
		if math.random() < 0.25 and guard3 then
		local spawn_pos1_gw = pos1 + offset1 + guard3
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos1_gw:Get())
		end
	
		elseif math.random() < 0.6 and not inst.treasure1 and offset2 then
		inst.treasure2 = true
		inst:DoTaskInTime(1, function()	inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_MED) end)
			local spawn_pos2 = pos1 + offset2
			local treasure2 = SpawnPrefab("musha_treasure2")
			treasure2.Transform:SetPosition(spawn_pos2:Get())
			treasure2:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos2:Get())
			--treasure2:AddTag("treasure")
		-- green worm
		if math.random() < 0.55 and guard1 then
		local spawn_pos2_gw = pos1 + offset2 + guard1
		local gworm = SpawnPrefab("greenworm")
		gworm.Transform:SetPosition(spawn_pos2_gw:Get())
		gworm.sg:GoToState("lure_enter")
		end
		-- green fruit
		if math.random() < 0.5 and guard2 then
		local spawn_pos2_gw = pos1 + offset2 + guard2
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos2_gw:Get())
		end
		-- green fruit
		if math.random() < 0.25 and guard3 then
		local spawn_pos2_gw = pos1 + offset2 + guard3
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos2_gw:Get())
		end	
		
		elseif not inst.treasure1 and not inst.treasure2 and offset3 then
		inst.treasure3 = true
		inst:DoTaskInTime(0.5, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_NEAR) end)
			local spawn_pos3 = pos1 + offset3
			local treasure3 = SpawnPrefab("musha_treasure2")
			treasure3.Transform:SetPosition(spawn_pos3:Get())
			treasure3:SetTreasureHunt()
			SpawnPrefab("musha_spore").Transform:SetPosition(spawn_pos3:Get())
			--treasure3.near_treasure = true
		-- green worm 
		if math.random() < 0.5 and guard1 then
		local spawn_pos3_gw = pos1 + offset3 + guard1
		local gworm = SpawnPrefab("greenworm")
		gworm.Transform:SetPosition(spawn_pos3_gw:Get())
		gworm.sg:GoToState("lure_enter")
		end
		-- green fruit
		if math.random() < 0.5 and guard2 then
		local spawn_pos3_gw = pos1 + offset3 + guard2
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos3_gw:Get())
		end
		if math.random() < 0.25 and guard3 then
		local spawn_pos3_gw = pos1 + offset3 + guard3
		local gworm = SpawnPrefab("green_apple_plant")
		gworm.Transform:SetPosition(spawn_pos3_gw:Get())
		end	
	
		elseif not inst.treasure1 and not inst.treasure2 and not inst.treasure3 then
			inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FAILED)
			inst.treasure = inst.treasure + 90
		end
	
		-------------
	
	--test
	--[[
	if IsServer then
	local minimap_fog = TheSim:FindFirstEntityWithTag("minimap")
		if minimap_fog then
			minimap_fog.MiniMap:EnableFogOfWar(false)
			minimap_fog.MiniMap:DrawForgottenFogOfWar(true)
		inst:DoTaskInTime( 5, function() if minimap_fog then 
			minimap_fog.MiniMap:EnableFogOfWar(true) 
		end end)
		end
	end]]
				
		-------------

	if inst.treasure1 or inst.treasure2 or inst.treasure3 then 		
	inst.treasure1 = false
	inst.treasure2 = false
	inst.treasure3 = false
			end
	end
end

 function on_treasure_hunt(inst)
if inst.components.playercontroller then
inst.components.playercontroller:Enable(false)

--[[	if TheSim:FindFirstEntityWithTag("musha_treasure") then
	local treasures = TheSim:FindFirstEntityWithTag("musha_treasure")
	local x, y, z = treasures.Transform:GetWorldPosition()
	local minimap = TheWorld.minimap.MiniMap
	minimap:ShowArea(x, y, z, 20)
			end]]

inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_SNIFF)
local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
if item then
inst.sg:GoToState("talk")
inst.components.inventory:Unequip(EQUIPSLOTS.HANDS, true) 
inst.components.inventory:GiveItem(item)
end
inst:DoTaskInTime(1.5, function() inst.components.playercontroller:Enable(false) inst.sg:GoToState("peertelescope2") inst.components.talker.colour = Vector3(1, 0.85, 0.7, 1) inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_FOUND) 
inst:DoTaskInTime(3, function() inst.components.playercontroller:Enable(false) inst.sg:GoToState("map") inst.components.talker.colour = Vector3(1, 0.85, 0.7, 1) inst.components.talker:Say(STRINGS.MUSHA_TALK_TREASURE_MARK)  
inst:DoTaskInTime(3.5, function() inst.components.playercontroller:Enable(true) inst.components.talker.colour = Vector3(1, 1, 1, 1) musha_treasurehunt(inst) end) end) end)
end 
end


 function on_music_act1(inst)
if inst.components.playercontroller then
local lightorb = SpawnPrefab("musha_spore2")
local hounds = SpawnPrefab("ghosthound")
inst.components.playercontroller:Enable(false)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.sg:GoToState("play_flute2")
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")
inst.entity:AddLight()
inst.Light:SetRadius(0.5)
inst.Light:SetFalloff(.75)
inst.Light:SetIntensity(.1)
inst.Light:SetColour(90/255,90/255,90/255)
inst.components.health:SetAbsorptionAmount(1)
inst.music_armor = true inst.nsleep = true inst.start_music = false 
inst.components.health:SetInvincible(true)
inst.components.sanityaura.aura = (TUNING.SANITYAURA_HUGE*5)
inst:DoTaskInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute2")
inst:DoTaskInTime(3, function() inst.sg:GoToState("enter_onemanband")inst:DoTaskInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute2") 
inst:DoTaskInTime(3, function() inst.components.playercontroller:Enable(true) inst.AnimState:SetBloomEffectHandle("") inst.Light:Enable(true)  --[[inst.components.talker:Say("[Light Aura] -ON     \n- Sanity Regen UP    \n- Sleep/Tired Regen UP")]] lightorb.Transform:SetPosition(inst:GetPosition():Get()) lightorb.components.follower:SetLeader(inst) inst.small_light = true inst.lightaura = true inst.moondrake_on = true inst.sg:GoToState("play_horn2") inst.nsleep = false  SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) hounds.Transform:SetPosition(inst:GetPosition():Get())  hounds.Transform:SetPosition(inst:GetPosition():Get()) hounds.followdog = true --[[hounds.components.follower:SetLeader(inst)]] inst.components.sanityaura.aura = (TUNING.SANITYAURA_HUGE) inst.components.sanity:DoDelta(10) inst.music_armor = false inst.components.health:SetInvincible(false) inst:DoTaskInTime(180, function() --[[inst.components.talker:Say("[Light Aura] -OFF")]] inst.small_light = false inst.lightaura = false inst.moondrake_on = false inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) inst.components.sanityaura.aura = 0 inst.Light:SetRadius(0.5) inst:DoTaskInTime(5, function() inst.Light:Enable(false) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") end) end)end)end)end)end)
end
end 

 function on_music_act2(inst)
if inst.components.playercontroller then
local lightorb = SpawnPrefab("musha_spore2")
local shadows = SpawnPrefab("shadowmusha")
inst.components.playercontroller:Enable(false)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.sg:GoToState("play_flute2")
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")
inst.entity:AddLight()
inst.Light:SetRadius(0.5)
inst.Light:SetFalloff(.75)
inst.Light:SetIntensity(.1)
inst.Light:SetColour(90/255,90/255,90/255)
inst.components.health:SetAbsorptionAmount(1)
inst.music_armor = true inst.nsleep = true inst.start_music = false
inst.components.health:SetInvincible(true)
inst.components.sanityaura.aura = (TUNING.SANITYAURA_HUGE*5)
inst:DoTaskInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute2")
inst:DoTaskInTime(3, function() inst.sg:GoToState("enter_onemanband")inst:DoTaskInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute2")inst:DoTaskInTime(3, function() inst.sg:GoToState("enter_onemanband")
inst:DoTaskInTime(3, function() inst.components.playercontroller:Enable(true) inst.AnimState:SetBloomEffectHandle("") inst.Light:Enable(true)  --[[inst.components.talker:Say("[Light Aura] -ON     \n- Sanity Regen UP    \n- Sleep/Tired Regen UP")]] lightorb.Transform:SetPosition(inst:GetPosition():Get()) lightorb.components.follower:SetLeader(inst) inst.small_light = true inst.lightaura = true inst.moondrake_on = true inst.sg:GoToState("play_horn2") inst.nsleep = false  SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) shadows.Transform:SetPosition(inst:GetPosition():Get())  shadows.followdog = true  inst.components.sanityaura.aura = (TUNING.SANITYAURA_HUGE) inst.components.sanity:DoDelta(10) inst.music_armor = false inst.components.health:SetInvincible(false) inst:DoTaskInTime(180, function() --[[inst.components.talker:Say("[Light Aura] -OFF")]] inst.small_light = false inst.lightaura = false inst.moondrake_on = false inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) inst.components.sanityaura.aura = 0 inst.Light:SetRadius(0.5) inst:DoTaskInTime(5, function() inst.Light:Enable(false) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") end) end)end)end)end)end)end)
end
end 

 function on_music_act3(inst)
if inst.components.playercontroller then
local lightorb = SpawnPrefab("musha_spore2")
inst.components.playercontroller:Enable(false)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.sg:GoToState("play_flute2")
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")
inst.entity:AddLight()
inst.Light:SetRadius(0.5)
inst.Light:SetFalloff(.75)
inst.Light:SetIntensity(.1)
inst.Light:SetColour(90/255,90/255,90/255)
inst.components.health:SetAbsorptionAmount(1)
inst.music_armor = true inst.nsleep = true inst.start_music = false
inst.components.health:SetInvincible(true)
inst.components.sanityaura.aura = (TUNING.SANITYAURA_HUGE*5)
inst:DoTaskInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute2")
inst:DoTaskInTime(3, function() inst.sg:GoToState("enter_onemanband")inst:DoTaskInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute2")inst:DoTaskInTime(3, function() inst.sg:GoToState("enter_onemanband")
inst:DoTaskInTime(3, function() inst.components.playercontroller:Enable(true) inst.AnimState:SetBloomEffectHandle("") inst.Light:Enable(true)  --[[inst.components.talker:Say("[Light Aura] -ON     \n- Sanity Regen UP    \n- Sleep/Tired Regen UP")]] lightorb.Transform:SetPosition(inst:GetPosition():Get()) lightorb.components.follower:SetLeader(inst) inst.small_light = true inst.lightaura = true inst.moondrake_on = true inst.sg:GoToState("play_horn2") inst.nsleep = false  
local drakeangle = math.random(1, 360)
local tentacle_frost0 = SpawnPrefab("tentacle_frost")
local tentacle_frost1 = SpawnPrefab("tentacle_frost")
local tentacle_frost2 = SpawnPrefab("tentacle_frost")
local tentacle_frost3 = SpawnPrefab("tentacle_frost")
local tentacle_frost4 = SpawnPrefab("tentacle_frost")
local tentacle_frost5 = SpawnPrefab("tentacle_frost")
local offset0 = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local offset1 = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local offset2 = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local offset3 = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local offset4 = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local offset5 = FindWalkableOffset(inst:GetPosition(), drakeangle*DEGREES, math.random(2,8), 30, false, false)
local x,y,z = inst.Transform:GetWorldPosition()
tentacle_frost0.Transform:SetPosition(x + offset0.x, y + offset0.y, z + offset0.z)
SpawnPrefab("statue_transition").Transform:SetPosition(tentacle_frost0:GetPosition():Get()) 
inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
inst:DoTaskInTime( 3, function() tentacle_frost1.Transform:SetPosition(x + offset1.x, y + offset1.y, z + offset1.z)
SpawnPrefab("statue_transition").Transform:SetPosition(tentacle_frost1:GetPosition():Get()) tentacle_frost1.SoundEmitter:PlaySound("dontstarve/common/gem_shatter") end)
inst:DoTaskInTime( 6, function() tentacle_frost2.Transform:SetPosition(x + offset2.x, y + offset2.y, z + offset2.z)
SpawnPrefab("statue_transition").Transform:SetPosition(tentacle_frost2:GetPosition():Get()) tentacle_frost2.SoundEmitter:PlaySound("dontstarve/common/gem_shatter") end)
inst:DoTaskInTime( 9, function() tentacle_frost3.Transform:SetPosition(x + offset3.x, y + offset3.y, z + offset3.z)
SpawnPrefab("statue_transition").Transform:SetPosition(tentacle_frost3:GetPosition():Get()) tentacle_frost3.SoundEmitter:PlaySound("dontstarve/common/gem_shatter") end)
inst:DoTaskInTime( 12, function() tentacle_frost4.Transform:SetPosition(x + offset4.x, y + offset4.y, z + offset4.z)
SpawnPrefab("statue_transition").Transform:SetPosition(tentacle_frost4:GetPosition():Get()) tentacle_frost4.SoundEmitter:PlaySound("dontstarve/common/gem_shatter") end)
inst:DoTaskInTime( 15, function() tentacle_frost5.Transform:SetPosition(x + offset5.x, y + offset5.y, z + offset5.z)
SpawnPrefab("statue_transition").Transform:SetPosition(tentacle_frost5:GetPosition():Get())  tentacle_frost5.SoundEmitter:PlaySound("dontstarve/common/gem_shatter") end)
  inst.components.sanityaura.aura = (TUNING.SANITYAURA_HUGE) inst.components.sanity:DoDelta(10) inst.music_armor = false inst.components.health:SetInvincible(false) inst:DoTaskInTime(180, function() --[[inst.components.talker:Say("[Light Aura] -OFF")]] inst.small_light = false inst.lightaura = false inst.moondrake_on = false inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) inst.components.sanityaura.aura = 0 inst.Light:SetRadius(0.5) inst:DoTaskInTime(5, function() inst.Light:Enable(false) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") end) end)end)end)end)end)end)
end
end 


 function on_sleep(inst)
	if inst.fberserk or inst.berserks and not inst:HasTag("playerghost") then
 	inst.berserks = false
	inst.fberserk = false
SpawnPrefab("statue_transition").Transform:SetPosition(inst:GetPosition():Get())
SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get())
   	if not inst:HasTag("playerghost") then
	if inst.components.hunger.current >= 160 then
		inst.strength = "full"  
		if inst.visual_cos then
	inst.AnimState:SetBuild("musha")
		elseif not inst.visual_cos and not inst.change_visual then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 and not inst.visual_hold4 then
			inst.AnimState:SetBuild("musha")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4) then
			inst.AnimState:SetBuild("musha")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3 and inst.visual_hold4) then
			inst.AnimState:SetBuild("musha_full_k")
			elseif inst.set_on and inst.visual_hold3 and not (inst.visual_hold and inst.visual_hold2 and inst.visual_hold4) then
			inst.AnimState:SetBuild("musha_old")
			elseif inst.set_on and inst.visual_hold4 and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_full_sw2")
		end
		end
	elseif inst.components.hunger.current < 160 then
		inst.strength = "normal"   
		if inst.visual_cos then
	inst.AnimState:SetBuild("musha_normal")
		elseif not inst.visual_cos and not inst.change_visual then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 and not inst.visual_hold4 then
			inst.AnimState:SetBuild("musha_normal")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4) then
			inst.AnimState:SetBuild("musha_normal")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3 and inst.visual_hold4) then
			inst.AnimState:SetBuild("musha_normal_k")
			elseif inst.set_on and inst.visual_hold3 and not (inst.visual_hold and inst.visual_hold2 and inst.visual_hold4) then
			inst.AnimState:SetBuild("musha_normal_old")
			elseif inst.set_on and inst.visual_hold4 and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_normal_sw2")			
		end
		end
	end	
	end
	end
	 
	inst:RemoveTag("notarget")
	if inst.sneaka or inst.sneak_pang then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	end
	inst.sneaka = false
	inst.poison_sneaka = false
	inst.sneak_pang = false	
	inst.AnimState:SetBloomEffectHandle( "" )
	inst.switch = false
	inst.active_valkyrie = false

local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
if weapon and weapon.components.weapon and weapon:HasTag("musha_items") then
weapon.components.weapon.stimuli = nil 
end
inst.components.locomotor:Stop()
local bedroll = inst.sg:GoToState("bedroll2")
--inst.sg:AddStateTag("sleeping")
inst.sg:AddStateTag("busy")
--inst.AnimState:OverrideSymbol("swap_bedroll", "swap_bedroll_straw", "bedroll_straw")

		if inst.components.temperature:GetCurrent() < 10 then
		
    		inst.AnimState:OverrideSymbol("swap_bedroll", "swap_bedroll_furry", "bedroll_furry")
        else 
  			inst.AnimState:OverrideSymbol("swap_bedroll", "swap_bedroll_straw", "bedroll_straw")
        end
if inst.components.health and not inst.components.health:IsDead() then 
inst.AnimState:PlayAnimation("bedroll")
inst:DoTaskInTime(2, function() inst.sleep_on = true end)
--inst.sleepheal = inst:DoPeriodicTask(5, function() onsleepheal(inst) end)
end
end

 function on_tiny_sleep(inst)
if inst.components.health and not inst.components.health:IsDead() then 
	if inst.fberserk or inst.berserks and not inst:HasTag("playerghost") then
 	inst.berserks = false
	inst.fberserk = false
SpawnPrefab("statue_transition").Transform:SetPosition(inst:GetPosition():Get())
SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get())
   	if not inst:HasTag("playerghost") then
	if inst.components.hunger.current >= 160 then
		inst.strength = "full"  
		if inst.visual_cos then
	inst.AnimState:SetBuild("musha")
		elseif not inst.visual_cos and not inst.change_visual then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 and not inst.visual_hold4 then
			inst.AnimState:SetBuild("musha")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4) then
			inst.AnimState:SetBuild("musha")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3 and inst.visual_hold4) then
			inst.AnimState:SetBuild("musha_full_k")
			elseif inst.set_on and inst.visual_hold3 and not (inst.visual_hold and inst.visual_hold2 and inst.visual_hold4) then
			inst.AnimState:SetBuild("musha_old")
			elseif inst.set_on and inst.visual_hold4 and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_full_sw2")
		end
		end
	elseif inst.components.hunger.current < 160 then
		inst.strength = "normal"   
		if inst.visual_cos then
	inst.AnimState:SetBuild("musha_normal")
		elseif not inst.visual_cos and not inst.change_visual then
			if not inst.set_on and not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 and not inst.visual_hold4 then
			inst.AnimState:SetBuild("musha_normal")
			elseif inst.set_on and inst.visual_hold and not (inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4) then
			inst.AnimState:SetBuild("musha_normal")
			elseif inst.set_on and inst.visual_hold2 and not (inst.visual_hold and inst.visual_hold3 and inst.visual_hold4) then
			inst.AnimState:SetBuild("musha_normal_k")
			elseif inst.set_on and inst.visual_hold3 and not (inst.visual_hold and inst.visual_hold2 and inst.visual_hold4) then
			inst.AnimState:SetBuild("musha_normal_old")
			elseif inst.set_on and inst.visual_hold4 and inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 then
			inst.AnimState:SetBuild("musha_normal_sw2")			
		end
		end
	end	
	end
	end
	 
	inst:RemoveTag("notarget")
	if inst.sneaka or inst.sneak_pang then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	end
	inst.sneaka = false
	inst.poison_sneaka = false
	inst.sneak_pang = false	
	inst.AnimState:SetBloomEffectHandle( "" )
	inst.switch = false
	inst.active_valkyrie = false
	inst.berserks = false
	inst.fberserk = false
local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
if weapon and weapon.components.weapon and weapon:HasTag("musha_items") then
weapon.components.weapon.stimuli = nil 
end
	if not inst:HasTag("playerghost") then
	inst.sg:GoToState("knockout") inst.tiny_sleep = true
	elseif inst:HasTag("playerghost") then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_SLEEP)
	end
	
end
end
 

 function on_wakeup(inst)

if not inst.music_check and inst.sleep_on then
inst.sleep_on = false
inst.sg:GoToState("wakeup")
inst.entity:AddLight()
inst.Light:SetRadius(1)
inst.Light:SetFalloff(.8)
inst.Light:SetIntensity(.8)
inst.Light:SetColour(150/255,150/255,150/255)
inst.components.health:SetAbsorptionAmount(1)
inst.music_armor = true
inst.Light:Enable(true)
inst:DoTaskInTime(1.5, function() inst.Light:Enable(false) inst.music_armor = false
inst.musha_press = false 
	if inst.components.stamina_sleep.current < 100 then 
	--inst.sg:GoToState("yawn") 
	inst.AnimState:PlayAnimation("yawn")
	elseif inst.components.stamina_sleep.current > 100 then 
		if math.random() < 0.3 then
		inst.AnimState:PlayAnimation("yawn")
		elseif math.random() < 0.3 then
		inst.AnimState:PushAnimation("mime1", false)
		elseif math.random() < 0.3 then
		inst.AnimState:PushAnimation("mime4", false)
		else
		inst.AnimState:PushAnimation("mime3", false)
		end
	end
end)
elseif not inst.music_check and inst.tiny_sleep then
inst.tiny_sleep = false
inst.sg:GoToState("wakeup")
inst.entity:AddLight()
inst.Light:SetRadius(1)
inst.Light:SetFalloff(.8)
inst.Light:SetIntensity(.8)
inst.Light:SetColour(150/255,150/255,150/255)
inst.components.health:SetAbsorptionAmount(1)
inst.music_armor = true
inst.Light:Enable(true)
inst:DoTaskInTime(3.1, function() inst.Light:Enable(false) inst.music_armor = false
	--inst.sg:GoToState("yawn") 
	inst.musha_press = false
	inst.AnimState:PlayAnimation("yawn")
end)

--if inst.sleepheal then inst.sleepheal:Cancel() inst.sleepheal = nil end
elseif inst.music_check then
	inst.components.playercontroller:Enable(false)
inst.sleep_on = false
inst.tiny_sleep = false
--inst.sg.statemem.iswaking = true
inst.sg:GoToState("wakeup")
inst.entity:AddLight()
inst.Light:SetRadius(1)
inst.Light:SetFalloff(.8)
inst.Light:SetIntensity(.8)
inst.Light:SetColour(150/255,150/255,150/255)
inst.components.health:SetAbsorptionAmount(1)
--inst.music_armor = true
inst.Light:Enable(true)
inst.AnimState:SetBloomEffectHandle( "" )
inst.music_check = false
inst.switlight = true
inst:DoTaskInTime(2, function() inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_READY) inst.sg:GoToState("play_flute2") inst.Light:Enable(false) inst.music_armor = false inst.music_check = false inst.AnimState:SetBloomEffectHandle( "" ) inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.musha_press = false inst.components.playercontroller:Enable(true) 
end)

end
end

 function on_buff_act(inst)
inst.writing = false
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 1, {"_writeable"})
for k,v in pairs(ents) do
inst.writing = true
end 
if not inst.writing then
local performance0 = 1
local performance1 = 0.25
local performance2 = 0.3
local performance3 = 0.1
local performance4 = 0.15
if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_RIDE)
		else
if inst.treasure_sniffs then
	on_treasure_hunt(inst)
	inst.treasure = inst.treasure *0
	inst.treasure_sniffs = false
elseif not inst.treasure_sniffs then

if inst.switlight and not inst.sleep_on and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not inst.start_music then
inst.start_music = true
inst.music = inst.music * 0
inst.switlight = false
	if math.random() < 0.5 then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_TYPE.. "1")
	on_music_act1(inst)
	elseif math.random() < 0.3 then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_TYPE.. "2")
	on_music_act2(inst)
	elseif math.random() < 0.15 then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_TYPE.. "3")
	on_music_act3(inst)
	else
	inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_TYPE.. "4")
	on_music_act1(inst)
	end
	
elseif not inst.switlight and not inst.sleep_on and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
	if inst.music < 100 then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SLEEP)
	elseif inst.music >= 100 then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_MUSIC_READY)
	inst.switlight = true
	end
	
elseif inst.components.health:IsDead() or inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_MUSIC)
end
----inst.components.talker.colour = Vector3(1, 0.85, 0.75, 1)
end
end
end
end
AddModRPCHandler("musha", "buff", on_buff_act)
 
 
 
  function on_sleeping(inst)
inst.writing = false
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 1, {"_writeable"})
for k,v in pairs(ents) do
inst.writing = true
end 
if not inst.writing and not inst.components.health:IsDead() and not inst.sleep_on and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not (inst.sg:HasStateTag("moving") or inst.sg:HasStateTag("attack")) and inst.components.stamina_sleep.current >= 90 then
if TheWorld.state.isday and not inst.tiny_sleep then 

if math.random() < 0.2 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_1)
elseif math.random() < 0.2 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_2)
elseif math.random() < 0.2 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_3)
elseif math.random() < 0.2 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_4)
else
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_5)
end

elseif TheWorld.state.isday and inst.tiny_sleep and not inst.musha_press then 
inst.musha_press = true
on_wakeup(inst)
end   
elseif not inst.writing and not inst.components.health:IsDead() and not inst.sleep_on and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not (inst.sg:HasStateTag("moving") or inst.sg:HasStateTag("attack")) and inst.components.stamina_sleep.current < 90 then
if TheWorld.state.isday and not inst.tiny_sleep then 
if (inst.warm_on or inst.warm_tent) then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NO_3)
end
if inst.components.stamina_sleep.current >=40 and not (inst.warm_on or inst.warm_tent) then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_1)
elseif inst.components.stamina_sleep.current < 40 and inst.components.stamina_sleep.current >=25  and not (inst.warm_on or inst.warm_tent) then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_2)
elseif inst.components.stamina_sleep.current < 25 and inst.components.stamina_sleep.current >=5  and not (inst.warm_on or inst.warm_tent) then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_3)
elseif inst.components.stamina_sleep.current < 5  and not (inst.warm_on or inst.warm_tent) then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_4)
end
inst:DoTaskInTime(1, function() on_tiny_sleep(inst) end)
inst.sg:AddStateTag("busy")
elseif TheWorld.state.isday and inst.tiny_sleep and not inst.musha_press then 
inst.musha_press = true
on_wakeup(inst)
end
end 
if not inst.writing and not inst.components.health:IsDead() and not inst.sleep_on and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not (inst.sg:HasStateTag("moving") or inst.sg:HasStateTag("attack")) and not TheWorld.state.isday and not inst.sleep_on and not inst.tiny_sleep and not inst.nsleep and not (inst.warm_on or inst.warm_tent) then
if not TheWorld.state.isnight then
if inst.components.stamina_sleep.current >=40 and not (inst.warm_on or inst.warm_tent) then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_1)
elseif inst.components.stamina_sleep.current < 40 and inst.components.stamina_sleep.current >=25  and not (inst.warm_on or inst.warm_tent) then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_2)
elseif inst.components.stamina_sleep.current < 25 and inst.components.stamina_sleep.current >=5  and not (inst.warm_on or inst.warm_tent) then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_3)
elseif inst.components.stamina_sleep.current < 5  and not (inst.warm_on or inst.warm_tent) then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_4)
end
inst:DoTaskInTime(1, function() on_tiny_sleep(inst) end)
inst.sg:AddStateTag("busy")
elseif TheWorld.state.isnight then
local random1 = 0.2
local last = 1
if not inst.LightWatcher:IsInLight() then
if math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NEED_LIGHT_1)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NEED_LIGHT_2)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NEED_LIGHT_3)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NEED_LIGHT_4)
elseif math.random() <= last then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_NEED_LIGHT_5)
end
elseif inst.LightWatcher:IsInLight() then
if inst.components.stamina_sleep.current >=40 and not (inst.warm_on or inst.warm_tent) then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_1)
elseif inst.components.stamina_sleep.current < 40 and inst.components.stamina_sleep.current >=25  and not (inst.warm_on or inst.warm_tent) then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_2)
elseif inst.components.stamina_sleep.current < 25 and inst.components.stamina_sleep.current >=5  and not (inst.warm_on or inst.warm_tent) then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_3)
elseif inst.components.stamina_sleep.current < 5  and not (inst.warm_on or inst.warm_tent) then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DIZZY_4)
end
inst:DoTaskInTime(1, function() on_tiny_sleep(inst) end)
end
end

elseif not inst.components.health:IsDead() and not inst.sleep_on and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not (inst.sg:HasStateTag("moving") or inst.sg:HasStateTag("attack")) and not TheWorld.state.isday and not inst.sleep_on and not inst.tiny_sleep and not inst.nsleep and (inst.warm_on or inst.warm_tent) and not inst.sleep_no then 
--[[if inst.components.stamina_sleep.current >= 95 then
inst.components.talker:Say("[Musha love sleep]")
elseif inst.components.stamina_sleep.current < 95 and inst.components.stamina_sleep.current >=75 then
inst.components.talker:Say("[Always sleepy..]")
elseif inst.components.stamina_sleep.current < 75 and inst.components.stamina_sleep.current >=70 then
inst.components.talker:Say("[Musha going to sing in a dream.]")
elseif inst.components.stamina_sleep.current < 70 then
inst.components.talker:Say("[Musha like campfire.]")
end]]
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_GOOD)
on_sleep(inst)

elseif not TheWorld.state.isday	and not inst.sleep_on and not inst.tiny_sleep and not inst.nsleep and (inst.warm_on or inst.warm_tent) and  inst.sleep_no then 
local random1 = 0.2
if math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DANGER_1)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DANGER_2)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DANGER_3)
elseif math.random() < random1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DANGER_4)
elseif math.random() <= 1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SLEEP_DANGER_5)
end
elseif not inst.components.health:IsDead() and (inst.sleep_on or inst.tiny_sleep) and not inst.nsleep and not inst:HasTag("playerghost") and not inst.musha_press then
inst.musha_press = true
on_wakeup(inst)

elseif inst.components.health:IsDead() or inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_OOOOH)
end
----inst.components.talker.colour = Vector3(1, 0.85, 0.75, 1)
end
 --end
 AddModRPCHandler("musha", "sleeping", on_sleeping)
 
  ---------------------moon tree
 
 function dall_update(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"dall"})
for k,v in pairs(ents) do
if inst.follow_dall and v.components.follower and not v.components.follower.leader and not inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("dall") == 0 then
if not v.onsleep then
inst.components.leader:AddFollower(v)
v.yamche = true
v.sleep_on = false
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_DALL_FOLLOW)
elseif v.onsleep then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_DALL_SLEEPY)
end
elseif not inst.follow_dall and v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("dall") == 1 then
if not v.onsleep then
v.yamche = true 
v.sleep_on = true
inst.components.leader:RemoveFollowersByTag("dall")
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_DALL_STAY)
elseif v.onsleep then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_DALL_SLEEPY)
end
end end end
 
 function order_dall(inst)
inst.writing = false
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 1, {"_writeable"})
for k,v in pairs(ents) do
inst.writing = true
end 
if not inst.writing then
if inst.dall_follow and not inst.follow_dall and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
--inst.components.talker:Say("Dall, Follow me!")
inst.follow_dall = true
dall_update(inst)
elseif inst.dall_follow and inst.follow_dall and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
--inst.components.talker:Say("Dall, stay here")
inst.follow_dall = false
inst.dall_follow = false
dall_update(inst)
elseif not inst.dall_follow and not inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_DALL_LOST)
elseif inst.dall_follow and not inst.follow_dall and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_FOLLOW)
inst.follow_dall = true
dall_update(inst)
elseif inst.dall_follow and inst.follow_dall and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_STAY)
inst.follow_dall = false
inst.dall_follow = false
dall_update(inst)
elseif not inst.dall_follow and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_OOOOH)
end
end
end 

AddModRPCHandler("musha","dall", order_dall)
-----pet

 

--AddModRPCHandler("musha","critter", order_pet)

 ---------------------arong
 
 function arong_update(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"Arongb"})
for k,v in pairs(ents) do
if inst.follow_arong and v.components.follower and not v.components.follower.leader and not inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("Arongb") == 0 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ARONG_FOLLOW)

inst.components.leader:AddFollower(v)
v.yamche = true
v.mount = true
v.sleep_on = false
v.follow = true
elseif not inst.follow_arong and v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("Arongb") == 1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ARONG_STAY)

v.yamche = true 
v.active_hunt = false
v.mount = false
v.sleep_on = true
v.follow = false
inst.components.leader:RemoveFollowersByTag("Arongb")
end end 
end
 
 function order_arong(inst)
inst.writing = false
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 1, {"_writeable"})
for k,v in pairs(ents) do
inst.writing = true
end 
if not inst.writing then
if inst.arong_follow and not inst.follow_arong and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.follow_arong = true
arong_update(inst)
elseif inst.arong_follow and inst.follow_arong and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.follow_arong = false
inst.arong_follow = false
arong_update(inst)
elseif not inst.arong_follow and not inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ARONG_LOST)
elseif inst.arong_follow and not inst.follow_arong and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_FOLLOW)
inst.follow_arong = true
arong_update(inst)
elseif inst.arong_follow and inst.follow_arong and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_STAY)
inst.follow_arong = false
inst.arong_follow = false
arong_update(inst)
elseif not inst.arong_follow and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_OOOOH)
end
end
end 

AddModRPCHandler("musha","arong", order_arong)
 
 -----------------------------
 function yamche_update(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"yamcheb"})
for k,v in pairs(ents) do
if not v.house and not v.hat then
if inst.follow and v.components.follower and not v.components.follower.leader and not inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("yamcheb") == 0 then
inst.components.leader:AddFollower(v)
--on_yamche(inst)
v.yamche = true
v.sleepn = false 
v.fightn = false
v.slave = true
--off_yamche(inst)
elseif not inst.follow and v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("yamcheb") == 1 then
v.sleepn = true
v.yamche = true 
v.fightn = true
v.active_hunt = false
v.slave = false
inst.components.leader:RemoveFollowersByTag("yamcheb")

if v.pick1 then
v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_GATHER_STOP)
v.pick1 = false
v.working_food = false
end
end end end
end
 
 function order_yamche(inst)
inst.writing = false
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 1, {"_writeable"})
for k,v in pairs(ents) do
inst.writing = true
end 
if not inst.writing and not inst.hat and not inst.house then
if inst.yamche_follow and not inst.follow and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_FOLLOW)
inst.follow = true
--master_yamche(inst)
yamche_update(inst)
elseif inst.yamche_follow and inst.follow and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_STAY)
inst.follow = false
inst.yamche_follow = false
--master_yamche(inst)
yamche_update(inst)
elseif not inst.yamche_follow and not inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_LOST)
elseif inst.yamche_follow and not inst.follow and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_FOLLOW)
inst.follow = true
yamche_update(inst)
elseif inst.yamche_follow and inst.follow and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_STAY)
inst.follow = false
inst.yamche_follow = false
yamche_update(inst)
elseif not inst.yamche_follow and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_OOOOH)
end
end
end 

AddModRPCHandler("musha","yamche", order_yamche)

--sneak attack --hide in shadow
 
 function on_Sneak_pang(inst, data)
local other = data.target
if not other:HasTag("smashable") and not other:HasTag("shadowminion") and not other:HasTag("alignwall") then
if not inst.sneaka and inst.sneak_pang then
	inst.components.sanity:DoDelta(50)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_UNHIDE)
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	 
	inst:RemoveTag("notarget")
	inst.sneaka = false
	if inst.poison_sneaka then	
		inst.poison_sneaka = false
		inst.components.sanity:DoDelta(10)
	end
	inst.sneak_pang = false	
elseif inst.sneaka and inst.sneak_pang and (other:HasTag("no_target") or other:HasTag("structure") or other:HasTag("wall") or other:HasTag("pillarretracting") or other:HasTag("tentacle_pillar") or other:HasTag("arm") or other:HasTag("shadow")) and not other.components.locomotor then
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_NO_TARGET)
		inst.components.sanity:DoDelta(50)
	--inst.components.talker:Say("Unhide !")
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	 
	inst:RemoveTag("notarget")
	inst.sneaka = false
	if inst.poison_sneaka then	
		inst.poison_sneaka = false
		inst.components.sanity:DoDelta(10)
	end
	inst.sneak_pang = false	
elseif inst.sneaka and inst.sneak_pang and not (other:HasTag("no_target") or other:HasTag("structure") or other:HasTag("wall") or other:HasTag("pillarretracting") or other:HasTag("tentacle_pillar") or other:HasTag("arm") or other:HasTag("shadow")) and other.components.locomotor then	

if not other.sg:HasStateTag("attack") and not other.sg:HasStateTag("shield") and not other.sg:HasStateTag("moving") and not other.sg:HasStateTag("frozen") then
	inst.components.sanity:DoDelta(50)
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)


if inst.level >=50 and inst.level <429  then  --5
inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SUCCESS.."\nLV(1)")
	other.components.health:DoDelta(-300)
elseif inst.level >=430 and inst.level <1029  then  --10
inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SUCCESS.."\nLV(2)")
	other.components.health:DoDelta(-400)
elseif inst.level >=1030 and inst.level <1879  then --15
inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SUCCESS.."\nLV(3)")
	other.components.health:DoDelta(-500)
elseif inst.level >=1880 and inst.level <3199  then --20
inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SUCCESS.."\nLV(4)")
	other.components.health:DoDelta(-600)
elseif inst.level >=3200 and inst.level <6999 then --25
inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SUCCESS.."\nLV(5)")
	other.components.health:DoDelta(-700)
elseif inst.level >=7000 then --30
inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SUCCESS.."\nLV(6)")
    other.components.health:DoDelta(-800)
end
	
	inst.switch = false
	inst.components.combat:SetRange(2)

	local dark1 = SpawnPrefab("statue_transition")
	local pos = Vector3(other.Transform:GetWorldPosition())
	dark1.Transform:SetPosition(pos:Get())
	dark1.Transform:SetScale(0.5,4,0.5)
	local fx = SpawnPrefab("explode_small")
	local pos = Vector3(other.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
	inst:RemoveTag("notarget")
	inst.sneak_pang = false	inst.sneaka = false
	inst:RemoveEventCallback("onhitother", on_Sneak_pang)
	
elseif other.sg:HasStateTag("frozen") then
	inst.components.sanity:DoDelta(50)
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SUCCESS.."\n"..STRINGS.MUSHA_TALK_SNEAK_FROZEN)
    if inst.level >=50 and inst.level <429  then  --5
	other.components.health:DoDelta(-150)
elseif inst.level >=430 and inst.level <1029  then  --10
	other.components.health:DoDelta(-200)
elseif inst.level >=1030 and inst.level <1879  then --15
	other.components.health:DoDelta(-250)
elseif inst.level >=1880 and inst.level <3199  then --20
	other.components.health:DoDelta(-300)
elseif inst.level >=3200 and inst.level <6999 then --25
	other.components.health:DoDelta(-350)
elseif inst.level >=7000 then --30
    other.components.health:DoDelta(-400)
	end
	local dark1 = SpawnPrefab("statue_transition")
	local pos = Vector3(other.Transform:GetWorldPosition())
	dark1.Transform:SetPosition(pos:Get())
	dark1.Transform:SetScale(0.5,4,0.5)
	local fx = SpawnPrefab("explode_small")
	local pos = Vector3(other.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
	inst:RemoveTag("notarget")
	inst.sneak_pang = false	inst.sneaka = false
	inst:RemoveEventCallback("onhitother", on_Sneak_pang)
	
elseif other.sg:HasStateTag("attack") or other.sg:HasStateTag("shield") or other.sg:HasStateTag("moving") and not other.sg:HasStateTag("frozen") then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_FAILED)
	local fx = SpawnPrefab("splash")
	local pos = Vector3(other.Transform:GetWorldPosition())
	fx.Transform:SetPosition(pos:Get())
	inst:RemoveTag("notarget")
	inst.sneak_pang = false	inst.sneaka = false
	inst:RemoveEventCallback("onhitother", on_Sneak_pang)
	--inst:DoTaskInTime(0.5, function() on_tiny_sleep(inst) end)
end
	if inst.poison_sneaka then
	inst.poison_sneaka = false
	if other.components.health and not other.components.health:IsDead() and other.components.combat	then		
			local shadowbomb = SpawnPrefab("shadowbomb")
			if shadowbomb then
			shadowbomb.entity:SetParent(other.entity)
			local follower = shadowbomb.entity:AddFollower()
			if not other:HasTag("cavedweller") then
			follower:FollowSymbol(other.GUID, other.components.combat.hiteffectsymbol, 0, -200, 0.5 )
			else
			follower:FollowSymbol(other.GUID, "body", 0, -200, 0.5 )
			end
			end	
	else 		
		local cloud = SpawnPrefab("sporecloud2")
			cloud.Transform:SetPosition(other:GetPosition():Get())
			cloud:FadeInImmediately()		
	end
	end
end 
end
end

--[[local function InShadow(inst, data)
if inst.sneaka then	
if inst.active_valkyrie or inst.switch then
inst.components.combat:SetRange(2)
inst.switch = false
end
local player = GLOBAL.ThePlayer
local x,y,z = inst.Transform:GetWorldPosition()	
local ents = TheSim:FindEntities(x, y, z, 12)
for k,v in pairs(ents) do
if v.components.health and not v.components.health:IsDead() and v.components.combat and v.components.combat.target == inst and not (v:HasTag("berrythief") or v:HasTag("prey") or v:HasTag("bird") or v:HasTag("butterfly")) then
		v.components.combat.target = nil
 end
 end end
 end]]
 
 function hide_discorved(inst, data)
    if inst.sneak_pang then
	inst.components.colourtweener:StartTween({1,1,1,1}, 0)
	inst.sneak_pang = false		
	inst.sneaka = false
	inst.poison_sneaka = false
	inst:RemoveTag("notarget")
	local fx = SpawnPrefab("statue_transition_2")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1.2, 1.2, 1.2)
        fx.Transform:SetPosition(0, 0, 0.5)
	inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_ATTACKED)
	inst:RemoveEventCallback("onhitother", on_Sneak_pang)
	inst:RemoveEventCallback("attacked", hide_discorved)	
    end end
 
 function HideIn(inst)	
if inst.level <50 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_NEED_EXP)
	if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
	inst.sg:GoToState("repelled")
	else
	inst.sg:GoToState("mindcontrolled")
	end
elseif inst.level >=50 then
    if not inst.sneak_pang and inst.components.sanity.current >= 50 and inst.components.stamina_sleep.current >= 30 then
	if inst.level >=50 and inst.level <429  then  --5
inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_HIDE.."(LV1)")
elseif inst.level >=430 and inst.level <1029  then  --10
inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_HIDE.."(LV2)")
elseif inst.level >=1030 and inst.level <1879  then --15
inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_HIDE.."(LV3)")
elseif inst.level >=1880 and inst.level <3199  then --20
inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_HIDE.."(LV4)")
elseif inst.level >=3200 and inst.level <6999 then --25
inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_HIDE.."(LV5)")
elseif inst.level >=7000 then --30
inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_HIDE.."(LV6)")
	end
	inst.components.sanity:DoDelta(-50)
			inst.sneak_pang = true  
				inst.components.colourtweener:StartTween({0.3,0.3,0.3,1}, 0)		
local fx = SpawnPrefab("statue_transition_2")
      fx.entity:SetParent(inst.entity)
	  fx.Transform:SetScale(1.2, 1.2, 1.2)
      fx.Transform:SetPosition(0, 0, 0.5)
	
inst:DoTaskInTime( 4, function() if inst.sneak_pang then 
inst.sneaka = true 
inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_SHADOW) 
	local fx = SpawnPrefab("stalker_shield_musha")
	  fx.Transform:SetScale(0.5, 0.5, 0.5)
  	  fx.Transform:SetPosition(inst:GetPosition():Get())
	if not inst:HasTag("notarget") then
	inst:AddTag("notarget") end
SpawnPrefab("statue_transition").Transform:SetPosition(inst:GetPosition():Get()) 
inst.components.colourtweener:StartTween({0.1,0.1,0.1,1}, 0) 
inst.in_shadow = true
InShadow(inst)  
end 
end)
		
	inst:ListenForEvent("onhitother", on_Sneak_pang)
	inst:ListenForEvent("attacked", hide_discorved)
	
elseif not inst.sneak_pang and inst.components.sanity.current < 50 and inst.components.stamina_sleep.current >= 30 then
		inst.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SANITY)
if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
inst.sg:GoToState("repelled")
else
inst.sg:GoToState("mindcontrolled")
end
elseif not inst.sneak_pang and inst.components.sanity.current > 50 and inst.components.stamina_sleep.current < 30 then
		inst.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SLEEPY)
if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
inst.sg:GoToState("repelled")
else
inst.sg:GoToState("mindcontrolled")
end
elseif not inst.sneak_pang and inst.components.sanity.current < 50 and inst.components.stamina_sleep.current < 30 then
		inst.components.talker:Say(STRINGS.MUSHA_TALK_NEED_SLEEP)
if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
inst.sg:GoToState("repelled")
else
inst.sg:GoToState("mindcontrolled")
end
		
elseif inst.sneak_pang then		
		inst.components.talker:Say(STRINGS.MUSHA_TALK_SNEAK_UNHIDE)	
			inst.components.colourtweener:StartTween({1,1,1,1}, 0)
			local fx = SpawnPrefab("statue_transition_2")
      fx.entity:SetParent(inst.entity)
	  fx.Transform:SetScale(1.2, 1.2, 1.2)
      fx.Transform:SetPosition(0, 0, 0.5)
		inst.components.sanity:DoDelta(50)
	inst.sneak_pang = false	inst.sneaka = false
	inst.poison_sneaka = false
	inst:RemoveTag("notarget")
	inst:RemoveEventCallback("onhitother", on_Sneak_pang)
	inst:RemoveEventCallback("attacked", hide_discorved)
end	
end	
		end
AddModRPCHandler("musha","shadows", HideIn)


--specific
--[[
local function BabyPostInit(inst)
	if not inst.components.characterspecific then
		inst:AddComponent("characterspecific")	end
	inst.components.characterspecific:SetOwner("musha")
	inst.components.characterspecific:SetStorable(false)
	inst.components.characterspecific:SetComment("Phoenix seems difficult to tame..")

	return inst
end
AddPrefabPostInit("musha_small", BabyPostInit) 
]]
-----------------------------------------------
function hiteffectsymbol_hound(inst)
if IsServer then
inst.components.combat.hiteffectsymbol = "hound_body"
end end
function hiteffectsymbol_frog(inst)
if IsServer then
inst.components.combat.hiteffectsymbol = "frogsack"
end end
function hiteffectsymbol_body(inst)
if IsServer then
 inst.components.combat.hiteffectsymbol = "body"
end end
AddPrefabPostInit("hound", hiteffectsymbol_hound)
AddPrefabPostInit("firehound", hiteffectsymbol_hound)
AddPrefabPostInit("icehound", hiteffectsymbol_hound)
AddPrefabPostInit("frog", hiteffectsymbol_frog)
AddPrefabPostInit("hound", hiteffectsymbol_body)


function electric_weapon(inst)
if IsServer then
        inst:AddTag("electric_weapon")
end end
AddPrefabPostInit("nightstick", electric_weapon)
function no_target(inst)
if IsServer then
        inst:AddTag("no_target")
end end
AddPrefabPostInit("slurtlehole", no_target)

function arms(inst)
if IsServer then
        inst:AddTag("arm")
end end
AddPrefabPostInit("tentacle_pillar_arm", arms)

local function green_mush(inst)
if IsServer then
	 inst:AddComponent("follower")
	 inst:AddTag("mushrooms")
end end
local function veggie(inst)
if IsServer then
	 inst:AddComponent("follower")
	 inst:AddTag("carrot")
end end
AddPrefabPostInit("carrot_planted", veggie)
AddPrefabPostInit("green_mushroom", green_mush)

-----------------------------------------------
local function visual_cos(inst)
----------------------------------------------
inst.writing = false
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 1, {"_writeable"})
for k,v in pairs(ents) do
inst.writing = true
end 
if not inst.writing and not inst.visual_cos then
	inst.musha_full = false
	inst.musha_normal = false
	inst.musha_battle = false
	inst.musha_hunger = false

inst.visual_cos = true
inst.components.talker:Say(STRINGS.MUSHA_VISUAL_BASE)
inst.soundsname = "willow"
inst.set_on = false
inst.visual_hold = false

inst.visual_hold2 = false
inst.visual_hold3 = false
inst.visual_hold4 = false
inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false
inst.hold_old1 = false
inst.hold_old2 = false
inst.hold_old3 = false
inst.hold_old4 = false
inst.hold_old5 = false
inst.hold_old6 = false
inst.hold_old7 = false
inst.hold_old8 = false
inst.full_k_hold = false
inst.normal_k_hold = false
inst.valkyrie_k_hold = false
inst.berserk_k_hold = false
inst.willow = false
inst.wigfred = false
inst.change_visual = false
end

inst.visual_cos = false

end

AddModRPCHandler("musha","visual_cos", visual_cos)


AddModRPCHandler("musha","visual_human", visual_human)

-----------------------------------------------
local function visual_hold(inst)
----------------------------------------------
inst.writing = false
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 1, {"_writeable"})
for k,v in pairs(ents) do
inst.writing = true
end 
if not inst.writing and not inst:HasTag("playerghost") then
if not inst.visual_cos then
	inst.musha_full = false
	inst.musha_normal = false
	inst.musha_battle = false
	inst.musha_hunger = false
if not inst.willow and not inst.wigfred then
inst.change_visual = true
inst.willow = true
inst.components.talker:Say("[Visual] : Willow \nCancel(O)key")
inst.AnimState:SetBuild("Willow")
inst.wigfred = false
elseif inst.willow and not inst.wigfred then
inst.change_visual = true
inst.willow = true
inst.components.talker:Say("[Visual] : Wigfred \nCancel(O)key")
inst.AnimState:SetBuild("wathgrithr")
inst.wigfred = true
elseif inst.willow and inst.wigfred then
inst.change_visual = false
if not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 and not inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold and not inst.hold_old1 and not inst.hold_old2 and not inst.hold_old3 and not inst.hold_old4 and not inst.hold_old5 and not inst.hold_old6 and not inst.hold_old7 and not inst.hold_old8 and not inst.full_k_hold and not inst.normal_k_hold and not inst.valkyrie_k_hold and not inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key\nVisual:[Auto] SET 1")
inst.set_on = true
inst.visual_hold = true
inst.visual_hold2 = false
inst.visual_hold3 = false
inst.visual_hold4 = false
inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false
inst.hold_old1 = false
inst.hold_old2 = false
inst.hold_old3 = false
inst.hold_old4 = false
inst.hold_old5 = false
inst.hold_old6 = false
inst.hold_old7 = false
inst.hold_old8 = false
inst.full_k_hold = false
inst.normal_k_hold = false
inst.valkyrie_k_hold = false
inst.berserk_k_hold = false
--inst.AnimState:SetBuild("musha")

elseif inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 and not inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold and not inst.hold_old1 and not inst.hold_old2 and not inst.hold_old3 and not inst.hold_old4 and not inst.hold_old5 and not inst.hold_old6 and not inst.hold_old7 and not inst.hold_old8 and not inst.full_k_hold and not inst.normal_k_hold and not inst.valkyrie_k_hold and not inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Auto] SET 2")
inst.set_on = true
inst.visual_hold = false
inst.visual_hold2 = true
inst.visual_hold3 = false
inst.visual_hold4 = false
inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false
inst.hold_old1 = false
inst.hold_old2 = false
inst.hold_old3 = false
inst.hold_old4 = false
inst.hold_old5 = false
inst.hold_old6 = false
inst.hold_old7 = false
inst.hold_old8 = false
inst.full_k_hold = false
inst.normal_k_hold = false
inst.valkyrie_k_hold = false
inst.berserk_k_hold = false

elseif not inst.visual_hold and inst.visual_hold2 and not inst.visual_hold3 and not inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold and not inst.hold_old1 and not inst.hold_old2 and not inst.hold_old3 and not inst.hold_old4 and not inst.hold_old5 and not inst.hold_old6 and not inst.hold_old7 and not inst.hold_old8 and not inst.full_k_hold and not inst.normal_k_hold and not inst.valkyrie_k_hold and not inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Auto] SET 3")
inst.set_on = true
inst.visual_hold = false
inst.visual_hold2 = false
inst.visual_hold3 = true
inst.visual_hold4 = false
inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false
inst.hold_old1 = false
inst.hold_old2 = false
inst.hold_old3 = false
inst.hold_old4 = false
inst.hold_old5 = false
inst.hold_old6 = false
inst.hold_old7 = false
inst.hold_old8 = false
inst.full_k_hold = false
inst.normal_k_hold = false
inst.valkyrie_k_hold = false
inst.berserk_k_hold = false

elseif not inst.visual_hold and not inst.visual_hold2 and inst.visual_hold3 and not inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold and not inst.hold_old1 and not inst.hold_old2 and not inst.hold_old3 and not inst.hold_old4 and not inst.hold_old5 and not inst.hold_old6 and not inst.hold_old7 and not inst.hold_old8 and not inst.full_k_hold and not inst.normal_k_hold and not inst.valkyrie_k_hold and not inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Auto] SET 4")
inst.set_on = true
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false
inst.hold_old1 = false
inst.hold_old2 = false
inst.hold_old3 = false
inst.hold_old4 = false
inst.hold_old5 = false
inst.hold_old6 = false
inst.hold_old7 = false
inst.hold_old8 = false
inst.full_k_hold = false
inst.normal_k_hold = false
inst.valkyrie_k_hold = false
inst.berserk_k_hold = false
--[[
elseif not inst.visual_hold and not inst.visual_hold2 and not inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold and not inst.hold_old1 and not inst.hold_old2 and not inst.hold_old3 and not inst.hold_old4 and not inst.hold_old5 and not inst.hold_old6 and not inst.hold_old7 and not inst.hold_old8 and not inst.full_k_hold and not inst.normal_k_hold and not inst.valkyrie_k_hold and not inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Auto] SET 5")
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false
inst.hold_old1 = false
inst.hold_old2 = false
inst.hold_old3 = false
inst.hold_old4 = false
inst.hold_old5 = false
inst.hold_old6 = false
inst.hold_old7 = false
inst.hold_old8 = false
inst.full_k_hold = false
inst.normal_k_hold = false
inst.valkyrie_k_hold = false
inst.berserk_k_hold = false
]]
----------------------------------------------
elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold and not inst.hold_old1 and not inst.hold_old2 and not inst.hold_old3 and not inst.hold_old4 and not inst.hold_old5 and not inst.hold_old6 and not inst.hold_old7 and not inst.hold_old8 and not inst.full_k_hold and not inst.normal_k_hold and not inst.valkyrie_k_hold and not inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Full]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = false
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and not inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8 and inst.full_k_hold and inst.normal_k_hold and inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Normal]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = false
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_normal")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and not inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8 and inst.full_k_hold and inst.normal_k_hold and inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Valkyrie]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = false
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true

inst.AnimState:SetBuild("musha_battle")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and not inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8 and inst.full_k_hold and inst.normal_k_hold and inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Berserk]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = false
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_hunger")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and not inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8 and inst.full_k_hold and inst.normal_k_hold and inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Change Appearance 1]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = false
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_old")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and not inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8 and inst.full_k_hold and inst.normal_k_hold and inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Change Appearance 2]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = false
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_normal_old")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and not inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8 and inst.full_k_hold and inst.normal_k_hold and inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Change Appearance 3]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = false
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_battle_old")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and not inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8 and inst.full_k_hold and inst.normal_k_hold and inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Change Appearance 4]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = false
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_hunger_old")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and not inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8 and inst.full_k_hold and inst.normal_k_hold and inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Change Appearance 5]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = false
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_full_sw2")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and not inst.hold_old6 and inst.hold_old7 and inst.hold_old8 and inst.full_k_hold and inst.normal_k_hold and inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Change Appearance 6]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = false
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_normal_sw2")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and not inst.hold_old7 and inst.hold_old8 and inst.full_k_hold and inst.normal_k_hold and inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Change Appearance 7]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = false
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true
inst.AnimState:SetBuild("musha_battle_sw2")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and not inst.hold_old8 and inst.full_k_hold and inst.normal_k_hold and inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Change Appearance 8]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = false
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true

inst.AnimState:SetBuild("musha_hunger_sw2")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8 and not inst.full_k_hold and inst.normal_k_hold and inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Change Appearance 9]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = false
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true

inst.AnimState:SetBuild("musha_full_k")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8 and inst.full_k_hold and not inst.normal_k_hold and inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Change Appearance 10]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = false
inst.berserk_k_hold = true

inst.AnimState:SetBuild("musha_normal_k")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8 and inst.full_k_hold and inst.normal_k_hold and not inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Change Appearance 11]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = false

inst.AnimState:SetBuild("musha_battle_k")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8 and inst.full_k_hold and inst.normal_k_hold and inst.valkyrie_k_hold and not inst.berserk_k_hold then
inst.components.talker:Say("Change Appearance\nCancel(O)key \nVisual:[Change Appearance 12]")
inst.set_on = false
inst.visual_hold = true
inst.visual_hold2 = true
inst.visual_hold3 = true
inst.visual_hold4 = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.hold_old1 = true
inst.hold_old2 = true
inst.hold_old3 = true
inst.hold_old4 = true
inst.hold_old5 = true
inst.hold_old6 = true
inst.hold_old7 = true
inst.hold_old8 = true
inst.full_k_hold = true
inst.normal_k_hold = true
inst.valkyrie_k_hold = true
inst.berserk_k_hold = true

inst.AnimState:SetBuild("musha_hunger_k")

elseif inst.visual_hold and inst.visual_hold2 and inst.visual_hold3 and inst.visual_hold4 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold and inst.hold_old1 and inst.hold_old2 and inst.hold_old3 and inst.hold_old4 and inst.hold_old5 and inst.hold_old6 and inst.hold_old7 and inst.hold_old8 and inst.full_k_hold and inst.normal_k_hold and inst.valkyrie_k_hold and inst.berserk_k_hold then
inst.components.talker:Say("[Visual Hold - Off] \nVisual:[Auto]")
inst.set_on = false
inst.visual_hold = false
inst.visual_hold = false
inst.visual_hold2 = false
inst.visual_hold3 = false
inst.visual_hold4 = false
inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false
inst.hold_old1 = false
inst.hold_old2 = false
inst.hold_old3 = false
inst.hold_old4 = false
inst.hold_old5 = false
inst.hold_old6 = false
inst.hold_old7 = false
inst.hold_old8 = false
inst.full_k_hold = false
inst.normal_k_hold = false
inst.valkyrie_k_hold = false
inst.berserk_k_hold = false
inst.willow = false
inst.wigfred = false
inst.change_visual = false
end 
end
----inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
end end
end
AddModRPCHandler("musha","visual_hold", visual_hold)

local function yamche2(inst)
inst.writing = false
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 1, {"_writeable"})
for k,v in pairs(ents) do
inst.writing = true
end 
if not inst.writing then
--hunt --defense --avoid
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"yamche"})
for k,v in pairs(ents) do
if not inst.components.leader:IsFollower(v) and v:HasTag("yamcheb") and not inst:HasTag("playerghost") and inst.components.leader:CountFollowers("yamcheb") == 0 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_ARONG_SLEEPY)
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not v.peace and not v.active_hunt and not v.defense and not inst:HasTag("playerghost") and not inst:HasTag("crazy") then
v.yamche = true 
if v:HasTag("yamcheb") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNT)
--v.components.talker:Say("[Aggressive]\nArmor:40")
v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_OFFENSE)
v.peace = false
v.active_hunt = true
v.defense = false
end
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not v.peace and v.active_hunt and not v.defense and inst.components.leader:IsFollower(v) and not inst:HasTag("playerghost") and not inst:HasTag("crazy") then
v.yamche = true 
if v:HasTag("yamcheb") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_RETREAT)
--v.components.talker:Say("[Avoidance]\nArmor:95")
v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_AVOID)
v.peace = true
v.active_hunt = false
v.defense = true
end
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and v.peace and not v.active_hunt and v.defense and inst.components.leader:IsFollower(v) and not inst:HasTag("playerghost") and not inst:HasTag("crazy") then
v.yamche = true 
if v:HasTag("yamcheb") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_PROTECT)
--v.components.talker:Say("[Defensive]\nArmor:60")
v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_DEFFENSE)
v.peace = false
v.active_hunt = false
v.defense = false
end
elseif v.components.follower and v.components.follower.leader and v.peace and inst.components.leader:IsFollower(v) and not inst:HasTag("playerghost") and inst:HasTag("crazy") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_BERSERK)
v.yamche = true 
if v:HasTag("yamcheb") then
v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_AVOID)
v.peace = true
v.active_hunt = false
v.defense = true
end
elseif v.components.follower and v.components.follower.leader and not v.peace and inst.components.leader:IsFollower(v) and inst:HasTag("playerghost") and not inst:HasTag("crazy") then
v.yamche = true 
if v:HasTag("yamcheb") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_GHOST)
v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_AVOID)
v.peace = true
v.active_hunt = false
v.defense = true
end
elseif v.components.follower and v.components.follower.leader and v.peace and inst.components.leader:IsFollower(v) and inst:HasTag("playerghost") and not inst:HasTag("crazy") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_OOOOHHHH)
v.yamche = true 
if v:HasTag("yamcheb") then
v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_DEFFENSE)
v.peace = false
v.active_hunt = false
v.defense = false
end
----inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
end end end
end
AddModRPCHandler("musha","yamche2", yamche2)

local function yamche3(inst)
inst.writing = false
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 1, {"_writeable"})
for k,v in pairs(ents) do
inst.writing = true
end 
if not inst.writing then
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"yamcheb"})
for k,v in pairs(ents) do
if not v.removinv then
if v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not inst:HasTag("playerghost") and v.level1 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_LEVEL1)
v.yamche = true

elseif not v.level1 and v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not inst:HasTag("playerghost") and v.components.container and v.item_max_full then	
	v.working_food = false
	v.pick1 = false
	v.drop = true
	v.item_1 = false 
	v.item_ready_drop = false
	inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_SHOWME)
	v.yamche = true
	--if v.components.inventory then
	--v.components.inventory:DropEverything(true)
	--v.components.container:DropEverything(true)
	--end
	--if v.components.container ~= nil then --v.components.container:DropEverything(true)
	--end
	SpawnPrefab("dr_warm_loop_2").Transform:SetPosition(v:GetPosition():Get())
		if not v.light_on then
		v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_REST.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x1)")
		elseif v.light_on then
		v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_LIGHT.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x8)")
		end

elseif not v.level1 and v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not v.pick1 and not inst:HasTag("playerghost") and not v.item_max_full then --and not v.level1 then

	if not v.components.inventory then
	--v:AddComponent("inventory")
	end
	
	inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_GATHER)
	v.working_food = true
	v.pick1 = true
	v.drop = false
	v.yamche = true 

	if not v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_STUFF.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x6)")
	elseif v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_LIGHT.."+"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_STUFF.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x14)")
	end
	
elseif not v.level1 and v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and v.pick1 and not inst:HasTag("playerghost") and not v.item_max_full then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_GATHER_STOP)
v.working_food = false
v.pick1 = false
v.drop = true
v.yamche = true 
	if not v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_REST.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x1)")
	elseif v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_LIGHT.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x8)")
	end


elseif not v.level1 and not inst.components.leader:IsFollower(v) and not inst:HasTag("playerghost") and inst.components.leader:CountFollowers("yamcheb") == 0 then
inst.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_EGG)
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not v.pick1 and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_GATHER)
v.working_food = true
v.pick1 = true
v.drop = false
v.yamche = true 
	if not v.components.inventory then
	--v:AddComponent("inventory") 
	end
	if not v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_STUFF.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x6)")
	elseif v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_LIGHT.."+"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_STUFF.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x14)")
	end
elseif not v.level1 and v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and v.pick1 and inst:HasTag("playerghost") then
inst.components.talker:Say(STRINGS.MUSHA_TALK_GHOST_STOP)
v.working_food = false
v.pick1 = false
v.drop = true
	if not v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_REST.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x1)")
	elseif v.light_on then
	v.components.talker:Say(STRINGS.MUSHA_TALK_ORDER_YAMCHE_LIGHT.."\n"..STRINGS.MUSHA_TALK_ORDER_YAMCHE_HUNGRY.."(x8)")
	end
end
----inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
end 
end
end
end

AddModRPCHandler("musha","yamche3", yamche3)


local function ydebug(inst)
inst.writing = false
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 1, {"_writeable"})
for k,v in pairs(ents) do
inst.writing = true
end 
if not inst.writing then

if not inst.sleepbadge_off then
inst.sleepbadge_off = true
inst.components.talker:Say(STRINGS.MUSHA_BADGE_SLEEP.."\nOFF")
elseif inst.sleepbadge_off then
inst.sleepbadge_off = false
inst.components.talker:Say(STRINGS.MUSHA_BADGE_SLEEP.."\nON")
		inst.sleep_debuff_reset = true
		inst.sleep_debuff_90 = false
		inst.sleep_debuff_70 = false
		inst.sleep_debuff_50 = false
		inst.sleep_debuff_30 = false
end
--[[
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 20, {"yamcheb"})
for k,v in pairs(ents) do
if v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and v.level1 and v.components.inventory then
v.components.inventory:DropEverything(true)
v.components.talker:Say(STRINGS.MUSHA_YAMCHE_DEBUG)
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not v.level1 and v.components.container and v.components.inventory then
v.components.container:DropEverything(true)
v.components.inventory:DropEverything(true)
v.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
v.components.talker:Say(STRINGS.MUSHA_YAMCHE_DEBUG)
end 
end ]] 
end
end

AddModRPCHandler("musha","ydebug", ydebug)

------------------------------------------------
-------------comfortable health info
local healthinfoActive = 0
for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "Health Info" then
		healthinfoActive = 1
   end end 

-------------------------------------------------
--yamche health/hunger info (thx health info)

if healthinfoActive == 0 or healthinfoActive == 1 then
AddClassPostConstruct("components/health_replica", function(self)
self.SetCurrent = function(self, current)
if self.inst.components and self.inst.components.health and self.inst.components.healthinfo_copy and self.inst.components.hungerinfo and (self.inst:HasTag("yamche") or self.inst:HasTag("arongbaby")) then
---------
local str = self.inst.components.healthinfo_copy.text
if str ~= nil then
			local h = self.inst.components.health
			local mx = math.floor(h.maxhealth-h.minhealth)
			local cur = math.floor(h.currenthealth-h.minhealth)
			local h2 = self.inst.components.hunger
			local mx2 = math.floor(h2.max-h2.hungerrate)
			local cur2 = math.floor(h2.current-h2.hungerrate)
local i,j = string.find(str, " [", nil, true)
if i ~= nil and i > 1 then str = string.sub(str, 1, (i-1)) end
str = "["..math.floor(cur*100/mx).."%/"..math.floor(cur2*100/mx2).."%]"
if self.inst.components.healthinfo_copy and (self.inst:HasTag("yamche") or self.inst:HasTag("arongbaby"))  then
self.inst.components.healthinfo_copy:SetText(str)
end end 
end
if self.classified ~= nil then
self.classified:SetValue("currenthealth", current)
end end end)
--hover text
AddGlobalClassPostConstruct('widgets/hoverer', 'HoverText', function(self)
self.OnUpdate = function(self)
local using_mouse = self.owner.components and self.owner.components.playercontroller:UsingMouse()
if using_mouse ~= self.shown then
if using_mouse then
self:Show()
else
self:Hide()
end end
if not self.shown then
return
end
local str = nil
if self.isFE == false then
str = self.owner.HUD.controls:GetTooltip() or self.owner.components.playercontroller:GetHoverTextOverride()
else
str = self.owner:GetTooltip()
end
local secondarystr = nil
local lmb = nil
if not str and self.isFE == false then
lmb = self.owner.components.playercontroller:GetLeftMouseAction()
if lmb then
str = lmb:GetActionString()
if lmb.target and lmb.invobject == nil and lmb.target ~= lmb.doer then
local name = lmb.target:GetDisplayName() or (lmb.target.components.named and lmb.target.components.named.name)
if name then
local adjective = lmb.target:GetAdjective()
if adjective then
str = str.. " " .. adjective .. " " .. name
else
str = str.. " " .. name
end
if lmb.target.replica.stackable ~= nil and lmb.target.replica.stackable:IsStack() then
str = str .. " x" .. tostring(lmb.target.replica.stackable:StackSize())
end
if lmb.target.components.inspectable and lmb.target.components.inspectable.recordview and lmb.target.prefab then
GLOBAL.ProfileStatsSet(lmb.target.prefab .. "_seen", true)
end end end
if lmb.target and lmb.target ~= lmb.doer and lmb.target.components and lmb.target.components.healthinfo_copy and lmb.target.components.healthinfo_copy.text ~= '' then
local name = lmb.target:GetDisplayName() or (lmb.target.components.named and lmb.target.components.named.name) or ""
local i,j = string.find(str, " " .. name, nil, true)
if i ~= nil and i > 1 then str = string.sub(str, 1, (i-1)) end
str = str.. " " .. name .. " " .. lmb.target.components.healthinfo_copy.text
end end
local rmb = self.owner.components.playercontroller:GetRightMouseAction()
if rmb then
secondarystr = GLOBAL.STRINGS.RMB .. ": " .. rmb:GetActionString()
end end
if str then
if self.strFrames == nil then self.strFrames = 1 end
if self.str ~= self.lastStr then
--print("new string")
self.lastStr = self.str
self.strFrames = SHOW_DELAY
else
self.strFrames = self.strFrames - 1
if self.strFrames <= 0 then
if lmb and lmb.target and lmb.target:HasTag("player") then
self.text:SetColour(lmb.target.playercolour)
else
self.text:SetColour(1,1,1,1)
end
self.text:SetString(str)
self.text:Show()
end end
else
self.text:Hide()
end
if secondarystr then
YOFFSETUP = -80
YOFFSETDOWN = -50
self.secondarytext:SetString(secondarystr)
self.secondarytext:Show()
else
self.secondarytext:Hide()
end
local changed = (self.str ~= str) or (self.secondarystr ~= secondarystr)
self.str = str
self.secondarystr = secondarystr
if changed then
local pos = TheInput:GetScreenPosition()
self:UpdatePosition(pos.x, pos.y)
end end end)
end

--------------------------------
AddPrefabPostInitAny(function(inst)
	if inst.components.healthinfo_copy == nil and inst:HasTag("yamche") then
		if not inst.components.healthinfo_copy then
		inst:AddComponent("healthinfo_copy")
		end
		if not inst.components.healthinfo_copy then
		inst:AddComponent("hungerinfo")
		end
	Updateyamche = inst:DoPeriodicTask(0.2, function()
	if inst.components.health and inst.components.hunger then
			str = ""
			local h=inst.components.health
			local mx=math.floor(h.maxhealth-h.minhealth)
			local cur=math.floor(h.currenthealth-h.minhealth)
			local h2 = inst.components.hunger
			local mx2 = math.floor(h2.max-h2.hungerrate)
			local cur2 = math.floor(h2.current-h2.hungerrate)
			str = "["..math.floor(cur*100/mx).."%/"..math.floor(cur2*100/mx2).."%]"
			--str = "\nHealth: "..math.floor(cur*100/mx).."%\nHunger: "..math.floor(cur2*100/mx2).."%"
		inst.components.healthinfo_copy:SetText(str)
		end	
		end) 
		end
end)		

AddPrefabPostInitAny(function(inst)
	if inst.components.healthinfo_copy == nil and inst:HasTag("arongbaby") then
		if not inst.components.healthinfo_copy then
		inst:AddComponent("healthinfo_copy")
		end
	if inst.components.health then
			str = ""
			local h=inst.components.health
			local mx=math.floor(h.maxhealth-h.minhealth)
			local cur=math.floor(h.currenthealth-h.minhealth)
			
			str = "["..math.floor(cur*100/mx).."%]"
			--str = "\nHealth: "..math.floor(cur*100/mx).."%\nHunger: "..math.floor(cur2*100/mx2).."%"
		inst.components.healthinfo_copy:SetText(str)
		end	end 
		end)

-------------------------------------------------

  function loud_Lightning_effect(inst)   
 if IsServer then
if Loud_Lightning == "loud1" then
loud_1 = true
elseif Loud_Lightning == "loud2" then
loud_2 = true
elseif Loud_Lightning == "loud3" then
loud_3 = true
end end end
  AddPrefabPostInit("musha", loud_Lightning_effect)


  function Death_Penalty(inst)   
 if IsServer and death_penalty == "off" then
inst.no_panalty = true
end end
  AddPrefabPostInit("musha", Death_Penalty)

---------------------------------------------------
 

 function SleepnTired(inst)   
if IsServer then
   if Badge_type == 0 then
   inst.No_Sleep_Princess = true 
	else
   inst.No_Sleep_Princess = false 
   end 
end
end
 AddPrefabPostInit("musha", SleepnTired)
 

 function never_eat(inst)
 if IsServer then
        inst:AddTag("no_edible")
		end end
AddPrefabPostInit("powcake", never_eat)
AddPrefabPostInit("mandrake", never_eat)
AddPrefabPostInit("cookedmandrake", never_eat)
AddPrefabPostInit("spoiled_food", never_eat)
-----------------------------difficulty test
--
function musha_font(inst)
   inst.components.talker.fontsize = 25
   inst.components.talker.colour = Vector3(0.75, 0.9, 1, 1)
end
AddPrefabPostInit("musha", musha_font)

function Difficulty_health(inst)
if IsServer then
  if DifficultHealth == "easy" then
 inst.easyh = true
  elseif DifficultHealth == "normal" then
 inst.normalh = true
  elseif DifficultHealth == "hard" then
 inst.hardh = true
  elseif DifficultHealth == "hardcore" then
 inst.hardcoreh = true
 end end
end
AddPrefabPostInit("musha", Difficulty_health)

function Difficulty_damage(inst)
if IsServer then
  if DifficultDamage == "newbie" then
  inst.newbied = true
inst.components.combat.damagemultiplier = 1.5
  elseif DifficultDamage == "sveasy" then
  inst.sveasyd = true
inst.components.combat.damagemultiplier = 1.25
  elseif DifficultDamage == "veasy" then
  inst.seasyd = true
inst.components.combat.damagemultiplier = 1
  elseif DifficultDamage == "easy" then
  inst.easyd = true
inst.components.combat.damagemultiplier = .75
  elseif DifficultDamage == "normal" then
  inst.normald = true
inst.components.combat.damagemultiplier = .55
  elseif DifficultDamage == "hard" then
  inst.hardd = true
inst.components.combat.damagemultiplier = .4
  elseif DifficultDamage == "hardcore" then
  inst.hardcored = true
inst.components.combat.damagemultiplier = .25
end end
end
AddPrefabPostInit("musha", Difficulty_damage)

--range weapon damage
function Difficulty_damage_range(inst)
if IsServer then
if DifficultDamage_Range == "veasy" then
inst.veasy = true
elseif DifficultDamage_Range == "easy" then
inst.easy = true
elseif DifficultDamage_Range == "normal" then
inst.normalr = true
elseif DifficultDamage_Range == "hard" then
inst.hardr = true
elseif DifficultDamage_Range == "hardcore" then
inst.hardcorer = true
end end
end
AddPrefabPostInit("musha", Difficulty_damage_range)

function Range_Weapon(inst)
if IsServer then
inst:AddTag("range_weapon")
end end

AddPrefabPostInit("boomerang", Range_Weapon)
AddPrefabPostInit("blowdart_sleep",Range_Weapon )
AddPrefabPostInit("blowdart_fire",Range_Weapon )
AddPrefabPostInit("blowdart_pipe",Range_Weapon )
AddPrefabPostInit("blowdart_walrus",Range_Weapon)
AddPrefabPostInit("blowdart_poison",Range_Weapon )
AddPrefabPostInit("blowdart_yellow",Range_Weapon )

function Difficulty_tired(inst)
if IsServer then
  if Dtired == "dtired_veasy" then
 inst.dtired_veasy = true
  elseif Dtired == "dtired_easy" then
 inst.dtired_easy = true
  elseif Dtired == "dtired_normal" then
 inst.dtired_normal = true
  elseif Dtired == "dtired_hard" then
 inst.dtired_hard = true
  elseif Dtired == "dtired_hardcore" then
 inst.dtired_hardcore = true
 end end
end
AddPrefabPostInit("musha", Difficulty_tired)

function Difficulty_sleep(inst)
if IsServer then
  if Dsleep == "dsleep_veasy" then
 inst.dsleep_veasy = true
  elseif Dsleep == "dsleep_easy" then
 inst.dsleep_easy = true
  elseif Dsleep == "dsleep_normal" then
 inst.dsleep_normal = true
  elseif Dsleep == "dsleep_hard" then
 inst.dsleep_hard = true
  elseif Dsleep == "dsleep_hardcore" then
 inst.dsleep_hardcore = true
 end end
end
AddPrefabPostInit("musha", Difficulty_sleep)

function Difficulty_music(inst)
if IsServer then
  if Dmusic == "dmusic_veasy" then
 inst.dmusic_veasy = true
  elseif Dmusic == "dmusic_easy" then
 inst.dmusic_easy = true
  elseif Dmusic == "dmusic_normal" then
 inst.dmusic_normal = true
  elseif Dmusic == "dmusic_hard" then
 inst.dmusic_hard = true
  elseif Dmusic == "dmusic_hardcore" then
 inst.dmusic_hardcore = true
 end end
end
AddPrefabPostInit("musha", Difficulty_music)

function Difficulty_sanity(inst)
if IsServer then
  if DifficultSanity == "easy" then
 inst.easys = true
  elseif DifficultSanity == "normal" then
 inst.normals = true
  elseif DifficultSanity == "hard" then
 inst.hards = true
  elseif DifficultSanity == "hardcore" then
 inst.hardcores = true
 end end
end
AddPrefabPostInit("musha", Difficulty_sanity)


-------difficulty enemiese option

if Difficult == "monster2x" then

function deerclops_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.DEERCLOPS_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.DEERCLOPS_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(2.75)
  inst:AddTag("giant2x")
end end
function bearger_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.BEARGER_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.DEERCLOPS_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(2.75)
  inst:AddTag("giant2x")
end end
function dragonfly_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.DRAGONFLY_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.DEERCLOPS_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(2.25)
  inst:AddTag("giant2x")
end end
function moose_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.MOOSE_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.DEERCLOPS_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(2.75)
  inst:AddTag("giant2x")
end end
function mossling_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.MOSSLING_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.DEERCLOPS_DAMAGE*1.5)
  inst:AddTag("small_giant2x")
end end
function toadstool_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.TOADSTOOL_HEALTH*2.2)
    inst:AddTag("giant2x")
end end
function beequeen_2x(inst)
if IsServer and inst.components.health then
	inst.components.health:SetMaxHealth(TUNING.BEEQUEEN_HEALTH*2)
inst:AddTag("giant2x")
end end
function nspider_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_HEALTH*2)
    inst:AddTag("monster2x")
end end
function wspider_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_WARRIOR_HEALTH*2)
    inst:AddTag("monster2x")
end end
function qspider_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDERQUEEN_HEALTH*2)
    inst:AddTag("small_giant2x")
end end
function chspider_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_HIDER_HEALTH*2)
    inst:AddTag("monster2x")
end end
function csspider_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_SPITTER_HEALTH*2)
    inst:AddTag("monster2x")
end end
function cdspider_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_WARRIOR_HEALTH*2)
     inst:AddTag("monster2x")
end end
function nhound_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.HOUND_HEALTH*2)
        inst:AddTag("monster2x")
end end
function fhound_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.FIREHOUND_HEALTH*2)
        inst:AddTag("monster2x")
end end
function ihound_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.ICEHOUND_HEALTH*2)
        inst:AddTag("monster2x")
end end
function warg_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.WARG_HEALTH*2)
        inst:AddTag("small_giant2x")
end end
function tentacle_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.TENTACLE_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.TENTACLE_DAMAGE*1.5)
        inst:AddTag("monster2x")
end end
function rook_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.ROOK_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.ROOK_DAMAGE*1.5)
        inst:AddTag("monster2x")
end end
function minotaur_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.MINOTAUR_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.MINOTAUR_DAMAGE*1.5)
        inst:AddTag("monster2x")
end end
function bishop_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.BISHOP_HEALTH*2)
    inst.components.combat:SetDefaultDamage(TUNING.BISHOP_DAMAGE*1.2)
        inst:AddTag("monster2x")
end end
function tallbird_2x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.TALLBIRD_HEALTH*2)
        inst:AddTag("monster2x")
end end
function leif_2x(inst)
if IsServer and inst.components.health then
        inst:AddTag("small_giant2x")
    inst.components.health:SetMaxHealth(TUNING.LEIF_HEALTH*2)
end end
function spat_2x(inst)
if IsServer and inst.components.health then
        inst:AddTag("small_giant2x")
    inst.components.health:SetMaxHealth(TUNING.SPAT_HEALTH*2)
end end
function birchnutdrake_2x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster2x")
    inst.components.health:SetMaxHealth(100)
end end
function merm_2x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster2x")
    inst.components.health:SetMaxHealth(TUNING.MERM_HEALTH*4)
end end
function bat_2x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster2x")
    inst.components.health:SetMaxHealth(TUNING.BAT_HEALTH*2)
end end
function monkey_2x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster2x")
    inst.components.health:SetMaxHealth(TUNING.MONKEY_HEALTH*2)
end end
function walus_2x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster2x")
    inst.components.health:SetMaxHealth(TUNING.WALRUS_HEALTH*2)
end end
function eyeplant_2x(inst)
if IsServer and inst.components.health then
  
    inst.components.health:SetMaxHealth(TUNING.EYEPLANT_HEALTH*2)
end end
function antlion_2x(inst)
if IsServer and inst.components.health then
 	inst.components.health:SetMaxHealth(TUNING.ANTLION_HEALTH*2.2)
    inst:AddTag("giant2x")
end end
function stalker_2x(inst)
if IsServer and inst.components.health then
 	inst.components.health:SetMaxHealth(TUNING.STALKER_HEALTH*2)
    inst:AddTag("giant2x")
end end
function stalker_atrium_2x(inst)
if IsServer and inst.components.health then
 	inst.components.health:SetMaxHealth(TUNING.STALKER_ATRIUM_HEALTH*2)
    inst:AddTag("giant2x")
end end

AddPrefabPostInit("deerclops", deerclops_2x)
AddPrefabPostInit("bearger", bearger_2x)
AddPrefabPostInit("dragonfly", dragonfly_2x)
AddPrefabPostInit("moose", moose_2x)
AddPrefabPostInit("mossling", mossling_2x)
AddPrefabPostInit("spider", nspider_2x)
AddPrefabPostInit("spider_warrior", wspider_2x)
AddPrefabPostInit("spiderqueen", qspider_2x)
AddPrefabPostInit("spider_hider", chspider_2x)
AddPrefabPostInit("spider_spitter", csspider_2x)
AddPrefabPostInit("spider_dropper", cdspider_2x)
AddPrefabPostInit("hound", nhound_2x)
AddPrefabPostInit("firehound", fhound_2x)
AddPrefabPostInit("icehound", ihound_2x)
AddPrefabPostInit("warg", warg_2x)
AddPrefabPostInit("tentacle", tentacle_2x)
AddPrefabPostInit("rook", rook_2x)
AddPrefabPostInit("minotaur", minotaur_2x)
AddPrefabPostInit("bishop", bishop_2x)
AddPrefabPostInit("tallbird", tallbird_2x)
AddPrefabPostInit("leif", leif_2x)
AddPrefabPostInit("spat", spat_2x)
AddPrefabPostInit("merm", merm_2x)
AddPrefabPostInit("birchnutdrake", birchnutdrake_2x)
AddPrefabPostInit("bat", bat_2x)
AddPrefabPostInit("walus", walus_2x)
AddPrefabPostInit("monkey", monkey_2x)
AddPrefabPostInit("eyeplant", eyeplant_2x)
AddPrefabPostInit("toadstool", toadstool_2x)
AddPrefabPostInit("beequeen", beequeen_2x)
AddPrefabPostInit("antlion", antlion_2x)
AddPrefabPostInit("stalker", stalker_2x)
AddPrefabPostInit("stalker_atrium", stalker_atrium_2x)
--AddPrefabPostInit("buzzard", buzzard_2x)
end
if Difficult == "monster3x" then

function deerclops_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.DEERCLOPS_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.DEERCLOPS_DAMAGE*2.5)
    inst.components.combat:SetAttackPeriod(2.6)
  inst:AddTag("giant3x")
end end
function bearger_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.BEARGER_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.BEARGER_DAMAGE*2.5)
    inst.components.combat:SetRange(TUNING.BEARGER_ATTACK_RANGE, TUNING.BEARGER_MELEE_RANGE)
    inst.components.combat:SetAttackPeriod(2.6)
  inst:AddTag("giant3x")
end end
function dragonfly_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.DRAGONFLY_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.DRAGONFLY_DAMAGE*2.5)
    inst.components.combat:SetAttackPeriod(2.1)
  inst:AddTag("giant3x")
end end
function moose_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.MOOSE_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.MOOSE_DAMAGE*2.5)
    inst.components.combat:SetAttackPeriod(2.6)
   inst:AddTag("giant3x")
end end
function mossling_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.MOSSLING_HEALTH*3)
    inst.components.combat:SetDefaultDamage(TUNING.MOSSLING_DAMAGE*2.5)
   inst:AddTag("small_giant3x")
end end
function toadstool_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.TOADSTOOL_HEALTH*3.3)
    inst:AddTag("giant3x")
end end
function beequeen_3x(inst)
if IsServer and inst.components.health then
	inst.components.health:SetMaxHealth(TUNING.BEEQUEEN_HEALTH*3)
inst:AddTag("giant3x")
end end
function nspider_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(2.75)
     inst:AddTag("monster3x")
end end
function wspider_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_WARRIOR_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_WARRIOR_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(3.75 + math.random()*2)
     inst:AddTag("monster3x")
end end
function qspider_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDERQUEEN_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDERQUEEN_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(2.75)
     inst:AddTag("small_giant3x")
end end
function chspider_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_HIDER_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_HIDER_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(2.75)
     inst:AddTag("monster3x")
end end
function csspider_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_SPITTER_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_SPITTER_DAMAGE_MELEE*1.5)
    inst.components.combat:SetAttackPeriod(4.75 + math.random()*2)
     inst:AddTag("monster3x")
end end
function cdspider_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_WARRIOR_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_WARRIOR_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(2.75 + math.random()*2)
     inst:AddTag("monster3x")
end end
function nhound_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.HOUND_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.HOUND_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(1.75)
        inst:AddTag("monster3x")
end end
function fhound_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.FIREHOUND_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.FIREHOUND_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(1.75)
        inst:AddTag("monster3x")
end end
function ihound_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.ICEHOUND_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.ICEHOUND_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(1.75)
        inst:AddTag("monster3x")
end end
function warg_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.WARG_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.WARG_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(2.75)
        inst:AddTag("small_giant3x")
end end
function tentacle_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.TENTACLE_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.TENTACLE_DAMAGE*2)
        inst:AddTag("monster3x")
end end
function rook_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.ROOK_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.ROOK_DAMAGE*2)
        inst:AddTag("monster3x")
end end
function minotaur_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.MINOTAUR_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.MINOTAUR_DAMAGE*2)
        inst:AddTag("monster3x")
end end
function bishop_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.BISHOP_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.BISHOP_DAMAGE*1.6)
        inst:AddTag("monster3x")
end end
function tallbird_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.TALLBIRD_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.TALLBIRD_DAMAGE*1.5)
    inst.components.combat:SetAttackPeriod(1.75)
        inst:AddTag("monster3x")
end end
function leif_3x(inst)
if IsServer and inst.components.health then
        inst:AddTag("small_giant3x")
    inst.components.health:SetMaxHealth(TUNING.LEIF_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.LEIF_DAMAGE*1.5)
end end
function spat_3x(inst)
if IsServer and inst.components.health then
        inst:AddTag("small_giant3x")
    inst.components.health:SetMaxHealth(TUNING.SPAT_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.SPAT_PHLEGM_DAMAGE*1.25)
end end
function birchnutdrake_3x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster3x")
    inst.components.health:SetMaxHealth(150)
    inst.components.combat:SetDefaultDamage(10)
end end
function merm_3x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster3x")
    inst.components.health:SetMaxHealth(TUNING.MERM_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.MERM_DAMAGE*1.5)
end end
function bat_3x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster3x")
    inst.components.health:SetMaxHealth(TUNING.BAT_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.BAT_DAMAGE*1.5)
end end
function monkey_3x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster3x")
    inst.components.health:SetMaxHealth(TUNING.MONKEY_HEALTH*4)
end end
function walus_3x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster3x")
    inst.components.health:SetMaxHealth(TUNING.WALRUS_HEALTH*4)
    inst.components.locomotor.runspeed = 6
    inst.components.locomotor.walkspeed = 2
end end
function eyeplant_3x(inst)
if IsServer and inst.components.health then
        -- inst:AddTag("monster1x")
    inst.components.health:SetMaxHealth(TUNING.EYEPLANT_HEALTH*4)
    inst.components.combat:SetDefaultDamage(TUNING.EYEPLANT_DAMAGE*1.5)
end end
function antlion_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.ANTLION_HEALTH*3.3)
    inst:AddTag("giant3x")
end end
function stalker_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.STALKER_HEALTH*3)
    inst:AddTag("giant3x")
end end
function stalker_atrium_3x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.STALKER_ATRIUM_HEALTH*3)
    inst:AddTag("giant3x")
end end

AddPrefabPostInit("deerclops", deerclops_3x)
AddPrefabPostInit("bearger", bearger_3x)
AddPrefabPostInit("dragonfly", dragonfly_3x)
AddPrefabPostInit("moose", moose_3x)
AddPrefabPostInit("mossling", mossling_3x)
AddPrefabPostInit("spider", nspider_3x)
AddPrefabPostInit("spider_warrior", wspider_3x)
AddPrefabPostInit("spiderqueen", qspider_3x)
AddPrefabPostInit("spider_hider", chspider_3x)
AddPrefabPostInit("spider_spitter", csspider_3x)
AddPrefabPostInit("spider_dropper", cdspider_3x)
AddPrefabPostInit("hound", nhound_3x)
AddPrefabPostInit("firehound", fhound_3x)
AddPrefabPostInit("icehound", ihound_3x)
AddPrefabPostInit("warg", warg_3x)
AddPrefabPostInit("tentacle", tentacle_3x)
AddPrefabPostInit("rook", rook_3x)
AddPrefabPostInit("minotaur", minotaur_3x)
AddPrefabPostInit("bishop", bishop_3x)
AddPrefabPostInit("tallbird", tallbird_3x)
AddPrefabPostInit("leif", leif_3x)
AddPrefabPostInit("spat", spat_3x)
AddPrefabPostInit("merm", merm_3x)
AddPrefabPostInit("birchnutdrake", birchnutdrake_3x)
AddPrefabPostInit("bat", bat_3x)
AddPrefabPostInit("walus", walus_3x)
AddPrefabPostInit("monkey", monkey_3x)
AddPrefabPostInit("eyeplant", eyeplant_3x)
AddPrefabPostInit("toadstool", toadstool_3x)
AddPrefabPostInit("beequeen", beequeen_3x)
AddPrefabPostInit("antlion", antlion_3x)
AddPrefabPostInit("stalker", stalker_3x)
AddPrefabPostInit("stalker_atrium", stalker_atrium_3x)
--AddPrefabPostInit("buzzard", buzzard_3x)
end
if Difficult == "monster4x" then

function deerclops_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.DEERCLOPS_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.DEERCLOPS_DAMAGE*3)
 --   inst.components.combat:SetAreaDamage(TUNING.DEERCLOPS_AOE_RANGE, TUNING.DEERCLOPS_AOE_SCALE)
    inst.components.combat:SetAttackPeriod(2.3)
   inst:AddTag("giant4x")
end end
function bearger_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.BEARGER_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.BEARGER_DAMAGE*3)
    inst.components.combat:SetRange(TUNING.BEARGER_ATTACK_RANGE, TUNING.BEARGER_MELEE_RANGE)
 --   inst.components.combat:SetAreaDamage(6, 0.8)
    inst.components.combat:SetAttackPeriod(2.3)
   inst:AddTag("giant4x")
end end
function dragonfly_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.DRAGONFLY_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.DRAGONFLY_DAMAGE*3)
   -- inst.components.combat:SetAreaDamage(6, 0.8)
    inst.components.combat:SetAttackPeriod(1.8)
   inst:AddTag("giant4x")
end end
function moose_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.MOOSE_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.MOOSE_DAMAGE*3)
    inst.components.combat:SetAttackPeriod(2.3)
    inst:AddTag("giant4x")
end end
function mossling_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.MOSSLING_HEALTH*5)
    inst.components.combat:SetDefaultDamage(TUNING.MOSSLING_DAMAGE*3)
    inst:AddTag("small_giant4x")
end end
function toadstool_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.TOADSTOOL_HEALTH*5.5)
    inst:AddTag("giant4x")
end end
function beequeen_4x(inst)
if IsServer and inst.components.health then
	inst.components.health:SetMaxHealth(TUNING.BEEQUEEN_HEALTH*4)
inst:AddTag("giant4x")
end end
function nspider_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(2.5)
     inst:AddTag("monster4x")
end end
function wspider_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_WARRIOR_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_WARRIOR_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(3.5 + math.random()*2)
     inst:AddTag("monster4x")
end end
function qspider_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDERQUEEN_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDERQUEEN_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(2.5)
     inst:AddTag("small_giant4x")
end end
function chspider_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_HIDER_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_HIDER_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(2.5)
     inst:AddTag("monster4x")
end end
function csspider_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_SPITTER_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_SPITTER_DAMAGE_MELEE*2)
    inst.components.combat:SetAttackPeriod(4.5 + math.random()*2)
        inst:AddTag("monster4x")
end end
function cdspider_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.SPIDER_WARRIOR_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.SPIDER_WARRIOR_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(3.5 + math.random()*2)
        inst:AddTag("monster4x")
end end
function nhound_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.HOUND_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.HOUND_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(1.5)
        inst:AddTag("monster4x")
end end
function fhound_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.FIREHOUND_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.FIREHOUND_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(1.5)
        inst:AddTag("monster4x")
end end
function ihound_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.ICEHOUND_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.ICEHOUND_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(1.5)
        inst:AddTag("monster4x")
end end
function warg_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.WARG_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.WARG_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(2.5)
        inst:AddTag("small_giant4x")
end end
function tentacle_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.TENTACLE_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.TENTACLE_DAMAGE*2.5)
        inst:AddTag("monster4x")
end end
function rook_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.ROOK_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.ROOK_DAMAGE*3)
        inst:AddTag("monster4x")
end end
function minotaur_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.MINOTAUR_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.MINOTAUR_DAMAGE*2.5)
        inst:AddTag("monster4x")
end end
function bishop_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.BISHOP_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.BISHOP_DAMAGE*2)
        inst:AddTag("monster4x")
end end
function tallbird_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.TALLBIRD_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.TALLBIRD_DAMAGE*2)
    inst.components.combat:SetAttackPeriod(1.5)
        inst:AddTag("monster4x")
end end
function leif_4x(inst)
if IsServer and inst.components.health then
        inst:AddTag("small_giant4x")
    inst.components.health:SetMaxHealth(TUNING.LEIF_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.LEIF_DAMAGE*2)
end end
function spat_4x(inst)
if IsServer and inst.components.health then
        inst:AddTag("small_giant4x")
    inst.components.health:SetMaxHealth(TUNING.SPAT_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.SPAT_PHLEGM_DAMAGE*1.5)
end end
function birchnutdrake_4x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster4x")
    inst.components.health:SetMaxHealth(200)
    inst.components.combat:SetDefaultDamage(15)
end end
function merm_4x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster4x")
    inst.components.health:SetMaxHealth(TUNING.MERM_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.MERM_DAMAGE*2)
end end
function bat_4x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster4x")
    inst.components.health:SetMaxHealth(TUNING.BAT_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.BAT_DAMAGE*2)
end end
function walus_4x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster4x")
    inst.components.health:SetMaxHealth(TUNING.WALRUS_HEALTH*6)
    inst.components.locomotor.runspeed = 8
    inst.components.locomotor.walkspeed = 2
end end
function monkey_4x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster4x")
    inst.components.health:SetMaxHealth(TUNING.MONKEY_HEALTH*6)
end end
function eyeplant_4x(inst)
if IsServer and inst.components.health then
        inst:AddTag("monster2x")
    inst.components.health:SetMaxHealth(TUNING.EYEPLANT_HEALTH*6)
    inst.components.combat:SetDefaultDamage(TUNING.EYEPLANT_DAMAGE*2)
end end
function antlion_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.ANTLION_HEALTH*5.5)
    inst:AddTag("giant4x")
end end
function stalker_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.STALKER_HEALTH*5)
    inst:AddTag("giant4x")
end end
function stalker_atrium_4x(inst)
if IsServer and inst.components.health then
    inst.components.health:SetMaxHealth(TUNING.STALKER_ATRIUM_HEALTH*5)
    inst:AddTag("giant4x")
end end

AddPrefabPostInit("deerclops", deerclops_4x)
AddPrefabPostInit("bearger", bearger_4x)
AddPrefabPostInit("dragonfly", dragonfly_4x)
AddPrefabPostInit("moose", moose_4x)
AddPrefabPostInit("mossling", mossling_4x)
AddPrefabPostInit("spider", nspider_4x)
AddPrefabPostInit("spider_warrior", wspider_4x)
AddPrefabPostInit("spiderqueen", qspider_4x)
AddPrefabPostInit("spider_hider", chspider_4x)
AddPrefabPostInit("spider_spitter", csspider_4x)
AddPrefabPostInit("spider_dropper", cdspider_4x)
AddPrefabPostInit("hound", nhound_4x)
AddPrefabPostInit("firehound", fhound_4x)
AddPrefabPostInit("icehound", ihound_4x)
AddPrefabPostInit("warg", warg_4x)
AddPrefabPostInit("tentacle", tentacle_4x)
AddPrefabPostInit("rook", rook_4x)
AddPrefabPostInit("minotaur", minotaur_4x)
AddPrefabPostInit("bishop", bishop_4x)
AddPrefabPostInit("tallbird", tallbird_4x)
AddPrefabPostInit("leif", leif_4x)
AddPrefabPostInit("spat", spat_4x)
AddPrefabPostInit("merm", merm_4x)
AddPrefabPostInit("birchnutdrake", birchnutdrake_4x)
AddPrefabPostInit("bat", bat_4x)
AddPrefabPostInit("walus", walus_4x)
AddPrefabPostInit("monkey", monkey_4x)
AddPrefabPostInit("eyeplant", eyeplant_4x)
AddPrefabPostInit("toadstool", toadstool_4x)
AddPrefabPostInit("beequeen", beequeen_4x)
AddPrefabPostInit("antlion", antlion_4x)
AddPrefabPostInit("stalker", stalker_4x)
AddPrefabPostInit("stalker_atrium", stalker_atrium_4x)
--AddPrefabPostInit("buzzard", buzzard_4x)
end


-------
AddModCharacter("musha","FEMALE")
--table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "musha")

