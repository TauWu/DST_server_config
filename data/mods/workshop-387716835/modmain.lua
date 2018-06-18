_G = GLOBAL
local cooking = _G.require "cooking"
modimport("scripts/cookpotfix.lua")

PrefabFiles = {
	"aqvarium",
	"red_roe",
	"black_roe",
	"fish_skelet",
	"eel_skelet",
	
	"red_cavair",
	"black_cavair",
}

Assets = 
{
	Asset( "IMAGE", "minimap/aqvarium.tex" ),
	Asset( "ATLAS", "minimap/aqvarium.xml" ),

    --Asset( "IMAGE", "images/inventoryimages/red_fish_eggs.tex" ),
    --Asset( "ATLAS", "images/inventoryimages/red_fish_eggs.xml" ),
    --Asset( "IMAGE", "images/inventoryimages/black_fish_eggs.tex" ),
    --Asset( "ATLAS", "images/inventoryimages/black_fish_eggs.xml" ),
	
    Asset( "IMAGE", "images/inventoryimages/red_roe.tex" ),
    Asset( "ATLAS", "images/inventoryimages/red_roe.xml" ),
    Asset( "IMAGE", "images/inventoryimages/black_roe.tex" ),
    Asset( "ATLAS", "images/inventoryimages/black_roe.xml" ),
    Asset( "IMAGE", "images/inventoryimages/fish_skelet.tex" ),
    Asset( "ATLAS", "images/inventoryimages/fish_skelet.xml" ),
    Asset( "IMAGE", "images/inventoryimages/eel_skelet.tex" ),
    Asset( "ATLAS", "images/inventoryimages/eel_skelet.xml" ),
    
	Asset( "IMAGE", "images/inventoryimages/red_cavair.tex" ),
    Asset( "ATLAS", "images/inventoryimages/red_cavair.xml" ),
	Asset( "IMAGE", "images/inventoryimages/black_cavair.tex" ),
    Asset( "ATLAS", "images/inventoryimages/black_cavair.xml" ),
}
AddMinimapAtlas("minimap/aqvarium.xml")

STRINGS = GLOBAL.STRINGS
RECIPETABS = GLOBAL.RECIPETABS
Recipe = GLOBAL.Recipe
Ingredient = GLOBAL.Ingredient
TECH = GLOBAL.TECH
STRINGS.Aquarium = {}
local aq = STRINGS.Aquarium

local is_rus = GLOBAL.rawget(GLOBAL,"russiannames") and true or false
local ch_nm = GLOBAL.rawget(GLOBAL,"RegisterRussianName")
or function(key,val)
	STRINGS.NAMES[key]=val
end

if not is_rus then
	STRINGS.NAMES.FISH_SKELET = "Fish Bones"
	STRINGS.NAMES.EEL_SKELET = "Eel Bones"
	STRINGS.NAMES.RED_CAVAIR = "Sandwich with Red Caviar"
	STRINGS.NAMES.BLACK_CAVAIR = "Sandwich with Caviar"
	STRINGS.NAMES.RED_ROE = "Red Roe"
	STRINGS.NAMES.BLACK_ROE = "Black Roe"

	STRINGS.CHARACTERS.GENERIC.DESCRIBE.RED_CAVAIR = "Delicacy!"
	STRINGS.CHARACTERS.GENERIC.DESCRIBE.BLACK_CAVAIR = "Delicacy!"
	STRINGS.CHARACTERS.GENERIC.DESCRIBE.BLACK_ROE = "Crude roe."
	STRINGS.CHARACTERS.GENERIC.DESCRIBE.RED_ROE = "Crude roe."
	STRINGS.CHARACTERS.GENERIC.DESCRIBE.FISH_SKELET = "Just leavings."
	STRINGS.CHARACTERS.GENERIC.DESCRIBE.EEL_SKELET = "This could be added to the soup."

	STRINGS.NAMES.AQVARIUM = "Aquarium"
	STRINGS.RECIPE_DESC.AQVARIUM = "Home fish"
	STRINGS.CHARACTERS.GENERIC.DESCRIBE.AQVARIUM = "Calm, keep calm..."
	
	--�������� ���� � ��������
	aq.WATER = "Swim, dear!"
	aq.COMBAT = "They eat each other!"
	
	--����� � ������������
	aq.SEEDS="Feeder is full!"
	aq.FROZEN="There is only ice."
	aq.LITTLEWATER="There's a little water."
	aq.NOWATER="There's no water."
	aq.NOSPACE="No free space for fish."
	aq.MONSTER="No way!"
	aq.THEY_WONT_EAT="Eat children??"
	aq.ENOUGH="Enough!"
	aq.WHY="Why?"
	STRINGS.Aquarium.ALREADY_EATEN="Already eaten!"
	
	--�����
	aq.WANTEAT1="Fish want to eat!"
	aq.WANTEAT2="She need food!"
	aq.WANTEAT3="She's starving!"
	aq.WANTEAT4="Help the fish!"
	aq.WANTEAT5="Bye, my fish!"
	aq.TASTYSEEDS="Lovely seeds!"
	aq.TASTYMEAT="Tasty meat!"
	--��������
	aq.PLOP="Plop!"

	aq.INSPECT_FROZEN="The water is frozen."
	aq.INSPECT_EMPTY="It's empty."
	aq.INSPECT_WATER_1="At the bottom there is a little water."
	aq.INSPECT_WATER_2="In it a little water."
	aq.INSPECT_WATER_3="Water had accumulated more than half."
	aq.INSPECT_WATER_4="Aquarium with water, but no fish."
	aq.INSPECT_WATER_DEAD_FISH="She was my best friend."
	aq.INSPECT_WATER_DEAD_EEL="It's dead."
	aq.INSPECT_FISH="There is a fish!"
	aq.INSPECT_FISHES="There are a lot of fish!"
	aq.INSPECT_EEL="There is a eel!"
	aq.INSPECT_EELS="There are a lot of eels!"
	aq.FEEDER_ALMOST_EMPTY="Feeder is almost empty."
	aq.FEEDER_EMPTY="Feeder is empty."
	aq.MEAT_NOT_FOOD="It won't live long, eating only meat."
	
else --russian language
	ch_nm("FISH_SKELET","������ �����","plural","������ ������","������ �����")
	ch_nm("EEL_SKELET","����� ����","plural","������ ����","����� ����")
	ch_nm("RED_CAVAIR","��������� � ������� �����")
	ch_nm("BLACK_CAVAIR","��������� � ������ �����")
	ch_nm("RED_ROE","������� ����","she")
	ch_nm("BLACK_ROE","׸���� ����","she")
	--STRINGS.NAMES.RED_FISH_EGGS = "�������"
	
	STRINGS.CHARACTERS.GENERIC.DESCRIBE.RED_CAVAIR = "���������!"
	STRINGS.CHARACTERS.GENERIC.DESCRIBE.BLACK_CAVAIR = "���������!"
	STRINGS.CHARACTERS.GENERIC.DESCRIBE.BLACK_ROE = "����� ����."
	STRINGS.CHARACTERS.GENERIC.DESCRIBE.RED_ROE = "����� ����."
	STRINGS.CHARACTERS.GENERIC.DESCRIBE.FISH_SKELET = "����� �����." --������� ���� ����
	STRINGS.CHARACTERS.GENERIC.DESCRIBE.EEL_SKELET = "��� ����� �������� � ���."

	STRINGS.NAMES.AQVARIUM = "��������"
	STRINGS.RECIPE_DESC.AQVARIUM = "�������� �����"
	STRINGS.CHARACTERS.GENERIC.DESCRIBE.AQVARIUM = "�����������, ������ �����������..."
	
	aq.WATER = "�����, �����!"
	aq.COMBAT = "��� ���� ���� �����!"
	
	aq.SEEDS="�������� �����������!"
	aq.FROZEN="���� �������."
	aq.LITTLEWATER="��� ���� ����."
	aq.NOWATER="��� ��� ����."
	aq.NOSPACE="��� ��� ��� ���������� �����."
	aq.MONSTER="�� �� ���!"
	aq.THEY_WONT_EAT="���� �����??"
	aq.ENOUGH="����������!"
	aq.WHY="�����?"
	STRINGS.Aquarium.ALREADY_EATEN="��� ��������� �� ������."
	
	aq.WANTEAT1="����� ����� ����!"
	aq.WANTEAT2="�� ����� ���!"
	aq.WANTEAT3="��� ��������!"
	aq.WANTEAT4="������ ��!"
	aq.WANTEAT5="������, �����!"
	aq.TASTYSEEDS="����� �������!"
	aq.TASTYMEAT="������� ����!"
	
	aq.PLOP="����-����!"
	
	aq.INSPECT_FROZEN="���� ������� � ��."
	aq.INSPECT_EMPTY="������ ��������."
	aq.INSPECT_WATER_1="�� ��� ���� ������� ����."
	aq.INSPECT_WATER_2="� �� ���� ����."
	aq.INSPECT_WATER_3="���� ��������� ������ ��������."
	aq.INSPECT_WATER_4="�������� � �����, �� ��� �����."
	aq.INSPECT_WATER_DEAD_FISH="��� ���� ���� ������."
	aq.INSPECT_WATER_DEAD_EEL="��. � ����� ��� ����� �����?"
	aq.INSPECT_FISH="��� ������� �����."
	aq.INSPECT_FISHES="��� ������� �����."
	aq.INSPECT_EEL="��� ������� �����."
	aq.INSPECT_EELS="��� ������� ����."
	aq.FEEDER_ALMOST_EMPTY="�������� ����� �����."
	aq.FEEDER_EMPTY="�������� �����."
	aq.MEAT_NOT_FOOD="����� �� ���� �� ���������."
end

--AddIngredientValues({"batwing", "batwing_cooked"}, {meat=0.5, wings=1, monster=0.5})
AddIngredientValues({"red_roe","black_roe"}, {fish=0.5, meat=0.5, seafood=1})
AddIngredientValues({"fish_skelet","eel_skelet"}, {})

--cooking.recipes.cookpot.red_cavair =
local red_cavair=
{
	name="red_cavair",
	test = function(cooker, names, tags) return names.red_roe and tags.egg and not tags.sweetener end,
	priority = 0,
	foodtype="MEAT",
	health = TUNING.HEALING_MEDSMALL,
	hunger = TUNING.CALORIES_MEDSMALL,
	sanity = TUNING.SANITY_MED,
	perishtime = TUNING.PERISH_FAST,
	--temperature = TUNING.COLD_FOOD_BONUS_TEMP,
	--temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
	cooktime = 0.25,
	weight = 1,
}
AddCookerRecipe("cookpot",red_cavair)

local black_cavair=
{
	name="black_cavair",
	test = function(cooker, names, tags) return names.black_roe and tags.egg and not tags.sweetener end,
	priority = 0,
	foodtype="MEAT",
	health = TUNING.HEALING_MEDSMALL,
	hunger = TUNING.CALORIES_MEDSMALL,
	sanity = TUNING.SANITY_MED,
	perishtime = TUNING.PERISH_FAST,
	--temperature = TUNING.COLD_FOOD_BONUS_TEMP,
	--temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
	cooktime = 0.25,
	weight = 1,
}
AddCookerRecipe("cookpot",black_cavair)


local aqvarium = GLOBAL.Recipe("aqvarium",{ Ingredient("goldnugget", 4), Ingredient("papyrus", 1), Ingredient("bluegem", 1) },					   
RECIPETABS.TOWN, TECH.SCIENCE_ONE, "aqvarium_placer" )
aqvarium.atlas = "minimap/aqvarium.xml"


if _G.TheNet and _G.TheNet:GetIsServer() then

--[[
--��������� ������ ������ � ���� (������-�� �� ��������... ���� ��)
local function LoveRoe(prefab)
	AddPrefabPostInit(prefab,function(inst)
		if inst.components.eater and inst.components.eater.foodprefs then
			table.insert(inst.components.eater.foodprefs,"ROE")
			if inst.components.eater.ablefoods then
				table.insert(inst.components.eater.ablefoods,"ROE")
			end
		end
	end)
end
LoveRoe("crow")
LoveRoe("robin")
LoveRoe("robin_winter")
if GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) then
	LoveRoe("mole") --� ��� ����
end

AddSimPostInit(function(inst)
	if inst.components.eater then
		table.insert(inst.components.eater.foodprefs,"ROE")
		if inst.components.eater.ablefoods then
			table.insert(inst.components.eater.ablefoods,"ROE")
		end
	end
end)
--]]



--AddPrefabPostInit("aqvarium", aqvariumPrefabPostInit)

--������ �������� ������� � ������������ � �����������
local Sandwich_Sanity = GetModConfigData("san") or 10
AddPrefabPostInit("black_cavair", function(inst)
	inst.components.edible.sanityvalue = Sandwich_Sanity
end)
AddPrefabPostInit("red_cavair", function(inst)
	inst.components.edible.sanityvalue = Sandwich_Sanity
end)

if true then -------GetModConfigData("bait")
	--�������� ��� ���� (� ������)
	local function bait_roe(inst)
		inst:AddTag("edible_SEEDS")
		inst:AddComponent("bait")
	end
	AddPrefabPostInit("red_roe",bait_roe)
	AddPrefabPostInit("black_roe",bait_roe)
end

--������ ��������� ������ ��� ���������. ��� �����
local pick = _G.require "components/pickable"
local sb = pick.CanBePicked
function pick:CanBePicked()
	local can = sb(self)
		if (self.inst.prefab=="aqvarium") then
			return false
		end
	return can
end



end