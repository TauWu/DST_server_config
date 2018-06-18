--local is_rus=GAMELANGUAGE=="RU"
version = "2.03"
name = "Aquarium"
description = GAMELANGUAGE=="RU" and "Лучший друг в аквариуме." or "Best friend in the aquarium."
author = GAMELANGUAGE=="RU" and "Star, дизайн-BeetleDan" or "Star, design-BeetleDan"

forumthread = ""

dont_starve_compatible = false
reign_of_giants_compatible = true
dst_compatible = true

all_clients_require_mod=true
client_only_mod=false

server_filter_tags = {"aquarium"}

icon_atlas = "aqvarium.xml"
icon = "aqvarium.tex"

api_version = 10
priority = -0.5 --russian support
NO_NEED_TRANSLATE_RUS = true --don't allow inject
russian_icon = true --russian flag in list of mods

configuration_options =
{
    {
        name = "san",
        label = GAMELANGUAGE=="RU" and "Бонус бутербродов" or "Bonus of sandwiches",
        options = 
        {
            {description = GAMELANGUAGE=="RU" and "+5 рассудка" or "+5 Sanity", data = 5},
            {description = GAMELANGUAGE=="RU" and "+10 рассудка" or "+10 Sanity", data = 10},
            {description = GAMELANGUAGE=="RU" and "+15 рассудка" or "+15 Sanity", data = 15},
        }, 
        default = 10,
    },
}


