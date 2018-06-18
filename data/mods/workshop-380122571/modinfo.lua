-- This information tells other players more about the mod
name = "(DST) Death"
description = "\This mod give you one additional character, one weapon and a few options for adjusting your journey. Inspired by character from Pratchett's book series - \"Discworld\"."
author = "Mikaiya"
version = "2.1.5"

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
forumthread = ""

api_version = 10

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
all_clients_require_mod = true
clients_only_mod = false

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options =
{
{name = "ScytheRecipeCost",
      label = "Scythe recipe",
       options =
		{
		{description = "Llama", data = "llama", hover = "very easy recipe, for real llamas"},
        {description = "Easy", data = "easy", hover = "good for beginners"},
        {description = "Normal", data = "normal", hover = "Standard recipe"},
		{description = "Hard", data = "hard", hover = "a bit harder than normal"}
    },
		default = "normal",
},

 {name = "appearance",
		label = "Reaper's appearance",
		options =
		{
            {description = "New", data = "new"},
            {description = "Old", data = "old"}
      },
	  default = "new"
	},
	
	{name = "lightAura",
		label = "Light aura",
		hover = "Aura prevents character to die in dark",
		options =
		{
            {description = "yes", data = "yes"},
            {description = "no", data = "no"}
      },
	  default = "yes"
	},

	{name = "HPamount",
		label = "Amount of HP",
		options =
		{
			{description = "95", data = "95"},
			{description = "115", data = "115"},
            {description = "130", data = "130"}
      },
	  default = "115"
	},
	
	{name = "sanityAmount",
		label = "Amount of sanity",
		options =
		{
			{description = "90", data = "90"},
			{description = "120", data = "120"},
			{description = "150", data = "150"},
            {description = "200", data = "200"}
      },
	  default = "120"  --
	},
	
	{name = "Insomniac",
		label = "Insomniac",
		hover = "You can't sleep",
		options =
		{
            {description = "yes", data = "yes"},
            {description = "no", data = "no"}
      },
	  default = "yes"
	},
	
		{name = "MonsterMeat",
		label = "Can eat monster meat?",
		hover = "",
		options =
		{
            {description = "yes", data = "yes"},
            {description = "no", data = "no"}
      },
	  default = "yes"
	},
	
		{name = "ScytheDamage",
		label = "Scythe damage",
		options =
		{
			{description = "42", data = "42"},
			{description = "57", data = "57"},
			{description = "64", data = "64"}
      },
	  default = "57"
	},
	
		{name = "SpeedBoost",
		label = "Movement speed",
		hover = "",
		options =
		{
            {description = "normal", hover = "deafult Wilson's speed \n \n choose if you don't like \n fast characters", data = "normal"},
            {description = "x 1.3", hover = "normal Death's speed", data = "1.3"}
		},
	   default = "1.3"
	  },
	
	}