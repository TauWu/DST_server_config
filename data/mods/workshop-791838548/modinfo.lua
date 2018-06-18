name = "The Engineer"
description = "Cream Gravy!"
author = "CheeseNuggets101 & Jack"
version = "2.3"

forumthread = "topic/72813-cheesenuggets-cheesy-fan-art-thread/"

api_version = 10

dont_starve_compatible = false --Not compatible with Singleplayer

reign_of_giants_compatible = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

all_clients_require_mod = true

client_only_mod = false

dst_compatible = true

server_filter_tags = {"engineertf2", "characters", "engineer", "tf2", "team fortress 2"}

menu_assets = {
    characters = {
        engineer = { gender = "MALE", skins = { "blu", "formal", "survivor", "shadow" } }
    },
    skins = {
	    engineer_blu = { name = "BLU", desc = "Take a look from the other side of the war.", atlas = "images/skinicons/engineer_blu.xml", image = "engineer_blu.tex" },
		engineer_formal = { name = "Guest of Honor", desc = "Engineer loves a good excuse to kick out the tooth-kickers.", atlas = "images/skinicons/engineer_formal.xml", image = "engineer_formal.tex" },
	    engineer_survivor = { name = "The Survivor", desc = "Dispensers don't dispense fresh clothes.", atlas = "images/skinicons/engineer_survivor.xml", image = "engineer_survivor.tex" },
	    engineer_shadow = { name = "The Triumphant", desc = "Engineer's contraptions are just as deadly as his looks.", atlas = "images/skinicons/engineer_shadow.xml", image = "engineer_shadow.tex" }
    }
}

configuration_options =
{

	{
		name="Sentry_Difficulty",
		label="Sentry Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easy",description="Easy"},
			{data="default",description="Default"},
			{data="hard",description="Hard"},
		    {data="harder",description="Harder"},
		},
		default="default"
	},
	
	{
		name="Dispenser_Difficulty",
		label="Dispenser Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easy",description="Easy"},
			{data="default",description="Default"},
			{data="hard",description="Hard"},
			{data="harder",description="Harder"},
		},
		default="default"
	},
	
	{
		name="Teleporter_Difficulty",
		label="Teleporter Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
		    {data="easy",description="Easy"},
			{data="default",description="Default"},
			{data="hard",description="Hard"},
			{data="harder",description="Harder"},
		},
		default="default"
	},
	
	{
		name="Sentry_Range",
		label="Sentry Range",
		hover = "The range of a sentry",
		options = {
		    {data=1,description="1"},
		    {data=2,description="2"},
			{data=3,description="3"},
			{data=4,description="4"},
		    {data=5,description="5"},
			{data=6,description="6"},
		    {data=7,description="7"},
			{data=8,description="8"},
			{data=9,description="9"},
			{data=10,description="10"},
			{data=11,description="11"},
		    {data=12,description="12"},
			{data=13,description="13(Default)"},
			{data=14,description="14"},
			{data=15,description="15"},
			{data=16,description="16"},
			{data=17,description="17"},
			{data=18,description="18"},
			{data=19,description="19"},
			{data=20,description="20"},
			{data=21,description="21"},
			{data=22,description="22"},
			{data=23,description="23"},
			{data=24,description="25"},
			{data=25,description="25"},
			{data=26,description="26"},
			{data=27,description="27"},
			{data=28,description="28"},
			{data=29,description="29"},
			{data=30,description="30"},
			{data=50,description="50"},
		},
		default=13,
	},
	
	{
		name="Sentry_Damage",
		label="Sentry Damage",
		hover = "The damage output for the sentry.",
		options = {
		    {data=1,description="1"}, 
		    {data=1.5,description="1.5"},
		    {data=2,description="2"},
		    {data=3,description="3"},
		    {data=3.5,description="3.5"},
		    {data=4,description="4"},
			{data=5,description="5"},
			{data=6,description="6"},
			{data=7,description="7"},
			{data=7.5,description="7.5"},
			{data=8,description="8"},
			{data=9,description="9"},
			{data=9.5,description="9.5(Default)"},
			{data=9.7,description="9.7"},
			{data=10,description="10"},
			{data=10.5,description="10.5"},
			{data=15,description="15"},
			{data=15.5,description="15.5"},
			{data=16,description="16"},
			{data=17,description="17"},
			{data=20,description="20"},
			{data=25,description="25"},
			{data=27.2,description="27.2"},
			{data=30,description="30"},
			{data=34,description="34"},
			{data=35,description="35"},
			{data=40,description="40"},
			{data=40.5,description="40.5"},
			{data=45,description="45"},
			{data=50,description="50"},
			{data=50.5,description="50.5"},
			{data=60,description="60"},
			{data=65,description="65"},
			{data=70,description="70"},
			{data=75,description="75"},
			{data=80,description="80"},
			{data=85,description="85"},
			{data=90,description="90"},
			{data=95,description="95"},
			{data=100,description="100"},
			{data=105,description="105"},
			{data=110,description="110"},
			{data=115,description="115"},
			{data=120,description="120"},
			{data=125,description="125"},
			{data=150,description="150"},
			{data=200,description="200"},
			{data=250,description="250"},
			{data=300,description="300"},
		},
		default=9.5,
	},
	
	{
		name="Sentry_ROF",
		label="Sentry Rate of Fire",
		hover = "The rate at which the sentry fires in seconds",
		options = {
			{data=0,description="Instant(0)"},
			{data=1,description="Default(1)"},
			{data=2,description="Medium(2)"},
			{data=3,description="Slow(3)"},
			{data=4,description="Slower(4)"},
			{data=5,description="Slowest(5)"},
		},
		default=1,
	},
	
	{
		name="Sentry_Health",
		label="Sentry Health",
		hover = "The amount of health a sentry has. Multiplies with each level and regens.",
		options = {
		    {data=10,description="10"},
		    {data=15,description="15"},
		    {data=20,description="20"},
		    {data=50,description="50"},
		    {data=100,description="100"},
		    {data=110,description="110"},
		    {data=120,description="120"},
			{data=130,description="130"},
			{data=140,description="140"},
			{data=150,description="150(TF2)"},
			{data=170,description="170"},
			{data=180,description="180"},
			{data=190,description="190"},
			{data=200,description="200(Default)"},
			{data=210,description="210"},
			{data=225,description="225"},
			{data=230,description="230"},
			{data=250,description="250"},
			{data=260,description="260"},
			{data=285,description="285"},
			{data=300,description="300"},
			{data=330,description="330"},
			{data=350,description="350"},
			{data=400,description="400"},
			{data=450,description="450"},
			{data=500,description="500"},
			{data=550,description="550"},
			{data=600,description="600"},
			{data=700,description="700"},
			{data=800,description="800"},
			{data=900,description="900"},
			{data=1000,description="1000"},
		},
		default=200,
	},
	
	{
        name = "sentryh_regen",
        label = "Sentry Health Regen?",
		hover = "Have the Sentry have a health regen?",
        options = 
        {
            {description = "Yes", data = "y"},
            {description = "No(Default)", data = "n"},
        }, 
        default = "n",
    },
	
	{
        name = "rocketsplashdmg",
        label = "Sentry Rocket Splash Damage?",
		hover = "Disable or Enable the Sentry's rockets causing splash damage.",
        options = 
        {
            {description = "Yes(Default)", data = "y"},
            {description = "No", data = "n"},
        }, 
        default = "y",
    },
	
	{
		name="disprange",
		label="Dispenser Range",
		hover = "Range the dispenser needs to be in with the player to heal them",
		options = {
		    {data=1,description="1"}, 
			{data=1.2,description="1.2"},
		    {data=1.5,description="1.5"},
			{data=1.8,description="1.8"},
		    {data=2,description="2(Default)"},
			{data=2.2,description="2.2"},
			{data=2.5,description="2.5"},
			{data=2.7,description="2.7"},
			{data=2.9,description="2.9"},
		    {data=3,description="3"},
			{data=3.2,description="3.2"},
			{data=3.5,description="3.5"},
			{data=3.7,description="3.7"},
			{data=4,description="4"},
			{data=4.2,description="4.2"},
			{data=4.5,description="4.5"},
			{data=4.7,description="4.7"},
			{data=5,description="5"},
		},
		default=2,
	},
	
	{
		name="dispenserhealingrate",
		label="Dispenser Healing Rate",
		hover = "How long a Dispenser takes to heal. Lvl1 heals 1hp every 3 seconds, lvl2 2 seconds, lvl3 1 second on default. The higher, the slower.",
		options = {
		    {data=1,description="1"}, --OP
		    {data=2,description="2"},
		    {data=3,description="3(Default)"},
			{data=4,description="4"},
			{data=5,description="5"},
			{data=5,description="5"},
			{data=6,description="6"},
			{data=7,description="7"},
			{data=8,description="8"},
			{data=9,description="9"},
			{data=10,description="10"},
			{data=11,description="11"},
			{data=12,description="12"},
			{data=13,description="13"},
			{data=14,description="14"},
			{data=15,description="15"},
			{data=16,description="16"},
			{data=17,description="17"},
			{data=18,description="18"},
			{data=19,description="19"},
			{data=20,description="20"},
			{data=30,description="30"},
			{data=40,description="40"},
			{data=50,description="50"},
		},
		default=3,
	},

	{
		name = "tf2wrenchdmg",
		label = "Wrench Base Damage",
		options =
		{
		    {description = "4.25", data = 4.25},
			{description = "8", data = 8},
			{description = "10", data = 10},
			{description = "13.6", data = 13.6},
			{description = "15", data = 15},
			{description = "17(Default)", data = 17},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "27.2", data = 27.2},
			{description = "29", data = 29},
			{description = "30", data = 30},
			{description = "30.6", data = 30.6},
			{description = "34", data = 34},
			{description = "37", data = 37},
			{description = "40", data = 40},
			{description = "42.5", data = 42.5},
		},
		default = 17,
	},
	
	{
		name = "tf2wrenchuses",
		label = "Wrench Uses",
		options =
		{
		    {description = "10", data = 10},
		    {description = "15", data = 15},
			{description = "50", data = 50},
			{description = "75", data = 75},
			{description = "100", data = 100},
			{description = "150(Default)", data = 150},
			{description = "175", data = 175},
			{description = "200", data = 200},
			{description = "250", data = 250},
			{description = "260", data = 260},
			{description = "270", data = 270},
			{description = "300", data = 300},
			{description = "375", data = 375},
			{description = "400", data = 400},
			{description = "500", data = 500},
		},
		default = 150,
	},
	
	{
		name="tf2Wrench_Difficulty",
		label="Wrench Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easier",description="Easier"},
			{data="default",description="Default"},
			{data="harder",description="Harder"},
		},
		default="default"
	},
	
	{
		name="Scrap_Difficulty",
		label="Scrap Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easier",description="Easiest"},
			{data="easy",description="Easier"},
			{data="default",description="Default"},
			{data="hard",description="Hard"},
			{data="harder",description="Harder"},
		},
		default="default"
	},
	
	{
		name = "hardhatabsorb",
		label = "Hard Hat Damage Absorption",
		options =
		{
			{description = "5%", data = .05},
			{description = "10%", data = .1},
			{description = "15%", data = .15},
			{description = "20%", data = .2},
			{description = "30%", data = .3},
			{description = "40%", data = .4},
			{description = "50%", data = .5},
			{description = "55%", data = .55},
			{description = "60%", data = .6},
			{description = "65%", data = .65},
			{description = "70%(Default)", data = .7},
			{description = "75%", data = .75},
			{description = "80%", data = .8},
			{description = "85%", data = .85},
			{description = "90%", data = .9},
			{description = "95%", data = .95},
		},
		default = .7,
	},
	
	{
		name = "ehardhatdura",
		label = "Hard Hat Durability",
		options =
		{
		    {description = "100", data = 100},
			{description = "110", data = 110},
		    {description = "120", data = 120},
		    {description = "125", data = 125},
		    {description = "130", data = 130},
		    {description = "140", data = 140},
		    {description = "150", data = 150},
		    {description = "160", data = 160},
		    {description = "170", data = 170},
		    {description = "180", data = 180},
		    {description = "190", data = 190},
		    {description = "200", data = 200},
		    {description = "210", data = 210},
		    {description = "220", data = 220},
		    {description = "230", data = 230},
		    {description = "240", data = 240},
		    {description = "250", data = 250},
			{description = "255", data = 255},
			{description = "260", data = 260},
			{description = "265", data = 265},
			{description = "270", data = 270},
			{description = "275", data = 275},
			{description = "280", data = 280},
			{description = "285", data = 285},
			{description = "290", data = 290},
			{description = "295(Default)", data = 295},
			{description = "300", data = 300},
			{description = "305", data = 305},
			{description = "310", data = 310},
			{description = "315", data = 315},
			{description = "320", data = 320},
			{description = "325", data = 325},
			{description = "330", data = 330},
			{description = "340", data = 340},
			{description = "350", data = 350},
			{description = "360", data = 360},
			{description = "370", data = 370},
			{description = "380", data = 380},
			{description = "390", data = 390},
			{description = "395", data = 395},
			{description = "400", data = 400},
			{description = "410", data = 410},
			{description = "420", data = 420},
			{description = "425", data = 425},
			{description = "430", data = 430},
			{description = "440", data = 440},
			{description = "450", data = 450},
			{description = "460", data = 460},
			{description = "470", data = 470},
			{description = "480", data = 480},
			{description = "490", data = 490},
			{description = "500", data = 500},
			{description = "525", data = 525},
			{description = "530", data = 530},
			{description = "600", data = 600},
		},
		default = 295,
	},
	
		{
		name="EHat_Difficulty",
		label="Hard Hat Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easy",description="Easier"},
			{data="default",description="Default"},
			{data="hard",description="Hard"},
			{data="harder",description="Harder"},
		},
		default="default"
	},
	
	{
		name="engiedmgdebuff",
		label="Engineer's Damage Debuff",
		hover = "How much Base Damage an Engineer does less compared to a basic Wilson.",
		options = {
		    {data=0.60,description="40% Less"}, 
			{data=0.65,description="35% Less"},
		    {data=0.70,description="30% Less"},
			{data=0.75,description="25% Less"},
		    {data=0.80,description="20% Less"},
			{data=0.85,description="15% Less"},
			{data=0.90,description="10% Less"},
			{data=0.95,description="5% Less"},
			{data=1,description="No Debuff"},
		},
		default=0.80,
	},

}