local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

GLOBAL.STRINGS.CHARACTER_TITLES.medic = "The Teutonic Man of Medicine"
GLOBAL.STRINGS.CHARACTER_NAMES.medic = "The Medic"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.medic = "*Has a passive health regen, but takes more damage\n*Can craft his various saws\n*Has his own healing methods"
GLOBAL.STRINGS.CHARACTER_QUOTES.medic = "\"Prepare for your examination!\""
STRINGS.CHARACTER_ABOUTME.medic = "With trembling enthusiasm for plunging his saws into exposed flesh, The Medic lacks basic morals for those he attends to."
GLOBAL.STRINGS.CHARACTERS.MEDIC = require "speech_medic"

GLOBAL.STRINGS.SKIN_QUOTES.medic_blu = "I healed the man who will kill you!"
GLOBAL.STRINGS.SKIN_NAMES.medic_blu = "BLU"
GLOBAL.STRINGS.SKIN_QUOTES.medic_survivor = "The healing is not as rewarding as the hurting."
GLOBAL.STRINGS.SKIN_NAMES.medic_survivor = "The Survivor"
GLOBAL.STRINGS.SKIN_QUOTES.medic_formal = "Oktoberfest!"
GLOBAL.STRINGS.SKIN_NAMES.medic_formal = "Guest of Honor"
GLOBAL.STRINGS.SKIN_QUOTES.medic_shadow = "I am the Übermensch!"
GLOBAL.STRINGS.SKIN_NAMES.medic_shadow = "The Triumphant"

GLOBAL.STRINGS.NAMES.MEDIC = "Medic"

RemapSoundEvent( "dontstarve/characters/medic/talk_LP", "medic/medic/talk_LP" )
RemapSoundEvent( "dontstarve/characters/medic/ghost_LP", "medic/medic/ghost_LP" )
RemapSoundEvent( "dontstarve/characters/medic/hurt", "medic/medic/hurt" )
RemapSoundEvent( "dontstarve/characters/medic/death_voice", "medic/medic/death_voice" )
RemapSoundEvent( "dontstarve/characters/medic/emote", "medic/medic/emote" )
RemapSoundEvent( "dontstarve/characters/medic/yawn", "medic/medic/yawn" )
RemapSoundEvent( "dontstarve/characters/medic/eye_rub_vo", "medic/medic/eye_rub_vo" )
RemapSoundEvent( "dontstarve/characters/medic/pose", "medic/medic/pose" )
RemapSoundEvent( "dontstarve/characters/medic/carol", "medic/medic/carol" )

GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BONESAW = "How scientific!"
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.BONESAW = "Its points are dulled down."
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.BONESAW = "Is sharp at weird angle."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.BONESAW = "It's worn to the point it can barely cut bone."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.BONESAW = "FLESHLINGS STAND NO CHANCE"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.BONESAW = "Don't grab the pointy end of this medical tool."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.BONESAW = "I'll always prefer a good axe over a saw."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.BONESAW = "Who's to say a doctor can't have a little fun?"
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.BONESAW = "It's some sort of deformed spear!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.BONESAW = "We could hit stuff with the pointy bits!"
GLOBAL.STRINGS.CHARACTERS.WINONA.DESCRIBE.BONESAW = "I don't see myself as the doctoring type."
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.BONESAW = "Look at this thing, bah!"
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.BONESAW = "You do not skip around in this man's battlefield with a weapon like that!"
end
end)

GLOBAL.STRINGS.NAMES.BONESAW = "Bonesaw"
GLOBAL.STRINGS.RECIPE_DESC.BONESAW = "Good for sawing through bones."

GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.UBERSAW = "I can now benefit from other's suffering!"
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.UBERSAW = "This needle will give someone a nice burn!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.UBERSAW = "It make me feel strong when fight!"
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.UBERSAW = "Life brings pain, pain brings life."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.UBERSAW = "ATTACK AND GAIN BENEFITS FROM KILLING FLESHLINGS"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.UBERSAW = "Jabbing the pointy end of this strange tool into another will grant me medical blessings."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.UBERSAW = "Healthiness in tool form."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.UBERSAW = "Nothing but classic venom and ash to puncture with."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.UBERSAW = "I do not need healing to take on any foe!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.UBERSAW = "If we hit stuff with the point we feel better!"
GLOBAL.STRINGS.CHARACTERS.WINONA.DESCRIBE.UBERSAW = "Nothing like taking something else's life force and givin' it to me!"
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.UBERSAW = "This bloody thing sucks the life outta ya!"
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.UBERSAW = "That is not a weapon, this is proof that you hate America!"
end
end)

GLOBAL.STRINGS.NAMES.UBERSAW = "Übersaw"
GLOBAL.STRINGS.RECIPE_DESC.UBERSAW = "Gain health upon each hit."

GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.AMPUTATOR = "The stinging means it's working!"
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.AMPUTATOR = "Music and medicine are boring."
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.AMPUTATOR = "I can make others feel strong!"
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.AMPUTATOR = "You will all only end up hurt again."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.AMPUTATOR = "THIS IS THE OPPOSITE OF WHAT I WANT TO DO"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.AMPUTATOR = "If you play it like a chordophone it grants a remedial quality to all around!"
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.AMPUTATOR = "I only play music for Lucy."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.AMPUTATOR = "I'll play a song of healing madness."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.AMPUTATOR = "Nobody needs healing to take on a powerful foe!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.AMPUTATOR = "It plays a soothing medicine tune."
GLOBAL.STRINGS.CHARACTERS.WINONA.DESCRIBE.AMPUTATOR = "So that's what healing sounds like, aye?"
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.AMPUTATOR = "How's that doin' no harm workin' out for ya, then?"
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.AMPUTATOR = "Do you call that a weapon, son? Somewhere, your father is weeping because of you!"
end
end)

GLOBAL.STRINGS.NAMES.AMPUTATOR = "Amputator"
GLOBAL.STRINGS.RECIPE_DESC.AMPUTATOR = "Grants nearby players health on use."

GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.VITASAW = "Note to self; don't point this near my eyes."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.VITASAW = "The stinging is my favorite part."
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.VITASAW = "Is sharp needle!"
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.VITASAW = "This is not mine, it does not serve me."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.VITASAW = "MEDICAL ANOMALY DETECTED"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.VITASAW = "It appears to charge the medical fluid the more blood the needle obtains."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.VITASAW = "An axe could do its job better."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.VITASAW = "I wouldn't be caught dead wielding such a thing."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.VITASAW = "It looks like it would snap in half upon attacking!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.VITASAW = "It has a fine needle!"
GLOBAL.STRINGS.CHARACTERS.WINONA.DESCRIBE.VITASAW = "That's one big needle I'd wanna avoid!"
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.VITASAW = "What bloody nursemaid would use such a thing!?"
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.VITASAW = "That is not a weapon, that is an excuse to kick your ass!"
end
end)

GLOBAL.STRINGS.NAMES.VITASAW = "Vita-Saw"
GLOBAL.STRINGS.RECIPE_DESC.VITASAW = "Collect the organs of creatures you hit!"

GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BLOWDART_HEALTH = "This seems fundamentally safe."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.BLOWDART_HEALTH = "I don't think healing is the same as burning."
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.BLOWDART_HEALTH = "Dart do health to enemies?"
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.BLOWDART_HEALTH = "I blow on one end and others gain the benefit. If they're lucky."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.BLOWDART_HEALTH = "WHY DOES IT HEAL FLESHLINGS? IT NEEDS TO DESTROY THEM"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.BLOWDART_HEALTH = "Improvised remedial device."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.BLOWDART_HEALTH = "This is what I thought that doctor meant by free healthcare."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.BLOWDART_HEALTH = "That needles does much more than simple healing."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.BLOWDART_HEALTH = "This won't help me fight foes!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.BLOWDART_HEALTH = "Like blowing little healthiness bubbles!"
GLOBAL.STRINGS.CHARACTERS.WINONA.DESCRIBE.BLOWDART_HEALTH = "Wouldn't be my first choice in healing."
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.BLOWDART_HEALTH = "Bah, leave it to the bloody Teutonic nursemaids!"
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.BLOWDART_HEALTH = "That thing is not a weapon! That thing is why the enemy wins!"
end
end)

GLOBAL.STRINGS.NAMES.BLOWDART_HEALTH = "Health Dart"
GLOBAL.STRINGS.RECIPE_DESC.BLOWDART_HEALTH = "Spit health at your friends and enemies."

GLOBAL.STRINGS.NAMES.SMALL_MEDKIT = "Small Health Kit"
GLOBAL.STRINGS.RECIPE_DESC.SMALL_MEDKIT = "Tastes like healthiness."

GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SMALL_MEDKIT = "The stinging part is my favorite."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.SMALL_MEDKIT = "Eww, I hate medicine!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.SMALL_MEDKIT = "Tiny bottle fix me!"
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.SMALL_MEDKIT = "It can't heal every wound."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.SMALL_MEDKIT = "TEMPORARY MAINTENANCE DEVICE"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.SMALL_MEDKIT = "This tiny canister contains medicinal properties."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.SMALL_MEDKIT = "At least I didn't have to pay for it."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.SMALL_MEDKIT = "I don't remember allowing this."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.SMALL_MEDKIT = "I do not need liquid health to fight!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.SMALL_MEDKIT = "We don't like taking our medicine!"
GLOBAL.STRINGS.CHARACTERS.WINONA.DESCRIBE.SMALL_MEDKIT = "Gotta make sure those kids take their kits."
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.SMALL_MEDKIT = "Thank ye, doctor!"
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.SMALL_MEDKIT = "Thanks, Doc."
end
end)

GLOBAL.STRINGS.NAMES.MED_MEDKIT = "Medium Health Kit"
GLOBAL.STRINGS.RECIPE_DESC.MED_MEDKIT = "Heals even more!"

GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.MED_MEDKIT = "Scientific medical tools!"
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.MED_MEDKIT = "I still hate medicine!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MED_MEDKIT = "Box make Wolfgang strong!"
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.MED_MEDKIT = "The tools in it can't help bring Abigail back."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.MED_MEDKIT = "I AM CONFLICTED"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MED_MEDKIT = "This medicinal case has many curative objects contained in it."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.MED_MEDKIT = "From your friendly neighbor-hood doctor."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MED_MEDKIT = "Do not let anyone take it from my grasps."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.MED_MEDKIT = "A friend of a warrior!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.MED_MEDKIT = "We can already feel the health!"
GLOBAL.STRINGS.CHARACTERS.WINONA.DESCRIBE.MED_MEDKIT = "Nothing like a good healin' kit to have by your side."
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.MED_MEDKIT = "Aye, thanks doc!"
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.MED_MEDKIT = "Thanks for the aid!"
end
end)

GLOBAL.STRINGS.NAMES.LARGE_MEDKIT = "Large Health Kit"
GLOBAL.STRINGS.RECIPE_DESC.LARGE_MEDKIT = "Filled to the brim with health!"

GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.LARGE_MEDKIT = "It's packed full of medical tools!"
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.LARGE_MEDKIT = "There's gotta be some good burning tools in here!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.LARGE_MEDKIT = "Large box is strong like me!"
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.LARGE_MEDKIT = "You can't heal everything, box."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.LARGE_MEDKIT = "YOU ARE MINE"
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.LARGE_MEDKIT = "This large case of medicinal tools will help supply us with a fine amount of health."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.LARGE_MEDKIT = "Now this is a health kit!"
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.LARGE_MEDKIT = "Give this to those who deserve it."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.LARGE_MEDKIT = "This will be helpful for fighting larger foes!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.LARGE_MEDKIT = "This one is big!"
GLOBAL.STRINGS.CHARACTERS.WINONA.DESCRIBE.LARGE_MEDKIT = "Gonna have to come back to this on a bad day."
AddPrefabPostInit("forest", function(inst)
        if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.LARGE_MEDKIT = "Good on ya, Medic!"
end
        if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.LARGE_MEDKIT = "You deserve a medal, Doc."
end
end)


GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.MEDIC = 
{
	GENERIC = "Greetings, %s!",
	ATTACKER = "That Medic looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "%s, living up to their name.",
	GHOST = "Better concoct a revival device. Can't leave a doctor floating.",
	FIRESTARTER = "Burning that wasn't very scientific, %s.",
}
--More characters
--<default>'s TF2 characters
AddPrefabPostInit("forest", function(inst)
    if GLOBAL.STRINGS.CHARACTERS.DEMOMAN then
GLOBAL.STRINGS.CHARACTERS.DEMOMAN.DESCRIBE.MEDIC = 
{
	GENERIC = "That %s is a bloody spy!",
	ATTACKER = "That %s is a bloody traitor!",
	MURDERER = "Cold-blooded murderer!",
	REVIVER = "%s, I didn't need yer help, you know.",
	GHOST = "How's that doin' no harm workin' out for ya, then?",
	FIRESTARTER = "The bloody %s is burning stuff!",
}
end
    if GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER then
GLOBAL.STRINGS.CHARACTERS.TF2SOLDIER.DESCRIBE.MEDIC = 
{
	GENERIC = "That %s is a spy!",
	ATTACKER = "I'm gonna mail my boot to the Kaiser with your ass around it!",
	MURDERER = "Ich bin I'm going to kick your ass!",
	REVIVER = "You deserve a medal, Doc.",
	GHOST = "America wins again!",
	FIRESTARTER = "%s! Do not burn my things! Do not do it!",
}
end

end)
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.MEDIC = 
{
	GENERIC = "Hi, %s!",
	ATTACKER = "Hey! That is not how you heal, %s!",
	MURDERER = "You've gone nuts! Murderer!",
	REVIVER = "Doing a good job, %s.",
	GHOST = "I'll get you a heart if you let me in on some of that magic you have!",
	FIRESTARTER = "I'm loving your new healing methods! Heh heh.",
}
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MEDIC = 
{
	GENERIC = "Is tiny doctor! Hello!",
	ATTACKER = "Medicine does not hurt!",
	MURDERER = "Creepy doctor has come from nightmares!",
	REVIVER = "%s is nice doctor!",
	GHOST = "Wolfgang will get nice heart as thank you for health!",
	FIRESTARTER = "Why staring fires, doctor? To heal them?",
}
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.MEDIC = 
{
	GENERIC = "How do you do, %s?",
	ATTACKER = "%s no longer wants the burden of healing.",
	MURDERER = "The doctor has turned to blood-lust. As I knew they always would.",
	REVIVER = "Abigail appreciates the support, %s. Even if it's not enough.",
	GHOST = "Healing others is a burden. Are you sure you want to come back, %s?",
	FIRESTARTER = "I have heard rumors that burning wounds helps.",
}
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.MEDIC = 
{
	GENERIC = "DETECTING... %s!",
	ATTACKER = "YOU CANNOT HEAL THINGS TO DEATH, %s",
	MURDERER = "YOU WILL HEAL OTHER FLESHLINGS NO MORE",
	REVIVER = "YOU ARE AN IDEAL SERVANT, %s",
	GHOST = "YOU CANNOT HEAL THAT, %s",
	FIRESTARTER = "%s HAS CHOSEN BURNING OVER HEALING. GOOD.",
}
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MEDIC = 
{
	GENERIC = "Ah, greetings dear %s!",
	ATTACKER = "Don't go testing my limits, Teutonic man!",
	MURDERER = "It appears we've entered a battle of the wits, %s!",
	REVIVER = "I appreciate your group support, %s.",
	GHOST = "I will heal you as you have healed me, %s.",
	FIRESTARTER = "Do be careful when trying to find new healing methods, dear.",
}
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.MEDIC = 
{
	GENERIC = "It's my medical buddy, %s!",
	ATTACKER = "%s isn't very polite...",
	MURDERER = "You do not live up to your oath, eh!",
	REVIVER = "%s, you're an alright guy.",
	GHOST = "Better get you a heart in exchange for all that free healthcare you give.",
	FIRESTARTER = "Careful around those open flames, %s.",
}
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MEDIC = 
{
	GENERIC = "Greetings, Mr %s.",
	ATTACKER = "I assume I won't be getting any healing now from %s.",
	MURDERER = "Do not start fights you cannot heal your way out of!",
	REVIVER = "%s has excellent command of medical arts.",
	GHOST = "I'll get you a heart, %s. Just promise to heal me specifically more often.",
	FIRESTARTER = "Even the healers have a breaking point.",
}
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.MEDIC = 
{
	GENERIC = "Good health and healing to you, %s!",
	ATTACKER = "If %s is looking for trouble, I'll give it to him!",
	MURDERER = "%s, Your healing may be key but that will not lessen my blow! Let us fight!",
	REVIVER = "The magic of Asclepius dwells within you, %s!",
	GHOST = "A valiant healer should not go to waste! A heart!",
	FIRESTARTER = "I'll not question your healing wisdom, %s.",
}
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.MEDIC = 
{
	GENERIC = "Hi %s! Looking healthy today!",
	ATTACKER = "%s, what's the matter?",
	MURDERER = "We don't need your healing, %s!",
	REVIVER = "%s is always here to help!",
	GHOST = "Don't worry %s, we'll get you a heart!",
	FIRESTARTER = "%s, no!! Fire does not heal!",
}
GLOBAL.STRINGS.CHARACTERS.WINONA.DESCRIBE.MEDIC = 
{
	GENERIC = "Good ta see ya, %s!",
	ATTACKER = "Watch it! Med's fed up with us and is after us with that bonesaw!",
	MURDERER = "Yikes! Hate to see healer turned killer!",
	REVIVER = "A worker's always thankful to have first aid nearby!",
	GHOST = "Well that just won't do at all!",
	FIRESTARTER = "This ain't the middle ages, %s, don't need fire to heal.",
}
