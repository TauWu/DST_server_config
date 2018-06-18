-- This information tells other players more about the mod
name = "Ancient Altar"
description = "Creates the crafting recipe for an ancient pseudoscience station and thulecite fragments."
author = "Ian_Link"
version = "0.5"

forumthread = ""

api_version = 10
icon_atlas = "modicon.xml"
icon = "modicon.tex"
dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
all_clients_require_mod = true

priority = 0.00398115041

--These tags allow the server running this mod to be found with filters from the server listing screen
server_filter_tags = {"craft", "altar","ancient","pseudoscience","machine"}

configuration_options =
{
	{
		name = "AncientStation",
		label = "Ancient Station",
		hover = "Select if the Ancient is craftable.",
		options =
	{
		{description = "Disabled", data = "disabled"},
		{description = "Easy", data = "easy"},
		{description = "Normal", data = "normal"},
		{description = "Hard", data = "hard"},
	},
		default = "normal",
	},
	{
		name = "ThuleciteFragments",
		label = "Thulecite Fragments",
		hover = "Select if the Thulecite Fragments is craftable.",
		options =
	{
		{description = "Disabled", data = "disabled"},
		{description = "Easy", data = "easy"},
		{description = "Normal", data = "normal"},
		{description = "Hard", data = "hard"},
	},
		default = "normal",
	},
}