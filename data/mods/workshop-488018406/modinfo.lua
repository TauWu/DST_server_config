-- This information tells other players more about the mod
name = "Break The Ice"
description = "Allows ice over ponds to be broken with a pickaxe."
author = "iNarek94, nailertn"
version = "1.0.3"

forumthread = ""

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

icon_atlas = "preview.xml"
icon = "preview.tex"

--Compatible with both the base game and Reign of Giants
--Let the mod system know that this mod is functional with Don't Starve Together
dont_starve_compatible = true
reign_of_giants_compatible = true
dst_compatible = true

all_clients_require_mod = false

--This let's the game know that this mod doesn't need to be listed in the server's mod listing
client_only_mod = false

--These tags allow the server running this mod to be found with filters from the server listing screen
server_filter_tags = {"bee_nice"}