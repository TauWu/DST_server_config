_G=GLOBAL

if not _G.rawget(_G,"mods") then _G.rawset(_G,"mods",{}) end
if not _G.mods.player_preinit_fns then
	_G.mods.player_preinit_fns={}
	--Slippery Snake
	local old_MakePlayerCharacter = _G.require("prefabs/player_common")
	local function new_MakePlayerCharacter(name, customprefabs, customassets, common_postinit, master_postinit, starting_inventory,...)
		local inst=old_MakePlayerCharacter(name, customprefabs, customassets, common_postinit, master_postinit, starting_inventory,...)
		for _,v in ipairs(_G.mods.player_preinit_fns) do
			v(inst)
		end
		return inst
	end
	_G.package.loaded["prefabs/player_common"] = new_MakePlayerCharacter
end

function AddPlayersPreInit(fn)
	table.insert(_G.mods.player_preinit_fns,fn)
end

local player_postinit_fns = {}
function AddPlayersPostInit(fn)
	table.insert(player_postinit_fns,fn)
end

local done_players = {}
AddPlayersPreInit(function(inst)
	local s = inst.prefab or inst.name
	if not done_players[s] then
		done_players[s] = true
		AddPrefabPostInit(s,function(inst)
			for _,v in ipairs(player_postinit_fns) do
				v(inst)
			end
		end)
	end
end)

--Inviswatch client code

if not _G.mods.GetStringOverwrite then
	_G.mods.GetStringOverwrite = true
	local old_GetString = _G.GetString
	_G.GetString = function(inst, stringtype, modifier,...)
		local character = type(inst) == "string" and string.upper(inst) or (inst ~= nil and string.upper(inst.prefab))
		if character and stringtype and type(modifier) == "table" and _G.STRINGS.CHARACTERS[character] then
			stringtype = string.upper(stringtype)
			local topic_tab = _G.STRINGS.CHARACTERS[character][stringtype]
			if topic_tab and type(topic_tab)=="table" then
				local ret = topic_tab
				for i,v in ipairs(modifier) do
					if type(ret)~="table" then
						return --No crash
					end
					ret = ret[v]
				end
			end
		end
		return old_GetString(inst, stringtype, modifier,...)
	end
end


if _G.TheNet and _G.TheNet:GetIsServer() then


local comp_combat = _G.require "components/combat"
local old_SuggestTarget = comp_combat.SuggestTarget
function comp_combat:SuggestTarget(target,...)
	if not(target and target.inviswatch_active and not self.inst:HasTag("player")) then
		return old_SuggestTarget(self,target,...)
	end
end

local old_SetTarget = comp_combat.SetTarget
function comp_combat:SetTarget(target,...)
	if not(target and target.inviswatch_active and not self.inst:HasTag("player")) then
		return old_SetTarget(self,target,...)
	end
end
---------end of server side --------------
end

local comb_rep = _G.require "components/combat_replica"
local old_IsAlly = comb_rep.IsAlly
function comb_rep:IsAlly(guy,...)
	if guy.inviswatch_active then
		return true
	end
	return old_IsAlly(self,guy,...)
end

local function UpdateAnim(inst,once)
	local data = inst.m_compatibility
	if data then
		if data.task then
			data.task:Cancel()
		end
		if data.time_create then
			if data.time_create + 15 > _G.GetTime() then
				once = false
			else
				data.time_create = nil
			end
		end
		data.task_cnt = once and 15 or 0
		data.task = inst:DoPeriodicTask(0.2+math.random()*0.05,function(inst)
			--print("UpdateAnim: "..tostring(data.task_cnt))
			local f = data.test
			--transp
			if inst.AnimState then
				local t = 1
				for k,m in pairs(data.transp) do
					local ofs = (f[k][1](inst) and 1 or (f[k][2](inst) and 2 or 3)) --owner/ally/neutral offset
						+(f[k][3](inst) and 0 or 3) --is it hidden at all?
					local m_val = type(m[ofs])=="function" and m[ofs](inst) or m[ofs]
					if m_val < t then
						t = m_val --minimum
					end
				end
				inst.AnimState:SetMultColour(t,t,t,t)
			end
			--icon
			if inst.MiniMapEntity then
				local show_icon = true
				for k,m in pairs(data.icon) do
					local ofs = (f[k][1](inst) and 1 or (f[k][2](inst) and 2 or 3)) --owner/ally/neutral offset
						+(f[k][3](inst) and 0 or 3) --is it hidden at all?
					if not m[ofs] then
						show_icon = false
						break
					end
				end
				inst.MiniMapEntity:SetEnabled(show_icon)
			end
			--shadow
			if inst.DynamicShadow then
				local show_shadow = true
				for k,m in pairs(data.shadow) do
					local ofs = (f[k][1](inst) and 1 or (f[k][2](inst) and 2 or 3)) --owner/ally/neutral offset
						+(f[k][3](inst) and 0 or 3) --is it hidden at all?
					if not m[ofs] then
						show_shadow = false
						break
					end
				end
				inst.DynamicShadow:Enable(show_shadow)
			end
			--indicator
			local show_indicator = true
			for k,m in pairs(data.indicator) do
				local ofs = (f[k][1](inst) and 1 or (f[k][2](inst) and 2 or 3)) --owner/ally/neutral offset
					+(f[k][3](inst) and 0 or 3) --is it hidden at all?
				if not m[ofs] then
					show_indicator = false
					break
				end
			end
			if show_indicator then
				inst:RemoveTag("noplayerindicator")
			else
				inst:AddTag("noplayerindicator")
			end
			--time out
			data.task_cnt = data.task_cnt + 1
			if data.task_cnt > 15 then
				data.task:Cancel()
				data.task = nil
			end
		end,0.05)
	end
end

--client test functions
local function test_owner(inst)
	return (inst == _G.ThePlayer)
end

local function test_ally(inst)
	return _G.ThePlayer and inst.m_friends and inst.m_friends[_G.ThePlayer.userid]
	--return false
end

local function test_hidden(inst)
	return inst.inviswatch_active
end

--Network update for client
local function On_inviswatch_active(inst)
	inst.inviswatch_active = inst.net_inviswatch_active:value()
	--print("OnIsBadring: "..tostring(inst.is_badring))
	inst.m_compatibility.UpdateAnim(inst)
	--[[if inst.inviswatch_active then
		inst:AddTag("inviswatch_active")
	else	
		inst:RemoveTag("inviswatch_active")
	end--]]
	--inst.SpySetHUDState(inst)
end


local function MakeTransparentAsSpy(inst)
	--print("MakeTransparentAsSpy "..tostring(inst))
	--Common part
	if not inst.m_compatibility then
		inst.m_compatibility =
		{
			transp = {}, --mods
			test = {}, --criteria functions
			icon = {},
			shadow = {},
			indicator = {},
			UpdateAnim = UpdateAnim,
			time_create = _G.GetTime(),
			--current = {},
		}
	end
	--Spy part
	local data = inst.m_compatibility
	data.test.spy = { test_owner, test_ally, test_hidden } --only 2 functions, because neutral is default result
	data.transp.spy = {0.3,0.2,0.03,1,1,1} --hidden owner/ally/neutral + unhidden owner/ally/neutral
	data.icon.spy = {true,true,false,true,true,true} --false is better
	data.shadow.spy = {false,false,false,true,true,true} --false is better
	data.indicator.spy = {true,true,false,true,true,true} --false is better
	--inst.SpySetHUDState = SetHUDState
	--Network part
	inst.inviswatch_active = false
	inst.net_inviswatch_active = _G.net_bool(inst.GUID,"inviswatch_active","event_inviswatch_active")
	if not _G.TheWorld.ismastersim then
		inst:ListenForEvent("event_inviswatch_active", On_inviswatch_active)
		return
	end
end

AddPlayersPostInit(MakeTransparentAsSpy) --Make all player prefabs hide-able