name = "The Medic"
description = "Doctor Assisted Homicide"
author = "CheeseNuggets101"
version = "6.7"
forumthread = "topic/72813-cheesenuggets-cheesy-fan-art-thread/"
api_version = 10

dont_starve_compatible = false
reign_of_giants_compatible = true
all_clients_require_mod = true
client_only_mod = false
dst_compatible = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {"medictf2", "character", "medic", "tf2", "team fortress 2"}

menu_assets = {
    characters = {
        medic = { gender = "MALE", skins = { "blu", "formal", "survivor", "shadow" } }
    },
    skins = {
	    medic_blu = { name = "BLU", desc = "Take a look from the other side of the war.", atlas = "images/skinicons/medic_blu.xml", image = "medic_blu.tex" },
        medic_formal = { name = "Guest of Honor", desc = "At a party still with his trusty gloves and trench coat means Medic will be blood-soaked within the hour.", atlas = "images/skinicons/medic_formal.xml", image = "medic_formal.tex" },
		medic_survivor = { name = "The Survivor", desc = "Left with only health kits and no medi-gun Medic has chosen the next best route; Battle Medic.", atlas = "images/skinicons/medic_survivor.xml", image = "medic_survivor.tex" },
		medic_shadow = { name = "The Triumphant", desc = "When you already consider yourself a god, why not look the part?", atlas = "images/skinicons/medic_shadow.xml", image = "medic_shadow.tex" }
    }
}

configuration_options =
{

		{
		name = "medicregen",
		label = "Medic Health Regen(Seconds)",
		hover = "1 hp gained every X amount of seconds.",
		options =
		{
			{description = "0(Disable)", data = 1000000}, --Cheat because 1 hp every 0 seconds renders hp not a problem, I am not a fan of that kind of OP-ness (277-ish Hours)
			{description = "1", data = 1}, -- 1 hp for every second
			{description = "2", data = 2},
			{description = "3", data = 3},
			{description = "4", data = 4},
			{description = "5", data = 5},
	    	{description = "6", data = 6, hover = "Classic"},
			{description = "7", data = 7},
			{description = "8", data = 8},
			{description = "9", data = 9},
			{description = "10(Default)", data = 10, 
			    hover = "10 Seconds"},
			{description = "11", data = 11},
			{description = "12", data = 12},
			{description = "13", data = 13},
			{description = "14", data = 14},
			{description = "15", data = 15},
			{description = "16", data = 16},
			{description = "17", data = 17},
			{description = "18", data = 18},
			{description = "19", data = 19},
			{description = "20", data = 20},
			{description = "21", data = 21},
			{description = "22", data = 22},
			{description = "23", data = 23},
			{description = "24", data = 24},
			{description = "25", data = 25},
			{description = "30", data = 30},
			{description = "35", data = 35},
			{description = "40", data = 40},
			{description = "45", data = 45},
			{description = "55", data = 55},
			{description = "60", data = 60, 
			    hover = "1 Minute"},
			{description = "65", data = 65},
			{description = "70", data = 70},
			{description = "75", data = 75},
			{description = "80", data = 80},
			{description = "85", data = 85},
			{description = "90", data = 90},
			{description = "95", data = 95},
			{description = "100", data = 100},
			{description = "105", data = 105},
			{description = "110", data = 110},
			{description = "115", data = 115},
			{description = "120", data = 120},
			{description = "125", data = 125},
			{description = "130", data = 130},
			{description = "135", data = 135},
			{description = "140", data = 140},
			{description = "145", data = 145},
			{description = "150", data = 150},
			{description = "155", data = 155},
			{description = "160", data = 160},
			{description = "165", data = 165},
			{description = "170", data = 170},
			{description = "175", data = 175},
			{description = "180", data = 180},
			{description = "185", data = 185},
			{description = "190", data = 190},
			{description = "195", data = 195},
			{description = "200", data = 200, 
			    hover = "3 Minutes, 20 Seconds"},
			{description = "205", data = 205},
			{description = "210", data = 210},
			{description = "215", data = 215},
			{description = "220", data = 220},
			{description = "225", data = 225},
			{description = "230", data = 230},
			{description = "235", data = 235},
			{description = "240", data = 240},
			{description = "245", data = 245},
			{description = "250", data = 250},
			{description = "255", data = 255},
			{description = "260", data = 260},
			{description = "265", data = 265},
			{description = "270", data = 270},
			{description = "275", data = 275},
			{description = "280", data = 280},
			{description = "285", data = 285},
			{description = "290", data = 290},
			{description = "295", data = 295},
			{description = "300", data = 300},
			{description = "500", data = 500, 
			    hover = "8 Minutes and 20 Seconds"},
			{description = "600", data = 600, 
			    hover = "10 Minutes"},
			{description = "1000", data = 1000, 
			    hover = "16 Minutes and 40 Seconds"},
			{description = "1500", data = 1500, 
			    hover = "25 Minutes"},
			{description = "1800", data = 1800, 
			    hover = "30 Minutes"},
		},
		default = 10,
	},
	
		{
		name = "bonesawdmg",
		label = "Bonesaw's Base Damage",
		options =
		{
		    {description = "10", data = 10},
		    {description = "17", data = 17},
			{description = "27", data = 27},
			{description = "34", data = 34},
			{description = "42(Default)", data = 42},
			{description = "42.5", data = 42.5},
			{description = "51", data = 51},
			{description = "55.5", data = 55.5},
			{description = "59.5", data = 59.5},
			{description = "60", data = 60},
			{description = "64", data = 64},
		},
		default = 42,
	},
	
	{
		name="Bonesaw_Difficulty",
		label="Bonesaw Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easy",description="Easy",
			   hover = "3 Boneshards, 2 Flint"},
			{data="default",description="Default",
			   hover = "5 Boneshards, 3 Flint"},
			{data="hard",description="Hard",
			   hover = "6 Boneshards, 5 Flint"},
		    {data="harder",description="Harder",
			   hover = "6 Boneshards, 6 Flint, 3 Twigs"},
		},
		default="default"
	},
	
	{
		name = "bonesawuses",
		label = "Bonesaw Uses",
		hover = "Durability",
		options =
		{
			{description = "33", data = 33},
			{description = "50", data = 50},
			{description = "75", data = 75},
			{description = "100(Default)", data = 100},
			{description = "150", data = 150},
			{description = "175", data = 175},
			{description = "190", data = 190},
			{description = "200", data = 200},
			{description = "250", data = 250},
		},
		default = 100,
	},
	
	{
		name="Ubersaw_Difficulty",
		label="Übersaw Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easy",description="Easy",
			   hover = "2 Healing Salves, 3 Twigs"},
			{data="default",description="Default",
			   hover = "1 Booster Shot, 4 Twigs, 1 Flint"},
			{data="hard",description="Hard",
			   hover = "1 Booster Shot, 5 Twigs, 3 Red Caps"},
		    {data="harder",description="Harder",
			   hover = "2 Booster Shots, 2 Logs, 2 Healing Salves"},
		},
		default="default"
	},
	
	{
		name = "ubersawdmg",
		label = "Übersaw's Base Damage",
		options =
		{
		    {description = "15", data = 15},
			{description = "20", data = 20},
			{description = "27.2", data = 27.2},
			{description = "34(Default)", data = 34},
			{description = "42.5", data = 42.5},
			{description = "50", data = 50},
			{description = "51", data = 51},
			{description = "55", data = 55},
			{description = "60", data = 60},
		},
		default = 34,
	},
	
	{
		name = "ubersawuses",
		label = "Übersaw Uses",
		options =
		{
		    {description = "30", data = 30},
			{description = "50", data = 50},
			{description = "75", data = 75},
			{description = "100", data = 100},
			{description = "150(Default)", data = 150},
			{description = "175", data = 175},
			{description = "200", data = 200},
			{description = "250", data = 250},
		},
		default = 150,
	},
	
	{
		name = "uberhealth",
		label = "Übersaw Health Granted",
		hover = "The health granted on attacking.",
		options =
		{
		    {description = "1", data = 1},
		    {description = "2", data = 2},
			{description = "5", data = 5},
			{description = "8", data = 8},
			{description = "10(Default)", data = 10},
			{description = "15", data = 15},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "27", data = 27},
			{description = "30", data = 30},
			{description = "35", data = 35},
			{description = "40", data = 40},
			{description = "50", data = 50},
		},
		default = 10,
	},
	
	{
		name="Amputator_Difficulty",
		label="Amputator Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easy",description="Easy",
			   hover = "2 Gold Nuggets, 4 Flint"},
			{data="default",description="Default",
			   hover = "2 Gold Nuggets, 5 Flint, 1 Healing Salve"},
			{data="hard",description="Hard",
			   hover = "3 Gold Nuggets, 5 Flint, 2 Healing Salves"},
		    {data="harder",description="Harder",
			   hover = "5 Gold Nuggets, 5 Flint, 3 Small Health Kits"},
		},
		default="default"
	},
	
	    {
		name = "ampudmg",
		label = "Amputator's Base Damage",
		options =
		{
			{description = "13.6", data = 13.6},
			{description = "17", data = 17},
			{description = "27.2(Default)", data = 27.2},
			{description = "30", data = 30},
			{description = "34", data = 34},
			{description = "39", data = 39},
			{description = "40", data = 40},
		},
		default = 27.2,
	},
	
	{
		name = "ampuuses",
		label = "Amputator Uses",
		hover = "When attacking.",
		options =
		{
			{description = "33", data = 33},
			{description = "50", data = 50},
			{description = "75", data = 75},
			{description = "100(Default)", data = 100},
			{description = "150", data = 150},
			{description = "175", data = 175},
			{description = "190", data = 190},
			{description = "200", data = 200},
		},
		default = 100,
	},
	
	{
		name = "ampuhealth",
		label = "Amputator Health Given",
		options =
		{
	    	{description = "5", data = 5},
			{description = "10", data = 10},
			{description = "15", data = 15},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "30(Default)", data = 30},
			{description = "35", data = 35},
			{description = "40", data = 40},
			{description = "45", data = 45},
			{description = "50", data = 50},
			{description = "60", data = 60},
			{description = "70", data = 70},
			{description = "80", data = 80},
			{description = "90", data = 90},
			{description = "95", data = 95},
			{description = "100", data = 100},
		},
		default = 30,
	},
	
	{
		name="Vitasaw_Difficulty",
		label="Vita-saw Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easy",description="Easy",
			   hover = "1 Log, 1 Stinger, 1 Twig"},
			{data="default",description="Default",
			  hover = "1 Log, 1 Stinger, 5 Twigs"},
			{data="hard",description="Hard",
			   hover = "1 Small Health Kit, 2 Stingers, 5 Twigs"},
		    {data="harder",description="Harder",
			   hover = "2 Logs, 1 Booster Shot, 5 Twigs"},
		},
		default="default"
	},
	
	{
		name = "vitasawhpgrant",
		label = "Vita-saw Max HP Penalty",
		hover = "The amount of max health removed when equipping the vita-saw.",
		options =
		{
			{description = "0", data = 0},
			{description = "3", data = 3},
			{description = "5", data = 5},
			{description = "9", data = 9},
			{description = "10(Default)", data = 10},
			{description = "11", data = 11},
			{description = "12", data = 12},
			{description = "13", data = 13},
			{description = "14", data = 14},
			{description = "15", data = 15},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "30", data = 30},
			{description = "35", data = 35},
			{description = "40", data = 40},
			{description = "45", data = 45},
			{description = "50", data = 50},
			{description = "55", data = 55},
			{description = "60", data = 60},
			{description = "65", data = 0},
			{description = "70", data = 70},
			{description = "75", data = 75},
			{description = "80", data = 80},
			{description = "85", data = 85},
			{description = "90", data = 90},
			{description = "95", data = 95},
			{description = "100", data = 100},
			{description = "105", data = 105},
			{description = "110", data = 110},
		},
		default = 10,
	},
	
	{
		name = "vitadmg",
		label = "Vita-saw's Base Damage",
		options =
		{
		    {description = "10", data = 10},
			{description = "15", data = 15},
			{description = "20", data = 20},
			{description = "27.2", data = 27.2},
			{description = "29(Default)", data = 29},
			{description = "30", data = 30},
			{description = "34", data = 34},
			{description = "40", data = 40},
			{description = "45", data = 45},
			{description = "50", data = 50},
		},
		default = 29,
	},
	
	{
		name = "vitauses",
		label = "Vita-saw Uses",
		options =
		{
			{description = "33", data = 33},
			{description = "50", data = 50},
			{description = "75", data = 75},
			{description = "100(Default)", data = 100},
			{description = "150", data = 150},
			{description = "175", data = 175},
			{description = "190", data = 190},
			{description = "200", data = 200},
		},
		default = 100,
	},
	
	{
		name = "healthdartmedichp",
		label = "Health Dart Health Given",
		options =
		{
			{description = "5", data = 5},
			{description = "10", data = 10},
			{description = "15", data = 15},
			{description = "20", data = 20},
	    	{description = "25", data = 25},
			{description = "30", data = 30},
			{description = "35", data = 35},
			{description = "40", data = 40},
			{description = "45", data = 45},
			{description = "50", data = 50},
			{description = "55", data = 55},
			{description = "60", data = 60},
			{description = "65", data = 65},
			{description = "70(Default)", data = 70},
			{description = "75", data = 75},
			{description = "80", data = 80},
			{description = "85", data = 85},
			{description = "90", data = 90},
			{description = "95", data = 95},
			{description = "100", data = 100},
			{description = "105", data = 105},
			{description = "110", data = 110},
			{description = "115", data = 115},
			{description = "120", data = 120},
			{description = "130", data = 130},
			{description = "140", data = 140},
			{description = "150", data = 150},
		},
		default = 70,
	},
	
	{
		name="Medicblowdart_Difficulty",
		label="Health Dart Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easy",description="Easy",
			   hover = "1 Cut Reed, 1 Spider Gland"},
			{data="default",description="Default",
			   hover = "2 Cut Reeds, 1 Spider Gland, 1 Robin Feather"},
			{data="hard",description="Hard",
			   hover = "2 Cut Reeds, 1 Small Health Kit, 1 Robin Feather"},
		    {data="harder",description="Harder",
			   hover = "3 Cut Reeds, 2 Small Health Kits, 2 Robin Feathers"},
		},
		default="default"
	},
	
	{
		name = "medkitrecipes",
		label = "Recipe Levels for Health Kits",
		options =
		{
			{description = "Very Easy", data = 1},
			{description = "Easier", data = 2},
			{description = "Default", data = 3},
			{description = "Medium", data = 4},
			{description = "Hard", data = 5},
			{description = "Harder", data = 6},
			{description = "Extreme", data = 7},
		},
		default = 3,
	},
	
	{
        name = "smedkithealth",
        label = "Small Health Kit Health",
		hover = "% of your max health received as health from a small health kit.",
        options = 
        {
		    {description = "3%", data = 0.03},
			{description = "5%", data = 0.05},
		    {description = "8%", data = 0.08},
            {description = "10%(Default)", data = 0.1},
		    {description = "15%", data = 0.15},
            {description = "20%", data = 0.2},
			{description = "25%", data = 0.25},
        }, 
        default = 0.1,
    },	
	
	{
        name = "medmedkithealth",
        label = "Medium Health Kit Health",
		hover = "% of your max health received as health from a medium health kit.",
        options = 
        {
		    {description = "30%", data = 0.3},
			{description = "33%", data = 0.33},
		    {description = "35%", data = 0.35},
		    {description = "40%", data = 0.4},
            {description = "50%(Default)", data = 0.5},
            {description = "55%", data = 0.66},
			{description = "60%", data = 0.6},
			{description = "65%", data = 0.65},
			{description = "70%", data = 0.7},
        }, 
        default = 0.5,
    },	
	
	{
        name = "lmedkithealth",
        label = "Large Health Kit Health",
		hover = "% of your max health received as health from a large health kit.",
        options = 
        {
		    {description = "65%", data = 0.65},
		    {description = "70%", data = 0.7},
			{description = "75%", data = 0.75},
		    {description = "80%", data = 0.8},
			{description = "85%", data = 0.85},
            {description = "90%(Default)", data = 0.9},
            {description = "95%", data = 0.95},
			{description = "99%", data = 0.99},
			{description = "100%", data = 1.0},
			{description = "105%", data = 1.05},
			{description = "110%", data = 1.1},
			{description = "115%", data = 1.15},
			{description = "120%", data = 1.2},
		    {description = "130%", data = 1.3},	
			{description = "140%", data = 1.4},
			{description = "150%", data = 1.5},
        }, 
        default = 0.9,
    },	
	
}	