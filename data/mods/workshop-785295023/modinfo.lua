name = "Super Wall DST"
version = "1.16"
description = "Version: DST "..version..[[

Invincible walls, auto doors, fence and fence gate are added to the game. A fast build tool is also added.
After built, the wall is in its tallest condition. Players can use hammer to shorten it.
They will not be damaged or ignited, and are immune to boss attack. Nothing but hammer can destroy them!
Walls can deal rebound damage to attacker.
Doors will open when any player approaches. You can change the ownership option, if you want to make it private.
Limestone wall and door are also added to the game.
加入了无敌的超级墙、自动门、栅栏、大门以及一个快速建造工具。
刚造好墙高度为最高，可以用锤子一节一节砸矮。
不会掉血、着火，免疫boss攻击。只有锤子能破坏！
墙可以反弹伤害给攻击者。
自动门在玩家靠近时自动打开。如果不想让别人用，可以设置使用权。
加入了海难中的石灰石墙。
]]
author = "DYC"

forumthread = "http://steamcommunity.com/sharedfiles/filedetails/?id=785295023"
api_version = 10


dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false

dst_compatible = true
all_clients_require_mod = true
client_only_mod = false
server_only_mod = true

server_filter_tags = {"Super Wall DST "..version}

icon_atlas = "preview.xml"
icon = "preview.tex"

configuration_options =
{
	{
		name = "dist",
		label = "Door Detection Distance",  
		hover = "",
		options =	{
						{description = "2", data = 2, hover = ""},
						{description = "2.5", data = 2.5, hover = ""},
						{description = "3", data = 3, hover = ""},
						{description = "4", data = 4, hover = ""},
						{description = "5", data = 5, hover = ""},
						{description = "6", data = 6, hover = ""},
						{description = "7", data = 7, hover = ""},
						{description = "8", data = 8, hover = ""},
						{description = "9", data = 9, hover = ""},
						{description = "10", data = 10, hover = ""},
						{description = "15", data = 15, hover = ""},
						{description = "20", data = 20, hover = ""},
					},
		default = 2.5,
	},
	
	{
		name = "rebounddmg",
		label = "Rebound Damage",  
		hover = "How much damage should the wall deal to the attacker when attacked?",  
		options =	{
						{description = "0", data = 0, hover = " "},
						{description = "1", data = 1, hover = " "},
						{description = "5", data = 5, hover = " "},
						{description = "10", data = 10, hover = " "},
						{description = "20", data = 20, hover = " "},
						{description = "50", data = 50, hover = " "},
						{description = "100", data = 100, hover = " "},
						{description = "200", data = 200, hover = "..."},
						{description = "500", data = 500, hover = "WTF?!.."},
					},
		default = 0,
	},
	
	{
		name = "bossres",
		label = "'Building Damage' Resistance", 
		hover = "",
		options =	{
						{description = "Immune", data = true, hover = "It will not be destroyed by boss, meteor or explosion"},  
						{description = "Destroyable", data = false, hover = "It can be destroyed by boss, meteor or explosion"},  
					},
		default = true,
	},
	
	{
		name = "companion",
		label = "Open For Chester", 
		hover = "Should the doors open for chesters, hutches and critters?", 
		options =	{
						{description = "Yes", data = true, hover = ""},
						{description = "No", data = false, hover = ""},
					},
		default = true,
	},
	
	{
		name = "ownership",
		label = "Ownership", 
		hover = "Who can use the doors? Who can hammer the walls and doors?", 
		options =	{
						{description = "Public", data = 0, hover = "Everyone can use or hammer them"},
						{description = "Authorized People", data = 1, hover = "Only builder and authorized people can use and hammer"},
					},
		default = 0,
	},
	
	{
		name = "minimapicon",
		label = "Minimap Icon",
		hover = "",
		options =	{
						{description = "On", data = true, hover = ""},
						{description = "Off", data = false, hover = ""},
					},
		default = false,
	},
	
	{
		name = "recipe",
		label = "Recipe Difficulty", 
		hover = "",
		options =	{
						{description = "Normal", data = "normal", hover = " "},
						{description = "Hard", data = "hard", hover = "wall = normal materials + 4 * electrical doodads   ,   door = normal materials + 4 * electrical doodads + 2 * gears"},  
					},
		default = "normal",
	},
	
	{
		name = "recipe_vanilla",
		label = "Recipe:Vanilla",
		hover = "Should the recipe of original walls, fence and fence gate be enabled?",
		options =	{
						{description = "Enabled", data = true, hover = ""},
						{description = "Disabled", data = false, hover = ""},
					},
		default = false,
	},
	
	{
		name = "recipe_wall",
		label = "Recipe:Walls",
		hover = "",
		options =	{
						{description = "Enabled", data = true, hover = ""},
						{description = "Disabled", data = false, hover = ""},
					},
		default = true,
	},
	
	{
		name = "recipe_door",
		label = "Recipe:Doors",
		hover = "",
		options =	{
						{description = "Enabled", data = true, hover = ""},
						{description = "Disabled", data = false, hover = ""},
					},
		default = true,
	},
	
	{
		name = "recipe_fence",
		label = "Recipe:Fence",
		hover = "Fence and fence gate",
		options =	{
						{description = "Enabled", data = true, hover = ""},
						{description = "Disabled", data = false, hover = ""},
					},
		default = true,
	},
	
	{
		name = "recipe_tool",
		label = "Recipe:Tool",
		hover = "Enable fast build tool?",
		options =	{
						{description = "Enabled", data = true, hover = ""},
						{description = "Disabled", data = false, hover = ""},
					},
		default = true,
	},
	
	{
		name = "language",
		label = "Language",
		hover = "",
		options =	{
						{description = "Automatic", data = "AUTO", hover = ""},
						{description = "English", data = "EN", hover = ""},
						{description = "简体中文", data = "CHS", hover = ""},
						{description = "繁體中文", data = "CHT", hover = ""},
					},
		default = "AUTO",
	},
}

-- configuration_options =
-- {
	-- {
		-- name = "dist",
		-- label = "自动门感应距离",
		-- hover = "",
		-- options =	{
						-- {description = "2", data = 2, hover = ""},
						-- {description = "2.5", data = 2.5, hover = ""},
						-- {description = "3", data = 3, hover = ""},
						-- {description = "4", data = 4, hover = ""},
						-- {description = "5", data = 5, hover = ""},
						-- {description = "6", data = 6, hover = ""},
						-- {description = "7", data = 7, hover = ""},
						-- {description = "8", data = 8, hover = ""},
						-- {description = "9", data = 9, hover = ""},
						-- {description = "10", data = 10, hover = ""},
						-- {description = "15", data = 15, hover = ""},
						-- {description = "20", data = 20, hover = ""},
					-- },
		-- default = 2.5,
	-- },
	
	-- {
		-- name = "rebounddmg",
		-- label = "反弹伤害",
		-- hover = "受到攻击时，墙反弹多少伤害？",
		-- options =	{
						-- {description = "0", data = 0, hover = " "},
						-- {description = "1", data = 1, hover = " "},
						-- {description = "5", data = 5, hover = " "},
						-- {description = "10", data = 10, hover = " "},
						-- {description = "20", data = 20, hover = " "},
						-- {description = "50", data = 50, hover = " "},
						-- {description = "100", data = 100, hover = " "},
						-- {description = "200", data = 200, hover = "..."},
						-- {description = "500", data = 500, hover = "什么?!.."},
					-- },
		-- default = 0,
	-- },
	
	-- {
		-- name = "bossres",
		-- label = "建筑伤害抗性",
		-- hover = "",
		-- options =	{
						-- {description = "免疫", data = true, hover = "不会被boss、陨石、火药等摧毁"},
						-- {description = "可破坏", data = false, hover = "会被boss、陨石、火药等摧毁"},
					-- },
		-- default = true,
	-- },
	
	-- {
		-- name = "companion",
		-- label = "切斯特触发门",
		-- hover = "自动门是否为切斯特、哈奇、宠物打开",
		-- options =	{
						-- {description = "是", data = true, hover = ""},
						-- {description = "否", data = false, hover = ""},
					-- },
		-- default = true,
	-- },
	
	-- {
		-- name = "ownership",
		-- label = "使用权",
		-- hover = "谁能用自动门，谁能摧毁？",
		-- options =	{
						-- {description = "公共", data = 0, hover = "谁都可以使用和摧毁"},
						-- {description = "授权的人", data = 1, hover = "只有建造者和授权的人能使用和摧毁"},
					-- },
		-- default = 0,
	-- },
	
	-- {
		-- name = "minimapicon",
		-- label = "小地图图标",
		-- hover = "",
		-- options =	{
						-- {description = "开启", data = true, hover = ""},
						-- {description = "关闭", data = false, hover = ""},
					-- },
		-- default = false,
	-- },
	
	-- {
		-- name = "recipe",
		-- label = "制作难度",
		-- hover = "",
		-- options =	{
						-- {description = "普通", data = "normal", hover = " "},
						-- {description = "困难", data = "hard", hover = "墙=普通材料+电子元件*4，门=普通材料+电子元件*4+齿轮*2"},
					-- },
		-- default = "normal",
	-- },
	
	-- {
		-- name = "recipe_vanilla",
		-- label = "制作：原版",
		-- hover = "是否允许制作游戏自带的墙、栅栏、栅栏门？",
		-- options =	{
						-- {description = "启用", data = true, hover = ""},
						-- {description = "禁用", data = false, hover = ""},
					-- },
		-- default = false,
	-- },
	
	-- {
		-- name = "recipe_wall",
		-- label = "制作：墙",
		-- hover = "",
		-- options =	{
						-- {description = "启用", data = true, hover = ""},
						-- {description = "禁用", data = false, hover = ""},
					-- },
		-- default = true,
	-- },
	
	-- {
		-- name = "recipe_door",
		-- label = "制作：门",
		-- hover = "",
		-- options =	{
						-- {description = "启用", data = true, hover = ""},
						-- {description = "禁用", data = false, hover = ""},
					-- },
		-- default = true,
	-- },
	
	-- {
		-- name = "recipe_fence",
		-- label = "制作：栅栏",
		-- hover = "栅栏和栅栏门",
		-- options =	{
						-- {description = "启用", data = true, hover = ""},
						-- {description = "禁用", data = false, hover = ""},
					-- },
		-- default = true,
	-- },
	
	-- {
		-- name = "recipe_tool",
		-- label = "制作：建造工具",
		-- hover = "是否允许制作快速建造工具?",
		-- options =	{
						-- {description = "启用", data = true, hover = ""},
						-- {description = "禁用", data = false, hover = ""},
					-- },
		-- default = true,
	-- },
	
	-- {
		-- name = "language",
		-- label = "语言",
		-- hover = "",
		-- options =	{
						-- {description = "自动检测", data = "AUTO", hover = ""},
						-- {description = "English", data = "EN", hover = ""},
						-- {description = "简体中文", data = "CHS", hover = ""},
						-- {description = "繁體中文", data = "CHT", hover = ""},
					-- },
		-- default = "AUTO",
	-- },
-- }