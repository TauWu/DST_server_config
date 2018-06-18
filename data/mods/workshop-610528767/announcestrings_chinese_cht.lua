ANNOUNCE_STRINGS = {
	-- 這些不是特定於字符的字符串，而是用於緩解翻譯。
	-- 註意！在開始和結尾的空格都是重要的，應該保留。
	_ = {
		getArticle = function(name)
			--如果名稱以元音字母開頭，則使用“an”，否則就使用“a” ——中文用不到，但有很多量詞，願有朝壹日能做到區分開，而不全是“個”。
			return "1 個"
		end,
		--如果項目有多個(復數)，詞後加{S} ——中文用不到
		--即使在英語中，這也不是完美的，但它已經足夠接近了
		S = "個",
		STAT_NAMES = {
			Hunger = "饑餓值",
			Sanity = "腦殘值",
			Health = "生命值",
			["Log Meter"] = "木頭值",
			Wetness = "雨露值",
			--其他mod統計數據不會有翻譯，但至少我們可以支持這些
		},
		ANNOUNCE_ITEM = {
			-- 這需要反映翻譯語言的語法
			-- 例如，這可能變成“我的箱子裝有6個紙莎草。”
			FORMAT_STRING = "{I_HAVE}{THIS_MANY} {S}{ITEM}{IN_THIS}{CONTAINER}{WITH}{PERCENT}{DURABILITY}。",
			
			--其中壹個進入了{I_HAVE}
			I_HAVE = "我擁有 ",
			WE_HAVE = "我們擁有 ",
			
			--{THIS_MANY}是壹個數字如有多個，但是單數會因語言而異
			--所以我們用getArticle來得到它
			
			--{ITEM}是從item.name獲得的
			
			--{S} uses S above
			
			--進入{IN_THIS}，如果存在
			IN_THIS = " 在這個 ",
			
			--{CONTAINER}是從 container.name 中獲取的
			
			--其中壹個進入{WITH}
			WITH = " 擁有 ", --如果只是壹個事物
			AND_THIS_ONE_HAS = ", 這個擁有 ", --如果有多個，只顯示壹個的耐久性
			
			--{PERCENT} 是否從產品的耐用性中獲得
			
			--進入 {DURABILITY}
			DURABILITY = " 的耐久度",
		},
		ANNOUNCE_RECIPE = {
			-- 這需要反映翻譯語言的語法
			-- 這是壹個例子:
			-- "我有壹臺預制的科學機器，準備就緒" -> 已制作且未放置
			-- "我將做壹把斧頭。" -> 已知，且有足夠原材料
			-- "有人能給我做個煉金術引擎嗎？我需要壹臺科學機器。" -> 未知
			-- "我們需要更多的幹燥架。" -> 已知，但沒有足夠原材料
			FORMAT_STRING = "{START_Q}{TO_DO}{THIS_MANY}{S}{ITEM}{PRE_BUILT}{END_Q}{I_NEED}{A_PROTO}{PROTOTYPER}{FOR_IT}。",
			
			--{START_Q} 是為那些匹配的語言嗎？ 在兩端
			START_Q = "", --英語不這麽做
			
			--其中壹個進入 {TO_DO}
			I_HAVE = "我做好了 ", --對預構建
			ILL_MAKE = "我可以制作 ", --對於已知的配方，妳有原料
			CAN_SOMEONE = "有人可以幫我做 ", --對未知的配方
			WE_NEED = "我需要制造 ", --對於已知的配方，妳沒有原料
			
			--{THIS_MANY} 使用getArticle來獲得正確的文章 ("a", "an")
			
			--{ITEM} 來自 recipe.name
			
			--{S} uses S above

			--進入 {PRE_BUILT}
			PRE_BUILT = " 準備放置",
			
			--此進入 {END_Q} 如果它是壹個問題
			END_Q = "嗎？",
			
			--進入 {I_NEED}
			I_NEED = " 我需要 ",
			
			--{PROTOTYPER} 來自 recipepopup.teaser:GetString 利用這函數 
			getPrototyper = function(teaser)
				--這是句子的精華 "Use a (science machine) to..." 和 "Use an (alchemy engine) to..."
				return teaser:gmatch("<.*>")() or teaser:gmatch("需要(.*)來")()			    
			end,
			
			--進入 {FOR_IT}
			FOR_IT = " 才能制造它",
		},
		ANNOUNCE_INGREDIENTS = {
			-- This needs to reflect the translating language's grammar
			-- 這是壹個例子:
			-- "我需要2塊或更多的切割石頭和壹臺科學機器來制造壹個煉金術引擎。"
			FORMAT_NEED = "我需要 {NUM_ING} {S}{INGREDIENT}{AND}{A_PROTO}{PROTOTYPER} 來制造 {RECIPE}。",
			
			--如果需要壹個原型，進入 {AND}
			AND = " 和 ",
			
			-- This needs to reflect the translating language's grammar
			-- 這是壹個例子:
			-- "我有足夠的樹枝做9個鳥籠，但我需要壹臺科學機器。"
			FORMAT_HAVE = "我有足夠的 {INGREDIENT} 來制造 {A_REC}{REC_S}{RECIPE}{BUT_NEED}{A_PROTO}{PROTOTYPER}。",
			---{A_REC}
			--如果需要壹個原型，進入 {BUT_NEED}
			BUT_NEED = ", 我還需要 ",
		},
		ANNOUNCE_SKIN = {
			-- This needs to reflect the translating language's grammar
			-- 例如，這可能會變成“我有火炬的悲劇性皮膚。”
			FORMAT_STRING = "我有 {ITEM} 的 {SKIN}。",
			
			--{SKIN} 形成皮膚的名字
			
			--{ITEM} 來自項目名稱
		},
		ANNOUNCE_TEMPERATURE = {
			-- This needs to reflect the translating language's grammar
			-- 例如，這可能會變成"我處於壹個舒適的溫度"
			-- 或者“野獸是冰冷的！”
			FORMAT_STRING = "{PRONOUN}{TEMPERATURE}",
			
			--{PRONOUN} is picked from this
			PRONOUN = {
				DEFAULT = "我",
				BEAST = "這個怪物是 ", --for Werebeaver
			},
			
			--{TEMPERATURE} is picked from this
			TEMPERATURE = {
				BURNING = "過熱了！",
				HOT = "幾乎過熱！",
				WARM = "有點熱。",
				GOOD = "在壹個舒適的溫度。",
				COOL = "稍微有點冷。",
				COLD = "幾乎凍結！",
				FREEZING = "“凝固”了！",
			},
		},
		ANNOUNCE_WORLDTEMP = {

			FORMAT_STRING = "{PRONOUN}{TEMPERATURE}",

			PRONOUN = {
				DEFAULT = "我",
				BEAST = "這個怪物是 ", --for Werebeaver
				WORLD = "這個氣候 ", --世界溫度宣告-Shang
			},

			--世界溫度宣告-Shang
			WORLDTEMP = {
				BURNING = "空調已經停止工作了！",
				HOT = "需要稍微開開空調吧！",
				WARM = "可能需要幾臺電風扇！",
				GOOD = "很適合安逸生活嬉戲玩耍！",
				COOL = "可以生個火堆！",
				COLD = "需要生個大火堆！",
				FREEZING = "……世界已經冰天雪地了！",
			},
		},
		ANNOUNCE_GIFT = {
			CAN_OPEN = "我有壹個禮物，我要打開它！",
			NEED_SCIENCE = "我需要額外的科學來打開這個禮物！",
		},
		ANNOUNCE_HINT = "宣告",
	},
	-- 下面是壹切 character-specific
	UNKNOWN = {
		HUNGER = {
			FULL  = "高於75%…我完全飽了！", 				-- >75%
			HIGH  = "55%…我可以吃壹點！！",				-- >55%
			MID   = "35%…我肚子餓癟了！！！", 				-- >35%
			LOW   = "15%…我非常餓！！！！", 				-- >15%
			EMPTY = "低於15%…我馬上要餓撲街了！！！！！", 	-- <15%
		},
		SANITY = {
			FULL  = "高於75%…我的大腦在巔峰狀態！", 					-- >75%
			HIGH  = "55%…我感覺還不錯！！", 							-- >55%
			MID   = "35%…我有點焦慮！！！", 							-- >35%
			LOW   = "15%…我感覺，這裏有點瘋狂！！！！", 				-- >15%
			EMPTY = "低於15%…啊噠，好疼！暗影惡魔在追我！！！！",		-- <15%
		},
		HEALTH = {
			FULL  = "100%…我去，血槽滿了！", 				-- 100%
			HIGH  = "75%…我掛了壹些彩！！", 				-- >75%
			MID   = "50%…我靠，嚴重掛彩！！！", 			-- >50%
			LOW   = "25%…血肉模糊，我已寫好遺書！！！！", 	-- >25%
			EMPTY = "低於25%…看管好我的財產！！！！！", 	-- <25%
		},
		WETNESS = {
			FULL  = "高於75%…完全濕身！！！！！", 					-- >75%
			HIGH  = "55%…我濕透了，哇！背包好隔水，把我裝進去吧！",	-- >55%
			MID   = "35%…我很濕！我去，背包也濕了！！", 			-- >35%
			LOW   = "15%…我只濕了壹小塊，還不足為懼！", 			-- >15%
			EMPTY = "我有壹點點潮濕……", 								-- <15%
		},
	},
	WILSON = {
		HUNGER = {
			FULL  = "我填滿了肚子！",
			HIGH  = "我還不缺乏吃的。",
			MID   = "我可以去吃壹點兒。",
			LOW   = "我真的餓了！",
			EMPTY = "我……需要……食物……",
		},
		SANITY = {
			FULL  = "視理智為還可以。",
			HIGH  = "我會好起來的。",
			MID   = "我的頭很痛……",
			LOW   = "Wha——那些行走的是什麽！？",
			EMPTY = "需要幫助！這些東西將要吃掉我！！",
		},
		HEALTH = {
			FULL  = "健康的如壹把小提琴！",
			HIGH  = "我受傷了，但我可以繼續行動。",
			MID   = "我……我想我需要註意治療。",
			LOW   = "我失去了很多血……",
			EMPTY = "我……我將不能走完路程……",
		},
		WETNESS = {
			FULL  = "我已經達到了飽和點！",
			HIGH  = "水快滾出去！",
			MID   = "我的衣服幾乎滲透。",
			LOW   = "Oh， H2O。",
			EMPTY = "我比較幹燥。",
		},
	},
	WILLOW = {
		HUNGER = {
			FULL  = "如果我不停止吃會發胖的。",
			HIGH  = "愉快又飽滿的。",
			MID   = "我的生命之火需要壹點燃料。",
			LOW   = "Ugh，我要餓死在這裏了！",
			EMPTY = "我現在已經餓的幾乎皮包骨！",
		},
		SANITY = {
			FULL  = "我認為我現在有充足的精神燒火。",
			HIGH  = "我剛才看到伯尼在行走了麽？……沒有，不用介意。",
			MID   = "我感覺寒冷無比，我很可能……",
			LOW   = "伯尼，為什麽我覺得如此寒冷！？",
			EMPTY = "伯尼，保護我不受那些可怕的事物咬傷！",
		},
		HEALTH = {
			FULL  = "完美的我就應該沒有壹塊傷痕！",
			HIGH  = "我有壹兩處擦傷。我或許應該點燃它們。",
			MID   = "這些裂口使我不再燃燒，我需要個醫生……",
			LOW   = "我覺得虛弱……我可能會……熄滅。",
			EMPTY = "我的生命之火幾乎要熄滅……",
		},
		WETNESS = {
			FULL  = "Ugh，這雨是最——壞——的！",
			HIGH  = "我討厭這壹切水！",
			MID   = "這場雨太多了。",
			LOW   = "Uh oh，如果這場雨持續上升……",
			EMPTY = "沒有足夠的雨水能滅了火。",
		},
	},
	WOLFGANG = {
		HUNGER = {
			FULL  = "沃爾夫岡是充實而強大的！",
			HIGH  = "沃爾夫岡必須吃飽，才能變得更加強大！！",
			MID   = "沃爾夫岡需要吃很多。",
			LOW   = "沃爾夫岡的肚子餓的開洞了。",
			EMPTY = "沃爾夫岡現在急需要食物！！！",
		},
		SANITY = {
			FULL  = "沃爾夫岡的頭感覺良好！",
			HIGH  = "沃爾夫岡的頭感覺很有趣。",
			MID   = "沃爾夫岡的頭很疼",
			LOW   = "沃爾夫岡看到可怕的怪物……",
			EMPTY = "到處都是可怕的怪物！！",
		},
		HEALTH = {
			FULL  = "沃爾夫岡現在不需要修理！",
			HIGH  = "沃爾夫岡需要點小修理",
			MID   = "沃爾夫岡受傷了。",
			LOW   = "沃爾夫岡需要很多的繃帶來治療傷口。",
			EMPTY = "沃爾夫岡或許要死了……",
		},
		WETNESS = {
			FULL  = "沃爾夫岡現在可能是水做的！",
			HIGH  = "這就像坐在池塘裏……",
			MID   = "沃爾夫岡不喜歡洗澡。",
			LOW   = "雨水時代。",
			EMPTY = "沃爾夫岡是幹燥的。",
		},
	},
	WENDY = {
		HUNGER = {
			FULL  = "即使再多的食物也不會填補我心中的空洞。",
			HIGH  = "我飽了，但仍渴望沒有朋友可以提供的東西。",
			MID   = "我不餓，但也不飽。很奇怪的感覺。",
			LOW   = "我的肚子就像心靈壹樣充滿了空虛。",
			EMPTY = "我發現最慢的死法——餓死。",
		},
		SANITY = {
			FULL  = "我的思維運轉地晶瑩剔透。",
			HIGH  = "我的思維漸漸變得陰郁。",
			MID   = "我的思維是極度興奮的……",
			LOW   = "阿比蓋爾！妳看到它們了麽？這些惡魔可能很快能使我加入妳。",
			EMPTY = "帶我去阿比蓋爾那裏，黑暗和夜晚的生物！",
		},
		HEALTH = {
			FULL  = "我痊愈了，但我相信我將再次受到傷害。",
			HIGH  = "我感到疼痛，但是不多。",
			MID   = "生存帶來了痛苦，但是我不習慣這麽多。",
			LOW   = "流了很多血……將會很容易……",
			EMPTY = "我很快將與阿比蓋爾……",
		},
		WETNESS = {
			FULL  = "滿是水的末世。",
			HIGH  = "長久的濕潤和悲傷。",
			MID   = "濕軟而又悲傷。",
			LOW   = "或許這些水分能填補我心靈的虛空。",
			EMPTY = "我的皮膚和我的心靈壹樣幹。",
		},
	},
	WX78 = {
		HUNGER = {
			FULL  = "  燃料 狀態：最大容量",
			HIGH  = "  燃料 狀態：高的 ",
			MID   = "  燃料 狀態：合意的 ",
			LOW   = "  燃料 狀態：低的 ",
			EMPTY = "  燃料 狀態：危險的 ",
		},
		SANITY = {
			FULL  = "  CPU 狀態：全面運轉",
			HIGH  = "  CPU 狀態：功能的",
			MID   = "  CPU 狀態：破損的",
			LOW   = "  CPU 狀態：故障迫近",
			EMPTY = "  CPU 狀態：多重故障檢測",
		},
		HEALTH = {
			FULL  = "  底盤 狀態：理想狀況",
			HIGH  = "  底盤 狀態：裂紋檢測",
			MID   = "  底盤 狀態：中度損壞",
			LOW   = "  底盤 狀態：完全性損壞",
			EMPTY = "  底盤 狀態：無功能的",
		},
		WETNESS = {
			FULL  = "  受潮 狀況：已達臨界值",
			HIGH  = "  受潮 狀況：接近臨界值",
			MID   = "  受潮 狀況：無法接受的",
			LOW   = "  受潮 狀況：可容許的",
			EMPTY = "  受潮 狀況：合意的",
		},
	},
	WICKERBOTTOM = {
		HUNGER = {
			FULL  = "我應該從事研究工作，而不是填充自己。",
			HIGH  = "充斥的，但不是臃腫的。",
			MID   = "我感覺到有壹點饑餓。",
			LOW   = "這個圖書管理員需要食物，我是擔心害怕的！",
			EMPTY = "如果我不馬上進食，就將會餓死！",
		},
		SANITY = {
			FULL  = "在這裏沒有什麽行為是非理智的。",
			HIGH  = "我相信我有壹點令人頭痛之事。",
			MID   = "這些偏頭痛是難以忍受的。",
			LOW   = "我不確定哪些事物虛構的，再也不！",
			EMPTY = "幫幫我！這些深不可測又令人可憎的敵人！",
		},
		HEALTH = {
			FULL  = "我的健康可以預計我的年齡！",
			HIGH  = "受壹些擦傷，但是無關緊要。",
			MID   = "我的醫療需要裝配。",
			LOW   = "如果不治療，這將是我的結局。",
			EMPTY = "我需要立刻馬上就醫！",
		},
		WETNESS = {
			FULL  = "完全絕對浸濕！",
			HIGH  = "我是濕的，濕的，濕的！重要的事情說三遍！",
			MID   = "我想知道我的最高承受力是……",
			LOW   = "水膜開始形成了 。",
			EMPTY = "我的水分是足夠缺乏的。",
		},
	},
	WOODIE = {
		HUMAN = { -- 人類形態
			HUNGER = {
				FULL  = "全部都滿了！",
				HIGH  = "對於砍樹仍然足夠。",
				MID   = "能力需要壹個小吃！",
				LOW   = "正餐鈴響了！ ",
				EMPTY = "我正在挨餓！",
			},
			SANITY = {
				FULL  = "好的猶如壹把小提琴曲",
				HIGH  = "還好，可以來壹小杯咖啡",
				MID   = "我想我需要壹個午睡！",
				LOW   = "退後，噩夢壹般的東西！",
				EMPTY = "所有恐懼都是真實的，還有傷害！",
			},
			HEALTH = {
				FULL  = "合適的猶如壹個哨子！",
				HIGH  = "大難不死，必有後福。",
				MID   = "可以和使用壹些物品來變得健康",
				LOW   = "這是痛苦真正的開始……",
				EMPTY = "讓我永眠…… 在這顆樹下……",
			},
			WETNESS = {
				FULL  = "這鬼天氣導致我不能砍樹。",
				HIGH  = "因為這些雨水讓格子花呢不再保暖。",
				MID   = "我獲得了相當的水分。",
				LOW   = "格子花呢很溫暖，也很潮濕。",
				EMPTY = "對我幾乎不受影響。",
			},
			["LOG METER"] = {	
				FULL  = "壹直有更多的木頭，但不是在我的肚子裏。",
				HIGH  = "我渴望有壹個小樹枝。",
				MID   = "木頭看起來真的很好吃。",
				LOW   = "我能感覺到詛咒即將來臨。",
				EMPTY = "壹般這個宣告不可能出現，除非沒有成功變身",	--(this shouldn't be possible, he'll become a werebeaver)
			},
		},
		WEREBEAVER = {
			-- HUNGER = { -- werebeaver 沒有饑餓值
				-- FULL  = "",
				-- HIGH  = "",
				-- MID   = "",
				-- LOW   = "",
				-- EMPTY = "",
			-- },
			SANITY = {
                FULL  = "野獸的眼睛又大又機靈。",
                HIGH  = "野獸似乎看到了黑色的影子。",
                MID   = "野獸回頭因為這裏有很多不存在的東西。",
                LOW   = "野獸顫抖著，它的眼睛在抽搐。",
                EMPTY = "野獸在咆哮，似乎被倍增的陰影獵殺。",
			},
			HEALTH = {
				FULL  = "野獸蹦蹦跳跳非常活潑。",
				HIGH  = "野獸受到壹些擦傷。",
				MID   = "野獸在舔自己的傷口。",
				LOW   = "野獸折斷了它的胳膊。",
				EMPTY = "野獸壹拐壹拐地走著非常可憐。",
			},
			WETNESS = {
				FULL  = "野獸的皮毛完全濕透了。",
				HIGH  = "野獸留下壹串小水坑。",
				MID   = "野獸的毛皮有點濕。",
				LOW   = "野獸頭上壹點水滴。",
				EMPTY = "野獸的毛皮是幹燥的。",
			},
			["LOG METER"] = {
				FULL  = "野獸看起來和人類幾乎差不多了。",	-- > 90%
				HIGH  = "野獸要咀嚼壹個樹木。",	-- > 70%
				MID   = "野獸要用力咀嚼壹個樹枝。",	-- > 50%
				LOW   = "野獸看起來渴望咀嚼那些樹。",	-- > 25%
				EMPTY = "野獸看起來很空腹。",	-- < 25%
			},
		},
	},
	WES = {
		HUNGER = {
			FULL  = "*拍拍肚子*",
			HIGH  = "*拍拍肚子*",
			MID   = "*手張開嘴*",
			LOW   = "*手張開嘴，眼睛瞪得大大的*",
			EMPTY = "*緊抓凹陷的胃絕望的壹個眼神*",
		},
		SANITY = {
			FULL  = "*行禮*",
			HIGH  = "*翹起姆指*",
			MID   = "*按摩太陽穴*",
			LOW   = "*掃視四處瘋狂似地*",
			EMPTY = "*搖籃壹樣的頭，來回搖擺*",
		},
		HEALTH = {
			FULL  = "*手結成心*",
			HIGH  = "*觸摸脈搏，豎起大拇指*",
			MID   = "*手在手臂來回移動，示意包紮它*",
			LOW   = "*搖晃手臂*",
			EMPTY = "*大幅搖擺，然後摔倒了*",
		},
		WETNESS = {
			FULL  = "*瘋狂地向上遊泳*",
			HIGH  = "*向上遊泳*",
			MID   = "*悲慘地看向天空*",
			LOW   = "*保護頭部武裝起來*",
			EMPTY = "*微笑，拿著無形的保護傘*",
		},
	},
	WAXWELL = {
		HUNGER = {
			FULL  = "我已經吃了完美的盛宴。",
			HIGH  = "我很滿足，但是不要過量。",
			MID   = "吃個快餐可能很合適。",
			LOW   = "我的內心已經空了。",
			EMPTY = "不！我沒有掙到我得到自由將在餓死在這裏！",
		},
		SANITY = {
			FULL  = "衣冠楚楚的可以。",
			HIGH  = "我通常堅定的智慧似乎是……搖擺不定。",
			MID   = "Ugh，我頭好痛。",
			LOW   = "我需要明確我的頭腦，我開始看到……它們。",
			EMPTY = "Help！這些陰影是真正的野獸，妳要知道！",
		},
		HEALTH = {
			FULL  = "我完全安然無恙。",
			HIGH  = "它只是壹個擦傷。",
			MID   = "我可能需要給自己打個補丁。",
			LOW   = "這不是我的天鵝之歌，但是我已經接近。",
			EMPTY = "不！我沒有逃避而死在這裏！",
		},
		WETNESS = {
			FULL  = "濕潤的好比水本身。",
			HIGH  = "我不認為我會再次幹燥。",
			MID   = "這水會毀了我的西裝。",
			LOW   = "潮濕使我變得不整潔。",
			EMPTY = "幹燥而整潔的。",
		},
	},
	WEBBER = {
		HUNGER = {
			FULL  = "我們兩者的胃部都爆滿了。",
			HIGH  = "我們可以再多啃壹點。",
			MID   = "我們認為是時候吃午飯了！",
			LOW   = "我們此時會吃媽媽的剩菜……",
			EMPTY = "我們的胃是空的！",
		},
		SANITY = {
			FULL  = "我們感覺健康又精力充沛。",
			HIGH  = "小睡壹會可以回復壹下。",
			MID   = "我們的頭好痛……",
			LOW   = "我們上壹次有午睡嗎？！",
			EMPTY = "我們不害怕妳，可怕的東西！",
		},
		HEALTH = {
			FULL  = "我們甚至沒有劃痕壹絲！",
			HIGH  = "我們需要壹個創可貼。",
			MID   = "我們需要再貼壹個創可貼……",
			LOW   = "我們的身體劇痛……",
			EMPTY = "我們還不想死……",
		},
		WETNESS = {
			FULL  = "哇哈，我們濕透了！",
			HIGH  = "我們的毛皮被浸泡了！",
			MID   = "我們很濕！",
			LOW   = "我們濕潤地不討人喜歡。",
			EMPTY = "我們喜歡在坑裏玩耍。",
		},
	},
	WATHGRITHR = {
		HUNGER = {
			FULL  = "我渴望戰鬥，無需肉！",
			HIGH  = "我足夠滿足於戰鬥。",
			MID   = "我可以有壹個肉類零食。",
			LOW   = "我渴望壹場盛宴！",
			EMPTY = "沒有壹些肉我就餓死了！",
		},
		SANITY = {
			FULL  = "我擔心沒有凡人！",
			HIGH  = "我會在戰場上感覺更好！",
			MID   = "我迷離的思緒……",
			LOW   = "這些陰影穿過我的矛……",
			EMPTY = "退後，黑暗怪獸！",
		},
		HEALTH = {
			FULL  = "我的皮膚是無懈可擊的！",
			HIGH  = "它只是壹個輕傷！",
			MID   = "我受傷了，但我還能戰鬥。",
			LOW   = "沒有援助，我很快就會在瓦爾哈拉殿堂……",
			EMPTY = "我的傳奇人生即將結束……",
		},
		WETNESS = {
			FULL  = "我完全濕透了！",
			HIGH  = "壹個戰士在這雨天無法戰鬥！",
			MID   = "我的護甲會生銹！",
			LOW   = "我不需要洗澡。",
			EMPTY = "幹澡夠了繼續戰鬥！",
		},
	},
	WINONA = {
		HUNGER = {
			FULL  = "我今天吃了壹頓正餐。",
			HIGH  = "我的胃總是有地方放存放更多食物！",
			MID   = "我的午餐休息時間還沒到嗎？",
			LOW   = "我快沒油了，老板。",
			EMPTY = "如果再不給點東西吃，工廠就沒有了工人！",
		},
		SANITY = {
			FULL  = "我會永遠保持理智。",
			HIGH  = "全部還好但低於我的頭巾！",
			MID   = "我想我的螺絲松了……",
			LOW   = "我的心碎了，我應該把它修好。",
			EMPTY = "這是壹場噩夢！哈！但它很真實。",
		},
		HEALTH = {
			FULL  = "我健康的猶如壹匹汗血寶馬！",
			HIGH  = "嗯，我來解決它。",
			MID   = "我仍然不能放棄。",
			LOW   = "我可以領取工人的退休金嗎…？",
			EMPTY = "我想我的輪班已經結束了……",
		},
		WETNESS = {
			FULL  = "我不能在這種濕度下工作！",
			HIGH  = "我的工作服正在吸收水份！",
			MID   = "有人應該放下壹個濕地板標誌。",
			LOW   = "在工作的時候補充水分是總是好的。",
			EMPTY = "這裏沒有什麽。",
		},
	},
	WARLY = {
		HUNGER = {
			FULL  = "我的烹飪將會是我的死亡！",
			HIGH  = "我想現在我已經受夠了。",
			MID   = "是時候在沙漠裏吃晚餐了。",
			LOW   = "我錯過了晚飯時間！",
			EMPTY = "饑餓……是最難受的死亡方式！",
		},
		SANITY = {
			FULL  = "我做菜的香味讓我神智清醒。",
			HIGH  = "我覺得有點頭暈。",
			MID   = "我的腦筋不能轉彎了。",
			LOW   = "竊竊私語……救命啊！",
			EMPTY = "我再也受不了這種精神錯亂了！",
		},
		HEALTH = {
			FULL  = "我非常健康。",
			HIGH  = "在切洋蔥時我很糟糕。",
			MID   = "我流血了……",
			LOW   = "我可以用壹些援助！",
			EMPTY = "我猜這就是我的結局了，摯友們……",
		},
		WETNESS = {
			FULL  = "我能感覺到魚在我的襯衫裏遊泳。",
			HIGH  = "水會毀了我完美的菜肴！",
			MID   = "在我感冒之前，我應該把衣服烘幹。",
			LOW   = "現在不是洗澡的時間或地點。",
			EMPTY = "只有幾滴在我身上，沒有壞處。",
		},
	},
	WALANI = {
		HUNGER = {
			FULL  = "嗯，那是在天堂做的壹頓飯。",
			HIGH  = "我還可以去吃點小吃。",
			MID   = "食物，食物，食物，重要的事情說三遍！",
			LOW   = "這樣我可能會得胃炎！",
			EMPTY = "請……我什麽都可以吃！",
		},
		SANITY = {
			FULL  = "沒有比沖浪更能讓我保持清醒的了。",
			HIGH  = "海浪在呼喚我。",
			MID   = "我的頭有點暈。",
			LOW   = "啊~ 我需要我的沖浪板！",
			EMPTY = "那些是什麽……東西！？",
		},
		HEALTH = {
			FULL  = "從未有如此美好的感覺！",
			HIGH  = "只有幾處刮痕，沒什麽大驚小怪的。",
			MID   = "我可以用壹些治療藥膏！",
			LOW   = "感覺就像我的內臟已經放棄了我。",
			EMPTY = "我身上的每根骨頭都碎了！",
		},
		WETNESS = {
			FULL  = "我是徹底濕透了！",
			HIGH  = "我的衣服好像很濕。",
			MID   = "我可能需要壹條毛巾。",
			LOW   = "這壹點點水不會使任何人受傷。",
			EMPTY = "我看到壹場暴風雨即將來臨！",
		},
	},
	WOODLEGS = {
		HUNGER = {
			FULL  = "Yarr，那是壹頓美餐，laddy！",
			HIGH  = "我肚子很飽了。",
			MID   = "這是我每天吃飯的時間。",
			LOW   = "啊！妳們這些飯桶，讓我吃什麽呢！？",
			EMPTY = "我要餓死了！",
		},
		SANITY = {
			FULL  = "是的，大海，她是個漂亮的女人！",
			HIGH  = "是時候在海上旅行了！",
			MID   = "我想念我的大海……",
			LOW   = "記不起上次我去航海是什麽時候了。",
			EMPTY = "我是壹個揮舞彎刀的海盜船長，不是陸地上的傻大個！",
		},
		HEALTH = {
			FULL  = "Yarr，我是個難對付的家夥！",
			HIGH  = "這就是妳們所得到的嗎？",
			MID   = "我還沒有放棄！",
			LOW   = "Woodlegs不是懦夫！",
			EMPTY = "Arr！妳贏了，無賴！",
		},
		WETNESS = {
			FULL  = "我渾身濕透了！",
			HIGH  = "我喜歡我的水留在我的船上。",
			MID   = "我的海盜襯衫被水打了。",
			LOW   = "我褲子濕透了！",
			EMPTY = "Arr！正在醞釀壹場暴風雨。",
		},
	},
	WILBUR = {
		HUNGER = {
			FULL  = "*跳來跳去拍他的手*",
			HIGH  = "*高興地拍手*",
			MID   = "*揉肚子*",
			LOW   = "*悲傷的眼神和揉皺的肚皮*",
			EMPTY = "OOAOE! *按摩赫利*",
		},
		SANITY = {
			FULL  = "*敲敲頭部*",
			HIGH  = "*豎起大拇指*",
			MID   = "*看起來害怕*",
			LOW   = "*尖叫令人難以忘懷*",
			EMPTY = "OOAOE! OOOAH!",
		},
		HEALTH = {
			FULL  = "*用兩只手來做箱子*",
			HIGH  = "*猛擊箱子*",
			MID   = "*溫柔地按摩缺失的補丁的皮毛*",
			LOW   = "*艱難地慘*",
			EMPTY = "OAOOE! OOOOAE!",
		},
		WETNESS = {
			FULL  = "*打噴嚏*",
			HIGH  = "*按摩手臂在壹起*",
			MID   = "Ooo! Ooae!",
			LOW   = "Oooh?",
			EMPTY = "Ooae Oooh Oaoa! Ooooe.",
		},
	},
}