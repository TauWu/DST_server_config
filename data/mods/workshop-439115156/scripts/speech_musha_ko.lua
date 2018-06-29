--Created: Luka 
return {
--adds action start
	ACTIONFAIL =
	{
        REPAIR =
        {
            WRONGPIECE = "I don't think that was right.",
        },
        BUILD =
        {
            MOUNTED = "I can't place that from way up here.",
            HASPET = "I've already got a pet.",
        },
		SHAVE =
		{
			AWAKEBEEFALO = "I'm not going to try that while he's awake.",
			GENERIC = "I can't shave that!",
			NOBITS = "There isn't even any stubble left!",
		},
		STORE =
		{
			GENERIC = "It's full.",
			NOTALLOWED = "That can't go in there.",
			INUSE = "I should wait my turn.",
		},
		RUMMAGE =
		{	
			GENERIC = "I can't do that.",
			INUSE = "They're elbow deep in junk right now.",
		},
		USEKLAUSSACKKEY =
        {
        	WRONGKEY = "Whoops! That wasn't right.",
        	KLAUS = "I'm a little preoccupied!!",
			QUAGMIRE_WRONGKEY = "I'll just have to find another key.",
        },
		ACTIVATE = 
		{
			LOCKED_GATE = "The gate is locked.",
		},
        COOK =
        {
            GENERIC = "I can't cook right now.",
            INUSE = "Looks like we had the same idea.",
            TOOFAR = "It's too far away!",
        },
		GIVE =
        {
            GENERIC = "That doesn't go there.",
            DEAD = "Maybe I'll just hold on to this.",
            SLEEPING = "Too unconscious to care.",
            BUSY = "I'll try again in a second.",
            ABIGAILHEART = "It was worth a shot.",
            GHOSTHEART = "Perhaps this is a bad idea.",
            NOTGEM = "I'm not sticking that in there!",
            WRONGGEM = "This gem won't work here.",
            NOTSTAFF = "It's not quite the right shape.",
            MUSHROOMFARM_NEEDSSHROOM = "A mushroom would probably be of more use.",
            MUSHROOMFARM_NEEDSLOG = "A living log would probably be of more use.",
            SLOTFULL = "We already put something there.",
            FOODFULL = "There's already a meal there.",
            NOTDISH = "It won't want to eat that.",
            DUPLICATE = "We already know that one.",
            NOTSCULPTABLE = "Not even science could make that into a sculpture.",
            NOTATRIUMKEY = "It's not quite the right shape.",
            CANTSHADOWREVIVE = "It won't resurrect.",
            WRONGSHADOWFORM = "It's not put together right.",
        },
        GIVETOPLAYER =
        {
            FULL = "Your pockets are too full!",
            DEAD = "Maybe I'll just hold on to this.",
            SLEEPING = "Too unconscious to care.",
            BUSY = "I'll try again in a second.",
        },
        GIVEALLTOPLAYER =
        {
            FULL = "Your pockets are too full!",
            DEAD = "Maybe I'll just hold on to this.",
            SLEEPING = "Too unconscious to care.",
            BUSY = "I'll try again in a second.",
        },
        WRITE =
        {
            GENERIC = "I think it's fine as is.",
            INUSE = "There's only room for one scribbler.",
        },
        DRAW =
        {
            NOIMAGE = "This'd be easier if I had the item in front of me.",
        },
        CHANGEIN =
        {
            GENERIC = "I don't want to change right now.",
            BURNING = "It's too dangerous right now!",
            INUSE = "It can only handle one style change at a time.",
        },
        ATTUNE =
        {
            NOHEALTH = "I don't feel well enough.",
        },
        MOUNT =
        {
            TARGETINCOMBAT = "I know better than to bother an angry beefalo!",
            INUSE = "Someone beat me to the saddle!",
        },
        SADDLE =
        {
            TARGETINCOMBAT = "It won't let me do that while it's angry.",
        },
        TEACH =
        {
            --Recipes/Teacher
            KNOWN = "I already know that one.",
            CANTLEARN = "I can't learn that one.",

            --MapRecorder/MapExplorer
            WRONGWORLD = "This map was made for some other place.",
        },
        WRAPBUNDLE =
        {
            EMPTY = "I need to have something to wrap.",
        },
        PICKUP =
        {
			RESTRICTION = "I'm not skilled enough to use that.",
			INUSE = "Science says I have to wait my turn.",
        },
        SLAUGHTER =
        {
            TOOFAR = "It got away.",
        },
        REPLATE =
        {
            MISMATCH = "It needs another type of dish.", 
            SAMEDISH = "I only need to use one dish.", 
        },
	},
	ACTIONFAIL_GENERIC = "I can't do that.",
	ANNOUNCE_DIG_DISEASE_WARNING = "It looks better already.",
	ANNOUNCE_PICK_DISEASE_WARNING = "Uh, is it supposed to smell like that?",
--adds action end
	ANNOUNCE_HATEFOOD = "정말 맛없어!",
	ANNOUNCE_ADVENTUREFAIL = "뮤샤는 조금만 잘거야. 조금만.",
	ANNOUNCE_BOOMERANG = "뮤샤를 때리지마 거미같은 나무야!",
	ANNOUNCE_CHARLIE = "뮤샤 뒤에 뭔가 있어!",
	ANNOUNCE_CHARLIE_ATTACK = "비겁한 녀석, 숨어서 때리지마!",
	ANNOUNCE_COLD = "뮤샤의 손가락이 얼었어!",
	ANNOUNCE_HOT = "이 날씨는 뮤샤에겐 너무 더워!",
	ANNOUNCE_DUSK = "햇살이 지고있어. 뮤샤는 불을 준비해야해!",
	ANNOUNCE_EAT =
      {
                GENERIC = "냠냠!",
                PAINFUL = "딱딱한게 씹혔어!",
                SPOILED = "썩었잖아!",
                STALE = "물컹하고 질척해!",
		YUCKY = "역겨워!",
	},
	ANNOUNCE_NOSLEEPONFIRE = "뮤샤는 여기에서는 잘 수 없어!\n뮤샤는 불을 먼저 피워야해!",
	ANNOUNCE_NODANGERSIESTA = "뮤샤는 이상한 소리를 들었어!\n뮤샤는 안전을 확인 해야해!",
	ANNOUNCE_NONIGHTSIESTA = "밤에 여기에서 쉬기에는 너무 추워!",
	ANNOUNCE_NONIGHTSIESTA_CAVE = "바닥이 너무 차가워!",
	ANNOUNCE_NOHUNGERSIESTA = "뮤샤는 쉬는 것보다 먹는 것을 먼저 할거야",
	ANNOUNCE_SHELTER = "이 안에는 편안해보여.",
	ANNOUNCE_BURNT = "이 나무의 이 부분은 사람 얼굴같지 않아?",
	ANNOUNCE_TOOL_SLIP = "미끄러졌어!",
	ANNOUNCE_DAMP = "비가 와! 빨리 비를 피해야해!",
	ANNOUNCE_WET = "뮤샤 머리가 축축해",
	ANNOUNCE_WETTER = "뮤샤의 옷하고 신발이 모두 축축해",
	ANNOUNCE_SOAKED = "물에 젖은 가방이 너무 무거워! 쉬고싶어!",
	ANNOUNCE_HOUNDS = "들었어? 하운드가 가까이 왔어",
	--ANNOUNCE_HUNGRY = "Musha needs meats. Anyone?",
	ANNOUNCE_HUNGRY = "너무 배고파",
	ANNOUNCE_HUNT_BEAST_NEARBY = "뮤샤가 사냥감을 찾았어! 정말 커!",
	ANNOUNCE_HUNT_LOST_TRAIL = "뮤샤는 발자국을 잃어버렸어",
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "진흙이 발자국을 지웠어. 뮤샤는 진흙이 싫어",
	ANNOUNCE_ACCOMPLISHMENT= "뮤샤와 모험은 언제나 함께야!",
	ANNOUNCE_ACCOMPLISHMENT_DONE = "뮤샤가 해냈어!",
	ANNOUNCE_LIGHTFIRE =
	{
		[1] = "빛이야!",
		[2] = "불이야!",
		[3] = "불을 피우면 여러가지를 할 수 있어!",
		[4] = "불길을 휘둘러 어둠을 내쫒는거야",
		[5] = "불을 피우면 따뜻해",
		[6] = "좋아!",
	},
	ANNOUNCE_PECKED = "나쁜 새!",
	ANNOUNCE_TORCH_OUT = "빛이 사라졌어!",
	ANNOUNCE_WORMHOLE = "뮤샤는 끈적한게 싫어.",
	ANNOUNCE_TRAP_WENT_OFF = "아! 함정을 보충해야겠어",
	ANNOUNCE_CRAFTING_FAIL = "어라? 만든게 작동하지 않아",
    ANNOUNCE_QUAKE = "동굴이 배탈났어!",
    ANNOUNCE_NODANGERSLEEP = "뮤샤는 이상한 소리를 들었어!\n뮤샤는 안전을 확인 해야해",
    ANNOUNCE_NOHUNGERSLEEP = "뮤샤는 너무 배고파!\n 뮤샤는 먼저 뭔가 먹어야 해!",
    ANNOUNCE_FREEDOM = "뮤샤는 자유야, 아무것도 뮤샤를 막을 수 없어!",
    ANNOUNCE_RESEARCH = "뮤샤는 그걸 알아! 뮤샤는 이걸 사용할 수 있어!",
    ANNOUNCE_NO_TRAP = "너무 쉬워!",
    ANNOUNCE_HIGHRESEARCH = "멋져! 뮤샤가 만든거야!",
    ANNOUNCE_THORNS = "오호! 정말 멋져!",
    ANNOUNCE_NODAYSLEEP_CAVE = "뮤샤는 더 놀고 싶어!\n뮤샤는 피곤하지 않아!",
    ANNOUNCE_BEES = "붕붕붕거리는 소리가 시끄러워",
    ANNOUNCE_KNOCKEDOUT = "어.. 작은 별들이 보여..",
    ANNOUNCE_LOWRESEARCH = "뮤샤는 너무 많이 만들었어",
    ANNOUNCE_DEERCLOPS = "강한 외눈은 오딘뿐이야!",
    ANNOUNCE_MOSQUITOS = "뮤샤도 너를 물거야!",
    ANNOUNCE_NODAYSLEEP = "졸려? 뮤샤는 더 놀고 싶어!",
    ANNOUNCE_INSUFFICIENTFERTILIZER = "이건 식물한테 별로 안좋을거야",
    ANNOUNCE_CANFIX = "뮤샤는 이걸 고칠 수 있어!",
    ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "뮤샤는 빛보다 빨라!",
        BATTLECRY =
        {
                GENERIC = "저 녀석을 잡는거야!",
                PIG = "나쁜 돼지!",
                PREY = "네가 오늘 내 사냥감이야!",
                --SPIDER = "거미는 뮤샤의 사냥감이야!",
				SPIDER = "거미 따위 무섭지 않아!",
                SPIDER_WARRIOR = "병정거미를 잡을거야!",
        },
        COMBAT_QUIT =
        {
                GENERIC = "살아남은 자가 강한거야.",
                PIG = "강한 돼지였어.\n 하지만 다음엔 뮤샤의 베이컨이 될거야!",
                PREY = "다음엔 널 잡아먹을거야!",
                SPIDER = "뮤샤도 팔이 많았으면 전부 때릴수 있었어..",
                SPIDER_WARRIOR = "뮤샤는 병정거미가 싫어!",
        },
		
--adds 4 start
	--ANNOUNCE_TOOL_SLIP = "Wow, that tool is slippery!",
	--ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "Safe from that frightening lightning!",
	ANNOUNCE_TOADESCAPING = "The toad is losing interest.",
	ANNOUNCE_TOADESCAPED = "The toad got away.",
	
	ANNOUNCE_BECOMEGHOST = "oOooOooo!!",
	ANNOUNCE_GHOSTDRAIN = "My humanity is about to start slipping away...",
	ANNOUNCE_PETRIFED_TREES = "Did I just hear trees screaming?",
	ANNOUNCE_KLAUS_ENRAGE = "There's no way to beat it now!!",
	ANNOUNCE_KLAUS_UNCHAINED = "Its chains came off!",
	ANNOUNCE_KLAUS_CALLFORHELP = "It called for help!",

    --lavaarena event
    ANNOUNCE_REVIVING_CORPSE = "Let me help you.",
    ANNOUNCE_REVIVED_OTHER_CORPSE = "Good as new!",
    ANNOUNCE_REVIVED_FROM_CORPSE = "Much better, thank-you.",
    --quagmire event
    QUAGMIRE_ANNOUNCE_NOTRECIPE = "Those ingredients didn't make anything.",
    QUAGMIRE_ANNOUNCE_MEALBURNT = "I left it on too long.",
    QUAGMIRE_ANNOUNCE_LOSE = "I have a bad feeling about this.",
    QUAGMIRE_ANNOUNCE_WIN = "Time to go!",

    ANNOUNCE_ROYALTY =
    {
        "Your majesty.",
        "Your highness.",
        "My liege!",
    },
	
--adds 4 end	
		
	--우와 정말 귀찮다..
	DESCRIBE =
	{

--adds 5 start (DESCRIBE)
	--MULTIPLAYER_PORTAL = "This ought to be a scientific impossibility.",
		ANTLION = 
		{
			GENERIC = "It wants something from me.",
			VERYHAPPY = "I think we're on good terms.",
			UNHAPPY = "It looks mad.",
		},
		ANTLIONTRINKET = "Someone might be interested in this.",
		SANDSPIKE = "I could've been skewered!",
        SANDBLOCK = "It's so gritty!",
        GLASSSPIKE = "Memories of the time I wasn't skewered.",
        GLASSBLOCK = "That's science for you.",
		ABIGAIL_FLOWER = 
		{ 
			GENERIC ="It's hauntingly beautiful.",
			LONG = "It hurts my soul to look at that thing.",
			MEDIUM = "It's giving me the creeps.",
			SOON = "Something is up with that flower!",
			HAUNTED_POCKET = "I don't think I should hang on to this.",
			HAUNTED_GROUND = "I'd die to find out what it does.",
		},

		BALLOONS_EMPTY = "It looks like clown currency.",
		BALLOON = "How are they floating?",

		BERNIE_INACTIVE =
		{
			BROKEN = "It finally fell apart.",
			GENERIC = "It's all scorched.",
		},

		BERNIE_ACTIVE = "That teddy bear is moving around. Interesting.",

        PLAYER =
        {
            GENERIC = "Greetings, %s!",
            ATTACKER = "%s looks shifty...",
            MURDERER = "Murderer!",
            REVIVER = "%s, friend of ghosts.",
            GHOST = "%s could use a heart.",
            FIRESTARTER = "Burning that wasn't very scientific, %s.",
        },
		WILSON = 
		{
			GENERIC = "Stars and atoms! Are you my doppelganger, %s?",
			ATTACKER = "Yeesh. Do I always look that creepy?",
			MURDERER = "Your existence is an affront to the laws of science, %s!",
			REVIVER = "%s has expertly put our theories into practice.",
			GHOST = "Better concoct a revival device. Can't leave another man of science floating.",
			FIRESTARTER = "Burning that wasn't very scientific, %s.",
		},
		WOLFGANG = 
		{
			GENERIC = "It's good to see you, %s!",
			ATTACKER = "Let's not start a fight with the strongman...",
			MURDERER = "Murderer! I can take you!",
			REVIVER = "%s is just a big teddy bear.",
			GHOST = "I told you you couldn't deadlift that boulder, %s. The numbers were all wrong.",
			FIRESTARTER = "You can't actually \"fight\" fire, %s!",
		},
		WAXWELL = 
		{
			GENERIC = "Decent day to you, %s!",
			ATTACKER = "Seems you've gone from \"dapper\" to \"slapper\".",
			MURDERER = "I'll show you Logic and Reason... those're my fists!",
			REVIVER = "%s is using his powers for good.",
			GHOST = "Don't look at me like that, %s! I'm working on it!",
			FIRESTARTER = "%s's just asking to get roasted.",
		},
		WX78 = 
		{
			GENERIC = "Good day to you, %s!",
			ATTACKER = "I think we need to tweak your primary directive, %s...",
			MURDERER = "%s! You've violated the first law!",
			REVIVER = "I guess %s got that empathy module up and running.",
			GHOST = "I always thought %s could use a heart. Now I'm certain!",
			FIRESTARTER = "You look like you're gonna melt, %s. What happened?",
		},
		WILLOW = 
		{
			GENERIC = "Good day to you, %s!",
			ATTACKER = "%s is holding that lighter pretty tightly...",
			MURDERER = "Murderer! Arsonist!",
			REVIVER = "%s, friend of ghosts.",
			GHOST = "I bet you're just burning for a heart, %s.",
			FIRESTARTER = "Again?",
		},
		WENDY = 
		{
			GENERIC = "Greetings, %s!",
			ATTACKER = "%s doesn't have any sharp objects, does she?",
			MURDERER = "Murderer!",
			REVIVER = "%s treats ghosts like family.",
			GHOST = "I'm seeing double! I'd better concoct a heart for %s.",
			FIRESTARTER = "I know you set those flames, %s.",
		},
		WOODIE = 
		{
			GENERIC = "Greetings, %s!",
			ATTACKER = "%s has been a bit of a sap lately...",
			MURDERER = "Murder! Bring me an axe and we'll get in the swing of things!",
			REVIVER = "%s saved everyone's backbacon.",
			GHOST = "Does \"universal\" coverage include the void, %s?",
			BEAVER = "%s's gone on a wood chucking rampage!",
			BEAVERGHOST = "Will you bea-very mad if I don't revive you, %s?",
			FIRESTARTER = "Don't burn yourself out, %s.",
		},
		WICKERBOTTOM = 
		{
			GENERIC = "Good day, %s!",
			ATTACKER = "I think %s's planning to throw the book at me.",
			MURDERER = "Here comes my peer review!",
			REVIVER = "I have deep respect for %s's practical theorems.",
			GHOST = "This doesn't seem very scientific, does it, %s?",
			FIRESTARTER = "I'm sure you had a very clever reason for that fire.",
		},
		WES = 
		{
			GENERIC = "Greetings, %s!",
			ATTACKER = "%s is silent, but deadly...",
			MURDERER = "Mime this!",
			REVIVER = "%s thinks outside the invisible box.",
			GHOST = "How do you say \"I'll concoct a revival device\" in mime?",
			FIRESTARTER = "Wait, don't tell me. You lit a fire.",
		},
		WEBBER = 
		{
			GENERIC = "Good day, %s!",
			ATTACKER = "I'm gonna roll up a piece of papyrus newspaper, just in case.",
			MURDERER = "Murderer! I'll squash you, %s!",
			REVIVER = "%s is playing well with others.",
			GHOST = "%s is really buggin' me for a heart.",
			FIRESTARTER = "We need to have a group meeting about fire safety.",
		},
		WATHGRITHR = 
		{
			GENERIC = "Good day, %s!",
			ATTACKER = "I'd like to avoid a punch from %s, if possible.",
			MURDERER = "%s's gone berserk!",
			REVIVER = "%s has full command of spirits.",
			GHOST = "Nice try. You're not escaping to Valhalla yet, %s.",
			FIRESTARTER = "%s is really heating things up today.",
		},
        WINONA =
        {
            GENERIC = "Good day to you, %s!",
            ATTACKER = "%s is a safety hazard.",
            MURDERER = "It ends here, %s!",
            REVIVER = "You're pretty handy to have around, %s.",
            GHOST = "Looks like someone threw a wrench into your plans.",
            FIRESTARTER = "Things are burning up at the factory.",
        },
        MIGRATION_PORTAL = 
        {
            GENERIC = "If I had any friends, this could take me to them.",
            OPEN = "If I step through, will I still be me?",
            FULL = "It seems to be popular over there.",
        },
	
	
--adds 5 end (DESCRIBE)

	    MUSHA_EGG ="얌체 알이야!",
        MUSHA_EGGS1 ="함께 모험하기 충분한 얌체가 태어날거야",
        MUSHA_EGGS2 ="뮤샤 얼굴 보다 큰 얌체 알이야!",
        MUSHA_EGGS3 ="엄청난 크기의 알이야!",
        MUSHA_EGG1 ="이만한 크기의 알이면 거미 걱정은 없을거야",
        MUSHA_EGG2 ="뮤샤보다 무거운 알이야! 정말로!",
        MUSHA_EGG3 ="이 얌체가 태어나면 밤에도 걱정이 없을거야",
        MUSHA_EGG8 ="거대한 얌체가 태어날거야",
        MUSHA_EGG_CRACKED = "얌체가 깨어나려고 하고있어!",
		MUSHA_EGG_CRACKEDS1 = "얌체가 깨어나려고 하고있어!",
		MUSHA_EGG_CRACKEDS2 = "얌체가 깨어나려고 하고있어!",
		MUSHA_EGG_CRACKEDS3 = "얌체가 깨어나려고 하고있어!",
		MUSHA_EGG_CRACKED1 = "얌체가 깨어나려고 하고있어!",
		MUSHA_EGG_CRACKED2 = "얌체가 깨어나려고 하고있어!",
		MUSHA_EGG_CRACKED3 = "얌체가 깨어나려고 하고있어!",
		MUSHA_EGG_CRACKED8 = "얌체가 깨어나려고 하고있어!",

       	MUSHA_SMALL = "얌체는 귀여워!\n기본값:(Z,V,B)",

		MUSHA_TEEN = "이젠 머리엔 올릴 수 없지만\n얌체는 여전히 귀여워\n기본값:(Z,V,B)",
		MUSHA_TEENR1 = "이젠 머리엔 올릴 수 없지만\n얌체는 여전히 귀여워\n기본값:(Z,V,B)",
		MUSHA_TEENR2 = "이젠 머리엔 올릴 수 없지만\n얌체는 여전히 귀여워\n기본값:(Z,V,B)",
		MUSHA_TEENR3 = "이젠 머리엔 올릴 수 없지만\n얌체는 여전히 귀여워\n기본값:(Z,V,B)",
		MUSHA_TEENR4 = "이젠 머리엔 올릴 수 없지만\n얌체는 여전히 귀여워\n기본값:(Z,V,B)",
		MUSHA_TEENICE = "이젠 머리엔 올릴 수 없지만\n얌체는 여전히 귀여워\n기본값:(Z,V,B)",

		MUSHA_TALL = "얌체는 아무거나 막 먹어\n기본값:(Z,V,B)",
		MUSHA_TALLR1 = "얌체는 아무거나 막 먹어\n기본값:(Z,V,B)",
		MUSHA_TALLR2 = "얌체는 아무거나 막 먹어\n기본값:(Z,V,B)",
		MUSHA_TALLR3 = "얌체는 아무거나 막 먹어\n기본값:(Z,V,B)",
		MUSHA_TALLR4 = "얌체는 아무거나 막 먹어\n기본값:(Z,V,B)",
		MUSHA_TALLRICE = "얌체는 아무거나 막 먹어\n기본값:(Z,V,B)",

		MUSHA_TALL2 = "얌체는 내 친구야\n기본값:(Z,V,B)",
		MUSHA_TALLRR1 = "얌체는 내 친구야\n기본값:(Z,V,B)",
		MUSHA_TALLRR2 = "얌체는 내 친구야\n기본값:(Z,V,B)",
		MUSHA_TALLRR3 = "얌체는 내 친구야\n기본값:(Z,V,B)",
		MUSHA_TALLRR4 = "얌체는 내 친구야\n기본값:(Z,V,B)",
		MUSHA_TALLRR5 = "얌체는 내 친구야\n기본값:(Z,V,B)",
		MUSHA_TALLRRICE = "얌체는 내 친구야\n기본값:(Z,V,B)",

		MUSHA_TALL3 = "얌체와 함께라면 아무것도 두렵지 않아\n기본값:(Z,V,B)",
		MUSHA_TALLRRR1 = "얌체와 함께라면 아무것도 두렵지 않아\n기본값:(Z,V,B)",
		MUSHA_TALLRRR2 = "얌체와 함께라면 아무것도 두렵지 않아\n기본값:(Z,V,B)",
		MUSHA_TALLRRR3 = "얌체와 함께라면 아무것도 두렵지 않아\n기본값:(Z,V,B)",
		MUSHA_TALLRRR4 = "얌체와 함께라면 아무것도 두렵지 않아\n기본값:(Z,V,B)",
		MUSHA_TALLRRR5 = "얌체와 함께라면 아무것도 두렵지 않아\n기본값:(Z,V,B)",
		MUSHA_TALLRRRICE = "얌체와 함께라면 아무것도 두렵지 않아\n기본값:(Z,V,B)",

		MUSHA_TALL4 = "뮤샤와 얌체는 한 가족이야\n기본값:(Z,V,B)",
		MUSHA_TALLRRRR1 = "뮤샤와 얌체는 한 가족이야\n기본값:(Z,V,B)",
		MUSHA_TALLRRRR2 = "뮤샤와 얌체는 한 가족이야\n기본값:(Z,V,B)",
		MUSHA_TALLRRRR3 = "뮤샤와 얌체는 한 가족이야\n기본값:(Z,V,B)",
		MUSHA_TALLRRRR4 = "뮤샤와 얌체는 한 가족이야\n기본값:(Z,V,B)",
		MUSHA_TALLRRRR5 = "뮤샤와 얌체는 한 가족이야\n기본값:(Z,V,B)",
		MUSHA_TALLRRRR6 = "뮤샤와 얌체는 한 가족이야\n기본값:(Z,V,B)",
		MUSHA_TALLRRRRICE = "뮤샤와 얌체는 한 가족이야\n기본값:(Z,V,B)",

		MUSHA_TALL5 = "함께 여행하는건 정말 즐거워!\n기본값:(Z,V,B)",
		MUSHA_TALLRRRRR1 = "함께 여행하는건 정말 즐거워!\n기본값:(Z,V,B)",
		MUSHA_TALLRRRRR2 = "함께 여행하는건 정말 즐거워!\n기본값:(Z,V,B)",
		MUSHA_TALLRRRRR3 = "함께 여행하는건 정말 즐거워!\n기본값:(Z,V,B)",
		MUSHA_TALLRRRRR4 = "함께 여행하는건 정말 즐거워!\n기본값:(Z,V,B)",
		MUSHA_TALLRRRRR5 = "함께 여행하는건 정말 즐거워!\n기본값:(Z,V,B)",
		MUSHA_TALLRRRRR6 = "함께 여행하는건 정말 즐거워!\n기본값:(Z,V,B)",
		MUSHA_TALLRRRRRICE = "함께 여행하는건 정말 즐거워!\n기본값:(Z,V,B)",

		MUSHA_RP1 = "뮤샤는 얌체를 사랑해!\n얌체는 뮤샤를 사랑해?\n기본값:(Z,V,B)",
		MUSHA_RP2 = "뮤샤는 얌체를 사랑해!\n얌체는 뮤샤를 사랑해?\n기본값:(Z,V,B)",
		MUSHA_RP3 = "뮤샤는 얌체를 사랑해!\n얌체는 뮤샤를 사랑해?\n기본값:(Z,V,B)",
		MUSHA_RP4 = "뮤샤는 얌체를 사랑해!\n얌체는 뮤샤를 사랑해?\n기본값:(Z,V,B)",
		MUSHA_RP5 = "뮤샤는 얌체를 사랑해!\n얌체는 뮤샤를 사랑해?\n기본값:(Z,V,B)",
		MUSHA_RP6 = "뮤샤는 얌체를 사랑해!\n얌체는 뮤샤를 사랑해?\n기본값:(Z,V,B)",
		MUSHA_RP7 = "뮤샤는 얌체를 사랑해!\n얌체는 뮤샤를 사랑해?\n기본값:(Z,V,B)",
		MUSHA_RPICE = "뮤샤는 얌체를 사랑해!\n얌체는 뮤샤를 사랑해?\n기본값:(Z,V,B)",

        GHOSTHOUND = "가자 멍뭉아!",
        GHOSTHOUND2 = "이게 뮤샤의 멍뭉이 친구야!",
        SHADOWMUSHA = "뮤샤와 꼭 닮은 그림자야!",
        --item
        MUSHA_FLUTE = "뮤샤가 피리를 불면 얌체가 좋아해",
		MUSHASWORD_BASE = "뮤샤의 칼이야",
		MUSHASWORD = "불의 힘이여! 뮤샤의 부름을 들으라!",
		MUSHASWORD_FROST = "얼음의 힘이여! 뮤샤의 부름을 들으라!",
		FROSTHAMMER = "혹한의 힘이 적을 무찌를거야!",
		BROKEN_FROSTHAMMER =  "이 망치에서 바스러지는 소리가 들려",
		HAT_MPHOENIX = "뮤샤에겐 익숙한 투구야! 한번 써보고 싶었어!",
		HAT_MPRINCESS = "뮤샤가 썼던 티아라는 이것과 거의 비슷해",
		HAT_MBUNNY = "수색할 시간이네",
		ARMOR_MUSHAA = "이건 뮤샤 특제 가방이야",
		ARMOR_MUSHAB = "뮤샤는 안전을 위해 보호대를 몇 개 덧댔어!",
		--WIP
		GLOWDUST ="단 맛이 나는 고운 가루야!",
		CRISTAL = "반짝이는 캔디같아!",
		EXP = "먹으면 힘이 강해진대!",

		--EXP1000CHEAT = "Show me the money!", -- Starcraft

        BOOK_BIRDS = "이게 바로 온 세상의 새들의 말을 적은 책이야",
        BOOK_TENTACLES = "왕지렁이를 키우는 108가지 방법",
        BOOK_GARDENING = "이 책을 읽어주면 식물들이 좋아해",
        BOOK_SLEEP = "아주 지루한 책이야",
        BOOK_BRIMSTONE = "위험한 느낌이 드는 책이야",

		GLOMMER = "깜찍한 날개 좀 봐! 게다가 날기까지 해!",
        GLOMMERFLOWER =
        {
        	GENERIC = "거대한 꽃봉오리야! 근데 어떻게 핀 거지?",
        	DEAD = "꽃잎이 회색이 됐어!\n얼마 전까지만 해도 빨갰는데!",
        },
        GLOMMERWINGS = "엄청 작아!",
        GLOMMERFUEL = "이 몽글몽글한 분홍색 좀 봐!\n먹으면 안돼? 왜?",
        BELL = "디너벨이 왜 여기있지?\n누가 뮤샤에게 식사를 가져다주는건데?",
        STATUEGLOMMER =
        {
        	GENERIC = "뮤샤 이거 알아! 음, 뭐였지?",
        	EMPTY = "뮤샤는 여기에 꽃이 핀 것을 본 적이 있어",
    	},
		WEBBERSKULL = "이 해골에는 긴 사연이 있어",
		MOLE =
		{
			HELD = "이것 좀 봐! 코가 재미있게 생겼어!",
			UNDERGROUND = "뭔가 땅 속에 숨어있나봐!\n쫒아가보자!",
			ABOVEGROUND = "이 녀석이 뮤샤의 아이템을 훔쳐갔어!",
		},
		MOLEHILL = "수상한 무더기야. 뮤샤의 코는 속일 수 없어",
		MOLEHAT = "이 모자에서 이상한 냄새가 나는거 같지 않아?",
		NIGHTSTICK = "이것은 밤에 유용한 반짝이 막대야!",
		
--adds 6 start
	MUSHROOMHAT = "Makes the wearer look like a fun guy.",
        MUSHROOM_LIGHT2 =
        {
            ON = "Blue is obviously the most scientific color.",
            OFF = "We could make a prime light source with some primary colors.",
            BURNT = "I didn't mildew it, I swear.",
        },
        MUSHROOM_LIGHT =
        {
            ON = "Science makes it light up.",
            OFF = "It's a big, science-y 'shroom.",
            BURNT = "Comboletely burnt.",
        },
        SLEEPBOMB = "It makes snooze circles when I throw it.",
        MUSHROOMBOMB = "A mushroom cloud in the making!",
        SHROOM_SKIN = "Warts and all!",
        TOADSTOOL_CAP =
        {
            EMPTY = "Just a hole in the ground.",
            INGROUND = "There's something poking out.",
            GENERIC = "That toadstool's just asking to be cut down.",
        },
        TOADSTOOL =
        {
            GENERIC = "Yeesh! I'm not kissing that!",
            RAGE = "He's hopping mad now!",
        },
        MUSHROOMSPROUT =
        {
            GENERIC = "How scientific!",
            BURNT = "How im-morel!",
        },
        MUSHTREE_TALL =
        {
            GENERIC = "That mushroom got too big for its own good.",
            BLOOM = "You can't tell from far away, but it's quite smelly.",
        },
        MUSHTREE_MEDIUM =
        {
            GENERIC = "These used to grow in my bathroom.",
            BLOOM = "I'm mildly offended by this.",
        },
        MUSHTREE_SMALL =
        {
            GENERIC = "A magic mushroom?",
            BLOOM = "It's trying to reproduce.",
        },
        MUSHTREE_TALL_WEBBED = "The spiders thought this one was important.",
        SPORE_TALL =
        {
            GENERIC = "It's just drifting around.",
            HELD = "I'll keep a little light in my pocket.",
        },
        SPORE_MEDIUM =
        {
            GENERIC = "Hasn't a care in the world.",
            HELD = "I'll keep a little light in my pocket.",
        },
        SPORE_SMALL =
        {
            GENERIC = "That's a sight for spore eyes.",
            HELD = "I'll keep a little light in my pocket.",
        },
		
		BEEQUEEN = "Keep that stinger away from me!",
		BEEQUEENHIVE = 
		{
			GENERIC = "It's too sticky to walk on.",
			GROWING = "Was that there before?",
		},
        BEEQUEENHIVEGROWN = "How in science did it get so big?!",
        BEEGUARD = "It's guarding the queen.",
        HIVEHAT = "The world seems less a little crazy when I wear it.",
        MINISIGN =
        {
            GENERIC = "I could draw better than that!",
            UNDRAWN = "We should draw something on there.",
        },
        MINISIGN_ITEM = "It's not much use like this. We should place it.",
		
		BERRYBUSH_JUICY =
		{
			BARREN = "It won't make any berries in this state.",
			WITHERED = "The heat even dehydrated the juicy berries!",
			GENERIC = "I should leave them there until it's time to eat.",
			PICKED = "The bush is working hard on the next batch.",
			DISEASED = "It looks pretty sick.",
			DISEASING = "Err, something's not right.",
			BURNING = "It's very much on fire.",
		},
		
		CANARY =
		{
			GENERIC = "Some sort of yellow creature made of science.",
			HELD = "I'm not squishing you, am I?",
		},
        CANARY_POISONED = "It's probably fine.",

		CRITTERLAB = "Is there something in there?",
        CRITTER_GLOMLING = "What an aerodynamical creature!",
        CRITTER_DRAGONLING = "It's wyrmed its way into my heart.",
		CRITTER_LAMB = "Much less mucusy than its momma.",
        CRITTER_PUPPY = "Pretty cute for a lil monster!",
        CRITTER_KITTEN = "You'd make a good lab assistant.",
        CRITTER_PERDLING = "My feathered friend.",
		
		LAVA_POND = "Magmificent!",
		LAVAE = "Too hot to handle.",
		LAVAE_COCOON = "Cooled off and chilled out.",
		LAVAE_PET = 
		{
			STARVING = "Poor thing must be starving.",
			HUNGRY = "I hear a tiny stomach grumbling.",
			CONTENT = "It seems happy.",
			GENERIC = "Aww. Who's a good monster?",
		},
		LAVAE_EGG = 
		{
			GENERIC = "There's a faint warmth coming from inside.",
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "I don't think that egg is warm enough.",
			COMFY = "I never thought I would see a happy egg.",
		},
		LAVAE_TOOTH = "It's an egg tooth!",
		
		ENDTABLE = 
		{
			BURNT = "A burnt vase on a burnt table.",
			GENERIC = "A flower in a vase on a table.",
			EMPTY = "I should put something in there.",
			WILTED = "Not looking too fresh.",
			FRESHLIGHT = "It's nice to have a little light.",
			OLDLIGHT = "Did we remember to pick up new bulbs?", -- will be wilted soon, light radius will be very small at this point
		},
		
		TWIGGYTREE = 
		{
			BURNING = "What a waste of wood.",
			BURNT = "I feel like I could have prevented that.",
			CHOPPED = "Take that, nature!",
			GENERIC = "It's all stick-y.",			
			DISEASED = "It looks sick. More so than usual.",
		},
		TWIGGY_NUT_SAPLING = "It doesn't need any help to grow.",
        TWIGGY_OLD = "That tree looks pretty wimpy.",
		TWIGGY_NUT = "There's a stick-y tree inside it that wants to get out.",
		
		FLOWER_WITHERED = "I don't think it got enough sun.",
		
		FOSSIL_PIECE = "Science bones! We should put them back together.",
        FOSSIL_STALKER =
        {
			GENERIC = "Still missing some pieces.",
			FUNNY = "My scientific instincts say this isn't quite right.",
			COMPLETE = "It's alive! Oh wait, no, it's not.",
        },
        STALKER = "The skeleton fused with the shadows!",
        STALKER_ATRIUM = "Why'd it have to be so big?",
        STALKER_MINION = "Anklebiters!",
        THURIBLE = "It smells like chemicals.",
        ATRIUM_OVERGROWTH = "I don't recognize any of these symbols.",
		
		LUCY = "That's a prettier axe than I'm used to.",
		
		MINIFAN = "Somehow the breeze comes out the back twice as fast.",
		
		OASISLAKE = "Is that a mirage?",
		
		PINECONE_SAPLING = "It'll be a tree soon!",
        LUMPY_SAPLING = "How did this tree even reproduce?",
		
--adds 6 end
		
		RABBITHOUSE=
		{
			GENERIC = "토끼괴인이 사는 집이야",
			BURNT = "토끼라서 불에는 익숙하지 않았나봐",
		},
		TURF_DECIDUOUS = "썩은잎이 가득한 무더기야",
		TURF_SANDY = "건조한 모래가 가득한 무더기야",
		TURF_BADLANDS = "딱딱한 무더기야!",
		BEARGER = "뮤샤도 꿀을 먹으면 키가 커질까?",
		BEARGERVEST = "복실복실한 옷이야",
		ICEPACK = "휴대용 냉장고야",
		BEARGER_FUR = "이 털가죽이 있으면 뮤샤가 새로운 것을 만들 수 있어",
		FURTUFT = "콜록! 뮤샤 입에 털뭉치가 들어갔어!",
		BIGFOOT = "어마어마하게 커다란 발자국이야!",
		BONESHARD = "뼈 무더기도 쓸데가 있어",
		BUZZARD = "얘 말고도 하늘에 엄청 많이 있어",
		CACTUS =
		{
			GENERIC = "왜 이 식물엔 이렇게 가시가 많을까?\n먹을 수도 없는데",
			PICKED = "가시가 많았지만 결국은 채집했어",
		},
		CACTUS_MEAT_COOKED = "조금 질겨진거 같아",
		CACTUS_MEAT = "가시가 없으면 괜찮아. 아마도",
		CACTUS_FLOWER = "이 삐죽한 식물에는 이쁜 꽃이 피어나네",
		COLDFIRE =
		{
			EMBERS = "뭔가 넣어볼까?",
			GENERIC = "이 파란 불꽃은 요리를 할 수 없어",
			HIGH = "엄청난 불꽃인데 차가워!",
			LOW = "차가운 불꽃이 사그러져가",
			NORMAL = "파란 불꽃은 엄청 뜨겁다고 들었는데 실제로는 차갑네",
			OUT = "불꽃이 사그러졌어",
		},
		CATCOON = "이 신경질적인 냐옹이는 남을게 없어보여",
		CATCOONDEN =
		{
			GENERIC = "냐옹이의 집은 냐옹이보다 중요할까?",
			EMPTY = "아무도 살지 않는 집은 뮤샤의 흥미를 끌 수 없어",
		},
		CATCOONHAT = "도끼를 들어야 할 것 같은 느낌이야",
		COONTAIL = "냐옹이에게서 건진 유일한 아이템이야",
		COOKPOT =
		{
			COOKING_LONG = "이렇게 오래 걸리는게 맞는거야?",
			COOKING_SHORT = "만들어봐요♬ 만들어봐요♬\n어디어디 무엇이 만들어질까♬",
			DONE = "요리가 완성됐어!",
			EMPTY = "이제 아무도 사용하지 않나봐.\n드디어 뮤샤의 실력을 발휘할 때야",
			BURNT = "왜 아무도 신경쓰지 않은겨야?",
		},
		EYEBRELLAHAT =	"비도 막아주고, 열도 막아주고,\n눈도 막아주는데, 무겁네.",
		ARMORDRAGONFLY = "살짝만 대어봐도 데어버릴 것 같아",
		DRAGON_SCALES = "멋져! 그리고 화끈해!",
		DRAGONFLYCHEST = "불보다 더 화끈한 상자야!",
		DECIDUOUSTREE =
		{
			BURNING = "탄다!!",
			BURNT = "타버렸네",
			CHOPPED = "여기에 앉아서 쉬면 편할 것 같아",
			GENERIC = "나무야",
			POISON = "왕!왕왕!",
		},
		ACORN_COOKED = "냄새가 좋아!",
		BIRCHNUTDRAKE = "창 말고, 도끼로 찍어버려야해!",
		FARMPLOT =
		{
			GENERIC = "씨앗을 심기위해 땅을 골라봤어",
			GROWING = "빨리빨리 자라라",
			NEEDSFERTILIZER = "비료를 가져와야겠어",
			BURNT = "익어버리기도 전에 타버렸네",
		},
		COLDFIREPIT =
		{
			EMBERS = "뭔가 넣어볼까?",
			GENERIC = "이 파란 불꽃은 요리를 할 수 없어",
			HIGH = "엄청난 불꽃인데 차가워!",
			LOW = "차가운 불꽃이 사그러져가",
			NORMAL = "파란 불꽃은 엄청 뜨겁다고 들었는데 실제로는 차갑네",
			OUT = "불꽃이 사그러졌어",
		},
		FIRESUPPRESSOR =
		{
			ON = "불이 나지 않게 하려면 태울게 많이 필요해",
			OFF = "아껴서 사용할 수 있다면 재료를 절약할 수 있을거야",
			LOWFUEL = "넣은게 거의 바닥났어. 어서 보충해야해",
		},
		ICEHAT = "머리가 축축하긴 하지만 지금 시원한건 좋아",
		LIGHTNINGGOAT =
		{
			GENERIC = "베베꼬인 뿔을 가진 염소야",
			CHARGED = "찌릿한 염소야! 근데 뮤샤에게 착할 것 같진 않아",
		},
		LIGHTNINGGOATHORN = "기가 드릴 브-\n웅? 안된다구? 왜?",
		GOATMILK = "염소젖이야!",
		MEATRACK =
		{
			DONE = "언제 회수하는거야? 이미 바싹 마른 것 같은데",
			DRYING = "뮤샤는 고기를 더욱 맛있게 만들고 있어",
			DRYINGINRAIN = "말리다 젖고 다시 마른 고기는 맛이 괜찮을까?",
			GENERIC = "뮤샤는 이것으로 육포를 만들거야. 육포는 맛있어.",
			BURNT = "뮤샤는 고기를 말리려고 했지 나무를 태울 생각은 없었어",
		},
		MERMHEAD =
		{
			GENERIC = "물고기괴인을 싫어하는게 뮤샤뿐만은 아닌것 같아",
			BURNT = "얘는 두번 죽었네",
		},
		MERMHOUSE =
		{
			GENERIC = "늪지에서 사는 괴물이 사는 집이야",
			BURNT = "늪에서 살아서 불에는 익숙하지 않았나봐",
		},
		FLOWERSALAD = "꽃잎을 요리하면 맛있어져",
        ICECREAM = "엄청 희귀한 요리야! 맛있을것 같아!",
        WATERMELONICLE = "과일하고 얼음하고 같이 먹는건 멋진 생각인것 같아!",
        TRAILMIX = "모든것은 먹을 수 있어. 돌죽도 있는걸",
        HOTCHILI = "화끈한 음식이야",
        GUACAMOLE = "먹을 수 있는것과 먹을 수 있는것을 섞었어",
		MOOSE = "저 오리는 나무도 한 입에 먹을 것 같아",
		MOOSEEGG = "그 새는 이 알을 어떻게 낳은거지?",
		MOSSLING = "뮤샤보다 커다란 병아리야",
		FEATHERFAN = "이 부채는 왜 이렇게 큰거지?",
		GOOSE_FEATHER = "이 깃털은 깃털펜으로 만들기엔 너무 큰거 같은데",
		STAFF_TORNADO = "바람이 분다 바람이 불어",
		PIGHEAD =
		{
			GENERIC = "뭘 하고 싶어서 이런걸 만든걸까?",
			BURNT = "먹을려고 구운건 아닐텐데",
		},
		PIGHOUSE =
		{
			FULL = "여보세요? 뮤샤를 잠깐만 도와줬으면 하는데",
			GENERIC = "돼지괴인들은 뮤샤를 도와줘. 가끔은 아니지만",
			LIGHTSOUT = "아, 비었나보네",
			BURNT = "이 집에 무슨 일이 벌어진거지?",
		},
		FERTILIZER = "똥통! 아니, 비료통!",
		RAINOMETER =
		{
			GENERIC = "비가 올 확률은 Soon™ 입니다",
			BURNT = "비가 올 확률은 N/A 입니- 어?",
		},
		RAINCOAT = "이제 젖을 걱정이 없을거야 그치?",
		RAINHAT = "뮤샤는 물을 마시는건 좋아하지만\n머리에 붓는게 마시는건 아니잖아",
		RESEARCHLAB =
		{
			GENERIC = "생존기술을 배울 수 있는 기계라고 해",
			BURNT = "선생님이 타버린거야?",
		},
		RESEARCHLAB2 =
		{
			GENERIC = "이 세계의 모든 지식의 정수가 담겨있-\n지 않네. 몇갠 없어.",
			BURNT = "타버린 책은 아무것도 읽을 수 없잖아\n이것도 마찬가지야",
		},
		RESEARCHLAB3 =
		{
			GENERIC = "뮤샤가 마법을 부릴 수 있게 해줘. 기적이던가.",
			BURNT = "마법도 기적도 불 앞에서는 손을 쓸 수 없었어",
		},
		RESEARCHLAB4 =
		{
			GENERIC = "결론이 나왔어. 모자와 토끼. 이건 마법이야!",
			BURNT = "마법도 불 앞에서는 손을 쓸 수 없었어",
		},
		RESURRECTIONSTATUE =
		{
			GENERIC = "이거 낮이 익어. 윌슨?",
			BURNT = "불타버린 윌슨이야. 뼈도 안남았다구",
		},
	--adds 1 start
		CAVEIN_BOULDER =
        {
            GENERIC = "I think I can lift this one.",
            RAISED = "It's out of reach.",
        },
        ROCK = "It wouldn't fit in my pocket.",
        PETRIFIED_TREE = "It looks scared stiff.",
        ROCK_PETRIFIED_TREE = "It looks scared stiff.",
        ROCK_PETRIFIED_TREE_OLD = "It looks scared stiff.",
	--adds 1 end
		ROCK_ICE =
		{
			GENERIC = "얼음이 하늘로 쭉쭉 자라나는거야",
			MELTED = "지금은 이래도 금방 쭉쭉 자랄거야",
		},
		ROCK_ICE_MELTED = "얼음이 하늘로 자라기엔 너무 더운 날씨야",
		ICE = "차가워",
        REFLECTIVEVEST = "뮤샤도 언젠가 헤엄칠 수 있을까?",
		HAWAIIANSHIRT = "알록달록한 옷이야!",
		TENT =
		{
			GENERIC = "텐트에선 밤에 어둠을 피할 수 있어",
			BURNT = "타버린 텐트는 밤에 뮤샤를 지켜주지 않아",
		},
		SIESTAHUT =
		{
			GENERIC = "너무 더울땐 여기서 쉬는 것도 좋아",
			BURNT = "너무 더워서 타버렸나봐",
		},
		TRANSISTOR = "이거야말로 마법이야!",
		TREASURECHEST =
		{
			GENERIC = "뮤샤에겐 많은게 필요하고,\n여기엔 그중에 몇몇개가 들어있어",
			BURNT = "모두 다 타버렸어!",
		},
		TUMBLEWEED = "멈춰! 그만 좀 굴러가!",
		GRASS_UMBRELLA = "파릇파릇한 우산으로 비를 막을거야",
		UNIMPLEMENTED = "재대로 작동을 하는거야?",
		WALL_HAY =
		{
			GENERIC = "간단히 만들수는 있어도 임시니까 조심해야해. 불도 조심해야해",
			BURNT = "뮤샤가 얘기했잖아, 불을 조심해야한다니까",
		},
		WALL_WOOD =
		{
			GENERIC = "볏단보단 낫지만 그래도 불에 조심해야해",
			BURNT = "(한숨) 그래도 뮤샤는 다시 보강해야해",
		},
		WARG = "이것 봐! 이게 검은 늑대들의 우두머리인가봐!",
		WATERMELON = "이 커다랗고 줄무늬있는 열매는 물이 가득해",
		WATERMELON_COOKED = "따끈하고 달콤한 물이 준비됐어",
		WATERMELONHAT = "열매 껍질로 모자를 만들 수 있어, 이것봐",
		WINTEROMETER =
		{
			GENERIC = "내일의 날씨는 SOON™ 입니다",
			BURNT = "화재 경보 기능은 없었나봐",
		},
		HOMESIGN =
		{
			GENERIC = "여기에 뭔갈 적어보자",
			BURNT = "표지판이면 이대로도 괜찮은거 아닐까?",
		},
		BEEBOX =
		{
			READY = "이걸봐! 벌이 안에 잔뜩 들어있어!",
			FULLHONEY = "상자에 꿀이 가득해!",
			GENERIC = "벌들이 사방에서 꿀을 모아올거야",
			NOHONEY = "뮤샤는 꿀을 기다릴거야",
			SOMEHONEY = "좋아, 꿀이 잘 모이고 있어",
			BURNT = "꿀을 상자째로 구워버리는건 좋은 생각이 아니야",
		},
		LIVINGTREE = "이 나무는 살아있는것같아. 특히 얼굴이 말이야",
		ICESTAFF = "파란색으로 빛나는 마법의 지팡이야",
		WORMLIGHT = "밤에 반짝이는 열매야! 먹으면 어떻게 될까?",
		WORM =
		{
		    PLANT = "밤에 반짝이는 열매야! 근데 이게 무슨 냄새지?",
		    DIRT = "땅속에 뭔가 움직이고있어!",
		    WORM = "엄청나게 커다란 지렁이야!",
		},
		EEL = "길고 이상하게 생긴 물고기야",
		EEL_COOKED = "고소한 냄새하고, 이건 무슨 냄새지?",
		UNAGI = "솥에 재료를 넣고 흔들었는데 우나기가 완성되었어!",
		EYETURRET = "이 돌탑이 모든걸 쏴버릴거야",
		EYETURRET_ITEM = "이건 쉽게 구할 수 있는게 아니니까 신중하게 지어야해",
		MINOTAURHORN = "이게 바로 뮤샤가 위대한 모험을 해냈다는 증거야",
		MINOTAURCHEST = "이 커다란 보물상자에는 무엇이 들어있을까?",
		THULECITE_PIECES = "흔하지 않은 재료지만\n뮤샤는 이걸로 무엇을 만들 수 있는지 알고있어",
		POND = "낚시를 하자!",
		POND_ALGAE = "뭔가 이상한게 물속에서 헤엄치고있어",
		GREENSTAFF = "뭐든지 분해할 수 있는 지팡이야\n살아있는 것에는 쓰면 안돼",
		POTTEDFERN = "뭔가에 써먹을 수는 없겠지만 그래도 좋아",

		THULECITE = "뭔가 의미가 있는것 같은 문양이야",
		ARMORRUINS = "확실히 단단할것 같지만 매우 무거워",
		RUINS_BAT = "뮤샤가 알고있는 돌망치 가운데는 가장 단단해",
		RUINSHAT = "이걸 쓰면 뮤샤도 훌륭한 뮤샤가 될까?",
		NIGHTMARE_TIMEPIECE = --Keeps track of the nightmare cycle
		{
		CALM = "아무것도 없고, 아무 문제도 없어",	--Calm phase
		WARN = "조금 더워진거 같아",	--Before nightmare
		WAXING = "뮤샤의 생각이지만 여긴 더 이상 안전하지 않은 것 같아", --Nightmare Phase first 33%
		STEADY = "이 이상은 나빠지지 않을 줄 알았는데!", --Nightmare 33% - 66%
		WANING = "여긴 지금 엄청나게 위험해!", --Nightmare 66% +
		DAWN = "조금만 더 버티면 될것같아!", --After nightmare
		NOMAGIC = "이런 평화로운 날도 있어야지", --Place with no nightmare cycle.
		},
		BISHOP_NIGHTMARE = "이 기계들은 왜 뮤샤를 쏘는거야?",
		ROOK_NIGHTMARE = "머리도, 다리도, 눈도 고장났지만 아직 달리고 있어",
		KNIGHT_NIGHTMARE = "말머리 기계는 박치기를 조심해야해",
		MINOTAUR = "위험해 보이지만 뮤샤는 이길 수 있어",	--Monster in labyrinth
		SPIDER_DROPPER = "하얀 거미는 동굴 위쪽에서 살고있어",	--White spider that comes from the roof
		NIGHTMARELIGHT = "이 불이 켜져있는건 좋은 징조는 아니야",	--Lights that activate during nightmare.
		GREENGEM = "녹색 보석은 흔히 볼 수 있는게 아니야",
		RELIC = "이제 작동할거야!",	--Fixed relic
		RUINS_RUBBLE = "뭔가 부품이 비어있어",	--Broken relic
		MULTITOOL_AXE_PICKAXE = "도끼로도 쓸 수 있고 곡괭이로도 쓸 수 있어!",	--Works as axe and pickaxe
		ORANGESTAFF = "뿅 뿅 하면서 움직일 수 있어!",	--Teleports player.
		YELLOWAMULET = "빨라져!",	--Emits light, player walks faster.
		GREENAMULET = "반값 세일!",	--Reduce cost of crafting

		SLURPER = "검정색 팩맨!",
		SLURPER_PELT = "이것봐! 아직도 살아있는것 처럼 꿈틀거려!",
		ARMORSLURPER = "이 벨트는 배를 너무 꽉 조여",
		ORANGEAMULET = "아이템을 쉽게 주을 수 있는 정도의 능력",
		YELLOWSTAFF = "빛을 만드는 마법의 지팡이!", 
		YELLOWGEM = "노란색 보석은 반짝반짝해!",
		ORANGEGEM = "주황색 보석은 시간하고 공간을 움직인다는 이야기가 있어",
		TELEBASE =
		{
			VALID = "하늘이 아니라 땅이 움직이는 것 같아",
			GEMS = "이제 작동하려나?",
		},
		GEMSOCKET =
		{
			VALID = "뮤샤는 여기에 보라색 보석이 필요하다고 느껴",
			GEMS = "뮤샤의 모험이 더 넓어질거야",
		},
		STAFFLIGHT = "대... 대단해!",

        LIGHTER = "이 작은 물건이 불을 붙일 수 있대",


        ANCIENT_ALTAR =
        {
        	WORKING = "이것도 뮤샤와 관련이 있는걸까?",
        	BROKEN = "재대로 움직이게 하려면 뭔가 더 필요할 것 같아",
        },
        ANCIENT_ALTAR_BROKEN = "재대로 움직이게 하려면 뭔가 더 필요할 것 같아",

        ANCIENT_STATUE = "이것도 뮤샤와 관련이 있는걸까?",

        LICHEN = "돌덩이?",
		CUTLICHEN = "뭔가 썩은냄새가 나",

        CAVE_BANANA = "동굴 속에서 이런 샛노란 과일을 발견했어",
        CAVE_BANANA_COOKED = "익히면 좀 더 달아?",
        CAVE_BANANA_TREE = "빛이 없는데 어떻게 자라는걸까?",
        ROCKY = "커다래!",

        BLUEAMULET = "차가운 목걸이야",
		PURPLEAMULET = "뮤샤는 죽은자가 보여",
		TELESTAFF = "뿅! 뿅! 뿅!",
		MINERHAT = "뮤샤는 광부는 아니지만, 동굴 속에서 이 모자는 유용해",
		MONKEY = "저 녀석이 뮤샤의 아이템을 훔쳐갔어",
		MONKEYBARREL = "저 속에 희귀한 아이템이 숨겨져 있을 지도 몰라",

		HOUNDSTOOTH="저 뼈 무더기에서 사는건 불편해보여",
		ARMORSNURTLESHELL="투구가 더 낫겠지만 이건 이것대로 좋아",
		BAT="나쁜 박쥐!",
		BATBAT = "뮤샤의 사냥감으로 뮤샤의 사냥감을 잡는거야",
		BATWING="이걸로 뮤샤는 여러가지를 해볼 수 있을 것 같아",
		BATWING_COOKED="바삭바삭해",
		BEDROLL_FURRY="이제 편하게 잘 수 있겠어",
		BUNNYMAN="조심해야해, 쟤들은 고기 냄새를 싫어해",
		FLOWER_CAVE="햇살 대신 동굴에서 중요한 빛이야",
		FLOWER_CAVE_DOUBLE="햇살 대신 동굴에서 중요한 빛이야",
		FLOWER_CAVE_TRIPLE="햇살 대신 동굴에서 중요한 빛이야",
		GUANO="뭘 먹었길래 이렇게 나오는거야?",
		LANTERN="손에 들고있어도 빛이 나오고 손에 떼고있어도 빛이 나와!",
		LIGHTBULB="빛나는 열매야!",
		MANRABBIT_TAIL="주먹만한 털뭉치야!",
		MUSHTREE_TALL="파란 버섯나무야",
		MUSHTREE_MEDIUM="빨간 버섯나무야",
		MUSHTREE_SMALL="녹색 버섯나무야",
		SLURTLE="이 단단한 껍질을 짊어지고 다니기엔 너무 작은거 아닐까?",
		SLURTLE_SHELLPIECES="열번찍으면 부셔지네",
		SLURTLEHAT="이 모자 나쁘지 않아!",
		SLURTLEHOLE="커다란 선인장같아",
		SLURTLESLIME="뮤샤는 알아. 먹으면 안되는거지?",
		SNURTLE="갑옷을 입고 있는 것 같아",
		SPIDER_HIDER="저 거미는 이상한 모자를 쓰고 있어",
		SPIDER_SPITTER="저 거미는 거미줄 뭉치를 쏘니까 조심해야해!",
		SPIDERHOLE="저기 거미집이 보여?",
		STALAGMITE="돌이 하늘로 자라고 있었나봐",
		STALAGMITE_FULL="돌이 나무처럼 크게크게 자랐어! 그리고 안쪽이 뭔가 있어!",
		STALAGMITE_LOW="이 돌은 쓸만할 것 같아",
		STALAGMITE_MED="돌이 하늘로 자라는 것 같아.\n잠깐, 뮤샤 전에도 이 말 한 것 같아.",
		STALAGMITE_TALL="돌이 하늘로 자라고 있었나봐",
		STALAGMITE_TALL_FULL="돌이 나무처럼 크게크게 자랐어! 그리고 안쪽이 뭔가 있어!",
		STALAGMITE_TALL_LOW="이 돌은 쓸만할 것 같아",
		STALAGMITE_TALL_MED="돌이 하늘로 자라는 것 같아.\n잠깐, 뮤샤 전에도 이 말 한 것 같아.",

		TURF_CARPETFLOOR = "푹신푹신해",
		TURF_CHECKERFLOOR = "알록달록하고 푹신푹신해",
		TURF_DIRT = "흙무더기야",
		TURF_FOREST = "이끼가 굉장히 많아",
		TURF_GRASS = "푸른 초원의 기분을 낼 수 있어",
		TURF_MARSH = "나뭇잎이 많아!",
		TURF_ROAD = "바닥이 딱딱하면 뮤샤는 더 빠르게 달릴 수 있어",
		TURF_ROCKY = "돌바닥은 쓸모가 있어",
		TURF_SAVANNA = "이거 무슨 냄새나지 않아? 비팔로의-",
		TURF_WOODFLOOR = "뮤샤는 삐걱거리는 소리도 좋아해",

		TURF_CAVE="흰색 바닥",
		TURF_FUNGUS="얼룩덜룩한게 사방에 퍼져있어",
		TURF_SINKHOLE="녹색 얼룩이 보여",
		TURF_UNDERROCK="이 돌은 못쓸거같은데",
		TURF_MUD="이 진흙 어떻게 사용할 수 없을까?",

		TURKEYDINNER = "칠면조 요리야!",
		TWIGS = "나뭇가지는 항상 많은게 좋아.\n여러군데 쓸 수 있으니까",
		POWCAKE = "MSG!",
        CAVE_ENTRANCE =
        {
            GENERIC="이 돌덩이는 마개같아. 뭘 막아놓은거지?",
            OPEN = "이 아래엔 뭐가 있을까?",
        },
        CAVE_EXIT = "지상으로 나가는 로프야!",

		MAXWELLPHONOGRAPH = "이런 취미도 괜찮은것 같아",
		PIGGUARD = "뭔가를 지키고 있나봐",
		BOOMERANG = "상대를 멀리서 공격할 수 있는 무기야",
		ADVENTURE_PORTAL = "여기로 들어가면 어디로 나오는거야?",
		AMULET = "뭔가 힘이 느껴져! 아닌가?",
		ANIMAL_TRACK = "좋은 사냥을",
		ARMORGRASS = "쉽게 만들 수 있어. 없는 것 보단 나아",
		ARMORMARBLE = "무겁다는 것만 빼면 나쁜건 아닌데, 너무 무겁네",
		ARMORWOOD = "가장 오랫동안 사용되었던 보호구가 아닐까",
		ARMOR_SANITY = "살아있는 갑옷인가봐",
		ASH =
		{
			GENERIC = "바람이 불면 타버렸다는 흔적도 사라질거야",
			REMAINS_GLOMMERFLOWER = "되돌릴 수는 없어도 새로 찾을 수는 있을거야",
			REMAINS_EYE_BONE = "되돌릴 수는 없어도 새로 찾을 수는 있을거야",
			REMAINS_THINGIE = "되돌릴 수는 없어도 새로 찾을 수는 있을거야",
		},
		AXE = "나무로는 여러가지를 할 수 있어. 나무를 쓸려면 먼저 베어야해",
		BABYBEEFALO =
		{
			GENERIC = "아기는 귀엽다구",
			SLEEPING = "자고있는 아기는 귀엽다구",
		},
		BACKPACK = "가방은 모험하면서 재료를 모을땐 정말 유용해",
		BACONEGGS = "고기도 있고 후라이도 있다니 정말 좋아!",
		BANDAGE = "붕대 필요해?",
		BASALT = "이건 뮤샤의 힘만으로는 어떻게 할 수 없을 것 같아",
		BEARDHAIR = "털과 수염은 무슨 차이인거야?",
		BEDROLL_STRAW = "뮤샤는 보통 위에서 잠을 자",
		BEE =
		{
			GENERIC = "저 벌들은 일을 하고 있어",
			HELD = "부웅부웅부우우웅",
		},
		BEEFALO =
		{
			FOLLOWER = "얘는 뮤샤를 따라오고있어",
			GENERIC = "크고 묵직하고 더럽고 느려보여",
			NAKED = "다리가 이렇게 가늘 줄은 몰랐어!",
			SLEEPING = "아무데서나 자는거야?",
		},
		BEEFALOHAT = "뮤샤는 아무것이나 들이받을 준비가 되었어",
		BEEFALOWOOL = "이걸 덮으면 따뜻할 것 같아",
		BEEHIVE = "벌들은 여기에 꿀을 쌓아놓아. 뮤샤에게 나누어 줄것 같진 않지만",
		BEEMINE = "벌은 화나면 무서워. 지금 엄청 화나있거든?",
		BEEMINE_MAXWELL = "모기도 화나면 무서울거야. 벌만큼 찔러댈테니까",
		BEEHAT = "벌에게서 최소한 얼굴은 안전해!",
		BERRIES = "맛있는 열매야!",
		BERRIES_COOKED = "구우면 더 맛있는 열매야!",
		BERRYBUSH =
		{
			BARREN = "열매를 말리는건 좋은 생각같은데 나무는 아니야",
			WITHERED = "맛이 간거같아. 열매 말고 나무가.",
			GENERIC = "신선한 열매가 열려있어!",
			PICKED = "언제쯤 열매가 다시 열리는걸까?",
		},
		BIRDCAGE =
		{
			GENERIC = "새를 위한 집이 준비되었어",
			OCCUPIED = "이 새는 밖에서 밥을 먹을 수 없으니까 뮤샤가 밥을 줘야해",
			SLEEPING = "새가 자는 동안엔 이 집이 새를 지켜줄거야",
		},
		BIRDTRAP = "새를 산채로 잡는 방법 가운데 하나야",
		BIRD_EGG = "알이 끝없이 나와!",
		BIRD_EGG_COOKED = "알로 만들 수 있는 요리는 참 많아",
		BISHOP = "저건 뮤샤를 쏘니까 조심해야해",
		BLOWDART_FIRE = "이건 불이 붙으니까 조심해야해",
		BLOWDART_SLEEP = "이걸 맞으면 잠에 들거야",
		BLOWDART_PIPE = "이건 좀 따가울 거야",
		BLUEGEM = "차가운 보석이야",
		BLUEPRINT = "이걸 읽으면 뮤샤의 지식이 늘어날거야",
		BELL_BLUEPRINT = "누군가를 부르는 도구를 만드는 방법이야",
		BLUE_CAP = "먹으면 힘이 나는 버섯이야",
		BLUE_CAP_COOKED = "구워서 먹으면 머리가 맑아져",
		BLUE_MUSHROOM =
		{
			GENERIC = "밤하늘을 좋아하는 파란버섯이야",
			INGROUND = "밤이 온 다음에 다시 와봐야해",
			PICKED = "기둥만 봐서는 무슨 버섯인지 모르겠어",
		},
		BOARDS = "판자로 만들 수 있는건 정말 많아",
		BONESTEW = "두 유 노 곰탕?",
		BUGNET = "벌레를 다치지 않게 잡을려면 이게 제일 간단해",
		BUSHHAT = "기다리게 했군",
		BUTTER = "버터플라이 - 플라이 = 버터",
		BUTTERFLY =
		{
			GENERIC = "버터가 날면 버터플라이!",
			HELD = "나비는 먹는게 아니야 땅에 심는거야", --☺
		},
		BUTTERFLYMUFFIN = "버터머핀이라는게 나비가 꽃혀있는 머핀이었어?",
		BUTTERFLYWINGS = "나비 몸통이 없어졌어",
		CAMPFIRE =
		{
			EMBERS = "사용하고 싶으면 태울만한걸 넣어야해",
			GENERIC = "뮤샤에게 따뜻한 온기를 나눠줘",
			HIGH = "불꽃이 하늘로 치솟고있어!",
			LOW = "불꽃이 사그러들고있어. 새벽이 빨리 온다면 문제는 없을거야",
			NORMAL = "밝은 빛이야",
			OUT = "다시 불을 피워야하는게 아닐까?",
		},
		CANE = "뮤샤는 두발보다 세발로 뛰는걸 더 잘하나봐!",
		CARROT = "뮤샤는 당근도 먹을 수 있어",
		CARROT_COOKED = "이제 당근이 딱딱하지 않아!",
		CARROT_PLANTED = "당근으 심어놨어",
		CARROT_SEEDS = "당근 씨앗이야",
		CAVE_FERN = "동굴 안에서만 볼 수 있는 보랏빛 잎이야",
		CHARCOAL = "한번 탄 나무는 또 탈 수 있어",
        CHESSJUNK1 = "부서진 잔해들이 널려있어",
        CHESSJUNK2 = "부서진 잔해들이 널려있어",
        CHESSJUNK3 = "부서진 잔해들이 널려있어",
		CHESTER = "복실복실해!",
		CHESTER_EYEBONE =
		{
			GENERIC = "뼈 위에 눈이 있을 뿐인데 어떻게 움직이는거지?",
			WAITING = "X를 눌러 조의를 표하시오? X는 뭐지?",
		},
		COOKEDMEAT = "뮤샤는 날것보다 조리한 쪽이 더 좋아",
		COOKEDMONSTERMEAT = "조리를 해도 극복할 수 없는 냄새야",
		COOKEDSMALLMEAT = "고기에는 뭘 넣어도 고기요리가 되어버려",
		CORN = "가루를 내어도 되고 삶아도 되고 구워도 되고 튀겨도 돼!",
		CORN_COOKED = "냄새가 좋아!",
		CORN_SEEDS = "옥수수 씨앗이야",
		CROW =
		{
			GENERIC = "새는 모두 알을 낳아. 검정색 새도 알을 낳아.",
			HELD = "뮤샤가 새를 잡았어! 산채로!",
		},
		CUTGRASS = "풀은 정말 다용도야",
		CUTREEDS = "갈대로 종이를 만들 수 있어!",
		CUTSTONE = "이 돌로 뭘 만들어볼까?",
		DEADLYFEAST = "먹으면 안돼!",
		DEERCLOPS = "어떻게 눈이 하나일 수 있지? 왜 저렇게 큰거지?",
		DEERCLOPS_EYEBALL = "하나만 있던거라면 훌륭한 전리품이야",
		DIRTPILE = "뮤샤가 발자국을 찾았어!",
		DIVININGROD =
		{
			COLD = "이게 무슨 소리지? 벌이 있는거야?",
			GENERIC = "이게 진짜 출구를 찾아주는걸까?",
			HOT = "뭔가 있는것 같아! 최소한 얘는 그렇게 말하고 있어!",
			WARM = "뭔가 느껴져. 진동이",
			WARMER = "뭔가 점점 가까워지는 모양이야. 뮤샤는 잘 모르겠지만",
		},
		DIVININGRODBASE =
		{
			GENERIC = "뭔가 꽃혀있어!",
			READY = "이제 이것은 뮤샤것입니다. 뮤샤가 마음대로 할 수 있는 것 입니다",
			UNLOCKED = "쓸모가 있을거야. 없을지도 모르지만",
		},
		DIVININGRODSTART = "이게 뮤샤를 도와줄거야",
		DRAGONFLY = "잠자리가 아니라 정말로 용-파리잖아!",
		LAVASPIT =
		{
			HOT = "정말 뜨거워!",
			COOL = "이것도 얼긴 하는구나",
		},
		DRAGONFRUIT = "뮤샤는 이것이 괜찮다고 생각해",
		DRAGONFRUIT_COOKED = "생긴게 이상해도 속은 괜찮지 않아?",
		DRAGONFRUIT_SEEDS = "용과 씨앗이야",
		DRAGONPIE = "파이는 언제나 옳아!",
		DRUMSTICK = "먹을 수 있는 다리를 구했어!",
		DRUMSTICK_COOKED = "구운 다리야!",
		DURIAN = "뮤샤에게도 이걸 먹는건 큰 모험이 될거야",
		DURIAN_COOKED = "뮤샤에게 코가 없었다면 이걸 좀 더 쉽게 먹었을지도 몰라",
		DURIAN_SEEDS = "두리안 씨앗이야",
		EARMUFFSHAT = "토끼털로 만든 귀마개야",
		EGGPLANT = "가지 좋아해?",
		EGGPLANT_COOKED = "더 말랑말랑해졌어",
		EGGPLANT_SEEDS = "가지 씨앗이야",
		STUFFEDEGGPLANT = "먹을 수 있는 그릇, 먹을 수 있는 음식, 먹을 수 있는 장식!",
		DUG_BERRYBUSH = "단 열매는 항상 옳아",
		DUG_GRASS = "풀은 쓸모가 많으니까 몇개 심어두면 편리해",
		DUG_MARSH_BUSH = "가시있는 덤불이지만 쓸모있어",
		DUG_SAPLING = "나뭇가지는 재료로 쓸 수 있고 연료로도 쓸 수 있어",
		EARMUFFS = "토끼털로 만든 귀마개야",
		DECIDUOUSTREE =
		{
			BURNING = "쉽게 불이 붙고, 쉽게 불이 번져",
			BURNT = "목탄 덩어리야",
			CHOPPED = "나무가 밑둥만 남아서 이제 더 이상 크지 않을거야",
			GENERIC = "비를 피할 수 있고, 땔감도 되고, 재료도 돼",
		},
		ACORN =
		{
		    GENERIC = "비를 피할 수 있고, 땔감도 되고, 재료도 돼",
		    PLANTED = "도토리 나무야",
		},
		EVERGREEN =
		{
			BURNING = "쉽게 불이 붙고, 쉽게 불이 번져",
			BURNT = "목탄 덩어리야",
			CHOPPED = "나무가 밑둥만 남아서 이제 더 이상 크지 않을거야",
			GENERIC = "비를 피할 수 있고, 땔감도 되고, 재료도 돼",
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "쉽게 불이 붙고, 쉽게 불이 번져",
			BURNT = "목탄 덩어리야",
			CHOPPED = "나무가 밑둥만 남아서 이제 더 이상 크지 않을거야",
			GENERIC = "비를 피할 수 있고, 땔감도 되고, 재료도 돼",
		},
		EYEPLANT = "뭐든지 먹어버리는 괴물이야",
		FEATHERHAT = "춤을 춰야만 할것 같은 모자야",
		FEATHER_CROW = "까만새 깃털이야",
		FEATHER_ROBIN = "빨간새 깃털이야",
		FEATHER_ROBIN_WINTER = "하얀새 깃털이야",
		FEM_PUPPET = "어디에 쓰는거지?", --what was that?
		FIREFLIES =
		{
			GENERIC = "밤에 빛나는 벌레야",
			HELD = "반짝일때는 몰랐는데 이거 이상하게 생겼어",
		},
		FIREHOUND = "절대로 집 안에 들어오게 하면 안돼! 다 타버릴거야!",
		FIREPIT =
		{
			EMBERS = "사용하고 싶으면 태울만한걸 넣어야해",
			GENERIC = "뮤샤에게 따뜻한 온기를 나눠줘",
			HIGH = "불꽃이 하늘로 치솟고있어!",
			LOW = "불꽃이 사그러들고있어. 새벽이 빨리 온다면 문제는 없을거야",
			NORMAL = "밝은 빛이야",
			OUT = "다시 불을 피워야하는게 아닐까?",
		},
		FIRESTAFF = "불을 쏘는 물건은 뭐든지 위험해",
		FISH = "이곳의 물고기는 연못에만 있어",
		FISHINGROD = "물고기를 먹으려면 물고기를 잡아야지",
		FISHSTICKS = "가시 걱정만 없다면 더 맛있게 먹을 수 있어",
		FISHTACOS = "물고기와 옥수수 가루만 있으면 만들 수 있어!",
		FISH_COOKED = "가장 간단한 물고기 요리야. 구운거야!",
		FLINT = "불꽃이 튀는 돌이지만 도구를 만드는 데도 쓸 수 있어",
		FLOWER = "색도 좋고, 냄새도 좋고, 맛은-",
		FLOWERHAT = "화환은 색도 좋고, 냄새도 좋고, 맛은-",
		FLOWER_EVIL = "화환의 냄새가 이상해졌어. 뮤샤의 머리에서도 이상한 냄새가 밴것같아",
		FOLIAGE = "그냥은 먹을 수 없겠어",
		FOOTBALLHAT = "튼튼하고 앞이 잘 보여",
		FROG =
		{
			DEAD = "좋은 개구리는 죽은 개구리뿐이야",
			GENERIC = "뮤샤는 개구리를 별로 안좋아하는데 개구리도 마찬가지인가봐",
			SLEEPING = "쉬잇, 개구리가 자고있어",
		},
		FROGGLEBUNWICH = "바삭한 다리로 만든 샌드위치야",
		FROGLEGS = "몸통엔 뭐가 들었을지 모르니까 다리만 챙겼어",
		FROGLEGS_COOKED = "잘 구워졌어",
		FRUITMEDLEY = "과일을 잔뜩 섞은거야",
		GEARS = "메탈 기어 뮤샤!",
		GHOST = "이 유령은 때릴 수 있어!",
		GOLDENAXE = "이 금도끼는 뮤샤의 금도끼야",
		GOLDENPICKAXE = "돌 곡괭이보다는 금으로 만든게 더 튼튼해",
		GOLDENPITCHFORK = "눈부셔!",
		GOLDENSHOVEL = "이걸로 땅을 파서 이거보다 값진게 나올까?",
		GOLDNUGGET = "뮤샤는 금덩이를 유용하게 사용할 줄 알아",
		GRASS =
		{
			BARREN = "비료가 필요해보여",
			WITHERED = "이대로 놔두면 말라 죽을지도 몰라",
			BURNING = "불이야!",
			GENERIC = "풀은 여러모로 쓸모가 많아",
			PICKED = "풀은 놔둬도 잘 자라",
		},
		GREEN_CAP = "녹색 버섯은 환각버섯이래",
		GREEN_CAP_COOKED = "구워 먹으면 정신이 또렷해진대",
		GREEN_MUSHROOM =
		{
			GENERIC = "녹색 버섯이야",
			INGROUND = "해가 질 무렵에 오면 버섯을 얻을 수 있을거야",
			PICKED = "기둥만 봐서는 무슨 버섯인지 모르겠어",
		},
		GUNPOWDER = "이게 있으면 뭐든지 터트릴 수 있어!",
		HAMBAT = "먹을것 가지고 장난치지 말라는 이야기는 있지만\n이건 장난이 아니니까 괜찮아",
		HAMMER = "망치가 있으면 뭐든지 부술 수 있는거야",
		HEALINGSALVE = "아플때 연고를 바르면 아픈게 사라져",
		HEATROCK =
		{
			FROZEN = "꽁꽁 얼었어",
			COLD = "살짝 언것 같아",
			GENERIC = "이 돌은 여름 겨울 가리지 않고 유용해",
			WARM = "따뜻한 돌이야",
			HOT = "돌이 불덩이처럼 뜨거워!",
		},
		HONEY = "꿀이야!",
		HONEYCOMB = "벌집이 있으면 벌통을 만들 수 있어",
		HONEYHAM = "입 속이 단맛으로 꽉 차고 배는 고기로 꽉 차는 요리야",
		HONEYNUGGETS = "꿀하고 고기를 같이 먹는거 뮤샤는 괜찮다고 생각해",
		HORN = "웅웅 거리는 소리가 날거야",
		HOUND = "이곳의 늑대하고 뮤샤하고는 아무런 관련이 없어. 진짜야",
		HOUNDMOUND = "어떻게 이 좁은 무더기에서 늑대들이 끊임없이 나오는거야?",
		HOUNDBONE = "이 상황이 되면 이건 그냥 뼈야",
		ICEBOX = "여기에 넣으면 음식을 오래 보관할 수 있어",
		ICEHOUND = "하얀 늑대야!",
		INSANITYROCK =
		{
			ACTIVE = "이게 열리려면 무슨 조건이 필요한 모양이야",
			INACTIVE = "열렸어!",
		},
	--adds 2 start
		SCARECROW = 
   		{
			GENERIC = "All dressed up and no where to crow.",
			BURNING = "Someone made that strawman eat crow.",
			BURNT = "Someone MURDERed that scarecrow!",
   		},
   		SCULPTINGTABLE=
   		{
			EMPTY = "We can make stone sculptures with this.",
			BLOCK = "Ready for sculpting.",
			SCULPTURE = "A masterpiece!",
			BURNT = "Burnt right down.",
   		},
        SCULPTURE_KNIGHTHEAD = "Where's the rest of it?",
		SCULPTURE_KNIGHTBODY = 
		{
			COVERED = "It's an odd marble statue.",
			UNCOVERED = "I guess he cracked under the pressure.",
			FINISHED = "At least it's back in one piece now.",
			READY = "Something's moving inside.",
		},
        SCULPTURE_BISHOPHEAD = "Is that a head?",
		SCULPTURE_BISHOPBODY = 
		{
			COVERED = "It looks old, but it feels new.",
			UNCOVERED = "There's a big piece missing.",
			FINISHED = "Now what?",
			READY = "Something's moving inside.",
		},
        SCULPTURE_ROOKNOSE = "Where did this come from?",
		SCULPTURE_ROOKBODY = 
		{
			COVERED = "It's some sort of marble statue.",
			UNCOVERED = "It's not in the best shape.",
			FINISHED = "All patched up.",
			READY = "Something's moving inside.",
		},
        GARGOYLE_HOUND = "I don't like how it's looking at me.",
        GARGOYLE_WEREPIG = "It looks very lifelike.",
	--adds 2 end	
	
		JAMMYPRESERVES = "슬로우푸드!",
		KABOBS = "꼬치구이!",
		KILLERBEE =
		{
			GENERIC = "일하지 않는 싸움꾼 벌이야!",
			HELD = "나쁜 벌!",
		},
		KNIGHT = "박치기 하는 말 동상... 말박이?",
		KOALEFANT_SUMMER = "빨간 코끼리야",
		KOALEFANT_WINTER = "파란 코끼리야",
		KRAMPUS = "악마가 나타났어!",
		KRAMPUS_SACK = "산타의 선물꾸러미가 이것보다 클까?",
		LAVAE = "이 불덩이는 뮤샤를 좋아하는건지 싫어하는건지 모르겠어",
		LEIF = "나무 거인이야!",
		LEIF_SPARSE = "나무 거인이야!",
		LIGHTNING_ROD =
		{
			CHARGED = "막대가 번쩍번쩍해!",
			GENERIC = "이게 있으면 번개에 안맞게된대",
		},
		LITTLE_WALRUS = "거슬리긴 하지만 신경쓰진 않아도 돼",
		LIVINGLOG = "통나무에 얼굴이 생기는거야?",
		LOCKEDWES = "누군가 같혀있어!",
		LOG =
		{
			BURNING = "모닥불을 피우는게 나았겠지만 급하면 어쩔수없지",
			GENERIC = "통나무로 할 수 있는 건 많으니까 많으면 좋아",
		},
		LUREPLANT = "이 식물엔 아이템이 끝없이 들어가는거 같아",
		LUREPLANTBULB = "이 식물은 이제 뮤샤꺼입니다.\n뮤샤 마음대로 할 수 있는겁니다",
		MALE_PUPPET = "윌슨을 기리는 동상인거야?",
		MANDRAKE =
		{
			DEAD = "머리같아",
			GENERIC = "당근이나 무라고 하기엔 뭔가 이상하게 생겼어",
			PICKED = "머리같은 뿌리에 머리카락같은 잎사귀야",
		},
		COOKEDMANDRAKE = "이 얼굴을 통째로 씹어먹는건 좋지 않은 생각같아",
		MANDRAKESOUP = "이게 그렇게 몸에 좋대",
		MARBLE = "진짜 무거운 돌이야",
		MARBLEPILLAR = "정말로 멋져",
		MARBLETREE = "이 나무는 어떻게 해서 생긴걸까?",
		MARSH_BUSH =
		{
			BURNING = "가질 필요가 없다면 태워버리면 돼",
			GENERIC = "가시가 많은 덤불이야",
			PICKED = "덤불도 어찌어찌 쓸모는 있어",
		},
		MARSH_PLANT = "이 풀은 너무 거칠어서 못 써먹어",
		MARSH_TREE =
		{
			BURNING = "잎이 없어도 잘 타는건 마찬가지네",
			BURNT = "모든 불탄 나무는 결국 목탄이 돼",
			CHOPPED = "나무는 나무니까 통나무는 있었지",
			GENERIC = "잎 대신 가시만 무성한 나무네",
		},
		MAXWELL = "키가 커!",
		MAXWELLHEAD = "뮤샤는 이 얼굴을 본 적이 있는 것 같아",
		MAXWELLLIGHT = "뭔가 불을 붙일 수 있을 것 같은데.",
		MAXWELLLOCK = "여기에 꼭 맞는 뭔가 있을 것 같은데",
		MAXWELLTHRONE = "이게 재대로 된 게 아니라는건 알겠어",
		MEAT = "고기는 말야, 굽고, 삶고, 튀기고, 말리고, 태울 수 있어",
		MEATBALLS = "미트볼이야!",
		MEAT_DRIED = "육포도 물에 불리면 다시 고기잖아?",
		MERM = "쟤들은 뮤샤를 별로 좋아하는 것 같지 않은데",
		MONSTERLASAGNA = "음식이긴 한데, 뮤샤는 먹고싶진 않아",
		MONSTERMEAT = "뮤샤 입에 모래가 들어가도 이건 먹고 싶지 않아",
		MONSTERMEAT_DRIED = "말리면 나아질 줄 알았는데 아직 아니야",
		MOSQUITO =
		{
			GENERIC = "뮤샤의 피는 맛이 없다구",
			HELD = "살아있는 모기를 써먹을 상황이 있을까?",
		},
		MOSQUITOSACK = "말랑말랑해!",
		MOUND =
		{
			DUG = "주인이 없어져버린 무덤이야",
			GENERIC = "누군가의 무덤이야",
		},
		MULTIPLAYER_PORTAL = "이곳에서 시작하고 이곳에서 끝이 날거야",
		NIGHTLIGHT = "새까만 불이어도 밤에 빛은 나는 불이야",
		NIGHTMAREFUEL = "이 작은 검은 덩어리는 아직도 꿈틀거려",
		NIGHTSWORD = "이건 날카롭다기보단 기분나쁜 칼이야",
		NITRE = "이걸로 화약을 만들 수 있어",
		ONEMANBAND = "신나게 달려보자구!",
		PANDORASCHEST = "보물상자야!",
		PANFLUTE = "뮤샤는 이거 불줄알아!",
		PAPYRUS = "갈대로 만든 종이도 책은 만들 수 있어",
		PENGUIN = "땅에서 헤엄치는 새야. 잠깐, 새?",
		PERD = "덤불속에서 숨어있어서 몰랐지만 저거 칠면조야!",
		PEROGIES = "고기만두!",
		PETALS = "꽃 뭉치 먹을래?",
		PETALS_EVIL = "갈색에 검정색이긴 해도 썩은건 아니니까 괜찮아",
		PHLEGM = "이걸 어떻게 해야하는거야?",
		PICKAXE = "이것저것 할려면 우선 돌을 캐야해",
		PIGGYBACK = "이게 좀 더 큰 가방이야",
		PIGKING = "저 돼지 왕은 기분이 좋으면 마음대로 금덩이를 뿌린다고해",
		PIGMAN =
		{
			DEAD = "죽고나면 결국 돼지야",
			FOLLOWER = "가자구! 가서 뮤샤랑 같이 거미를 잡자!",
			GENERIC = "저 돼지괴인들은 뮤샤를 싫어하지 않는 것 같아",
			GUARD = "저 돼지괴인들은 신경이 날카로워보여",
			WEREPIG = "털난 맷돼지같아! 게다가 사납구!",
		},
		PIGSKIN = "뮤샤는 먹지 않을거지만 누군가는 먹을지도 몰라",
		PIGTORCH = "기둥이 멋진 횃불이야",
		PINECONE =
		{
		    GENERIC = "솔방울이야",
		    PLANTED = "소나무 묘목이야",
		},
		PITCHFORK = "땅을 엎어버릴 수 있어. 아니, 뜯을 수 있어",
		PLANTMEAT = "뮤샤가 보기에 이건 녹아내리고있는 것 같아",
		PLANTMEAT_COOKED = "냄새는 고기같아!",
		PLANT_NORMAL =
		{
			GENERIC = "채소나 과일을 기르려면 필요해",
			GROWING = "Let it grow~ Let it grow~",
			READY = "이제 수확해도 돼!",
			WITHERED = "물기가 너무 없어. 완전히 바싹 말라버렸어",
		},
		POMEGRANATE = "석류야",
		POMEGRANATE_COOKED = "열매 안쪽에 또 열매가 있어",
		POMEGRANATE_SEEDS = "석류 씨앗이야",
		POOP = "너무 큰... 똥이야. 하지만 쓸 구석은 많아",
		PUMPKIN = "호박이야! 뮤샤는 잭-오-랜턴의 이야기를 좋아해!",
		PUMPKINCOOKIE = "호박과자!",
		PUMPKIN_COOKED = "호박을 한번 찌면 자르기 쉬워",
		PUMPKIN_LANTERN = "이렇게 놓고 보니까 늑대 얼굴같아",
		PUMPKIN_SEEDS = "호박 씨앗이야",
		PURPLEGEM = "이 보라색 보석 속에 뭔가 보이는 것 같아",
		RABBIT =
		{
			GENERIC = "빠르긴 해도 뮤샤에겐 손쉬운 사냥감이야",
			HELD = "이 토끼를 어떻게 해볼까?",
		},
		RABBITHOLE =
		{
			GENERIC = "토끼가 숨어있는 구멍이야",
			SPRING = "이제는 사용하지 않는 구멍같아.\n하지만 조사해보면 뭔가 있을지도 몰라",
		},
		RATATOUILLE = "알록달록한 음식이야! 고기는 하나도 없어",
		RAZOR = "뮤샤가 네 털을 몽땅 밀어버릴거야!",
		REDGEM = "빨간 보석은 생명과 불을 상징한다고 해",
		RED_CAP = "빨간 버섯은 독버섯이라던데",
		RED_CAP_COOKED = "구워도 빨간 버섯이야",
		RED_MUSHROOM =
		{
			GENERIC = "빨간 버섯은 독이 있다고 해",
			INGROUND = "낮에 다시 오면 확인할 수 있을거야",
			PICKED = "기둥만 봐서는 무슨 버섯인지 모르겠어",
		},
		REEDS =
		{
			BURNING = "늪지여도 불은 붙어!",
			GENERIC = "갈대는 용도가 참 많아. 특히 종이랑 다트",
			PICKED = "시간이 지나면 다시 자랄거야",
		},
        RELIC =
        {
            GENERIC = "주인이 없다면 이제 뮤샤가 써도 되겠지?",
            BROKEN = "쓸려면 수리를 해야할 거 같아",
        },
        RUBBLE = "이걸 어디에 쓰지?",
		RESURRECTIONSTONE = "부활을 하려면 죽어야하는데, 일부러 그럴 필요는 없을 것 같아",
		ROBIN =
		{
			GENERIC = "이 빨간 새는 나무를 잘 쪼아댈 것 같아.",
			HELD = "뮤샤가 빨간새를 잡았어! 산채로!",
		},
		ROBIN_WINTER =
		{
			GENERIC = "푹신푹신한 하얀 돼지새야",
			HELD = "뮤샤가 하얀새를 잡았어! 산채로!",
		},
		ROBOT_PUPPET = "결국은 모두 죽기마련",
		ROCK_LIGHT =-- what the flame blast?
		{
			GENERIC = "이게 무슨일이 벌어지는거야?",
			OUT = "불이 나갔어",
			LOW = "무슨 일이 벌어질거야",
			NORMAL = "확실히 이건 뜨거워",
		},
		ROCKS = "돌이 있으면 여러가지를 할 수 있어",
        ROOK = "강철로 된 코뿔소야!",
        ROPE = "묶는데 쓸 수 있을까?",
		ROTTENEGG = "상한 알 냄새는 정말 구려",
		SANITYROCK =
		{
			ACTIVE = "이게 열리려면 무슨 조건이 필요한 모양이야",
			INACTIVE = "열렸어!",
		},
		SAPLING =
		{
			BURNING = "아무데서나 잘 자라지만 그렇다고 막 태워도 되는건 아니야",
			WITHERED = "물이 필요한 것 같아",
			GENERIC = "나뭇가지가 필요하면 꺾으면 되잖아",
			PICKED = "몇일 있으면 다시 자랄거야",
		},
		SEEDS = "아무튼 씨앗이야",
		SEEDS_COOKED = "배고프면 씨낱알도 먹어야지",
		SEWING_KIT = "옷을 수선하는데는 쓸 수 있지만 뮤샤는 다른것도 쓸 수 있어",
		SHOVEL = "삽질하는데는 삽이 필요해",
		SILK = "거미를 계속 사냥하다보면 가장 많이 쌓이는것 같아",
		SKELETON = "먼저 왔던 누군가의 시체인 모양이야",
		--SKELETON_PLAYER = "That gives me the willies.",

		SKELETON_PLAYER =
		{
			MALE = "여기 %s의 시체는 %s 때문에 죽었어",
			FEMALE = "여기 %s의 시체는 %s 때문에 죽었어",
			ROBOT = "여기 %s의 시체는 %s 때문에 죽었어",
			DEFAULT = "여기 %s의 시체는 %s 때문에 죽었어",
		},

		SKULLCHEST = "뭐가 들어있을까?", --what was that?
		SMALLBIRD =
		{
			GENERIC = "얌체만큼이나 아주 작은 새야",
			HUNGRY = "이 새는 지금 배고픈가봐",
			STARVING = "잠깐만 기다려봐! 뮤샤도 네가 배고픈거 알고있어",
		},
		SMALLMEAT = "다리일 수도 있고, 팔일 수도 있고, 날개일 수도 있고",
		SMALLMEAT_DRIED = "마르니까 더 작아졌어! 하지만 먹는데는 문제없어",
		SPAT = "양도 아니고 코뿔소도 아니고 저건 대체 무슨 생물이야?",
		SPEAR = "찌르는것 보다 때리는데 더 유용한 창이야!",
		SPIDER =
		{
			DEAD = "뮤샤가 강해지는 가장 빠른 방법이 거미를 끝없이 사냥하는거야",
			GENERIC = "이 세계의 모든 거미는 뮤샤의 사냥감이야",
			SLEEPING = "거미가 자고있어",
		},
		SPIDERDEN = "뮤샤는 거미집을 무서워하지 않아",
		SPIDEREGGSACK = "뮤샤의 뒷마당에 꽃아놓으면 거미가 계속 나올거야",
		SPIDERGLAND = "이걸 상처난 곳에 바르면 회복이 빨라져",
		SPIDERHAT = "뮤샤가 모든 거미를 사냥해버렸어! 여왕거미까지 모두 다!",
		SPIDERQUEEN = "여왕거미는 거미를 계속 낳아대니까 얌체랑 같이 공격해야해",
		SPIDER_WARRIOR =
		{
			DEAD = "병정거미여도 결국은 죽기마련",
			GENERIC = "폴짝뛰어 깨물어대니까 거리를 잘 조절해야해",
			SLEEPING = "거미는 낮이 되면 잠을 자. 굳이 깨울 필요는 없지 않아?",
		},
		SPOILED_FOOD = "완전히 썩었어!",
		STATUEHARP = "왜 돌로 연주도 할 수 없는 하프를 만든걸까?",
		STATUEMAXWELL = "분명히 이 녀석이 뮤샤를 여기에 끌어들인걸거야",
		STEELWOOL = "굉장히 지저분해보여",
		STINGER = "벌침이야",
		STRAWHAT = "밀집모자로도 비는 막을 수 있고 더위도 막을 수 있어",
		SUNKBOAT = "무슨 일이 있었던걸까?",
		SWEATERVEST = "얼룩무늬 상의야",
		TAFFY = "입속이 단맛으로 가득해져!",
		TALLBIRD = "정말 키가 큰 새야. 정확히는 다리가 긴 새야",
		TALLBIRDEGG = "키큰 새의 커다란 알이야.",
		TALLBIRDEGG_COOKED = "정말 커다란 알이지만 뮤샤는 다 먹을 수 있어",
		TALLBIRDEGG_CRACKED =
		{
			COLD = "부화할려면 따뜻한 곳에 놓아야 할 것 같아",
			GENERIC = "아기새가 태어날려나봐",
			HOT = "이대로 놔두면 알이 익어버릴거야!",
			LONG = "언제 부화하는거지?",
			SHORT = "뮤샤는 이 알을 부화시켜볼거야",
		},
		TALLBIRDNEST =
		{
			GENERIC = "다른 알 보다 5배는 커보여",
			PICKED = "알이 있었는데요 없었습니다",
		},
		TEENBIRD =
		{
			GENERIC = "이 새는 뮤샤를 따르기는 하는데 뒤가 근질거려",
			HUNGRY = "아직도 이 새의 밥은 뮤샤가 챙겨줘야해",
			STARVING = "뮤샤는 네가 배가 고픈걸 알고있으니까 잠깐만 기다려",
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "뮤샤가 너를 만나러 갈거야",
			GENERIC = "여기서 멀리서 단숨에 이동할 수 있대. 웜홀이네!",
			LOCKED = "작동시키려면 뭔가가 필요해",
			PARTIAL = "다음 모험으로!",
		},
		TELEPORTATO_BOX = "서프라이즈 박스!",
		TELEPORTATO_CRANK = "이 손잡이는 원래 어디 있던거지?",
		TELEPORTATO_POTATO = "감자처럼 생겼는데 감자가 아니야",
		TELEPORTATO_RING = "커다란 링이야",
		TENTACLE = "다리? 그러면 몸통은 땅속에 있는거야?",
		TENTACLESPOTS = "땅이 보글보글 거리고있어! 땅 속에 뭔가 있나봐!",
		TENTACLESPIKE = "이 가시는 좀 따가울거같아",
		TENTACLE_PILLAR = "땅 밑바닥엔 뭐가 있는걸까! 모험이 기대돼!",
		TENTACLE_PILLAR_ARM = "촉수가 잔뜩 있어!",
		TENTACLE_GARDEN = "뭔가 땅속을 움직이고있어",
		TOPHAT = "신사적인 모자야",
		TORCH = "깜깜하지 않다면, 뮤샤에게 무서울 건 없어!",
		TRAP = "작은 사냥감은 이걸로 잡을 수 있어",
		TRAP_TEETH = "좀 큰 사냥감은 이걸로 잡을 수 있어",
		TRAP_TEETH_MAXWELL = "손대면 펑 하고 터질것만 같아",
		TRINKET_1 = "몇번 씹었다가 뱉은 젤리같아.",-- Melty Marbles
		TRINKET_10 = "입을 왜 이렇게 해놓은거야? 고약하네",-- Second-hand Dentures
		TRINKET_11 = "네모네모난 기계야! 움직이진 않지만",-- Lying Robot
		TRINKET_12 = "이건 먹고싶지 않아",--Dessicated Tentacle
		TRINKET_13 = "누군가는 좋아할지도 모르지만, 뮤샤는 아니야",
		TRINKET_2 = "바람의 오카리나.. 전혀 모르겠네!",--Fake Kazoo
		TRINKET_3 = "호루라기를 불면 누군가 나타난대. 그러니까 이름이.. 포돌이?",--Gord's Knot
		TRINKET_4 = "꼬마 요정이 있다면 이렇게 생겼을까?",--Gnome
		TRINKET_5 = "이 신발의 주인은 엄청난 모험을 했었을거야!", --starcraft
		TRINKET_6 = "와이어로 암살하는 108가지 방법? 뮤샤에겐 필요없어",--Frazzled Wires
		TRINKET_7 = "뮤샤는 이걸 어떻게 쓰는지 깨달았어! 전혀 쓸모없네!",-- Ball and Cup
		TRINKET_8 = "뭔가를 막는데 쓰는것 같아. 자국이 있으나까 알 수 있어",-- Hardened Rubber Bung
		TRINKET_9 = "색이 너무 제각각이라 어디에 붙여야할지 모르겠네!",--Mismatched Buttons
	--adds 3 start
		TRINKET_10 = "They've quickly become Wes' favorite prop.", --Dentures
		TRINKET_11 = "Hal whispers beautiful lies to me.", --Lying Robot
		TRINKET_12 = "That's just asking to be experimented on.", --Dessicated Tentacle
		TRINKET_13 = "It must be some kind of religious artifact.", --Gnomette
		TRINKET_14 = "Now if I only had some tea...", --Leaky Teacup
		TRINKET_15 = "...Maxwell left his stuff out again.", --Pawn
		TRINKET_16 = "...Maxwell left his stuff out again.", --Pawn
		TRINKET_17 = "A horrifying utensil fusion. Maybe science *can* go too far.", --Bent Spork
		TRINKET_18 = "I wonder what it's hiding?", --Trojan Horse
		TRINKET_19 = "It doesn't spin very well.", --Unbalanced Top
		TRINKET_20 = "Wigfrid keeps jumping out and hitting me with it?!", --Backscratcher
		TRINKET_21 = "This egg beater is all bent out of shape.", --Egg Beater
		TRINKET_22 = "I have a few theories about this string.", --Frayed Yarn
		TRINKET_23 = "I can put my shoes on without help, thanks.", --Shoehorn
		TRINKET_24 = "I think Wickerbottom had a cat.", --Lucky Cat Jar
		TRINKET_25 = "It smells kind of stale.", --Air Unfreshener
		TRINKET_26 = "Food and a cup! The ultimate survival container.", --Potato Cup
		TRINKET_27 = "If you unwound it you could poke someone from really far away.", --Coat Hanger
		TRINKET_28 = "How Machiavellian.", --Rook
        TRINKET_29 = "How Machiavellian.", --Rook
        TRINKET_30 = "Honestly, he just leaves them out wherever.", --Knight
        TRINKET_31 = "Honestly, he just leaves them out wherever.", --Knight
        TRINKET_32 = "I know someone who'd have a ball with this!", --Cubic Zirconia Ball
        TRINKET_33 = "I hope this doesn't attract spiders.", --Spider Ring
        TRINKET_34 = "Let's make a wish. For science.", --Monkey Paw
        TRINKET_35 = "Hard to find a good flask around here.", --Empty Elixir
        TRINKET_36 = "I might need these after all that candy.", --Faux fangs
        TRINKET_37 = "I don't believe in the supernatural.", --Broken Stake
        TRINKET_38 = "I think it came from another world. One with grifts.", -- Binoculars Griftlands trinket
        TRINKET_39 = "I wonder where the other one is?", -- Lone Glove Griftlands trinket
        TRINKET_40 = "Holding it makes me feel like bartering.", -- Snail Scale Griftlands trinket
        TRINKET_41 = "It's a little warm to the touch.", -- Goop Canister Hot Lava trinket
        TRINKET_42 = "It's full of someone's childhood memories.", -- Toy Cobra Hot Lava trinket
        TRINKET_43= "It's not very good at jumping.", -- Crocodile Toy Hot Lava trinket
        TRINKET_44 = "It's some sort of plant specimen.", -- Broken Terrarium ONI trinket
        TRINKET_45 = "It's picking up frequencies from another world.", -- Odd Radio ONI trinket
        TRINKET_46 = "Maybe a tool for testing aerodynamics?", -- Hairdryer ONI trinket
		
		HALLOWEENCANDY_1 = "The cavities are probably worth it, right?",
        HALLOWEENCANDY_2 = "What corruption of science grew these?",
        HALLOWEENCANDY_3 = "It's... corn.",
        HALLOWEENCANDY_4 = "They wriggle on the way down.",
        HALLOWEENCANDY_5 = "My teeth are going to have something to say about this tomorrow.",
        HALLOWEENCANDY_6 = "I... don't think I'll be eating those.",
        HALLOWEENCANDY_7 = "Everyone'll be raisin' a fuss over these.",
        HALLOWEENCANDY_8 = "Only a sucker wouldn't love this.",
        HALLOWEENCANDY_9 = "Sticks to your teeth.",
        HALLOWEENCANDY_10 = "Only a sucker wouldn't love this.",
        HALLOWEENCANDY_11 = "Much better tasting than the real thing.",
        HALLOWEENCANDY_12 = "Did that candy just move?", --ONI meal lice candy
        HALLOWEENCANDY_13 = "Oh, my poor jaw.", --Griftlands themed candy
        HALLOWEENCANDY_14 = "I don't do well with spice.", --Hot Lava pepper candy
        CANDYBAG = "It's some sort of delicious pocket dimension for sugary treats.",

        DRAGONHEADHAT = "So who gets to be the head?",
        DRAGONBODYHAT = "I'm middling on this middle piece.",
        DRAGONTAILHAT = "Someone has to bring up the rear.",
        PERDSHRINE =
        {
            GENERIC = "I feel like it wants something.",
            EMPTY = "I've got to plant something there.",
            BURNT = "That won't do at all.",
        },
        REDLANTERN = "This lantern feels more special than the others.",
        LUCKY_GOLDNUGGET = "What a lucky find!",
        FIRECRACKERS = "Filled with explosion science!",
        PERDFAN = "It's inordinately large.",
        REDPOUCH = "Is there something inside?",
        WARGSHRINE = 
        {
            GENERIC = "I should make something fun.",
            EMPTY = "I need to put a torch in it.",
            BURNT = "It burned down.",
        },
        CLAYWARG = 
        {
        	GENERIC = "A terror cotta monster!",
        	STATUE = "Did it just move?",
        },
        CLAYHOUND = 
        {
        	GENERIC = "It's been unleashed!",
        	STATUE = "It looks so real.",
        },
        HOUNDWHISTLE = "This'd stop a dog in its tracks.",
        CHESSPIECE_CLAYHOUND = "That thing's the leashed of my worries.",
        CHESSPIECE_CLAYWARG = "And I didn't even get eaten!",

		BISHOP_CHARGE_HIT = "Ow!",
	--adds 3 end	
		TRUNKVEST_SUMMER = "방수가 되는 옷이야!",
		TRUNKVEST_WINTER = "이 옷이 겨울에 그렇게 따뜻하대",
		TRUNK_COOKED = "한입에 들어갈 것 같진 않아. 근데 이거 먹어도 되는거야?",
		TRUNK_SUMMER = "안이 뻥 뚫려있어!",
		TRUNK_WINTER = "안이 뻥 뚫려있어!",
		UMBRELLA = "뮤샤는 이 색깔이 맘에 들어! 펼쳤을 때 모양도 맘에 들어!",
		WAFFLES = "와플의 바삭함이 딱 좋은 상태로 요리가 됐어",
		WALL_HAY_ITEM = "바람이 분다고 날아가지 않으면 좋겠어",
		WALL_STONE = "이 벽이 있으면 잠깐 시간을 벌 수 있어",--0
		WALL_STONE_ITEM = "돌을 구하는건 어렵지 않고, 나름 튼튼해",
		WALL_RUINS = "이걸 부수고 들어올려면 시간이 오래걸릴거야",--0
		WALL_RUINS_ITEM = "시간을 벌어준다면 이건 낭비가 아니야",
		WALL_WOOD_ITEM = "통나무를 순식간에 부수고 들어올 순 없을거야",
		WALRUS = "저게 쏠 틈을 주면 안돼!",
		WALRUSHAT = "완벽하게 멋져",
		WALRUS_CAMP =
		{
			EMPTY = "이 바닥은 누군가 만들어서 생긴거야",
			GENERIC = "얼음집이라니 엄청나게 추워보여",
		},
		WALRUS_TUSK = "이 이빨에 물렸다면 엄청 아팠을거야",
		WARG = "떼거리로 몰려오기 전에 때려잡으면 돼",
		WASPHIVE = "전리품을 얻으려면 모험이 필요한거야",
		WETGOOP = "원형이 남지 않을정도로 이상한게 되어버렸어",
		WINTERHAT = "겨울을 나려면 이정도는 준비해야지",
		WORMHOLE =
		{
			GENERIC = "이게 입일까 아니면-",
			OPEN = "이게 안전한거 맞지? 뮤샤는 매우 의심스러운데",
		},
		ACCOMPLISHMENT_SHRINE = "엄청난 사치품이야. 정말로",
	},
	DESCRIBE_TOODARK = "아무것도 보이지 않아! 정말로 위험해!",
	DESCRIBE_SMOLDERING = "으아아아앙그아아아아!!",
	EAT_FOOD =
	{
		TALLBIRDEGG_CRACKED = "알도 고기야",
	},
}
