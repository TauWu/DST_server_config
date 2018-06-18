name = "The Spy"
description = "This Spy has already breached our defenses..."
author = "CheeseNuggets101"
version = "3.6"

forumthread = "topic/72813-cheesenuggets-cheesy-fan-art-thread/"

api_version = 10

dont_starve_compatible = true

reign_of_giants_compatible = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

all_clients_require_mod = true

client_only_mod = false

dst_compatible = true

server_filter_tags = {"spytf2", "characters", "spy", "tf2", "teamfortress2"}

menu_assets = {
    characters = {
        spy = { gender = "MALE", skins = { "blu", "rose" } } 
    },
    skins = {
	    spy_blu = { name = "BLU", desc = "Take a look from the other side of the war.", atlas = "images/skinicons/spy_blu.xml", image = "spy_blu.tex" },
	    spy_rose = { name = "The Roseate", desc = "Suits as sharp as knives. Knives as sharp as laurels.", atlas = "images/skinicons/spy_rose.xml", image = "spy_rose.tex" }
    }
}

configuration_options =
{
		{
		name = "bknifedmg",
		label = "Butterfly Knife Base Dmg",
		options =
		{
		    {description = "5", data = 5},
			{description = "10", data = 10},
			{description = "17", data = 17},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "27.2(Default)", data = 27.2},
			{description = "29", data = 29},
			{description = "30", data = 30},
			{description = "30.6", data = 30.6},
			{description = "35", data = 35},
            {description = "40", data = 40},
			{description = "45", data = 45},
			{description = "50", data = 50},
			{description = "55", data = 55},
			{description = "60", data = 60},
			{description = "65", data = 65},
			{description = "70", data = 70},
			{description = "75", data = 75},
			{description = "80", data = 80},
			{description = "85", data = 85},
			{description = "90", data = 90},
			{description = "95", data = 95},
			{description = "100", data = 100},
		},
		default = 27.2,
	},

		{
		name = "bknifeuses",
		label = "Butterfly Knife Uses",
		options =
		{
			{description = "33", data = 33},
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
		name = "goldenknifedmg",
		label = "Austrailium Knife Base Dmg",
		options =
		{
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "27.2", data = 27.2},
			{description = "30.6(Default)", data = 30.6},
			{description = "35", data = 35},
			{description = "40", data = 40},
			{description = "40.5", data = 40.5},
			{description = "45", data = 45},
			{description = "50", data = 50},
			{description = "55", data = 55},
			{description = "60", data = 60},
			{description = "65", data = 65},
			{description = "70", data = 70},
			{description = "75", data = 75},
			{description = "80", data = 80},
			{description = "85", data = 85},
			{description = "90", data = 90},
			{description = "95", data = 95},
			{description = "100", data = 100},
		},
		default = 30.6,
	},
	
		{
		name = "goldenknifeuses",
		label = "Austrailium Knife Uses",
		options =
		{
			{description = "75", data = 75},
			{description = "100", data = 100},
			{description = "150", data = 150},
			{description = "200(Default)", data = 200},
			{description = "250", data = 250},
			{description = "275", data = 275},
			{description = "300", data = 300},
		},
		default = 200,
	},
	
			{
		name = "kunaidmg",
		label = "Kunai Base Dmg",
		options =
		{
			{description = "17", data = 17},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "27.2(Default)", data = 27.2},
			{description = "29", data = 29},
			{description = "30", data = 30},
			{description = "30.6", data = 30.6},
			{description = "35", data = 35},
			{description = "40", data = 40},
			{description = "47.5", data = 47.5},
			{description = "50", data = 50},
			{description = "55", data = 55},
			{description = "60", data = 60},
			{description = "65", data = 65},
			{description = "70", data = 70},
			{description = "75", data = 75},
			{description = "80", data = 80},
			{description = "85", data = 85},
			{description = "90", data = 90},
			{description = "95", data = 95},
			{description = "100", data = 100},
		},
		default = 27.2,
	},

		{
		name = "kunaiuses",
		label = "Kunai Uses",
		options =
		{
			{description = "33", data = 33},
			{description = "70", data = 70},
			{description = "75", data = 75},
			{description = "100(Default)", data = 100},
			{description = "150", data = 150},
			{description = "175", data = 175},
			{description = "200", data = 200},
			{description = "250", data = 250},
		},
		default = 100,
	},

	
				{
		name = "scicledmg",
		label = "Spy-cicle Base Dmg",
		options =
		{
		    {description = "7", data = 7},
			{description = "10", data = 10},
			{description = "13.6", data = 13.6},
			{description = "15", data = 15},
			{description = "17(Default)", data = 17},
			{description = "20", data = 20},
			{description = "27.2", data = 27.2},
			{description = "29.92", data = 29.92},
			{description = "34", data = 34},
			{description = "35", data = 35},
            {description = "40", data = 40},
			{description = "45", data = 45},
			{description = "50", data = 50},
			{description = "55", data = 55},
			{description = "60", data = 60},
			{description = "65", data = 65},
			{description = "70", data = 70},
			{description = "75", data = 75},
			{description = "80", data = 80},
			{description = "85", data = 85},
			{description = "90", data = 90},
			{description = "95", data = 95},
			{description = "100", data = 100},
		},
		default = 17,
	},

		{
		name = "scicleuses",
		label = "Spy-cicle Uses",
		hover = "Not the melting rate.",
		options =
		{
		    {description = "15", data = 15},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "33", data = 33},
			{description = "70(Default)", data = 70},
			{description = "75", data = 75},
			{description = "100", data = 100},
			{description = "175", data = 175},
			{description = "190", data = 190},
			{description = "200", data = 200},
		},
		default = 70,
	},
	
			{
		name = "spybackstab",
		label = "Backstab Damage Multiplied",
		hover = "The amount a backstab multiplies a knives' base damage.",
		options =
		{
		    {description = "None", data = 1},
		    {description = "2", data = 2},
		    {description = "3", data = 3},
		    {description = "4", data = 4},
		    {description = "5(Default)", data = 5},
			{description = "6", data = 6},
			{description = "7", data = 7},
			{description = "8", data = 8},
			{description = "9", data = 9},
			{description = "10", data = 10},
			{description = "11", data = 12},
			{description = "13", data = 13},
			{description = "14", data = 14},
			{description = "15", data = 15},
			{description = "16", data = 16},
			{description = "17", data = 17},
			{description = "18", data = 18},
			{description = "19", data = 19},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "29", data = 29},
			{description = "30", data = 30},
			{description = "35", data = 35},
            {description = "40", data = 40},
			{description = "45", data = 45},
			{description = "50", data = 50},
			{description = "55", data = 55},
			{description = "60", data = 60},
			{description = "65", data = 65},
			{description = "70", data = 70},
			{description = "75", data = 75},
			{description = "80", data = 80},
			{description = "85", data = 85},
			{description = "90", data = 90},
			{description = "95", data = 95},
			{description = "100", data = 100}, --As OP as you'd expect 
		},
		default = 5,
	},
	
	{
        name = "boxtrotcrafting",
        label = "BoxHat Craftable for Everyone?",
		hover = "Disable or Enable the ability to have the 'Box Trot' craftable by everyone.",
        options = 
        {
            {description = "Yes", data = "y"},
            {description = "No", data = "n"},
        }, 
        default = "y",
    },	
}