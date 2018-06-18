local WHISPER = false
local WHISPER_ONLY = false
local EXPLICIT = true
local OVERRIDEB = false
local SHOWDURABILITY = true
local SHOWPROTOTYPER = true

local setters = {
	WHISPER = function(v) WHISPER = v end,
	WHISPER_ONLY = function(v) WHISPER_ONLY = v end,
	EXPLICIT = function(v) EXPLICIT = v end,
	OVERRIDEB = function(v) OVERRIDEB = v end,
	SHOWDURABILITY = function(v) SHOWDURABILITY = v end,
	SHOWPROTOTYPER = function(v) SHOWPROTOTYPER = v end,
}

local StatusAnnouncer = Class(function(self)
	self.cooldown = false
	self.cooldowns = {}
	self.stats = {}
	self.button_to_stat = {}
	self.char_messages = STRINGS._STATUS_ANNOUNCEMENTS.UNKNOWN
end,
nil,
{
})

function StatusAnnouncer:Announce(message)
	if not self.cooldown and not self.cooldowns[message] then
		local whisper = TheInput:IsKeyDown(KEY_CTRL) or TheInput:IsControlPressed(CONTROL_MENU_MISC_3)
		self.cooldown = ThePlayer:DoTaskInTime(1, function() self.cooldown = false end)
		self.cooldowns[message] = ThePlayer:DoTaskInTime(10, function() self.cooldowns[message] = nil end)
		TheNet:Say(STRINGS.LMB .. " " .. message, WHISPER_ONLY or WHISPER ~= whisper)
	end
	return true
end

function StatusAnnouncer:AnnounceItem(item, percent, container, owner)
	local S = STRINGS._STATUS_ANNOUNCEMENTS._ --To save some table lookups
	if container == nil or (container and container.type == "pack") then
		--\equipslots/        \backpacks/
		container = ThePlayer.replica.inventory
	end
	local num_equipped = 0
	if not container.type then --this is an inventory
		--add in items in equipslots, which don't normally get counted by Has
		for _,slot in pairs(EQUIPSLOTS) do
			local equipped_item = container:GetEquippedItem(slot)
			if equipped_item and equipped_item.prefab == item.prefab then
				num_equipped = num_equipped + (equipped_item.replica.stackable and equipped_item.replica.stackable:StackSize() or 1)
			end
		end
	end
	local container_name = container.type and container.inst.name:lower()
	local name = item.name:lower()
	local has, num_found = container:Has(item.prefab, 1)
	num_found = num_found + num_equipped
	local i_have = ""
	local in_this = ""
	if container_name then -- this is a chest
		i_have = S.ANNOUNCE_ITEM.WE_HAVE
		in_this = S.ANNOUNCE_ITEM.IN_THIS
	else -- this is a backpack or inventory
		i_have = S.ANNOUNCE_ITEM.I_HAVE
		container_name = ""
	end
	local this_many = "" .. num_found
	local plural = num_found > 1
	local with = ""
	local durability = ""
	if percent and SHOWDURABILITY then
		with = plural 
				and S.ANNOUNCE_ITEM.AND_THIS_ONE_HAS
				 or S.ANNOUNCE_ITEM.WITH
		durability = S.ANNOUNCE_ITEM.DURABILITY
	else
		percent = ""
	end
	local a = S.getArticle(name)
	local s = S.S
	if (not plural) or string.find(name, s.."$") ~= nil then
		s = ""
	end
	if this_many == nil or this_many == "1" then this_many = a end
	local announce_str = subfmt(S.ANNOUNCE_ITEM.FORMAT_STRING,
								{
									I_HAVE = i_have,
									THIS_MANY = this_many,
									ITEM = name,
									S = s,
									IN_THIS = in_this,
									CONTAINER = container_name,
									WITH = with,
									PERCENT = percent,
									DURABILITY = durability,
								})
	return self:Announce(announce_str)
end

function StatusAnnouncer:AnnounceRecipe(slot, recipepopup, ingnum)
	local S = STRINGS._STATUS_ANNOUNCEMENTS._ --To save some table lookups
	local builder = slot.owner.replica.builder
	local buffered = builder:IsBuildBuffered(slot.recipe.name)
	local knows = builder:KnowsRecipe(slot.recipe.name) or CanPrototypeRecipe(slot.recipe.level, builder:GetTechTrees())
	local can_build = builder:CanBuild(slot.recipe.name)
	local name = STRINGS.NAMES[slot.recipe.name:upper()]:lower()
	local a = S.getArticle(name)
	local ingredient = nil
	if recipepopup == nil then --mouse controls, we have to find the focused ingredient
		recipepopup = slot.recipepopup
		for i, ing in ipairs(recipepopup.ing) do
			if ing.focus then ingredient = ing end
		end
	else --controller controls, we pick it by number (determined by which button was pressed)
		ingredient = recipepopup.ing[ingnum]
	end
	if ingnum and ingredient == nil then return end --controller button for ing that doesn't exist
	local prototyper = recipepopup.teaser.shown and S.ANNOUNCE_RECIPE.getPrototyper(recipepopup.teaser:GetString())
	local a_proto = ""
	local proto = ""
	if ingredient == nil then
		local start_q = ""
		local to_do = ""
		local s = ""
		local pre_built = ""
		local end_q = ""
		local i_need = ""
		local for_it = ""
		if buffered then
			to_do = S.ANNOUNCE_RECIPE.I_HAVE
			pre_built = S.ANNOUNCE_RECIPE.PRE_BUILT
		elseif can_build and knows then
			to_do = S.ANNOUNCE_RECIPE.ILL_MAKE
		elseif knows then
			to_do = S.ANNOUNCE_RECIPE.WE_NEED
			a = ""
			s = string.find(name, s.."$") == nil and S.S or ""
		else
			to_do = S.ANNOUNCE_RECIPE.CAN_SOMEONE
			if prototyper ~= "" and SHOWPROTOTYPER then
				i_need = S.ANNOUNCE_RECIPE.I_NEED
				a_proto = S.getArticle(prototyper) .. " "
				proto = prototyper
				for_it = S.ANNOUNCE_RECIPE.FOR_IT
			end
			start_q = S.ANNOUNCE_RECIPE.START_Q
			end_q = S.ANNOUNCE_RECIPE.END_Q
		end
		local announce_str = subfmt(S.ANNOUNCE_RECIPE.FORMAT_STRING,
									{
										START_Q = start_q,
										TO_DO = to_do,
										THIS_MANY = a,
										ITEM = name,
										S = s,
										PRE_BUILT = pre_built,
										END_Q = end_q,
										I_NEED = i_need,
										A_PROTO = a_proto,
										PROTOTYPER = proto,
										FOR_IT = for_it,
									})
		return self:Announce(announce_str)
	else
		local num = 0
		local ingname = ingredient.ing.texture:sub(1,-5)
		local ing_s = S.S
		local amount_needed = 1
		for k,v in pairs(slot.recipe.ingredients) do
			if ingname == v.type then amount_needed = v.amount end
		end
		local has, num_found = slot.owner.replica.inventory:Has(ingname, RoundBiasedUp(amount_needed * slot.owner.replica.builder:IngredientMod()))
		for k,v in pairs(slot.recipe.character_ingredients) do
			if ingname == v.type then
				amount_needed = v.amount
				has, num_found = slot.owner.replica.builder:HasCharacterIngredient(v)
				ing_s = "" --health and sanity are already plural
			end
		end
		num = amount_needed - num_found
		local can_make = math.floor(num_found / amount_needed)*slot.recipe.numtogive
		local ingredient_str = (ingredient.tooltip or "<missing_string>"):lower()
		if num == 1 or ingredient_str:find(ing_s.."$") ~= nil then ing_s = "" end
		local announce_str = "";
		if num > 0 then
			local and_str = ""
			if prototyper and SHOWPROTOTYPER then
				and_str = S.ANNOUNCE_INGREDIENTS.AND
				a_proto = S.getArticle(prototyper) .. " "
				proto = prototyper
			end
			announce_str = subfmt(S.ANNOUNCE_INGREDIENTS.FORMAT_NEED,
									{
										NUM_ING = num,
										INGREDIENT = ingredient_str,
										S = ing_s,
										AND = and_str,
										A_PROTO = a_proto,
										PROTOTYPER = proto,
										A_REC = S.getArticle(name),
										RECIPE = name,
									})
		else
			local but_need = ""
			if prototyper and SHOWPROTOTYPER then
				but_need = S.ANNOUNCE_INGREDIENTS.BUT_NEED
				a_proto = S.getArticle(prototyper) .. " "
				proto = prototyper
			end
			local a_rec = ""
			local rec_s = ""
			if can_make > 1 then
				a_rec = can_make .. ""
				rec_s = S.S
				if string.find(name, rec_s.."$") ~= nil then --already plural
					rec_s = ""
				end
			else
				a_rec = S.getArticle(name)
			end
			announce_str = subfmt(S.ANNOUNCE_INGREDIENTS.FORMAT_HAVE,
									{
										INGREDIENT = ingredient_str,
										ING_S = ing_s,
										A_REC = a_rec,
										RECIPE = name,
										REC_S = rec_s,
										BUT_NEED = but_need,
										A_PROTO = a_proto,
										PROTOTYPER = proto,
									})
		end
		return self:Announce(announce_str)
	end
end

function StatusAnnouncer:AnnounceSkin(recipepopup)
	local skin_name = recipepopup.skins_spinner.GetItem()
	local item_name = recipepopup.recipe.name
	if skin_name ~= item_name then --don't announce default skins
		return self:Announce(subfmt(STRINGS._STATUS_ANNOUNCEMENTS._.ANNOUNCE_SKIN.FORMAT_STRING,
									{SKIN = GetName(skin_name), ITEM = GetName(item_name)}))
	end
end

function StatusAnnouncer:AnnounceTemperature(pronoun)
	local S = STRINGS._STATUS_ANNOUNCEMENTS._.ANNOUNCE_TEMPERATURE --To save some table lookups
	local temp = ThePlayer:GetTemperature()
	local pronoun = pronoun and S.PRONOUN[pronoun] or S.PRONOUN.DEFAULT
	local message = S.TEMPERATURE.GOOD
	local TUNING = TUNING
	if temp >= TUNING.OVERHEAT_TEMP then
		message = S.TEMPERATURE.BURNING
	elseif temp >= TUNING.OVERHEAT_TEMP - 5 then
		message = S.TEMPERATURE.HOT
	elseif temp >= TUNING.OVERHEAT_TEMP - 15 then
		message = S.TEMPERATURE.WARM
	elseif temp <= 0 then
		message = S.TEMPERATURE.FREEZING
	elseif temp <= 5 then
		message = S.TEMPERATURE.COLD
	elseif temp <= 15 then
		message = S.TEMPERATURE.COOL
	end
	message = pronoun .. message
	if EXPLICIT then
		return self:Announce(string.format("(%d\176) %s", temp, message))
	else
		return self:Announce(message)
	end
end

function StatusAnnouncer:AnnounceWorldtemp(pronoun)
	local S = STRINGS._STATUS_ANNOUNCEMENTS._.ANNOUNCE_WORLDTEMP or nil --以保存一些表查找
	if S then
	local temp = TheWorld.state.temperature
	local pronoun = pronoun and S.PRONOUN[pronoun] or S.PRONOUN.WORLD
	local message = S.WORLDTEMP.GOOD
	local TUNING = TUNING
	if temp >= TUNING.OVERHEAT_TEMP then
		message = S.WORLDTEMP.BURNING
	elseif temp >= TUNING.OVERHEAT_TEMP - 5 then
		message = S.WORLDTEMP.HOT
	elseif temp >= TUNING.OVERHEAT_TEMP - 15 then
		message = S.WORLDTEMP.WARM
	elseif temp <= 0 then
		message = S.WORLDTEMP.FREEZING
	elseif temp <= 5 then
		message = S.WORLDTEMP.COLD
	elseif temp <= 15 then
		message = S.WORLDTEMP.COOL
	end
	message = pronoun .. message
	if EXPLICIT then
		return self:Announce(string.format("(%d\176) %s", temp, message))
	else
		return self:Announce(message)
	end end
end

--NOTE: Your mod is responsible for adding and deciding when to show/hide the controller button hint
-- look at the modmain for examples-- most stats just show/hide with controller inventory,
-- but moisture requires some special handling
function StatusAnnouncer:RegisterStat(name, widget, controller_btn,
										thresholds, category_names, value_fn, switch_fn)
	self.button_to_stat[controller_btn] = name
	self.stats[name] = {
		--The widget that should be focused when announcing this stat
		widget = widget,
		--The button on the controller that announces this stat
		controller_btn = controller_btn,
		--the numerical thresholds at which messages change (must be sorted in increasing order!)
		thresholds = thresholds,
		--the names of the buckets between the thresholds, for looking up strings
		category_names = category_names,
		--value_fn(ThePlayer) returns the current and maximum of the stat
		value_fn = value_fn,
		--switch_fn(ThePlayer) returns the mode (e.g. HUMAN for Woodie vs WEREBEAVER for Werebeaver)
		--if this is nil, it assumes there's just one table (look at Woodie's table in announcestrings vs the others)
		switch_fn = switch_fn,
	}
end

--The other arguments are here so that mods can use them to override this function
-- and avoid some of these stats if their character doesn't have them
function StatusAnnouncer:RegisterCommonStats(HUD, prefab, hunger, sanity, health, moisture, beaverness)
	local stat_categorynames = {"EMPTY", "LOW", "MID", "HIGH", "FULL"}
	local default_thresholds = {	.15,	.35,	.55,	.75		 }
	
	local has_beavermode = type(HUD.controls.status.beaverness) == "table"
	local switch_fn = has_beavermode
		and function(ThePlayer) return ThePlayer.isbeavermode:value() and "WEREBEAVER" or "HUMAN" end
		or nil 
	
	if hunger ~= false then
		self:RegisterStat(
			"Hunger",
			HUD.controls.status.stomach,
			CONTROL_INVENTORY_USEONSCENE, -- D-Pad Left
			default_thresholds,
			stat_categorynames,
			function(ThePlayer)
				return	ThePlayer.player_classified.currenthunger:value(),
						ThePlayer.player_classified.maxhunger:value()
			end,
			switch_fn
		)
	end
	if sanity ~= false then
		self:RegisterStat(
			"Sanity",
			HUD.controls.status.brain,
			CONTROL_INVENTORY_EXAMINE, -- D-Pad Up
			default_thresholds,
			stat_categorynames,
			function(ThePlayer)
				return	ThePlayer.player_classified.currentsanity:value(),
						ThePlayer.player_classified.maxsanity:value()
			end,
			switch_fn
		)
	end
	if health ~= false then
		self:RegisterStat(
			"Health",
			HUD.controls.status.heart,
			CONTROL_INVENTORY_USEONSELF, -- D-Pad Right
			{.25, .5, .75, 1},
			stat_categorynames,
			function(ThePlayer)
				return	ThePlayer.player_classified.currenthealth:value(),
						ThePlayer.player_classified.maxhealth:value()
			end,
			switch_fn
		)
	end
	if beaverness ~= false and has_beavermode then
		self:RegisterStat(
			"Log Meter",
			HUD.controls.status.beaverness,
			CONTROL_ROTATE_LEFT, -- Left Bumper
			{ .25, .5, .7, .9 },
			stat_categorynames,
			function(ThePlayer)
				return	ThePlayer.player_classified.currentbeaverness:value(),
						100 -- looks like the only way is to hardcode this; not networked
			end,
			switch_fn
		)
	end
	if moisture ~= false then
		self:RegisterStat(
			"Wetness",
			HUD.controls.status.moisturemeter,
			CONTROL_ROTATE_RIGHT, -- Right Bumper
			default_thresholds,
			stat_categorynames,
			function(ThePlayer)
				return	ThePlayer.player_classified.moisture:value(),
						ThePlayer.player_classified.maxmoisture:value()
			end,
			switch_fn
		)
	end
end

function StatusAnnouncer:OnHUDMouseButton(HUD)
	for stat_name,data in pairs(self.stats) do
		if data.widget.focus then
			return self:Announce(self:ChooseStatMessage(stat_name))
		end
	end
	if HUD.controls.status.temperature and HUD.controls.status.temperature.focus then
		return self:AnnounceTemperature(HUD.controls.status._beavermode and "BEAST" or nil)
	end
--添加宣告世界温度_鼠标
	if HUD.controls.status.worldtemp and HUD.controls.status.worldtemp.focus then
		return self:AnnounceWorldtemp()
	end
--结束
end

function StatusAnnouncer:OnHUDControl(HUD, control)
	if HUD:IsControllerCraftingOpen() then
		local cc = HUD.controls.crafttabs.controllercrafting
		if control == CONTROL_MENU_MISC_2 then --Y
			return self:AnnounceRecipe(cc.oldslot, cc.recipepopup)
		elseif control == CONTROL_INVENTORY_USEONSCENE then --d-pad left
			return self:AnnounceRecipe(cc.oldslot, cc.recipepopup, 1)
		elseif control == CONTROL_INVENTORY_EXAMINE then --d-pad up
			return self:AnnounceRecipe(cc.oldslot, cc.recipepopup, 2)
		elseif control == CONTROL_INVENTORY_USEONSELF then --d-pad right
			return self:AnnounceRecipe(cc.oldslot, cc.recipepopup, 3)
		elseif control == CONTROL_INVENTORY_DROP and cc.recipepopup.skins_spinner then --d-pad down
			return self:AnnounceSkin(cc.recipepopup)
		end
	elseif HUD:IsControllerInventoryOpen()
	or (HUD.controls.status._beavermode and HUD._statuscontrollerbuttonhintsshown) then
		local stat = self.button_to_stat[control]
		if stat and self.stats[stat].widget.shown then
			return self:Announce(self:ChooseStatMessage(stat))
		end
		if OVERRIDEB and HUD.controls.status.temperature and control == CONTROL_CANCEL then
			return self:AnnounceTemperature(HUD.controls.status._beavermode and "BEAST" or nil)
		end
--添加宣告世界温度_控制器_LB
		if OVERRIDEB and HUD.controls.status.worldtemp and control == CONTROL_ROTATE_LEFT then
			return self:AnnounceWorldtemp()
		end
--结束
	end
end

local function get_category(thresholds, percent)
	local i = 1
	while thresholds[i] ~= nil and percent >= thresholds[i] do
		i = i + 1
	end
	return i
end

function StatusAnnouncer:ChooseStatMessage(stat)
	local cur, max = self.stats[stat].value_fn(ThePlayer)
	local percent = cur/max
	local messages = self.stats[stat].switch_fn
						and self.char_messages[self.stats[stat].switch_fn(ThePlayer)]
						or self.char_messages
	--nice-looking version
	-- local category = get_category(self.stats[stat].thresholds, percent)
	-- local category_name = self.stats[stat].category_names[category]
	-- local message = messages[stat:upper()][category_name]
	--dirty but efficient version (just substituting in the variables)
	local message = messages[stat:upper()][self.stats[stat].category_names[get_category(self.stats[stat].thresholds, percent)]]
	if EXPLICIT then
		return string.format("(%s: %d/%d) %s", STRINGS._STATUS_ANNOUNCEMENTS._.STAT_NAMES[stat] or stat,
								cur, max, message)
	else
		return message
	end
end

function StatusAnnouncer:ClearCooldowns()
	self.cooldown = false
	self.cooldowns = {}
end

function StatusAnnouncer:ClearStats()
	self.stats = {}
	self.button_to_stat = {}
end

function StatusAnnouncer:SetCharacter(prefab)
	self:ClearCooldowns()
	self:ClearStats()
	self.char_messages = STRINGS._STATUS_ANNOUNCEMENTS[prefab:upper()] or STRINGS._STATUS_ANNOUNCEMENTS.UNKNOWN
end

function StatusAnnouncer:SetLocalParameter(parameter, value)
	if setters[parameter] then setters[parameter](value) end
end

return StatusAnnouncer