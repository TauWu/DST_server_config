_G=GLOBAL

PrefabFiles = {
	"spy",
	"spy_skins",
	"inviswatch",
	"knife",
    "goldenknife",
    "hat_box",
    "spykunai",
	"spycicle", }

Assets = {
    Asset( "IMAGE", "bigportraits/spy.tex" ),
    Asset( "ATLAS", "bigportraits/spy.xml" ),
	--Skins
	Asset( "IMAGE", "bigportraits/spy_blu.tex" ),
    Asset( "ATLAS", "bigportraits/spy_blu.xml" ),
	Asset( "IMAGE", "bigportraits/spy_rose.tex" ),
    Asset( "ATLAS", "bigportraits/spy_rose.xml" ),
	--
	Asset( "IMAGE", "images/map_icons/spy.tex" ),
	Asset( "ATLAS", "images/map_icons/spy.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_spy.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_spy.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_spy.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_spy.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_spy.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_spy.xml" ),
	
	Asset( "IMAGE", "images/names_spy.tex" ),
    Asset( "ATLAS", "images/names_spy.xml" ),
	Asset( "IMAGE", "images/names_gold_spy.tex" ),
    Asset( "ATLAS", "images/names_gold_spy.xml" ),
	
    Asset( "IMAGE", "bigportraits/spy_none.tex" ),
    Asset( "ATLAS", "bigportraits/spy_none.xml" ),
}

local s = _G.STRINGS
local Recipe = GLOBAL.Recipe

s.CHARACTER_TITLES.spy = "The Globe-trotting Rogue"
s.CHARACTER_NAMES.spy = "The Spy"
s.CHARACTER_DESCRIPTIONS.spy = "*Has his trusty cloaking device\n*Loves stabbing with his unique knives\n*Hates food spoilage"
s.CHARACTER_QUOTES.spy = "\"I never really was on your side.\""

s.NAMES.SPY = "Spy"
s.CHARACTERS.SPY = _G.require "speech_spy"

s.SKIN_QUOTES.spy_blu = "Gentlemen."
s.SKIN_NAMES.spy_blu = "BLU"
s.SKIN_QUOTES.spy_rose = "Ah, ma petit chou-fleur"
s.SKIN_NAMES.spy_rose = "Rose"

TUNING.KNIFE_DAMAGE = GetModConfigData("bknifedmg")
TUNING.KNIFE_USES = GetModConfigData("bknifeuses")
TUNING.GOLDKNIFE_DAMAGE = GetModConfigData("goldenknifedmg")
TUNING.GOLDKNIFE_USES = GetModConfigData("goldenknifeuses")
TUNING.CKUNAI_DAMAGE = GetModConfigData("kunaidmg")
TUNING.CKUNAI_USES = GetModConfigData("kunaiuses")
TUNING.SPYCICLE_DAMAGE = GetModConfigData("scicledmg")
TUNING.SPYCICLE_USES = GetModConfigData("scicleuses")
TUNING.BACKSTAB_MULT = GetModConfigData("spybackstab")

s.CHARACTERS.SPY.DESCRIBE.INVISWATCH = "This will be the last time you see me."
s.CHARACTERS.GENERIC.DESCRIBE.INVISWATCH = "What a scientific wristwatch filled with nightmares!"
s.CHARACTERS.WILLOW.DESCRIBE.INVISWATCH = "It would look prettier on fire."
s.CHARACTERS.WOLFGANG.DESCRIBE.INVISWATCH = "Is too tiny for wrist."
s.CHARACTERS.WENDY.DESCRIBE.INVISWATCH = "You can't hide forever."
s.CHARACTERS.WX78.DESCRIBE.INVISWATCH = "INFERIOR TECHNOLOGY DETECTED"
s.CHARACTERS.WICKERBOTTOM.DESCRIBE.INVISWATCH = "It seems to be a highly developed sci-fi espionage wristwatch."
s.CHARACTERS.WOODIE.DESCRIBE.INVISWATCH = "I'm not the biggest fan of watches, eh."
s.CHARACTERS.WAXWELL.DESCRIBE.INVISWATCH = "A cheater's contraption."
s.CHARACTERS.WATHGRITHR.DESCRIBE.INVISWATCH = "This is not armour fit for Vikings!"
s.CHARACTERS.WEBBER.DESCRIBE.INVISWATCH = "We've never seen a watch like this before!"
s.CHARACTERS.WINONA.DESCRIBE.INVISWATCH = "My head's feeling fuzzy being around that lil' gadget."
AddPrefabPostInit("forest", function(inst)
        if s.CHARACTERS.TF2SOLDIER then
s.CHARACTERS.TF2SOLDIER.DESCRIBE.INVISWATCH = "Words cannot express how much I hate France right now!"
end
        if s.CHARACTERS.DEMOMAN then
s.CHARACTERS.DEMOMAN.DESCRIBE.INVISWATCH = "Stop ya hidin' and fight me face-to-face ya back-pokin' snake!"
end
end)

s.NAMES.INVISWATCH = "Invis Watch"

s.CHARACTERS.SPY.DESCRIBE.KNIFE = "Shock, blood loss, infection; Oh ho ho ho, I love stabbing!"
s.CHARACTERS.GENERIC.DESCRIBE.KNIFE = "To stab tiny foes!"
s.CHARACTERS.WILLOW.DESCRIBE.KNIFE = "It's pokey!"
s.CHARACTERS.WOLFGANG.DESCRIBE.KNIFE = "Is sharp and small!"
s.CHARACTERS.WENDY.DESCRIBE.KNIFE = "Sharp and ready to kill."
s.CHARACTERS.WX78.DESCRIBE.KNIFE = "THIS KNIFE IS SHARPER THAN EXPECTED"
s.CHARACTERS.WICKERBOTTOM.DESCRIBE.KNIFE = "The hinges of this balisong appear to be cemented."
s.CHARACTERS.WOODIE.DESCRIBE.KNIFE = "Why use a tiny knife when you have an axe?"
s.CHARACTERS.WAXWELL.DESCRIBE.KNIFE = "Yup, a pocket knife."
s.CHARACTERS.WATHGRITHR.DESCRIBE.KNIFE = "Tiny spear!"
s.CHARACTERS.WEBBER.DESCRIBE.KNIFE = "We should be careful around this tiny knife."
s.CHARACTERS.WINONA.DESCRIBE.KNIFE = "I ain't playing tricks with no back stabbers."
AddPrefabPostInit("forest", function(inst)
        if s.CHARACTERS.DEMOMAN then
s.CHARACTERS.DEMOMAN.DESCRIBE.KNIFE = "Ya alley-skulkin' backstabber!"
end
        if s.CHARACTERS.TF2SOLDIER then
s.CHARACTERS.TF2SOLDIER.DESCRIBE.KNIFE = "American knives are bigger and sharper!"
end
end)

s.CHARACTERS.SPY.DESCRIBE.GOLDENKNIFE = "It's the only one of it's kind! And it's mine!"
s.CHARACTERS.GENERIC.DESCRIBE.GOLDENKNIFE = "Stabbing has never been so fancy!"
s.CHARACTERS.WILLOW.DESCRIBE.GOLDENKNIFE = "It won't light people on fire, but at least it's shiny."
s.CHARACTERS.WOLFGANG.DESCRIBE.GOLDENKNIFE = "Fancy knife good for stab."
s.CHARACTERS.WENDY.DESCRIBE.GOLDENKNIFE = "At least I can kill with style."
s.CHARACTERS.WX78.DESCRIBE.GOLDENKNIFE = "GOLD IS MORE DURABLE?"
s.CHARACTERS.WICKERBOTTOM.DESCRIBE.GOLDENKNIFE = "The most malleable of metals, but let's see how this punctures."
s.CHARACTERS.WOODIE.DESCRIBE.GOLDENKNIFE = "It's pretty but it can't chop down trees."
s.CHARACTERS.WAXWELL.DESCRIBE.GOLDENKNIFE = "It gets sharper with every jab."
s.CHARACTERS.WATHGRITHR.DESCRIBE.GOLDENKNIFE = "A tiny spear with tiny gold!"
s.CHARACTERS.WEBBER.DESCRIBE.GOLDENKNIFE = "We agree that we shouldn't get this dirty."
s.CHARACTERS.WINONA.DESCRIBE.KNIFE = "This ought to be the snootiest tool for killing I've ever seen!"
AddPrefabPostInit("forest", function(inst)
        if s.CHARACTERS.DEMOMAN then
s.CHARACTERS.DEMOMAN.DESCRIBE.GOLDENKNIFE = "Keep yer little baby knives away from me!"
end
        if s.CHARACTERS.TF2SOLDIER then
s.CHARACTERS.TF2SOLDIER.DESCRIBE.GOLDENKNIFE = "Keep your shiny toys to yourself, crouton."
end
end)

s.CHARACTERS.SPY.DESCRIBE.HAT_BOX = "Oh hohoho!"
s.CHARACTERS.GENERIC.DESCRIBE.HAT_BOX = "For all your box-wearing needs!"
s.CHARACTERS.WILLOW.DESCRIBE.HAT_BOX = "I bet it shimmers when burnt."
s.CHARACTERS.WOLFGANG.DESCRIBE.HAT_BOX = "I'm so sneaky!"
s.CHARACTERS.WENDY.DESCRIBE.HAT_BOX = "To disappear to those who are foolish enough to believe it."
s.CHARACTERS.WX78.DESCRIBE.HAT_BOX = "HOW DEMEANING"
s.CHARACTERS.WICKERBOTTOM.DESCRIBE.HAT_BOX = "Comical camouflage."
s.CHARACTERS.WOODIE.DESCRIBE.HAT_BOX = "It's good for hiding from nature."
s.CHARACTERS.WAXWELL.DESCRIBE.HAT_BOX = "There's room in there for me."
s.CHARACTERS.WATHGRITHR.DESCRIBE.HAT_BOX = "This is not proper stealth gear!"
s.CHARACTERS.WEBBER.DESCRIBE.HAT_BOX = "I love hiding in this box!"
s.CHARACTERS.WINONA.DESCRIBE.HAT_BOX = "You've got to be joking."
AddPrefabPostInit("forest", function(inst)
        if s.CHARACTERS.DEMOMAN then
s.CHARACTERS.DEMOMAN.DESCRIBE.HAT_BOX = "I hope I didn't scare you with my face-to-face man fightin!"
end
        if s.CHARACTERS.TF2SOLDIER then
s.CHARACTERS.TF2SOLDIER.DESCRIBE.HAT_BOX = "Your small box does not stop American bullets."
end
end)

s.CHARACTERS.SPY.DESCRIBE.SPYKUNAI = "Ah, stab wounds. My favorite type of wound!"
s.CHARACTERS.GENERIC.DESCRIBE.SPYKUNAI = "I must learn how to use this ninja weapon someday."
s.CHARACTERS.WILLOW.DESCRIBE.SPYKUNAI = "I don't know how to use this dumb thing!"
s.CHARACTERS.WOLFGANG.DESCRIBE.SPYKUNAI = "Is a small weapon."
s.CHARACTERS.WENDY.DESCRIBE.SPYKUNAI = "An old conniver's murdering tool."
s.CHARACTERS.WX78.DESCRIBE.SPYKUNAI = "BEST USED AGAINST FLESHLINGS"
s.CHARACTERS.WICKERBOTTOM.DESCRIBE.SPYKUNAI = "An ancient Japanese trowel. It can also be used as a multi-functional weapon."
s.CHARACTERS.WOODIE.DESCRIBE.SPYKUNAI = "How do I use this, eh?"
s.CHARACTERS.WAXWELL.DESCRIBE.SPYKUNAI = "Ah, the ancient gardening tool turned weapon."
s.CHARACTERS.WATHGRITHR.DESCRIBE.SPYKUNAI = "The mighty Japanese throwing weapon!"
s.CHARACTERS.WEBBER.DESCRIBE.SPYKUNAI = "Handling this seems dangerous!"
s.CHARACTERS.WINONA.DESCRIBE.SPYKUNAI = "This is no way near my area of workin'!"
AddPrefabPostInit("forest", function(inst)
        if s.CHARACTERS.DEMOMAN then
s.CHARACTERS.DEMOMAN.DESCRIBE.SPYKUNAI = "I'd need me eye back to aim with this bloody thing."
end
        if s.CHARACTERS.TF2SOLDIER then
s.CHARACTERS.TF2SOLDIER.DESCRIBE.SPYKUNAI = "Get your non-American crap out of my face!"
end
end)

s.CHARACTERS.SPY.DESCRIBE.SPYCICLE = "Time for the killing stroke!"
s.CHARACTERS.GENERIC.DESCRIBE.SPYCICLE = "These things can be extremely dangerous when weaponized."
s.CHARACTERS.WILLOW.DESCRIBE.SPYCICLE = "Cold ice can leave a nasty burn, I suppose."
s.CHARACTERS.WOLFGANG.DESCRIBE.SPYCICLE = "Is cold and sharp!"
s.CHARACTERS.WENDY.DESCRIBE.SPYCICLE = "To put a cold dark end to whomever dares test it."
s.CHARACTERS.WX78.DESCRIBE.SPYCICLE = "NOW THIS IS HOW YOU USE WATER"
s.CHARACTERS.WICKERBOTTOM.DESCRIBE.SPYCICLE = "These are known for their horrific outcomes when falling onto a person. Be careful."
s.CHARACTERS.WOODIE.DESCRIBE.SPYCICLE = "These things were everywhere back home."
s.CHARACTERS.WAXWELL.DESCRIBE.SPYCICLE = "Now that's how you make use of an icicle."
s.CHARACTERS.WATHGRITHR.DESCRIBE.SPYCICLE = "Weaponized sticks of ice!"
s.CHARACTERS.WEBBER.DESCRIBE.SPYCICLE = "Brr! It's cold and pointy!"
s.CHARACTERS.WINONA.DESCRIBE.SPYCICLE = "You stab people with bits of ice where ya from?"
AddPrefabPostInit("forest", function(inst)
        if s.CHARACTERS.DEMOMAN then
s.CHARACTERS.DEMOMAN.DESCRIBE.SPYCICLE = "It be a wee back-poker!"
end
        if s.CHARACTERS.TF2SOLDIER then
s.CHARACTERS.TF2SOLDIER.DESCRIBE.SPYCICLE = "The power of Smissmas compels you!"
end
end)

s.NAMES.HAT_BOX = "Box Hat"
s.RECIPE_DESC.HAT_BOX = "The original stealth device."

s.NAMES.KNIFE = "Butterfly Knife"
s.RECIPE_DESC.KNIFE = "Backstab your enemies!"

s.NAMES.GOLDENKNIFE = "Austrailium Knife"
s.RECIPE_DESC.GOLDENKNIFE = "Not made of real Austrailium."

s.NAMES.SPYKUNAI = "Conniver's Kunai"
s.RECIPE_DESC.SPYKUNAI = "Leech health from fallen foes."

s.NAMES.SPYCICLE = "Spy-cicle"
s.RECIPE_DESC.SPYCICLE = "Ice retooled into a murderous weapon."

s.CHARACTERS.GENERIC.DESCRIBE.SPY = 
{
	GENERIC = "Greetings, %s!",
	ATTACKER = "That %s looks shifty...",
	MURDERER = "Murderer!",
    REVIVER = "%s is using his powers for good.",
	GHOST = "Don't look at me like that, %s! I'm working on it!",
	FIRESTARTER = "%s's just asking to get roasted.",
}
-- More characters
AddPrefabPostInit("forest", function(inst)
if s.CHARACTERS.DEMOMAN then
s.CHARACTERS.DEMOMAN.DESCRIBE.SPY = 
{
	GENERIC = "Aye, how are ya doin' ya snake?",
	ATTACKER = "That Spy's a bloody traitor!",
	MURDERER = "Yer a back-pokin' snake, and by God you'll die like one!",
	REVIVER = "%s, I didn't need yer help, you know.",
	GHOST = "Let that be a bloody lesson to ya!",
	FIRESTARTER = "You've brought shame onto your people, lad.",
}
end
if s.CHARACTERS.TF2SOLDIER then
s.CHARACTERS.TF2SOLDIER.DESCRIBE.SPY = 
{
	GENERIC = "Spy in our midst, men!",
	ATTACKER = "That Spy is not one of ours!",
	MURDERER = "Boys, we have a traitor!",
	REVIVER = "Nice work.",
	GHOST = "You just got your Frenchie ass dominated.",
	FIRESTARTER = "The spy is starting fires!",
}
end
end)
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.SPY = 
{
	GENERIC = "Hi, %s!",
	ATTACKER = "You can't trust spies!",
	MURDERER = "You cannot be trusted! Burn!!",
	REVIVER = "You do care about us, %s!",
	GHOST = "You need a heart %s, Hee Hee!",
	FIRESTARTER = "Burn it all, %s! Burn it!",
}
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.SPY = 
{
	GENERIC = "Is tiny masked-man, %s! Hello!",
	ATTACKER = "Does masked-man want to fight? Ha Ha! Tiny knife is no match!",
	MURDERER = "Wolfgang thought %s was changed! Killer!",
	REVIVER = "%s cares! Ha Ha!",
	GHOST = "%s is friend of Wolfgang! I will get heart!",
	FIRESTARTER = "Is dastardly plan with fire, %s?",
}
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.SPY = 
{
	GENERIC = "How do you do, %s?",
	ATTACKER = "A man whose job was to kill cannot be trusted.",
	MURDERER = "You will be granted death the same as you have granted others.",
	REVIVER = "You have gained Abigail's respects, %s.",
	GHOST = "Are you in need of reviving because of attempted murder, %s?",
	FIRESTARTER = "You cannot hide in flames, %s.",
}
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.SPY = 
{
	GENERIC = "DETECTING... %s!",
	ATTACKER = "SPY DETECTED.",
	MURDERER = "YOU WILL DECIET NO MORE WITH SMALL KNIVES. DIE!",
	REVIVER = "%s CARES MORE THAN THEY LEAD ON.",
	GHOST = "%s'S FRAIL FLESHLING BODY WAS IRONICALLY PUNCTURED.",
	FIRESTARTER = "AT LEAST THERE'S STILL A BIT OF EVIL IN HIM",
}
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.SPY = 
{
	GENERIC = "Ah, greetings dear %s!",
	ATTACKER = "Up to some of your fancy tricks, are you %s?",
	MURDERER = "You will not sneak past me, %s!",
	REVIVER = "There's some good to be found in everyone.",
	GHOST = "Stings, doesn't it dear? I'll fetch you a heart.",
	FIRESTARTER = "Lighting fires are we now, %s? Tread carefully.",
}
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.SPY = 
{
	GENERIC = "Hey it's my spy buddy, %s!",
	ATTACKER = "Looks like I'm the fancier one here, %s!",
	MURDERER = "Your cheap kills will bring you a choppin', %s!",
	REVIVER = "%s, maybe I misjudged you.",
	GHOST = "Lucy says people who don't help other deserve help anyway. Let's get goin'.",
	FIRESTARTER = "You'll not want to be burning things, bud.",
}
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.SPY = 
{
	GENERIC = "Greetings, Mr %s.",
	ATTACKER = "I'm familiar with that type of look. What are you up to, %s?",
	MURDERER = "Your murder habits will be the end of you!",
	REVIVER = "%s cares a lot more about others than I do.",
	GHOST = "At least I don't have to look at your wilted suit, %s.",
    FIRESTARTER = "Finally changed your mind about things, %s?",
}
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.SPY = 
{
	GENERIC = "Greetings %s, my ally!",
	ATTACKER = "Feeling the passion of a snake as usual, %s.",
	MURDERER = "How many tricks do you have, %s?",
	REVIVER = "Kindness has been found within %s!",
	GHOST = "A heart could return %s to this realm if we so wished.",
	FIRESTARTER = "Loki has brought %s into a world of flame.",
}
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.SPY = 
{
	GENERIC = "Hi %s! Love the suit!",
	ATTACKER = "%s looks meaner than usual.",
	MURDERER = "Why do you love to hurt, %s?",
	REVIVER = "You are not killing someone for once, %s!",
	GHOST = "Not even killers deserve to be stuck like that, %s!",
	FIRESTARTER = "Don't burn our things please. We like them.",
}
GLOBAL.STRINGS.CHARACTERS.WINONA.DESCRIBE.SPY = 
{
	GENERIC = "Hey there, %s. Got my eyes locked on you and your knife.",
	ATTACKER = "Yikes! %s is starting to swing that knife of theirs!",
	MURDERER = "I have no mercy for back stabbers! I'm gonna break ya to bits, %s!",
	REVIVER = "This ought to be a sign to keep doin good and not stabbing backs, %s!",
	GHOST = "That's where a desire for murdering gets ya, %s.",
	FIRESTARTER = "I've had enough of sleazy jerks in suits mysteriously burning things up!",
}

--Box trot crafting recipe. Craftable for all players.
if GetModConfigData("boxtrotcrafting") == "y" then
local hat_box = Recipe("hat_box",{Ingredient("rope", 1),Ingredient("boards", 4)}, _G.RECIPETABS.DRESS, _G.TECH.SCIENCE_TWO)
hat_box.atlas = "images/inventoryimages/hat_box.xml"
end
if GetModConfigData("boxtrotcrafting") == "n" then
local hat_boxrecipe = AddRecipe("hat_box", 
{Ingredient("rope", 1),Ingredient("boards", 4)},
_G.RECIPETABS.DRESS, _G.TECH.SCIENCE_TWO, nil, nil, nil, nil, "spy", "images/inventoryimages/hat_box.xml")
hat_boxrecipe.sortkey = -1
end

--Spy specific knife recipes
local goldenkniferecipe = AddRecipe("goldenknife", 
{Ingredient("goldnugget", 2), Ingredient("butterflywings", 2), Ingredient("twigs", 4)}, 
_G.RECIPETABS.WAR, _G.TECH.SCIENCE_TWO, nil, nil, nil, nil, "spy", "images/inventoryimages/goldenknife.xml")
goldenkniferecipe.sortkey = -3
local kniferecipe = AddRecipe("knife", 
{Ingredient("flint", 1), Ingredient("butterflywings", 2), Ingredient("twigs", 1)},
_G.RECIPETABS.WAR, _G.TECH.NONE, nil, nil, nil, nil, "spy", "images/inventoryimages/knife.xml")
kniferecipe.sortkey = -4
local spykunairecipe = AddRecipe("spykunai", 
{Ingredient("nightmarefuel", 1), Ingredient("flint", 2), Ingredient("rope", 2)},
_G.RECIPETABS.WAR, _G.TECH.SCIENCE_TWO, nil, nil, nil, nil, "spy", "images/inventoryimages/spykunai.xml")
spykunairecipe.sortkey = -2
local spyciclerecipe = AddRecipe("spycicle", 
{Ingredient("ice", 6)},
_G.RECIPETABS.WAR, _G.TECH.SCIENCE_TWO, nil, nil, nil, nil, "spy", "images/inventoryimages/spycicle.xml")
spyciclerecipe.sortkey = -1

modimport("inviswatchclient.lua")
AddMinimapAtlas("images/map_icons/spy.xml")
AddModCharacter("spy","MALE")
modimport("scripts/tf2spymod_skins.lua")