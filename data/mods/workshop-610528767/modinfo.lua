--The name of the mod displayed in the 'mods' screen. 
--这个是 Mod 名称，将在“Mods”里显示。
name = "快捷宣告-Shang汉化"

--Who wrote this awesome mod? 
--制作这个 Mod 的作者是谁？
author = "rezecib编码；Shang完美汉化"

--A version number so you can ask people if they are running an old version of your mod. 
--版本号，有了它你就可以询问玩家是否正在运行你 Mod 的旧版本。
version = "2.4.4"
Old_version = "2.2.1_s"

--A description of the mod. 
--作者对 Mod 的描述。
descri_CN = "\nALT + 鼠标点击 宣告三维信息和库存物品种类数量，举个栗子：(\"我受伤!\",\"我有2树枝。\",\"我们需要更多的晾肉架。\")。ALT + SHIFT + 鼠标点击 同屏范围宣告物品项目。\n\n"
descri_EN = "Alt-click parts of the HUD to announce their status (\"I'm wounded!\", \"I have 2 twigs.\", \"We need more drying racks.\"). ALT+SHIFT click to announce items."

description = "版本号: "..version..descri_CN..descri_EN

--This lets other players know if your mod is out of date. This typically needs to be updated every time there's a new game update.
--这让其他玩家知道你的 Mod 是否过时了。每当有新的游戏更新时，这通常需要更新。
api_version = 10

dst_compatible = true

--This lets clients know if they need to get the mod from the Steam Workshop to join the game
--这让客户端知道是否需要从Steam创意工坊获得此 Mod 才能加入游戏
all_clients_require_mod = false

--This determines whether it causes a server to be marked as modded (and shows in the mod list)
--这决定了此 Mod 是否支持服务器端，服务器会标记为modded(并且在 Mod 列表中显示)
client_only_mod = true

--This lets people search for servers with this mod by these tags
--这让人们可以通过这些标签搜索服务器
server_filter_tags = {}

icon_atlas = "statusannouncements.xml"
icon = "statusannouncements.tex"

forumthread = "http://forums.kleientertainment.com/files/file/923-dst-status-announcements"

--[[
Credits:
    Silentdarkness1 for coming up with most of the character-specific quotes
	Acemurdock and OSMRhodey for helping out with the Woodie quotes
	SuperPsiPower (and friends) for helping out with the Webber quotes
	Vinicius Araújo for translating the quotes to Brazilian Portuguese

制作人员名谢: 
    Silentdarkness1 提出了大多数特定字符的引用
    Acemurdock和OSMRhodey 帮助提供 伍迪(Woodie)的语录
    SuperPsiPower (and friends) 帮助提供 韦伯(Webber)的语录
    Vinicius Araujo 提供了巴西葡萄牙语的翻译
]]

configuration_options =
{
	{
		name = "LANGUAGE",
		label = "选择你的语言",
		hover = "你可以选择使用哪种语言，目前有简、繁、英和葡萄牙语。",
		options =	{
						{description = "自动检测", data = "detect", hover = "根据安装的语言模块检测语言。"},
						{description = "简体中文", data = "chinese", hover = "始终为简体中文。"},
						{description = "English", data = "english", hover = "始終為英語，作學習或體驗用！"},
						{description = "繁體中文", data = "chinese_cht", hover = "始終為繁體中文。"},
						{description = "Português (BR)", data = "brazil", hover = "巴西葡萄牙语"},
					},
		default = "detect",
	},
	{
		name = "WHISPER",
		label = "默认宣告密语",
		hover = "习惯性设置，在游戏中宣告可以加 Ctrl 键互相切换私密与公开",
		options =	{
						{description = "开", data = true, hover = "Alt+Shift 宣告只有附近玩家能看到。"},
						{description = "关", data = false, hover = "Alt+Shift 宣告全部玩家都能看到。"},
					},
		default = false,
	},
	{
		name = "EXPLICIT",
		label = "显示(当前值)/(最大值)",
		hover = "在宣告三维状态时，是否显示当前值和最大值。(Current)/(Max)",
		options =	{
						{description = "是", data = true, hover = "开启是正确的选择。"},
						{description = "否", data = false, hover = "关闭后异常的尴尬。"},
					},
		default = true,
	},
	{
		name = "SHOWPROTOTYPER",
		label = "宣告标准原型体",
		hover = "宣告制定配方时，是否要宣告“你需要一个科学机器”或“一个原型样本”。",
		options =	{
						{description = "是", data = true, hover = ""},
						{description = "否", data = false, hover = ""},
					},
		default = true,
	},
	{
		name = "SHOWDURABILITY",
		label = "宣告装备耐久性",
		hover = "是否要宣告一个装备的耐久性或耐用时限。",
		options =	{
						{description = "开", data = true, hover = ""},
						{description = "关", data = false, hover = ""},
					},
		default = true,
	},
	{
		name = "OVERRIDEB",
		label = "手柄控制器宣告",
		hover = "当使用手柄控制器且库存是打开时，允许用 B (取消按钮) 来宣告 体温。",
		options =	{
						{description = "开", data = true, hover = ""},
						{description = "关", data = false, hover = ""},
					},
		default = true,
	},
	{
		name = "WILSON",
		label = "定制科学家 威尔逊语录",
		hover = "当你是威尔逊时，会宣告科学家专有语录。",
		options =	{
						{description = "开", data = true},
						{description = "关", data = false},
					},
		default = true,
	},
	{
		name = "WILLOW",
		label = "定制玩火者 薇洛语录",
		hover = "当你是薇洛时，会宣告玩火者专有语录。",
		options =	{
						{description = "开", data = true},
						{description = "关", data = false},
					},
		default = true,
	},
	{
		name = "WX78",
		label = "定制机器人 WX-78语录",
		hover = "当你是WX-78时，会宣告机器人专有语录。",
		options =	{
						{description = "开", data = true},
						{description = "关", data = false},
					},
		default = true,
	},
	{
		name = "WICKERBOTTOM",
		label = "定制图管员 维克波顿语录",
		hover = "当你是维克波顿时，会宣告图书管理员专有语录。",
		options =	{
						{description = "开", data = true},
						{description = "关", data = false},
					},
		default = true,
	},
	{
		name = "WOLFGANG",
		label = "定制大力士 沃尔夫冈语录",
		hover = "当你是沃尔夫冈时，会宣告大力士专有语录。",
		options =	{
						{description = "开", data = true},
						{description = "关", data = false},
					},
		default = true,
	},
	{
		name = "WENDY",
		label = "定制丧亲者 温蒂语录",
		hover = "当你是温蒂时，会宣告丧失亲人者专有语录。",
		options =	{
						{description = "开", data = true},
						{description = "关", data = false},
					},
		default = true,
	},
	{
		name = "WOODIE",
		label = "定制啃木人 伍迪语录",
		hover = "当你是伍迪时，会宣告异食癖专有语录。",
		options =	{
						{description = "开", data = true},
						{description = "关", data = false},
					},
		default = true,
	},
	{
		name = "WES",
		label = "定制表演家 维斯语录",
		hover = "当你是维斯时，会宣告表演家专有语录。",
		options =	{
						{description = "开", data = true},
						{description = "关", data = false},
					},
		default = true,
	},
	{
		name = "WAXWELL",
		label = "定制暗法师 麦斯威尔语录",
		hover = "当你是麦斯威尔时，会宣告暗影魔法师专有语录。",
		options =	{
						{description = "开", data = true},
						{description = "关", data = false},
					},
		default = true,
	},
	{
		name = "WEBBER",
		label = "定制蜘蛛人 韦帕语录",
		hover = "当你是韦帕时，会宣告蜘蛛人专有语录。",
		options =	{
						{description = "开", data = true},
						{description = "关", data = false},
					},
		default = true,
	},
	{
		name = "WATHGRITHR",
		label = "定制女战神 瓦弗德语录",
		hover = "当你是瓦弗德时，会宣告战武神专有语录。",
		options =	{
						{description = "开", data = true},
						{description = "关", data = false},
					},
		default = true,
	},
}