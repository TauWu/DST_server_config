--The name of the mod displayed in the 'mods' screen.
name = "Major Stack size"
--A description of the mod.
description = "Increases the max size of item stacks up to 1000."
author = "Avery"

 
version = "1.2"

api_version = 10

-- Compatible with both the base game, reign of giants, and dst
dont_starve_compatible = true
reign_of_giants_compatible = true
dst_compatible = true

forumthread = ""

--These let clients know if they need to get the mod from the Steam Workshop to join the game
all_clients_require_mod = true
clients_only_mod = false

--This lets people search for servers with this mod by these tags
server_filter_tags = {"utility"}

-- ModConfiguration option
configuration_options =
{
	{
		name = "MAXSTACKSIZE",
		label = "Max stacksize",
		options =	{
						{description = "20", data = 20},
						{description = "100", data = 99},
						{description = "250", data = 250},
						{description = "500", data = 500},
						{description = "1000", data = 1000},
					},

		default = 99,
	},
}

prioriry = 0.00374550642