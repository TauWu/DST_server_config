name = "Repair Combine"
description = "With this mod you can repair your equipment with the same equipment.\n\nSo you can combine a logsuit with 10% and a logsuit with 30% to a logsuit with 40%!"
author = "Serpens66"
version = "1.04"
forumthread = ""
api_version = 10
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
dst_compatible = true
icon_atlas = "modicon.xml"
icon = "modicon.tex"
all_clients_require_mod = true
client_only_mod = false
server_filter_tags = {"combinate","repair","combine"}


configuration_options =
{
    {
        name = "bonus",
        label = "Bonus Durability",
		hover = "Getting some more durability",
        options = {
            {description = "+0%", data = 0, hover="Default"},
            {description = "+0-5%", data = 0.05, hover="Randomly between 0 and 5%"},
            {description = "+0-10%", data = 0.1, hover="Randomly between 0 and 10%"},
            {description = "+1%", data = 1, hover="\n"},
            {description = "+2%", data = 2, hover="\n"},
            {description = "+3%", data = 3, hover="\n"},
            {description = "+4%", data = 4, hover="\n"},
            {description = "+5%", data = 5, hover="\n"},
            {description = "+6%", data = 6, hover="\n"},
            {description = "+7%", data = 7, hover="\n"},
            {description = "+8%", data = 8, hover="\n"},
            {description = "+9%", data = 9, hover="\n"},
            {description = "+10%", data = 10, hover="\n"},
        },
        default = 0, 
    },
    {
        name = "maxweapon",
        label = "Max Weapons(NoClient!)",
		hover = "Does not work for clients, so only use if\nyou are playing alone and without caves!\nCombinating weapons can lead to max uses of:",   -- does not work for clients, dont know why
        options = {
            {description = "100%", data = 1},
            {description = "200%", data = 2},
            {description = "300%", data = 3},
            {description = "400%", data = 4},
            {description = "500%", data = 5},
            {description = "600%", data = 6},
            {description = "700%", data = 7},
            {description = "800%", data = 8},
            {description = "900%", data = 9},
            {description = "1000%", data = 10},
        },
        default = 1, 
    },
}