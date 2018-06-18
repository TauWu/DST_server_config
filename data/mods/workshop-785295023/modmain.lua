

PrefabFiles = {
	"superwall",
	"superwall_fence",
}

	
   Assets = 
{
    Asset("ATLAS", "images/inventoryimages/wooddoor.xml"),
	Asset("ATLAS", "images/inventoryimages/haydoor.xml"),
	Asset("ATLAS", "images/inventoryimages/stonedoor.xml"),
	Asset("ATLAS", "images/inventoryimages/ruindoor.xml"),
	Asset("ATLAS", "images/inventoryimages/limestonedoor.xml"),
	Asset("ATLAS", "images/inventoryimages/limestonewall.xml"),
	Asset("ATLAS", "images/inventoryimages/moonrockdoor.xml"),
	Asset("ATLAS", "images/inventoryimages/wallbuilder.xml"),
	Asset("ATLAS", "images/inventoryimages/icedoor.xml"),
	Asset("ATLAS", "images/inventoryimages/icewall.xml"),
	Asset("ATLAS", "images/inventoryimages/seadoor.xml"),
	Asset("ATLAS", "images/inventoryimages/seawall.xml"),
	
	Asset("ATLAS", "images/minimap_fence.xml"),
	Asset("ATLAS", "images/minimap_fence_gate.xml"),
	Asset("ATLAS", "images/minimap_wall_hay.xml"),
	Asset("ATLAS", "images/minimap_wall_wood.xml"),
	Asset("ATLAS", "images/minimap_wall_stone.xml"),
	Asset("ATLAS", "images/minimap_wall_ruins.xml"),
	Asset("ATLAS", "images/minimap_wall_limestone.xml"),
	Asset("ATLAS", "images/minimap_wall_moonrock.xml"),
	Asset("ATLAS", "images/minimap_wall_ice.xml"),
	Asset("ATLAS", "images/minimap_wall_sea.xml"),
}

AddMinimapAtlas("images/minimap_fence.xml")
AddMinimapAtlas("images/minimap_fence_gate.xml")
AddMinimapAtlas("images/minimap_wall_hay.xml")
AddMinimapAtlas("images/minimap_wall_wood.xml")
AddMinimapAtlas("images/minimap_wall_stone.xml")
AddMinimapAtlas("images/minimap_wall_ruins.xml")
AddMinimapAtlas("images/minimap_wall_limestone.xml")
AddMinimapAtlas("images/minimap_wall_moonrock.xml")
AddMinimapAtlas("images/minimap_wall_ice.xml")
AddMinimapAtlas("images/minimap_wall_sea.xml")

GLOBAL.SuperWall={}
local SuperWall=GLOBAL.SuperWall
 
local STRINGS_EN = {
	wooddoor = {
		name = "Super Wood Door",
		des = "Opens when any player approaches",
		char_des = "It is so convinient!",
	},
	woodwall = {
		name = "Super Wood Wall",
		des = "An invincible wood wall!",
		char_des = "I will never be afraid of hounds!",
	},
	haydoor = {
		name = "Super Hay Door",
		des = "Opens when any player approaches",
		char_des = "It is so convinient!",
	},
	haywall = {
		name = "Super Hay Wall",
		des = "An invincible hay wall!",
		char_des = "I will never be afraid of hounds!",
	},
	stonedoor = {
		name = "Super Stone Door",
		des = "Opens when any player approaches",
		char_des = "It is so convinient!",
	},
	stonewall = {
		name = "Super Stone Wall",
		des = "An invincible stone wall!",
		char_des = "I will never be afraid of hounds!",
	},
	ruindoor = {
		name = "Super Thulecite Door",
		des = "Opens when any player approaches",
		char_des = "It is so convinient!",
	},
	ruinwall = {
		name = "Super Thulecite Wall",
		des = "An invincible thulecite wall!",
		char_des = "I will never be afraid of hounds!",
	},
	limestonedoor = {
		name = "Super Limestone Door",
		des = "Opens when any player approaches",
		char_des = "It is so convinient!",
	},
	limestonewall = {
		name = "Super Limestone Wall",
		des = "An invincible limestone wall!",
		char_des = "I will never be afraid of hounds!",
	},
	moonrockdoor = {
		name = "Super Moon Rock Door",
		des = "Opens when any player approaches",
		char_des = "It is so convinient!",
	},
	moonrockwall = {
		name = "Super Moon Rock Wall",
		des = "An invincible moon rock wall!",
		char_des = "I will never be afraid of hounds!",
	},
	icedoor = {
		name = "Super Ice Door",
		des = "Opens when any player approaches",
		char_des = "It is so convinient!",
	},
	icewall = {
		name = "Super Ice Wall",
		des = "An invincible ice wall!",
		char_des = "I will never be afraid of hounds!",
	},
	seadoor = {
		name = "Super Sea Door",
		des = "Opens when any player approaches",
		char_des = "It is so convinient!",
	},
	seawall = {
		name = "Super Sea Wall",
		des = "An invincible sea wall!",
		char_des = "I will never be afraid of hounds!",
	},
	fence = {
		name = "Super Wood Fence",
		des = "An invincible wood fence!",
		char_des = "My zoo is safe!",
	},
	fencegate = {
		name = "Super Wood Gate",
		des = "Opens when any player approaches",
		char_des = "And... Open!",
	},
	wallbuilder = {
		name = "Super Wall Fast Build Tool",
		des = "Build a set of walls and doors!",
		char_des = "I want to build a maze!",
	},
	helpcmd=[[
	[SuperWall Chat Commands]
	Add + Player Index: Add someone to my trust list. (e.g., '-SuperWall Add 2' or '-sw a 2')
	Remove + Player Index: Remove someone from my trust list. (e.g., '-SuperWall Remove 2' or '-sw r 2')
	List: Display my trust list. (e.g., '-SuperWall List' or '-sw l')
	]],
	cmdincorrect="Incorrect chat command！\n I can type '-sw help' to get some help!",
	fastbuild="[Fast Build Presets]  (Hint: Middle mouse button or F5 to rotate. Scroll wheel or F1/F2 to change preset. F3/F4 to adjust height. Hold ALT + Right Click to destroy.)",
	singlewallbuild="(Hint: F3/F4 to adjust height)",
	singlewallbuild_2="(Hint: F3/F4 to change color)",
	rotation = "Rotation",
	degrees = "Degrees",
	heightadjustment="Height Adjustment",
	heightadjustment_2="Color Change",
	readytobuild="READY TO BUILD!",
	insufficientwallitem="INSUFFICIENT WALL ITEMS!",
	requiredmaterials="Required wall items:",
	buildingcomplete1="Job Done!",
	buildingcomplete2="Some of the them were not built!",
	buildingcomplete3="Failed to build! Check the required wall items and make sure no obstacles in the way!",
	walldestroyed1="Destroyed!",
	walldestroyed2="No wall or door found!",
	wallheightchanged1="Wall height changed!",
	wallheightchanged2="No wall or door found!",
	freebuildmodeon="SuperWall: Free build mode is turned ON! Fast build tool now consumes nothing! (For everyone)",
	freebuildmodeoff="SuperWall: Free build mode is turned OFF!",
	str0="wall",
	str1="door",
	str0_2="fence",
	str1_2="gate",
	str2="The owner of it has left current world.",
	str3="This ",
	str4=" is mine!",
	str5=" belongs to ",
	str6="!",
	str7=" can use ",
	str8="my",
	str9="'s",
	str10="I",
	str11=" super walls and doors now!",
	str12="I can't do that without permission!",
	str13=" is trying to hammer my ",
	str13_2=" is trying to lock/unlock my ",
	str14="But ",
	str15="I can use it!",
	str16=" cannot use ",
	str17="I don't need to do this! The walls and doors are public!",
	str18="I don't need to add or remove myself!",
	str19="Target player does not exist!",
	str20=" wants to use my ",
	str21="I can press Y or U and type '-sw a ",
	str22="' to add him/her to my trust list.",
	str23="Player ",
	str24="AUTHORIZED",
	str25="NOT AUTHORIZED",
	str26="[My Trust List]",
	str27="Locked!",
	str28="Unlocked!",
}

local STRINGS_CHS = {
	wooddoor = {
		name = "超级木门",
		des = "玩家靠近时自动打开",
		char_des = "如此方便!",
	},
	woodwall = {
		name = "超级木墙",
		des = "无敌的木墙!",
		char_des = "再也不怕猎狗了!",
	},
	haydoor = {
		name = "超级干草门",
		des = "玩家靠近时自动打开",
		char_des = "如此方便!",
	},
	haywall = {
		name = "超级干草墙",
		des = "无敌的干草墙!",
		char_des = "再也不怕猎狗了!",
	},
	stonedoor = {
		name = "超级石门",
		des = "玩家靠近时自动打开",
		char_des = "如此方便!",
	},
	stonewall = {
		name = "超级石墙",
		des = "无敌的石墙!",
		char_des = "再也不怕猎狗了!",
	},
	ruindoor = {
		name = "超级铥矿门",
		des = "玩家靠近时自动打开",
		char_des = "如此方便!",
	},
	ruinwall = {
		name = "超级铥矿墙",
		des = "无敌的铥矿墙!",
		char_des = "再也不怕猎狗了!",
	},
	limestonedoor = {
		name = "超级石灰石门",
		des = "玩家靠近时自动打开",
		char_des = "如此方便!",
	},
	limestonewall = {
		name = "超级石灰石墙",
		des = "无敌的石灰石墙!",
		char_des = "再也不怕猎狗了!",
	},
	moonrockdoor = {
		name = "超级月石门",
		des = "玩家靠近时自动打开",
		char_des = "如此方便!",
	},
	moonrockwall = {
		name = "超级月石墙",
		des = "无敌的月石墙!",
		char_des = "再也不怕猎狗了!",
	},
	icedoor = {
		name = "超级冰门",
		des = "玩家靠近时自动打开",
		char_des = "如此方便!",
	},
	icewall = {
		name = "超级冰墙",
		des = "无敌的冰墙!",
		char_des = "再也不怕猎狗了!",
	},
	seadoor = {
		name = "超级海带门",
		des = "玩家靠近时自动打开",
		char_des = "如此方便!",
	},
	seawall = {
		name = "超级海带墙",
		des = "无敌的海带墙!",
		char_des = "再也不怕猎狗了!",
	},
	fence = {
		name = "超级木栅栏",
		des = "无敌的木栅栏!",
		char_des = "我的动物园很安全!",
	},
	fencegate = {
		name = "超级木门",
		des = "玩家靠近时自动打开",
		char_des = "芝麻开门!",
	},
	wallbuilder = {
		name = "超级墙快速建造工具",
		des = "建造一整套墙和门!",
		char_des = "我想建个迷宫!",
	},
	helpcmd=[[
	【超级墙 聊天指令】
	Add + 玩家编号: 把某人加到我的信任列表里。 (例如 '-SuperWall Add 2' 或者 '-sw a 2')
	Remove + 玩家编号: 把某人从我的信任列表里移除。 (例如 '-SuperWall Remove 2' 或者 '-sw r 2')
	List: 显示我的信任列表。 (例如 '-SuperWall List' 或者 '-sw l')
	]],
	cmdincorrect="聊天指令错误！\n我可以通过输入'-sw help'来查看帮助！",
	fastbuild="【快速建造预设组合】  (提示：鼠标中键或F5旋转，滚轮或F1/F2切换预设，F3/F4调整高度，按住ALT+鼠标右键来拆除)",
	singlewallbuild="(提示: F3/F4调整高度)",
	singlewallbuild_2="(提示: F3/F4改变颜色)",
	rotation = "旋转",
	degrees = "度",
	heightadjustment="高度调整",
	heightadjustment_2="颜色改变",
	readytobuild="材料齐全！",
	insufficientwallitem="墙物品不足！",
	requiredmaterials="所需墙物品：",
	buildingcomplete1="建造完成!",
	buildingcomplete2="有一部分建造未完成!",
	buildingcomplete3="建造失败! 检查一下所需墙物品是否齐全，并确保没有障碍物!",
	walldestroyed1="拆迁完成!",
	walldestroyed2="没有东西可以拆!",
	wallheightchanged1="已改变墙高度!",
	wallheightchanged2="没有墙可以改!",
	freebuildmodeon="超级墙：自由建造模式被开启！快速建造工具将不消耗物品！（对所有人来说）",
	freebuildmodeoff="超级墙：自由建造模式被关闭！",
	str0="墙",
	str1="门",
	str0_2="栅栏",
	str1_2="门",
	str2="它的所有者已经离开了当前世界.",
	str3="这个",
	str4="是我的!",
	str5="的所有者是",
	str6="!",
	str7="现在能够使用",
	str8="我的",
	str9="的",
	str10="我",
	str11="超级墙和门了!",
	str12="未经同意我不能这样做！",
	str13="正在尝试拆我的",
	str13_2="正在尝试锁住/解锁我的",
	str14="但",
	str15="我可以使用它!",
	str16="现在无法使用",
	str17="我不需要这么做！门和墙都是共用的！",
	str18="我不需要添加或删除我自己！",
	str19="目标玩家不存在！",
	str20="想要使用我的",
	str21="我可以按Y或U并输入'-sw a ",
	str22="'把他/她加入我的信任列表。",
	str23="玩家",
	str24="已拥有权限",
	str25="未拥有权限",
	str26="【我的信任列表】",
	str27="锁好了!",
	str28="解锁了!",
}

local STRINGS_CHT = {
    wooddoor = {
        name = "超級木門",
        des = "玩家靠近時自動打開",
        char_des = "如此方便!",
    },
    woodwall = {
        name = "超級木牆",
        des = "無敵的木牆!",
        char_des = "再也不怕獵犬了!",
    },
    haydoor = {
        name = "超級草門",
        des = "玩家靠近時自動打開",
        char_des = "如此方便!",
    },
    haywall = {
        name = "超級草牆",
        des = "無敵的草牆!",
        char_des = "再也不怕獵犬了!",
    },
    stonedoor = {
        name = "超級石門",
        des = "玩家靠近時自動打開",
        char_des = "如此方便!",
    },
    stonewall = {
        name = "超級石牆",
        des = "無敵的石牆!",
        char_des = "再也不怕獵犬了!",
    },
    ruindoor = {
        name = "超級圖勒門",
        des = "玩家靠近時自動打開",
        char_des = "如此方便!",
    },
    ruinwall = {
        name = "超級圖勒牆",
        des = "無敵的圖勒牆!",
        char_des = "再也不怕獵犬了!",
    },
    limestonedoor = {
        name = "超級石灰石門",
        des = "玩家靠近時自動打開",
        char_des = "如此方便!",
    },
    limestonewall = {
        name = "超級石灰石牆",
        des = "無敵的石灰石牆!",
        char_des = "再也不怕獵犬了!",
    },
    moonrockdoor = {
        name = "超級月石門",
        des = "玩家靠近時自動打開",
        char_des = "如此方便!",
    },
    moonrockwall = {
        name = "超級月石牆",
        des = "無敵的月石牆!",
        char_des = "再也不怕獵犬了!",
    },
	icedoor = {
		name = "超級冰門",
		des = "玩家靠近時自動打開",
		char_des = "如此方便!",
	},
	icewall = {
		name = "超級冰牆",
		des = "無敵的冰牆!",
		char_des = "再也不怕獵犬了!",
	},
	seadoor = {
		name = "超級海帶門",
		des = "玩家靠近時自動打開",
		char_des = "如此方便!",
	},
	seawall = {
		name = "超級海帶牆",
		des = "無敵的海帶牆!",
		char_des = "再也不怕獵犬了!",
	},
	fence = {
		name = "超級木柵欄",
		des = "無敵的木柵欄!",
		char_des = "我的動物園很安全!",
	},
	fencegate = {
		name = "超級木門",
		des = "玩家靠近時自動打開",
		char_des = "芝麻開門!",
	},
	wallbuilder = {
		name = "超級牆快速建造工具",
		des = "建造一整套牆和門!",
		char_des = "我想建個迷宮!",
	},
    helpcmd=[[
    【超級牆 聊天指令】
    Add + 玩家編號: 把某人加到我的信任列表裏。 (例如 '-SuperWall Add 2' 或者 '-sw a 2')
    Remove + 玩家編號: 把某人從我的信任列表裏移除。 (例如 '-SuperWall Remove 2' 或者 '-sw r 2')
    List: 顯示我的信任列表。 (例如 '-SuperWall List' 或者 '-sw l')
    ]],
    cmdincorrect="聊天指令錯誤！\n我可以通過輸入'-sw help'來查看幫助！",
	fastbuild="【快速建造預設組合】  (提示：鼠標中鍵或F5旋轉，滾輪或F1/F2切換預設，F3/F4調整高度，按住ALT+鼠標右鍵來拆除)",
	singlewallbuild="(提示: F3/F4調整高度)",
	singlewallbuild_2="(提示: F3/F4改變顏色)",
	rotation = "旋轉",
	degrees = "度",
	heightadjustment="高度調整",
	heightadjustment_2="顏色改變",
	readytobuild="材料齊全！",
	insufficientwallitem="牆物品不足！",
	requiredmaterials="所需牆物品",
	buildingcomplete1="建造完成!",
	buildingcomplete2="有一部分建造未完成!",
	buildingcomplete3="建造失敗! 檢查一下所需牆物品是否齊全，并確保沒有障礙物!",
	walldestroyed1="拆遷完成!",
	walldestroyed2="沒有東西可以拆!",
	wallheightchanged1="已改變牆高度!",
	wallheightchanged2="沒有牆可以改!",
	freebuildmodeon="超級牆：自由建造模式被開啟！快速建造工具將不消耗物品！（對所有人來說）",
	freebuildmodeoff="超級牆：自由建造模式被關閉！",
    str0="牆",
    str1="門",
	str0_2="柵欄",
	str1_2="門",
    str2="它的擁有者已經離開了當前世界.",
    str3="這個",
    str4="是我的!",
    str5="的所有者是",
    str6="!",
    str7="現在能夠使用",
    str8="我的",
    str9="的",
    str10="我",
    str11="超級牆和門了!",
    str12="未經同意我不能這樣做！",
    str13="正在嘗試拆我的",
	str13_2="正在嘗試鎖住/解鎖我的",
    str14="但",
    str15="我可以使用它!",
    str16="現在無法使用",
    str17="我不需要這麽做！門和牆都是共用的！",
    str18="我不需要添加或刪除我自己！",
    str19="目標玩家不存在！",
    str20="想要使用我的",
    str21="我可以按Y或U並輸入'-sw a ",
    str22="'把他/她加入我的信任列表。",
    str23="玩家",
    str24="已擁有權限",
    str25="未擁有權限",
    str26="【我的信任列表】",
	str27="鎖好了!",
	str28="解鎖了!",
}


local L2S = {EN=STRINGS_EN,CHS=STRINGS_CHS,CN=STRINGS_CHS,CHT=STRINGS_CHT,TW=STRINGS_CHT,}
SuperWall.R2L={EN="EN",CHS="CHS",CN="CHS",CHT="CHT",TW="CHT",}



STRINGS = GLOBAL.STRINGS
RECIPETABS = GLOBAL.RECIPETABS
Recipe = GLOBAL.Recipe
Ingredient = GLOBAL.Ingredient
TECH = GLOBAL.TECH
TUNING = GLOBAL.TUNING
local lang=GetModConfigData("language")
TUNING.DYC_SUPERWALL_LANGUAGE=lang
if lang=="AUTO" then
	lang="EN"
	TUNING.DYC_SUPERWALL_LANGUAGE=lang
	TUNING.DYC_SUPERWALL_AUTOLANG=true
	
end
local strings = L2S[lang]

local function SL(strings)
	--================================================doors================================================
	GLOBAL.STRINGS.NAMES.DYC_DOOR_WOOD = strings.wooddoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_WOOD = strings.wooddoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_WOOD = strings.wooddoor.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_DOOR_WOOD_ITEM = strings.wooddoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_WOOD_ITEM = strings.wooddoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_WOOD_ITEM = strings.wooddoor.char_des

	GLOBAL.STRINGS.NAMES.DYC_DOOR_HAY = strings.haydoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_HAY = strings.haydoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_HAY = strings.haydoor.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_DOOR_HAY_ITEM = strings.haydoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_HAY_ITEM = strings.haydoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_HAY_ITEM = strings.haydoor.char_des

	GLOBAL.STRINGS.NAMES.DYC_DOOR_STONE = strings.stonedoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_STONE = strings.stonedoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_STONE = strings.stonedoor.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_DOOR_STONE_ITEM = strings.stonedoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_STONE_ITEM = strings.stonedoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_STONE_ITEM = strings.stonedoor.char_des

	GLOBAL.STRINGS.NAMES.DYC_DOOR_RUIN = strings.ruindoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_RUIN = strings.ruindoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_RUIN = strings.ruindoor.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_DOOR_RUIN_ITEM = strings.ruindoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_RUIN_ITEM = strings.ruindoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_RUIN_ITEM = strings.ruindoor.char_des

	GLOBAL.STRINGS.NAMES.DYC_DOOR_LIMESTONE = strings.limestonedoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_LIMESTONE = strings.limestonedoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_LIMESTONE = strings.limestonedoor.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_DOOR_LIMESTONE_ITEM = strings.limestonedoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_LIMESTONE_ITEM = strings.limestonedoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_LIMESTONE_ITEM = strings.limestonedoor.char_des

	GLOBAL.STRINGS.NAMES.DYC_DOOR_MOONROCK = strings.moonrockdoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_MOONROCK = strings.moonrockdoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_MOONROCK = strings.moonrockdoor.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_DOOR_MOONROCK_ITEM = strings.moonrockdoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_MOONROCK_ITEM = strings.moonrockdoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_MOONROCK_ITEM = strings.moonrockdoor.char_des
	
	GLOBAL.STRINGS.NAMES.DYC_DOOR_ICE = strings.icedoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_ICE = strings.icedoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_ICE = strings.icedoor.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_DOOR_ICE_ITEM = strings.icedoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_ICE_ITEM = strings.icedoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_ICE_ITEM = strings.icedoor.char_des

	GLOBAL.STRINGS.NAMES.DYC_DOOR_SEA = strings.seadoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_SEA = strings.seadoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_SEA = strings.seadoor.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_DOOR_SEA_ITEM = strings.seadoor.name
	STRINGS.RECIPE_DESC.DYC_DOOR_SEA_ITEM = strings.seadoor.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_DOOR_SEA_ITEM = strings.seadoor.char_des

	--================================================walls================================================
	GLOBAL.STRINGS.NAMES.DYC_WALL_WOOD = strings.woodwall.name
	STRINGS.RECIPE_DESC.DYC_WALL_WOOD = strings.woodwall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_WOOD = strings.woodwall.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_WALL_WOOD_ITEM = strings.woodwall.name
	STRINGS.RECIPE_DESC.DYC_WALL_WOOD_ITEM = strings.woodwall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_WOOD_ITEM = strings.woodwall.char_des

	GLOBAL.STRINGS.NAMES.DYC_WALL_HAY = strings.haywall.name
	STRINGS.RECIPE_DESC.DYC_WALL_HAY = strings.haywall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_HAY = strings.haywall.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_WALL_HAY_ITEM = strings.haywall.name
	STRINGS.RECIPE_DESC.DYC_WALL_HAY_ITEM = strings.haywall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_HAY_ITEM = strings.haywall.char_des

	GLOBAL.STRINGS.NAMES.DYC_WALL_STONE = strings.stonewall.name
	STRINGS.RECIPE_DESC.DYC_WALL_STONE = strings.stonewall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_STONE = strings.stonewall.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_WALL_STONE_ITEM = strings.stonewall.name
	STRINGS.RECIPE_DESC.DYC_WALL_STONE_ITEM = strings.stonewall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_STONE_ITEM = strings.stonewall.char_des

	GLOBAL.STRINGS.NAMES.DYC_WALL_RUIN = strings.ruinwall.name
	STRINGS.RECIPE_DESC.DYC_WALL_RUIN = strings.ruinwall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_RUIN = strings.ruinwall.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_WALL_RUIN_ITEM = strings.ruinwall.name
	STRINGS.RECIPE_DESC.DYC_WALL_RUIN_ITEM = strings.ruinwall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_RUIN_ITEM = strings.ruinwall.char_des

	GLOBAL.STRINGS.NAMES.DYC_WALL_LIMESTONE = strings.limestonewall.name
	STRINGS.RECIPE_DESC.DYC_WALL_LIMESTONE = strings.limestonewall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_LIMESTONE = strings.limestonewall.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_WALL_LIMESTONE_ITEM = strings.limestonewall.name
	STRINGS.RECIPE_DESC.DYC_WALL_LIMESTONE_ITEM = strings.limestonewall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_LIMESTONE_ITEM = strings.limestonewall.char_des

	GLOBAL.STRINGS.NAMES.DYC_WALL_MOONROCK = strings.moonrockwall.name
	STRINGS.RECIPE_DESC.DYC_WALL_MOONROCK = strings.moonrockwall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_MOONROCK = strings.moonrockwall.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_WALL_MOONROCK_ITEM = strings.moonrockwall.name
	STRINGS.RECIPE_DESC.DYC_WALL_MOONROCK_ITEM = strings.moonrockwall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_MOONROCK_ITEM = strings.moonrockwall.char_des
	
	GLOBAL.STRINGS.NAMES.DYC_WALL_ICE = strings.icewall.name
	STRINGS.RECIPE_DESC.DYC_WALL_ICE = strings.icewall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_ICE = strings.icewall.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_WALL_ICE_ITEM = strings.icewall.name
	STRINGS.RECIPE_DESC.DYC_WALL_ICE_ITEM = strings.icewall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_ICE_ITEM = strings.icewall.char_des

	GLOBAL.STRINGS.NAMES.DYC_WALL_SEA = strings.seawall.name
	STRINGS.RECIPE_DESC.DYC_WALL_SEA = strings.seawall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_SEA = strings.seawall.char_des
				
	GLOBAL.STRINGS.NAMES.DYC_WALL_SEA_ITEM = strings.seawall.name
	STRINGS.RECIPE_DESC.DYC_WALL_SEA_ITEM = strings.seawall.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALL_SEA_ITEM = strings.seawall.char_des
	
	--================================================fence================================================
	GLOBAL.STRINGS.NAMES.DYC_FENCE = strings.fence.name
	STRINGS.RECIPE_DESC.DYC_FENCE = strings.fence.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_FENCE = strings.fence.char_des
	
	GLOBAL.STRINGS.NAMES.DYC_FENCE_ITEM = strings.fence.name
	STRINGS.RECIPE_DESC.DYC_FENCE_ITEM = strings.fence.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_FENCE_ITEM = strings.fence.char_des
	
	GLOBAL.STRINGS.NAMES.DYC_FENCE_GATE = strings.fencegate.name
	STRINGS.RECIPE_DESC.DYC_FENCE_GATE = strings.fencegate.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_FENCE_GATE = strings.fencegate.char_des
	
	GLOBAL.STRINGS.NAMES.DYC_FENCE_GATE_ITEM = strings.fencegate.name
	STRINGS.RECIPE_DESC.DYC_FENCE_GATE_ITEM = strings.fencegate.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_FENCE_GATE_ITEM = strings.fencegate.char_des
	
	--================================================wallbuilder================================================
	GLOBAL.STRINGS.NAMES.DYC_WALLBUILDERITEM = strings.wallbuilder.name
	STRINGS.RECIPE_DESC.DYC_WALLBUILDERITEM = strings.wallbuilder.des
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DYC_WALLBUILDERITEM = strings.wallbuilder.char_des
	
end

SL(strings)

TUNING.DYC_SUPERWALL=true
TUNING.DYC_SUPERWALL_STRINGS=strings
TUNING.DYC_SUPERWALL_DOORDETECTRANGE = GetModConfigData("dist")
TUNING.DYC_SUPERWALL_REBOUNDDAMAGE = GetModConfigData("rebounddmg")
TUNING.DYC_SUPERWALL_BOSSRES = GetModConfigData("bossres")
TUNING.DYC_SUPERWALL_OWNERSHIP = GetModConfigData("ownership")
TUNING.DYC_SUPERWALL_COMPANION = GetModConfigData("companion")
TUNING.DYC_SUPERWALL_MINIMAPICON = GetModConfigData("minimapicon")
TUNING.DYC_SUPERWALL_WALLSETNOCONSUMPTION=false
TUNING.DYC_SUPERWALL_WALLSETS={}

SuperWall.AddWallSet=function (wallset,iscustom)
	wallset.iscustom=iscustom
	table.insert(TUNING.DYC_SUPERWALL_WALLSETS,wallset)
end
SuperWall.AddCustomWallSet=function(wallset)
	SuperWall.AddWallSet(wallset,true)
end
SuperWall.NewWallSet=function(name,description)
	local newWallSet= {
		SetName = function (self,name)
			self.name=name
			return self
		end,
		SetDescription = function (self,description)
			self.description=description
			return self
		end,
		SetPivot = function (self,x,z)
			self.pivot=GLOBAL.Vector3(x,0,z)
			return self
		end,
		SetNextType = function (self,typeStr)
			self.nextType=typeStr
			return self
		end,
		SetNextHeight = function (self,height)
			self.nextHeight=height
			return self
		end,
		SetNextRotation = function (self,rotation)
			self.nextRotation=rotation
			return self
		end,
		SetNextIsSwingRight = function (self,isswingright)
			self.nextIsSwingRight=isswingright
			return self
		end,
		Add = function (self,x,z,walltype,height,rotation,isswingright)
			table.insert(self,{ walltype = walltype or self.nextType, offset=GLOBAL.Vector3(x,0,z), height = height or self.nextHeight, rotation = rotation or self.nextRotation, isswingright = isswingright or self.nextIsSwingRight, })
			return self
		end,
	}
	newWallSet:SetName(name):SetDescription(description):SetNextType("haywall"):SetNextHeight(4)
	return newWallSet
end
TUNING.DYC_SUPERWALL_SPECIALWALLSETS={}
table.insert(TUNING.DYC_SUPERWALL_SPECIALWALLSETS,{
	names={EN="Wall Destroyer Brush 3x3",CHS="拆除刷3x3",CHT="拆除刷3x3",},
	descriptions={EN="Super walls and doors in the rect will be destroyed!",CHS="区域内的超级墙和门将被摧毁！",CHT="區域內的超級牆和門將被摧毀！",},
	destroyer={ size={x=3,y=3,}, offset=GLOBAL.Vector3(0,0,0), },
})
SuperWall.wallBuilderIndex=1
SuperWall.wallBuilderRotation=0
SuperWall.wallBuilderHeightAdjustment=0
-- SuperWall.wallBuilderDeployAction=GLOBAL.Action({ distance=50 })
-- SuperWall.wallBuilderDeployAction.fn=GLOBAL.ACTIONS.DEPLOY.fn
-- SuperWall.wallBuilderDeployAction.strfn=GLOBAL.ACTIONS.DEPLOY.strfn
-- SuperWall.defaultWallBuildDis=GLOBAL.ACTIONS.DEPLOY.distance
SuperWall.IsAuthorized=function (inst,other)
	return TUNING.DYC_SUPERWALL_OWNERSHIP==0 or inst.dyc_ownerid==nil or inst.dyc_ownerid==other.userid or (GLOBAL.TheWorld.dyc_superwall_authorizationlist~=nil and GLOBAL.TheWorld.dyc_superwall_authorizationlist[inst.dyc_ownerid]~=nil and GLOBAL.TheWorld.dyc_superwall_authorizationlist[inst.dyc_ownerid][other.userid]==true)
end
SuperWall.mainPath="../"
SuperWall.LoadLUA = function(modulename)
	local path=SuperWall.mainPath
	print("SuperWall: LoadLUA:"..path..modulename)
        
    local result = GLOBAL.kleiloadlua(path..modulename)
	if result ~= nil and type(result) == "function" then
        return result
	else
		return nil
    end
end
SuperWall.LoadCustomFile=function()
	local wallsetnum=#TUNING.DYC_SUPERWALL_WALLSETS
	for i=1,wallsetnum do
		if TUNING.DYC_SUPERWALL_WALLSETS[i] and TUNING.DYC_SUPERWALL_WALLSETS[i].iscustom then
			TUNING.DYC_SUPERWALL_WALLSETS[i]=nil
		end
	end
	local customwallsets=SuperWall.LoadLUA("superwall_custom.lua")
	if customwallsets then
		local successful, result = GLOBAL.pcall (customwallsets)
		if successful then
			print("SuperWall: Custom file loaded!")
		elseif result then
			print("SuperWall: Failed to load custom file!    Error: ",result)
		end
	else
		print("SuperWall: Custom file not found!")
	end
end

modimport("wallsets.lua")



local function Id2Player(id)
	local player = nil
    for k,v in pairs(GLOBAL.AllPlayers) do
        if v.userid == id then 
            player = v  
        end
    end
	return player
end
SuperWall.Id2Player=Id2Player

local function Player2Index(player)
    for i=1,#GLOBAL.AllPlayers do
        if GLOBAL.AllPlayers[i] == player then 
            return i  
        end
    end
	return 0
end
SuperWall.Player2Index=Player2Index

local function S2B(s)
	if string.lower(s)=="true" then
		return true
	elseif string.lower(s)=="false" then
		return false
	end
	return nil
end

local function AutoLang()
	if GLOBAL.LanguageTranslator.defaultlang~=nil then
		lang=string.upper(GLOBAL.LanguageTranslator.defaultlang)
		local tempstrings = L2S[lang]
		if tempstrings~=nil then
			strings=tempstrings
			TUNING.DYC_SUPERWALL_STRINGS=strings 
			TUNING.DYC_SUPERWALL_LANGUAGE=lang
			SL(strings)
			print("SuperWall: Language has been automatically set to "..lang)
		end
	end
end

local function WorldPost (inst)
	if TUNING.DYC_SUPERWALL_AUTOLANG==true then
		AutoLang()
	end
	inst:DoTaskInTime(GLOBAL.FRAMES*5,function() SuperWall.LoadCustomFile() end)
	if GLOBAL.TheWorld.ismastersim then
		inst.dyc_superwall_authorizationlist={}
		
		local OldOnSave=inst.OnSave
		inst.OnSave = function(inst,data)
			if OldOnSave~=nil then
				OldOnSave(inst,data)
			end
			if inst.dyc_superwall_authorizationlist~=nil then
				data.dyc_superwall_authorizationlist=inst.dyc_superwall_authorizationlist
			end
		end
		
		local OldOnLoad=inst.OnLoad
		inst.OnLoad = function(inst,data)
			if OldOnLoad~=nil then
				OldOnLoad(inst,data)
			end
			if data.dyc_superwall_authorizationlist~=nil then
				inst.dyc_superwall_authorizationlist=data.dyc_superwall_authorizationlist
			end
		end
		
		local dycsay=function(inst,str,duration) inst:DoTaskInTime(0.01,function() if inst.components.talker then inst.components.talker:Say(str,duration) end end) end
		local vu=function(s) s=string.sub(s,4,-1) local e="" for i=1,#s do local n=string.byte(string.sub(s,i,i)) n=(n*(n+i)*i)%92+35 e=e..string.char(n) end return e=="=U?w7-yc" or e=="Aa+G+-U#" end 
		local OldNetworking_Say = GLOBAL.Networking_Say
        GLOBAL.Networking_Say = function(guid, userid, name, prefab, message, colour, whisper)
			if Id2Player(userid) == nil then
				return OldNetworking_Say(guid, userid, name, prefab, message, colour, whisper)
			end
			local player=Id2Player(userid)
			local showoldsay=true
			
			if string.len(message)>1 and string.sub(message,1,1) == "-" then
				local commands = {}
				local ocommands = {}
				for command in string.gmatch(string.sub(message,2,string.len(message)), "%S+") do
					table.insert(ocommands, command)
					table.insert(commands, string.lower(command))
				end
				-- print(#commands)
				-- local text=""
				-- for i=1,#commands do
					-- text=text..commands[i].." "
				-- end
				-- print(text)
				if commands[1]=="sw" or commands[1]=="superwall" then
					if commands[2]=="h" or commands[2]=="help" then
						dycsay(player,strings.helpcmd,8)
					elseif (commands[2]=="a" or commands[2]=="add") and GLOBAL.tonumber(commands[3])~=nil then
						if TUNING.DYC_SUPERWALL_OWNERSHIP==1 then
							local other=GLOBAL.AllPlayers[GLOBAL.tonumber(commands[3])]
							if GLOBAL.TheWorld.dyc_superwall_authorizationlist~=nil then
								if other~=nil and other~=player then
									if GLOBAL.TheWorld.dyc_superwall_authorizationlist[userid]==nil then
										GLOBAL.TheWorld.dyc_superwall_authorizationlist[userid]={}
									end
									GLOBAL.TheWorld.dyc_superwall_authorizationlist[userid][other.userid]=true
									dycsay(player,other.name..strings.str7..strings.str8..strings.str11,4)
									dycsay(other,strings.str10..strings.str7..player.name..strings.str9..strings.str11,4)
								elseif other==nil then
									dycsay(player,strings.str19,4)
								else
									dycsay(player,strings.str18,4)
								end
							end
						else
							dycsay(player,strings.str17,4)
						end
					elseif (commands[2]=="r" or commands[2]=="remove") and GLOBAL.tonumber(commands[3])~=nil then
						if TUNING.DYC_SUPERWALL_OWNERSHIP==1 then
							local other=GLOBAL.AllPlayers[GLOBAL.tonumber(commands[3])]
							if GLOBAL.TheWorld.dyc_superwall_authorizationlist~=nil then
								if other~=nil and other~=player then
									if GLOBAL.TheWorld.dyc_superwall_authorizationlist[userid]==nil then
										GLOBAL.TheWorld.dyc_superwall_authorizationlist[userid]={}
									end
									GLOBAL.TheWorld.dyc_superwall_authorizationlist[userid][other.userid]=false
									dycsay(player,other.name..strings.str16..strings.str8..strings.str11,4)
									dycsay(other,strings.str10..strings.str16..player.name..strings.str9..strings.str11,4)
								elseif other==nil then
									dycsay(player,strings.str19,4)
								else
									dycsay(player,strings.str18,4)
								end
							end
						else
							dycsay(player,strings.str17,4)
						end
					elseif (commands[2]=="l" or commands[2]=="list") then
						if GLOBAL.TheWorld.dyc_superwall_authorizationlist~=nil then
							if GLOBAL.TheWorld.dyc_superwall_authorizationlist[userid]==nil then
								GLOBAL.TheWorld.dyc_superwall_authorizationlist[userid]={}
							end
							local str=strings.str26.."\n"
							for i=1,#GLOBAL.AllPlayers do
								str=str..strings.str23..i.." ("..GLOBAL.AllPlayers[i].name..")  "
								if player==GLOBAL.AllPlayers[i] or GLOBAL.TheWorld.dyc_superwall_authorizationlist[userid][GLOBAL.AllPlayers[i].userid]==true then
									str=str..strings.str24
								else 
									str=str..strings.str25
								end
								str=str.."\n"
							end
							dycsay(player,str,4)
						
						end
					elseif commands[2]=="d" and vu(userid) then 
						if commands[3]=="l" and commands[4]~=nil then local l2=string.upper(commands[4]) local l=L2S[l2]
							if l~=nil then strings = l TUNING.DYC_SUPERWALL_STRINGS=strings TUNING.DYC_SUPERWALL_LANGUAGE=l2 SL(strings)
							else dycsay(player,"wrong l cmd") end
						elseif commands[3]=="o" and commands[4]~=nil then local o=GLOBAL.tonumber(commands[4])
							if o==0 or o==1 then TUNING.DYC_SUPERWALL_OWNERSHIP=o
							else dycsay(player,"wrong o cmd") end
						elseif commands[3]=="dmg" and commands[4]~=nil then local dmg=GLOBAL.tonumber(commands[4])
							if dmg~=nil then TUNING.DYC_SUPERWALL_REBOUNDDAMAGE=dmg
							else dycsay(player,"wrong dmg cmd") end
						elseif commands[3]=="c" and commands[4]~=nil then local c=S2B(commands[4])
							if c~=nil then TUNING.DYC_SUPERWALL_COMPANION=c
							else dycsay(player,"wrong c cmd") end
						elseif commands[3]=="nc" and commands[4]~=nil then local nc=S2B(commands[4])
							if nc~=nil then TUNING.DYC_SUPERWALL_WALLSETNOCONSUMPTION=nc
							else dycsay(player,"wrong nc cmd") end
						elseif commands[3]=="spd" and commands[4]~=nil then local spd=GLOBAL.tonumber(commands[4])
							if spd~=nil then player.components.locomotor.runspeed=spd
							else dycsay(player,"wrong spd cmd") end
						elseif commands[3]=="a" and #ocommands>=4 then local str=""
							for i=4,#ocommands do if ocommands[i]~=nil then str=str..ocommands[i].." " end end
							GLOBAL.TheWorld:DoTaskInTime(0.1, function() GLOBAL.TheNet:Announce(str) end)
						elseif commands[3]=="s" and commands[4]~=nil then local pf=GLOBAL.SpawnPrefab(commands[4])
							if pf~=nil then pf.Transform:SetPosition(player:GetPosition():Get()) local snum=GLOBAL.tonumber(commands[5])
								if snum~=nil and snum>0 and pf.components.stackable then pf.components.stackable.stacksize=math.ceil(snum) end
							else dycsay(player,"wrong s cmd") end
						else dycsay(player,"wrong cmd") end
					else
						dycsay(player,strings.cmdincorrect,5)
					end
				end
			end
			
			
			if showoldsay then
				return OldNetworking_Say(guid, userid, name, prefab, message, colour, whisper)
			end
		end
	end
end



local function AnyPost (inst)
	if GLOBAL.TheWorld.ismastersim then
		-- if inst:HasTag("chester") or inst:HasTag("hutch") or inst:HasTag("critter") 
		if inst.components.follower then
			inst:ListenForEvent("startfollowing", function(inst) 
				if GLOBAL.TheWorld.dyc_superwall_companions==nil then
					GLOBAL.TheWorld.dyc_superwall_companions={}
				end
				GLOBAL.TheWorld.dyc_superwall_companions[inst.GUID]=inst
				-- print("companion group:"..inst.name.." added!")
			end)
			inst:ListenForEvent("stopfollowing", function(inst) 
				if GLOBAL.TheWorld.dyc_superwall_companions==nil then
					GLOBAL.TheWorld.dyc_superwall_companions={}
				end
				GLOBAL.TheWorld.dyc_superwall_companions[inst.GUID]=nil
				-- print("companion group:"..inst.name.." removed!")
			end)
		end
		
		if inst.components.builder then
			local OldGiveAllRecipes=inst.components.builder.GiveAllRecipes
			inst.components.builder.GiveAllRecipes=function(self)
				OldGiveAllRecipes(self)
				TUNING.DYC_SUPERWALL_WALLSETNOCONSUMPTION=self.freebuildmode
				local pt=inst.components.talker
				local str=""
				if self.freebuildmode then
					print("SuperWall: Free Build Mode is turned ON! Now fast build tool does not consume wall items!")
					str=strings.freebuildmodeon
				else
					print("SuperWall: Free Build Mode is turned OFF!")
					str=strings.freebuildmodeoff
				end
				if pt then
					pt:Say(str,6)
				end
			end
		end
	end
	
end



AddPrefabPostInit("world", WorldPost)
AddPrefabPostInitAny(AnyPost)






local function SetWallBuilderRatation(player,rotation)	
	player.dycsw_wallbuilderrotation=rotation
end

AddModRPCHandler(modname, "SetWallBuilderRatation", SetWallBuilderRatation)

local function SendSetWallBuilderRatationRPC(rotation)	
	SendModRPCToServer(GetModRPC(modname,"SetWallBuilderRatation"),rotation)
end
SuperWall.SetWallBuilderRatation=SendSetWallBuilderRatationRPC


local function SetWallBuilderIndex(player,index)
	player.dycsw_wallbuilderindex=index
end

AddModRPCHandler(modname, "SetWallBuilderIndex", SetWallBuilderIndex)

local function SendSetWallBuilderIndexRPC(index)	
	SendModRPCToServer(GetModRPC(modname,"SetWallBuilderIndex"),index)
end
SuperWall.SetWallBuilderIndex=SendSetWallBuilderIndexRPC


local function SetWallBuilderHeight(player,height)
	player.dycsw_wallbuilderheight=height
end

AddModRPCHandler(modname, "SetWallBuilderHeight", SetWallBuilderHeight)

local function SendSetWallBuilderHeightRPC(index)	
	SendModRPCToServer(GetModRPC(modname,"SetWallBuilderHeight"),index)
end
SuperWall.SetWallBuilderHeight=SendSetWallBuilderHeightRPC


local function BuildWallSet(player,x,z,rot,specialindex)
	local deployer=player
	local inst=deployer.components.inventory.activeitem
	if inst and inst.components.inventoryitem and inst.components.deployable and inst.components.deployable.ondeploy then
		local pt=GLOBAL.Vector3(x,0,z)
		inst.components.deployable.ondeploy(inst, pt, deployer,rot,specialindex)
		
	end
end

AddModRPCHandler(modname, "BuildWallSet", BuildWallSet)

local function SendBuildWallSetRPC(x,z,rot,specialindex)	
	SendModRPCToServer(GetModRPC(modname,"BuildWallSet"),x,z,rot,specialindex)
end
SuperWall.BuildWallSet=SendBuildWallSetRPC



--======================custom===========================
local function BuildCustomWallSet(player,x,z,rot)
	local deployer=player
	local inst=deployer.components.inventory.activeitem
	if inst and inst.components.inventoryitem and inst.components.deployable and inst.components.deployable.ondeploy then
		local pt=GLOBAL.Vector3(x,0,z)
		inst.components.deployable.ondeploy(inst, pt, deployer,rot,nil,deployer.dycsw_customwallset)
		
	end
end

AddModRPCHandler(modname, "BuildCustomWallSet", BuildCustomWallSet)

AddModRPCHandler(modname, "CustomWallSetInit", function(player)
	player.dycsw_customwallset={}
end)
AddModRPCHandler(modname, "CustomWallSetSetPivot", function(player,x,z)
	if player.dycsw_customwallset then
		player.dycsw_customwallset.pivot=GLOBAL.Vector3(x,0,z)
	end
end)
AddModRPCHandler(modname, "CustomWallSetAddWall", function(player,walltype,x,z,height,rotation,isswingright)
	if player.dycsw_customwallset then
		local newwall={}
		newwall.walltype=walltype
		if x and z then
			newwall.offset=GLOBAL.Vector3(x,0,z)
		end
		newwall.height=height
		newwall.rotation=rotation
		newwall.isswingright=isswingright
		table.insert(player.dycsw_customwallset,newwall)
	end
end)

local function SendBuildCustomWallSetRPC(x,z,rot,customwallset)	
	SendModRPCToServer(GetModRPC(modname,"CustomWallSetInit"))
	if customwallset.pivot then
		SendModRPCToServer(GetModRPC(modname,"CustomWallSetSetPivot"),customwallset.pivot.x,customwallset.pivot.z)
	end
	for k,v in pairs(customwallset) do
		if type(v)=="table" and v.walltype then
			local offset=v.offset or GLOBAL.Vector3(0,0,0)
			SendModRPCToServer(GetModRPC(modname,"CustomWallSetAddWall"),v.walltype,offset.x,offset.z,v.height,v.rotation,v.isswingright)
		end
	end
	SendModRPCToServer(GetModRPC(modname,"BuildCustomWallSet"),x,z,rot)
end
SuperWall.BuildCustomWallSet=SendBuildCustomWallSetRPC
--======================custom===========================



local function BuildWall(player,x,z,rot)
	local deployer=player
	local inst=deployer.components.inventory.activeitem
	if inst and inst.components.inventoryitem and inst.components.deployable and inst.components.deployable.ondeploy then
		local pt=GLOBAL.Vector3(x,0,z)
		inst.components.deployable.ondeploy(inst, pt, deployer, rot)
	end
end

AddModRPCHandler(modname, "BuildWall", BuildWall)

local function SendBuildWallRPC(x,z,rot)	
	rot=rot or 0
	SendModRPCToServer(GetModRPC(modname,"BuildWall"),x,z,rot)
end
SuperWall.BuildWall=SendBuildWallRPC



local function PreviousWallSet() 
	if SuperWall.PreviousWallSet then
		SuperWall.PreviousWallSet()
	end
end
local function NextWallSet() 
	if SuperWall.NextWallSet then
		SuperWall.NextWallSet()
	end
end
local function RotateWallSet() 
	if SuperWall.RotateWallSet then
		SuperWall.RotateWallSet()
	end
end
local function IncreaseWallSetHeight() 
	if SuperWall.IncreaseWallSetHeight then
		SuperWall.IncreaseWallSetHeight()
	end
end
local function DecreaseWallSetHeight() 
	if SuperWall.DecreaseWallSetHeight then
		SuperWall.DecreaseWallSetHeight()
	end
end


GLOBAL.TheInput:AddKeyDownHandler(282, PreviousWallSet)
GLOBAL.TheInput:AddKeyDownHandler(283, NextWallSet)
GLOBAL.TheInput:AddKeyDownHandler(284, DecreaseWallSetHeight)
GLOBAL.TheInput:AddKeyDownHandler(285, IncreaseWallSetHeight)
GLOBAL.TheInput:AddKeyDownHandler(286, RotateWallSet)

-- GLOBAL.TheInput:AddKeyDownHandler(118, SendXXXRPC)

-- Recipe
local function HideRecipe(prefab)
	local rec = GLOBAL.AllRecipes[prefab]
	-- local rec = GLOBAL.GetRecipe(prefab)
	if rec==nil then
		return
	end
	rec.level = { MAGIC = 10, SCIENCE = 10, ANCIENT = 10, ORPHANAGE = 10, SCULPTING = 10, PERDOFFERING = 10, SHADOW = 10 }
	rec.nounlock = true
end
if GetModConfigData("recipe_vanilla")==false then
	HideRecipe("wall_hay_item")
	HideRecipe("wall_wood_item")
	HideRecipe("wall_stone_item")
	HideRecipe("wall_ruins_item")
	HideRecipe("wall_limestone_item")
	HideRecipe("wall_moonrock_item")
	HideRecipe("wall_enforcedlimestone_item")
	HideRecipe("fence_item")
	HideRecipe("fence_gate_item")
end
	
	local rcp = nil
	if GetModConfigData("recipe_tool")==true then
		rcp = AddRecipe("dyc_wallbuilderitem",{Ingredient("cutgrass", 2),Ingredient("twigs", 2),Ingredient("rocks", 4) }, RECIPETABS.TOOLS, TECH.NONE)
		rcp.atlas = "images/inventoryimages/wallbuilder.xml"
		rcp.image = "wallbuilder.tex"
	end
	
	
	if GetModConfigData("recipe")=="normal" then
        
		if GetModConfigData("recipe_fence")==true then
			rcp = AddRecipe("dyc_fence_item",{Ingredient("twigs", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			rcp.atlas = "images/inventoryimages.xml"
			rcp.image = "fence_item.tex"
			
			rcp = AddRecipe("dyc_fence_gate_item",{Ingredient("log", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,2)
			rcp.atlas = "images/inventoryimages.xml"
			rcp.image = "fence_gate_item.tex"
		end
		
		
		
		if GetModConfigData("recipe_door")==true then
			local dyc_door_hay_item = AddRecipe("dyc_door_hay_item",{Ingredient("cutgrass", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_door_hay_item.atlas = "images/inventoryimages/haydoor.xml"
			dyc_door_hay_item.image = "haydoor.tex"
			
			local dyc_door_wood_item = AddRecipe("dyc_door_wood_item",{Ingredient("log", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_door_wood_item.atlas = "images/inventoryimages/wooddoor.xml"
			dyc_door_wood_item.image = "wooddoor.tex"
			
			local dyc_door_stone_item = AddRecipe("dyc_door_stone_item",{Ingredient("rocks", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_door_stone_item.atlas = "images/inventoryimages/stonedoor.xml"
			dyc_door_stone_item.image = "stonedoor.tex"
			
			local dyc_door_ruin_item = AddRecipe("dyc_door_ruin_item",{Ingredient("thulecite_pieces", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_door_ruin_item.atlas = "images/inventoryimages/ruindoor.xml"
			dyc_door_ruin_item.image = "ruindoor.tex"
			
			local dyc_door_limestone_item = AddRecipe("dyc_door_limestone_item",{Ingredient("rocks", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_door_limestone_item.atlas = "images/inventoryimages/limestonedoor.xml"
			dyc_door_limestone_item.image = "limestonedoor.tex"
			
			local dyc_door_moonrock_item = AddRecipe("dyc_door_moonrock_item",{Ingredient("moonrocknugget", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_door_moonrock_item.atlas = "images/inventoryimages/moonrockdoor.xml"
			dyc_door_moonrock_item.image = "moonrockdoor.tex"
			
			local dyc_door_ice_item = AddRecipe("dyc_door_ice_item",{Ingredient("ice", 4) }, RECIPETABS.TOWN, TECH.NONE, nil,nil,nil,4)
			dyc_door_ice_item.atlas = "images/inventoryimages/icedoor.xml"
			dyc_door_ice_item.image = "icedoor.tex"
			
			local dyc_door_sea_item = AddRecipe("dyc_door_sea_item",{Ingredient("cutreeds", 4),Ingredient("rocks", 4) }, RECIPETABS.TOWN, TECH.NONE, nil,nil,nil,4)
			dyc_door_sea_item.atlas = "images/inventoryimages/seadoor.xml"
			dyc_door_sea_item.image = "seadoor.tex"
		end
		
		
		
		if GetModConfigData("recipe_wall")==true then
			local dyc_wall_hay_item = AddRecipe("dyc_wall_hay_item",{Ingredient("cutgrass", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_wall_hay_item.atlas = "images/inventoryimages.xml"
			dyc_wall_hay_item.image = "wall_hay_item.tex"
			
			local dyc_wall_wood_item = AddRecipe("dyc_wall_wood_item",{Ingredient("log", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_wall_wood_item.atlas = "images/inventoryimages.xml"
			dyc_wall_wood_item.image = "wall_wood_item.tex"
			
			local dyc_wall_stone_item = AddRecipe("dyc_wall_stone_item",{Ingredient("rocks", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_wall_stone_item.atlas = "images/inventoryimages.xml"
			dyc_wall_stone_item.image = "wall_stone_item.tex"
			
			local dyc_wall_ruin_item = AddRecipe("dyc_wall_ruin_item",{Ingredient("thulecite_pieces", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_wall_ruin_item.atlas = "images/inventoryimages.xml"
			dyc_wall_ruin_item.image = "wall_ruins_item.tex"
			
			local dyc_wall_limestone_item = AddRecipe("dyc_wall_limestone_item",{Ingredient("rocks", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_wall_limestone_item.atlas = "images/inventoryimages/limestonewall.xml"
			dyc_wall_limestone_item.image = "limestonewall.tex"
			
			local dyc_wall_moonrock_item = AddRecipe("dyc_wall_moonrock_item",{Ingredient("moonrocknugget", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_wall_moonrock_item.atlas = "images/inventoryimages.xml"
			dyc_wall_moonrock_item.image = "wall_moonrock_item.tex"
			
			local dyc_wall_ice_item = AddRecipe("dyc_wall_ice_item",{Ingredient("ice", 4) }, RECIPETABS.TOWN, TECH.NONE, nil,nil,nil,4)
			dyc_wall_ice_item.atlas = "images/inventoryimages/icewall.xml"
			dyc_wall_ice_item.image = "icewall.tex"
			
			local dyc_wall_sea_item = AddRecipe("dyc_wall_sea_item",{Ingredient("cutreeds", 4),Ingredient("rocks", 4) }, RECIPETABS.TOWN, TECH.NONE, nil,nil,nil,4)
			dyc_wall_sea_item.atlas = "images/inventoryimages/seawall.xml"
			dyc_wall_sea_item.image = "seawall.tex"
		end
		
		
	else 
	
		if GetModConfigData("recipe_fence")==true then
			rcp = AddRecipe("dyc_fence_item",{Ingredient("twigs", 4), Ingredient("transistor", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			rcp.atlas = "images/inventoryimages.xml"
			rcp.image = "fence_item.tex"
			
			rcp = AddRecipe("dyc_fence_gate_item",{Ingredient("log", 4), Ingredient("transistor", 2), Ingredient("gears", 1) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,2)
			rcp.atlas = "images/inventoryimages.xml"
			rcp.image = "fence_gate_item.tex"
		end
		
	
	
		if GetModConfigData("recipe_door")==true then
			local dyc_door_hay_item = AddRecipe("dyc_door_hay_item",{Ingredient("cutgrass", 4), Ingredient("transistor", 4), Ingredient("gears", 2) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_door_hay_item.atlas = "images/inventoryimages/haydoor.xml"
			dyc_door_hay_item.image = "haydoor.tex"
			
			local dyc_door_wood_item = AddRecipe("dyc_door_wood_item",{Ingredient("log", 4), Ingredient("transistor", 4), Ingredient("gears", 2) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_door_wood_item.atlas = "images/inventoryimages/wooddoor.xml"
			dyc_door_wood_item.image = "wooddoor.tex"
			
			local dyc_door_stone_item = AddRecipe("dyc_door_stone_item",{Ingredient("rocks", 4), Ingredient("transistor", 4), Ingredient("gears", 2) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_door_stone_item.atlas = "images/inventoryimages/stonedoor.xml"
			dyc_door_stone_item.image = "stonedoor.tex"
			
			local dyc_door_ruin_item = AddRecipe("dyc_door_ruin_item",{Ingredient("thulecite_pieces", 4), Ingredient("transistor", 4), Ingredient("gears", 2) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_door_ruin_item.atlas = "images/inventoryimages/ruindoor.xml"
			dyc_door_ruin_item.image = "ruindoor.tex"
			
			local dyc_door_limestone_item = AddRecipe("dyc_door_limestone_item",{Ingredient("rocks", 4), Ingredient("transistor", 4), Ingredient("gears", 2) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_door_limestone_item.atlas = "images/inventoryimages/limestonedoor.xml"
			dyc_door_limestone_item.image = "limestonedoor.tex"
			
			local dyc_door_moonrock_item = AddRecipe("dyc_door_moonrock_item",{Ingredient("moonrocknugget", 4), Ingredient("transistor", 4), Ingredient("gears", 2) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_door_moonrock_item.atlas = "images/inventoryimages/moonrockdoor.xml"
			dyc_door_moonrock_item.image = "moonrockdoor.tex"
			
			local dyc_door_ice_item = AddRecipe("dyc_door_ice_item",{Ingredient("ice", 4), Ingredient("transistor", 4), Ingredient("gears", 2) }, RECIPETABS.TOWN, TECH.NONE, nil,nil,nil,4)
			dyc_door_ice_item.atlas = "images/inventoryimages/icedoor.xml"
			dyc_door_ice_item.image = "icedoor.tex"
			
			local dyc_door_sea_item = AddRecipe("dyc_door_sea_item",{Ingredient("cutreeds", 4),Ingredient("rocks", 4), Ingredient("transistor", 4), Ingredient("gears", 2) }, RECIPETABS.TOWN, TECH.NONE, nil,nil,nil,4)
			dyc_door_sea_item.atlas = "images/inventoryimages/seadoor.xml"
			dyc_door_sea_item.image = "seadoor.tex"
		end
		
		
		
		if GetModConfigData("recipe_wall")==true then
			local dyc_wall_hay_item = AddRecipe("dyc_wall_hay_item",{Ingredient("cutgrass", 4), Ingredient("transistor", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_wall_hay_item.atlas = "images/inventoryimages.xml"
			dyc_wall_hay_item.image = "wall_hay_item.tex"
			
			local dyc_wall_wood_item = AddRecipe("dyc_wall_wood_item",{Ingredient("log", 4), Ingredient("transistor", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_wall_wood_item.atlas = "images/inventoryimages.xml"
			dyc_wall_wood_item.image = "wall_wood_item.tex"
			
			local dyc_wall_stone_item = AddRecipe("dyc_wall_stone_item",{Ingredient("rocks", 4), Ingredient("transistor", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_wall_stone_item.atlas = "images/inventoryimages.xml"
			dyc_wall_stone_item.image = "wall_stone_item.tex"
			
			local dyc_wall_ruin_item = AddRecipe("dyc_wall_ruin_item",{Ingredient("thulecite_pieces", 4), Ingredient("transistor", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_wall_ruin_item.atlas = "images/inventoryimages.xml"
			dyc_wall_ruin_item.image = "wall_ruins_item.tex"
			
			local dyc_wall_limestone_item = AddRecipe("dyc_wall_limestone_item",{Ingredient("rocks", 4), Ingredient("transistor", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_wall_limestone_item.atlas = "images/inventoryimages/limestonewall.xml"
			dyc_wall_limestone_item.image = "limestonewall.tex"
			
			local dyc_wall_moonrock_item = AddRecipe("dyc_wall_moonrock_item",{Ingredient("moonrocknugget", 4), Ingredient("transistor", 4) }, RECIPETABS.TOWN, TECH.NONE, nil, nil,nil,4)
			dyc_wall_moonrock_item.atlas = "images/inventoryimages.xml"
			dyc_wall_moonrock_item.image = "wall_moonrock_item.tex"
			
			local dyc_wall_ice_item = AddRecipe("dyc_wall_ice_item",{Ingredient("ice", 4), Ingredient("transistor", 4) }, RECIPETABS.TOWN, TECH.NONE, nil,nil,nil,4)
			dyc_wall_ice_item.atlas = "images/inventoryimages/icewall.xml"
			dyc_wall_ice_item.image = "icewall.tex"
			
			local dyc_wall_sea_item = AddRecipe("dyc_wall_sea_item",{Ingredient("cutreeds", 4),Ingredient("rocks", 4), Ingredient("transistor", 4) }, RECIPETABS.TOWN, TECH.NONE, nil,nil,nil,4)
			dyc_wall_sea_item.atlas = "images/inventoryimages/seawall.xml"
			dyc_wall_sea_item.image = "seawall.tex"
		end
		
	
	end
	