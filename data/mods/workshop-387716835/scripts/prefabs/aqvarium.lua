
local assets =
{
	Asset("ANIM", "anim/aqvarium-ds.zip"),
}

local c_max_seeds = 10 --������������ ����������� �����
local c_max_meat = 3 --������������ ����������� ����
local c_need_wet = 60 --������� ���� ���� ��� ����������.
local c_life_to_get_out = 0.2 --������� ������ ���� ����� � �����, ����� �� ���� �� ����� � ���������
local c_drop_ice = 5 --������� ����� �������� �� ������� ���������

--��� ������ ������ ��� ����������, ����������� �����-�� ����
local function ontalk(inst, script)
	--inst.SoundEmitter:PlaySound("dontstarve/rabbit/hop")
end

local net_anim_num = {
	"frozen1_1",
	"frozen1_2",
	"polon1_1",
	"polon1_2",
	"polon1_3",
	"pust",
	"fiska",
	"fiska2",
	"fiska3",
	"eel",
	"eel2",
	"eel3",
	"dead_fish",
	"dead_eel",
	"hit",
	"combat",
	"zapol1_1",
	"zapol1_2",
	"x",
	"x",
}
local net_anim_assoc = {}
for i,v in ipairs(net_anim_num) do net_anim_assoc[v]=i end

local function aquarium_dirty(inst)
	inst.anim_num = inst.net_anim_num:value()
	local anim_num = inst.anim_num
	local overwrite = false
	if anim_num > #net_anim_num then
		anim_num = anim_num/2
		overwrite = true
	end
	if net_anim_num[anim_num] then
		inst.AnimState:PlayAnimation(net_anim_num[anim_num],overwrite)
	end
end



local function PlayNetAnim(inst,anim,kill_anim)
	--p(tostring(inst.GUID).." -:- "..tostring(anim)..(kill_anim and " (true)" or ""))
	if anim ~= inst.play_net_anim_save then
		inst.AnimState:PlayAnimation(anim,kill_anim)
		inst.play_net_anim_save = anim
		if net_anim_assoc[anim] then
			local anim_num = net_anim_assoc[anim] * (kill_anim and 2 or 1)
			inst.anim_num = anim_num
			inst.net_anim_num:set(anim_num)
		else
			print("Unknown anim "..anim.."!!!")
		end
	end
end


--������ �������� �� ������, ����������� �� ���������� ����������
--local last_anim=false --���������� ������ �������� ����� ���� ��� ������ ��� ������� ����������.
--kill_anim - ��� ��������� ���������� ���� ��������� �������� (����� �������� �� ���������)
local function PlayAnim(inst,kill_anim)
	if(inst.anim_name and not kill_anim and GetTime()<inst.anim_target+0.1) then
		return --���������� ��������, �.�. ������������� ������ ��������
	else
		inst.anim_name = false
	end
	if (inst.data.frozen) then
		PlayNetAnim(inst,"frozen1_1")
	elseif not inst.data.water then
		if inst.data.wet==0 then
			PlayNetAnim(inst,"pust")
		--elseif inst.data.wet<0.25*c_need_wet then
		--	PlayNetAnim(inst,"polon1_3") --�� ���
		elseif inst.data.wet<0.5*c_need_wet then
			PlayNetAnim(inst,"polon1_3") --���� ����
		else --inst.data.wet<1*c_need_wet then
			PlayNetAnim(inst,"polon1_2") -- ������ ��������
		end
	else --���� ���� � �� ����
		if (inst.data.fish) then --����� ������ (���� ���)
			local suffix=inst.data.fishlife>2.1 and "3" or (inst.data.fishlife>1.1 and "2" or "")
			if inst.data.fish=="fish" then
				PlayNetAnim(inst,"fiska"..suffix, true)
			else --eel? �� � ��� �� ���?
				PlayNetAnim(inst,"eel"..suffix, true)
			end
		else --��� ����
			if (inst.data.dead_fish) then
				if inst.data.dead_fish == "fish" then
					PlayNetAnim(inst,"dead_fish")
				else
					PlayNetAnim(inst,"dead_eel")
				end
			else
				PlayNetAnim(inst,"polon1_1") --��� idle
			end
		end
	end
	inst.last_anim=false
end

--������������� ���������� ���. ���� ���� - ��������� ��������.
local function UpdateCount(inst,do_anim)
	local count=math.ceil(inst.data.fishlife-0.1)
	if count<1 then count=1 end
	local diff=0
	if inst.fish_count~=count then
		diff=count-inst.fish_count -- +1 ���� �����������, -1 ���� �����������
		inst.fish_count=count
		if (do_anim) then PlayAnim(inst) end
	end	
	return diff
end


--����������� ����� �������� ������ �����������������. (������ ������, �������������?)
local function PlayNewAnim(inst,anim_name,duration)
	inst.anim_name = anim_name --�������� ��������
	inst.anim_target = GetTime() + duration --����� ����������
	PlayNetAnim(inst,anim_name)
	inst:DoTaskInTime(duration, function(inst) --����� �������� ���������� ������� ��������� ��������.
		if (inst.anim_name == anim_name) then --���� �� ��� �� ����� ��������.
			PlayAnim(inst,true)
		end
	end) 
	--PlayAnim(inst)
end

--���������� ����������� �����
local function MakeFishFull(inst)
	inst.data.fishhungry = 0
	inst.data.fisheat = math.random() * 480 * 2 -- ~ each 1 day
end

local cooking = require "cooking"

--����� ���� � ��������. ��� ���-��.
local function OnFishGiven(inst, giver, item)
	if item.components.edible and string.find(item.prefab, "seeds") then
		------------------������!!!
		inst.data.seeds = inst.data.seeds+1
		if inst.data.seeds > c_max_seeds then
			inst.data.seeds = c_max_seeds
		end
	elseif (item.prefab=="fish" or item.prefab=="eel") then
		-----------------�����!!!
		--inst.components.trader:Enable()
		inst.components.pickable:SetUp(item.prefab, 1000000)
		inst.components.pickable:Pause()
		inst.components.pickable.caninteractwith = true
		--inst.data.water="true"
		inst.components.pickable.product = nil --������� ���� �����
		--inst.components.pickable.canbepicked = false --����� �����, �� �� �������.
		
		local newlife = item.components.perishable and item.components.perishable:GetPercent() or 0.4
	
		if not inst.data.fish then
			inst.data.fish=item.prefab --���������� ������ �����
			inst.data.fishlife = newlife
			UpdateCount(inst)
			giver.components.talker:Say(STRINGS.Aquarium.WATER)
			if (inst.data.dead_fish) then
				inst.components.lootdropper:SpawnLootPrefab(inst.data.dead_fish.."_skelet")
				inst.data.dead_fish = false
			end
		elseif  inst.data.fish~=item.prefab then
			PlayNewAnim(inst,"combat",1) --�������� ����� (���� � ������ ���������, ���� ������������)
			giver.components.talker:Say(STRINGS.Aquarium.COMBAT)
			--������ 2 ����� ��� �����. ������ 1 - 50/50. ������ �������� ����� ���� ������ - 75%. � �.�.
			local victory = math.random() > 0.5*inst.data.fishlife --�������� �� ����� ����
			UpdateCount(inst)
			local killed_count=inst.fish_count --����������, ������� ��� ���� � ���������
			-- � ��� 2 �������: 1) ������ (��� ���� � ���. ��������) 2) ��������� (����� �������� + 0-1 �� ���).
			-- � ������ ��������� ����� ����� �������.
			inst.data.fishlife = inst.data.fishlife - 1
			if inst.data.fishlife < 0.1 or victory then
				inst.data.fishlife = 0.1
			end
			local diff=UpdateCount(inst) -- ��� ���������� ������ � ������ ��������� (������� �������)
			local killed_fish = inst.data.fish.."_skelet"; --������ ���� � ��������� (��������)
			local killed_guest = item.prefab.."_skelet"
			if victory then
				inst.data.fish=item.prefab --��������� ����
				inst.data.fishlife = 0.5 --�������� ����������: "��� ����"
				killed_guest = false --����� �� ����
				-- ������ �� ������. ���������� ������ ��� ��� � killed_count
			else
				killed_count = -diff --����� ������ ������� �� ������� ����� "����" � "�����"
				--inst.components.talker:Say("Diff: "..diff)
			end
			--����������� ���, �����:
			inst:DoTaskInTime(1, function()
				if killed_count>0 then
					for i=1,killed_count do
						inst.components.lootdropper:SpawnLootPrefab(killed_fish)
					end
				end
				if killed_guest then
					inst.components.lootdropper:SpawnLootPrefab(killed_guest)
				end
			end)
		else
			inst.data.fishlife = inst.data.fishlife + newlife
			UpdateCount(inst)
		end
		
		inst.data.fishtime = 0
		inst.data.fishtalk = 0
		inst.data.fishgift = 0
		MakeFishFull(inst)
		PlayAnim(inst)
		
		
	elseif inst.data.fish and item.prefab~="red_roe" and item.prefab~="black_roe" then
		-------------����!!!
		local val = 0.5
		local ing = cooking.ingredients[item.prefab]
		if ing and ing.tags.meat and ing.tags.meat>0 then
			val = ing.tags.meat
		end
		inst.data.meat = inst.data.meat + val
		if inst.data.meat > c_max_meat then
			inst.data.meat = c_max_meat
		end
	end
	--����� ������!
	
    --inst.AnimState:PlayAnimation("fiska", true)
	--inst.components.talker:Say("TY "..giver.prefab.." for "..item.prefab)
	--if(giver and giver.components.talker)then
	--	giver.components.talker:Say("Thank me ("..giver.prefab..") for "..item.prefab)
	--end
end

--��������� ���� �� ���������!
local function KickFish(inst) --, picker) --, loot)
	local loot = inst.components.lootdropper:SpawnLootPrefab(inst.data.fish) --����������� ����
	--������������� �� ����� �� ��, ��� ������ ����.
	if (loot and loot.components.perishable) then
		local life = inst.data.fishlife
		life = (life>1)and 1 or (life<0.1 and 0.1 or life)
		loot.components.perishable:SetPercent(life)
	end
	--����������
	inst.data.fishlife = inst.data.fishlife - 1
	if inst.data.fishlife<0.1 then
		inst.data.fish=false
		inst.components.pickable.caninteractwith = false
	else
		UpdateCount(inst)
	end
	--PlayAnim(inst) -- �� ����������� ��������, ��� ��� ����������� �������
end

--�������� ���� �� ��������� (�������)
local function OnFishTaken(inst, picker, loot) --loot==nil, ��� �� ����� ���������� ����������
    --inst.components.trader:Enable()
    --inst.components.pickable.caninteractwith = false
    --inst.AnimState:PlayAnimation("idle")
	KickFish(inst, picker, loot)
	PlayAnim(inst)
	--inst.components.lootdropper:DropLoot()
	
	--inst.components.talker:Say("Nooooo! Give it back!")
end

--����������� ����� OnFishTaken � ����� ������� ������ components.pickable
local function OnPicked(inst,tbl) --(picker, loot)
	if inst.data.fish and not inst.data.frozen then
		--��������������� ����������� ��� ����� �����
		inst.components.pickable:SetUp(inst.data.fish, 1000000)
		inst.components.pickable:Pause()
		inst.components.pickable.caninteractwith = true
		inst.components.pickable.product = nil --������� ���� �����
		--inst.components.talker:Say("Nooooo! Give it back!")
	end
	--inst - aquarium
	--tbl.picker - object
	--tbl.loot - object
	
    --inst.components.pickable:SetUp("fish", 1000000)
    --inst.components.pickable:Pause()
    --inst.components.pickable.caninteractwith = true
end

local q_sqrt = {} --������� ��������� ������
for i=1,81 do
	local x = (math.sqrt(i) - 3)*25
	if x<0 then x=0 end
	x = math.floor(x+0.5) + 50
	q_sqrt[i] = x --����� �� ����� �� ������������ ������� (3-9)
end

--��������� � ����������.
local function OnSnowCoverChange(inst, thresh)
	--thresh = thresh or .02
	--local snow_cover = TheWorld and TheWorld.state.snowlevel or 0
	local must_freeze = TheWorld and (TheWorld.state.temperature < 0)
	if must_freeze then
		--p("------------")
		local pt = inst:GetPosition()
		local total_heat = -15
		local e = TheSim:FindEntities(pt.x,pt.y,pt.z,9,{"HASHEATER"})
		for i,v in ipairs(e) do
			if v.prefab ~= "spawnlight_multiplayer" then
				local dist = math.ceil(inst:GetDistanceSqToInst(v))
				local heat = v.components.heater and v.components.heater:GetHeat(inst) or 0
				--p("Heat = "..heat)
				if dist and heat then
					if heat<=10 and dist<=3 and heat>0 then
						total_heat = total_heat+heat
					elseif q_sqrt[dist] then
						heat = heat - q_sqrt[dist]
						--p("Heat minus = "..q_sqrt[dist])
						if heat>0 then total_heat = total_heat+heat end
					end
				end
			end
		end
		if total_heat>= 0 then
			must_freeze = false
		end
		--p("Total heat: "..total_heat)
		inst.total_heat = total_heat
	else
		inst.total_heat = false
	end
	if must_freeze and not inst.frozen and inst.data.wet>0 then --������ ���� ���� ����!
		while inst.data.fish do
			KickFish(inst) --����������� ������ ����� ����������
		end
		inst.frozen = true
		inst.data.frozen=true
		inst.components.trader:Disable()
		PlayNewAnim(inst,"frozen1_2",5) --�������� ���������� 5 ������
		--PlayAnim(inst)
		--inst.AnimState:PlayAnimation("frozen")
		
		--inst.SoundEmitter:PlaySound("dontstarve/winter/pondfreeze")
	    --inst.components.childspawner:StopSpawning()
		--inst.components.fishable:Freeze()

        --inst.Physics:SetCollisionGroup(COLLISION.OBSTACLES)
        --inst.Physics:ClearCollisionMask()
        --inst.Physics:CollidesWith(COLLISION.WORLD)
        --inst.Physics:CollidesWith(COLLISION.ITEMS)
	elseif (not must_freeze) and inst.frozen then
		inst.frozen = false
		inst.data.frozen=false
		inst.data.fish=false --�� ������ ������. �� ���� ����� �� ��������.
		inst.components.trader:Enable()
		PlayAnim(inst)
		
	    --inst.components.childspawner:StartSpawning()
		--inst.components.fishable:Unfreeze()

		--inst.Physics:SetCollisionGroup(COLLISION.OBSTACLES)
        --inst.Physics:ClearCollisionMask()
        --inst.Physics:CollidesWith(COLLISION.WORLD)
        --inst.Physics:CollidesWith(COLLISION.ITEMS)
        --inst.Physics:CollidesWith(COLLISION.CHARACTERS)

		--SpawnPlants(inst, inst.planttype)
	end
end

local function OnLoad(inst, data)
	--PlayAnim(inst)
	inst:DoTaskInTime(0, function() --��� ��������!
		if data and data.aq then
			for k,v in pairs(data.aq) do --�������� ������, � �� �������� ���.
				inst.data[k]=v
			end
			if inst.data.fish and not inst.data.frozen then
				inst.components.pickable:SetUp(inst.data.fish, 1000000)
				inst.components.pickable:Pause()
				inst.components.pickable.caninteractwith = true
				inst.components.pickable.product = nil --������� ���� �����
			end
			inst.frozen = data.aq.frozen and true or false
			--inst.data=data.aq
		--[[	inst.components.talker:Say("Data loaded! water="..tostring(data.water))
		elseif data and data.water then
			inst.components.talker:Say("Shit! water="..tostring(data.water))
		elseif data then
			inst.components.talker:Say("Data ONLY!")
		else
			inst.components.talker:Say("No data!") --]]
		end
	
		OnSnowCoverChange(inst) --��������� ���������. ��� ��� ��������� ������ ����������, ���� ����.
		--��������������� ��������
		PlayAnim(inst)
	end)
end

local function OnSave(inst, data)
	if not data then data={} end
	data.aq=inst.data
	--return data --����� ��� refs? ���������� �����-��...
end

--???
local function getstatus(inst)
    if inst.components.pickable.caninteractwith then
        return "VALID"
    else
        return "FISH"
    end
end

---????
local function onturnon(inst)
	PlayNetAnim(inst,"idle", true)
	
end

---???
local function onturnoff(inst)
    inst.AnimState:PushAnimation("fiska", true)
end

local Is_ROG_Enabled = TUNING.LIGHTNING_GOAT_DAMAGE ~= nil
 
local function onhammered(inst, worker)
	if Is_ROG_Enabled then --������ ��� DLC!
		local i_max=math.ceil(inst.data.wet*c_drop_ice/c_need_wet)
		if i_max>c_drop_ice then i_max=c_drop_ice end
		if inst.data.frozen and i_max>0 then --������� ���, ���� �������� ���������
			for i=1,i_max do inst.components.lootdropper:SpawnLootPrefab("ice") end
		end
	end
	if inst.data.seeds>0 then --������� ��� ������ (�����������)
		for i=1,inst.data.seeds do
			local loot = inst.components.lootdropper:SpawnLootPrefab("seeds")
			loot.components.perishable:SetPercent(0.2)
		end
	end
	while inst.data.meat>0 do --������� �� ���� (������� ������� �����)
		local loot;
		local r=math.random()
		if inst.data.meat>=2 then
			if r<0.2 then
				loot = inst.components.lootdropper:SpawnLootPrefab("trunk_summer")
				loot.components.perishable:SetPercent(0.4)
				inst.data.meat = inst.data.meat - 2
			elseif r<0.3 then
				loot = inst.components.lootdropper:SpawnLootPrefab("trunk_cooked")
				loot.components.perishable:SetPercent(0.7)
				inst.data.meat = inst.data.meat - 2
			end
		end
		r=math.random()
		if inst.data.meat>=1.5 then
			if r<0.4 then
				loot = inst.components.lootdropper:SpawnLootPrefab("monstermeat")
				loot.components.perishable:SetPercent(0.4)
				inst.data.meat = inst.data.meat - 1
			elseif r<0.5 then
				loot = inst.components.lootdropper:SpawnLootPrefab("meat")
				loot.components.perishable:SetPercent(0.19)
				inst.data.meat = inst.data.meat - 1
			end
		end
		r=math.random()
		if inst.data.meat>=0.5 then
			if r<0.2 then
				loot = inst.components.lootdropper:SpawnLootPrefab("smallmeat")
				loot.components.perishable:SetPercent(0.4)
				inst.data.meat = inst.data.meat - 0.5
			elseif r<0.6 then
				loot = inst.components.lootdropper:SpawnLootPrefab("froglegs")
				loot.components.perishable:SetPercent(0.4)
				inst.data.meat = inst.data.meat - 0.5
			elseif r<0.7 then
				loot = inst.components.lootdropper:SpawnLootPrefab("batwing")
				loot.components.perishable:SetPercent(0.3)
				inst.data.meat = inst.data.meat - 0.5
			elseif r<0.8 then
				loot = inst.components.lootdropper:SpawnLootPrefab("batwing_cooked")
				loot.components.perishable:SetPercent(0.6)
				inst.data.meat = inst.data.meat - 0.5
			elseif r<0.9 then
				loot = inst.components.lootdropper:SpawnLootPrefab("drumstick")
				loot.components.perishable:SetPercent(0.2)
				inst.data.meat = inst.data.meat - 0.5
			end
		end
	end
	while inst.data.fish do --�, �������, ������� ���� ����.
		KickFish(inst)
	end
	if inst.data.dead_fish then --��� � �����
		inst.components.lootdropper:SpawnLootPrefab(inst.data.dead_fish.."_skelet")
	end
	inst.components.lootdropper:DropLoot() --������� ���������� ��� ������.
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function onhit(inst, worker)
	PlayNetAnim(inst,"hit")
	--inst.AnimState:PushAnimation("idle")
	PlayAnim(inst)
end

--������ �������� �� ���� ������� �������!
local function CalcSanityAura(inst, observer)
	local aura = 0
	if inst.data.water then
		aura = TUNING.SANITYAURA_TINY --���� �����������
		if inst.data.fish then
			local suffix=inst.data.fishlife>2.1 and 3 or (inst.data.fishlife>1.1 and 2 or 1)
			aura = aura * (1 + 0.6 * suffix) --� � ������ ������ �������!
		end
	elseif inst.data.dead_fish then
		aura = -TUNING.SANITYAURA_TINY --������� ������
	end
	return aura
end


local monsters = { monstermeat = 1, monstermeat_cooked = 1, cookedmonstermeat = 1, 
	batwing = 1, batwing_cooked = 1}

local already_eaten = {fish_skelet=1, eel_skelet=1}

--���������� �� ����������� "����"
local function ShouldAcceptItem(inst, item)
	local can=false
	--if item.prefab=="froglegs" then return false end --jjjjjjjjjj
	if item.components.edible and string.find(item.prefab, "seeds") and inst.data.seeds< c_max_seeds then
		can=true --������
	elseif inst.data.frozen or not inst.data.water then
		can=false --���� ��� ��� ����
	elseif inst.data.fish then
		if item.prefab=="fish" or item.prefab=="eel" then
			if inst.data.fishlife<=2 or inst.data.fish~=item.prefab then
				can=true
			end
		elseif item.prefab~="red_roe" and item.prefab~="black_roe" then
			local ing = cooking.ingredients[item.prefab]
			if ing and ing.tags.meat and ing.tags.meat>0 and (inst.data.meat + ing.tags.meat) <= c_max_meat
				and (not monsters[item.prefab])
				and (not already_eaten[item.prefab])
			then
				can = true --����, �� �� ����� ����
			end
		end
	else --no fish
		if item.prefab=="fish" or item.prefab=="eel" then
			can=true --�����
		end
	end
	return can
end

--� ������ ������ ������� ����� ��� ���-�� (������� �������� �� �����)
local function OnRefuseItem(inst, giver, item)
	--if item.prefab=="froglegs" then
	--	inst.components.talker:Say("W:"..inst.data.w..", t:"..inst.data.t..", wet:"..inst.data.wet)
	--end
	--inst.AnimState:PlayAnimation("flap")
    --inst.SoundEmitter:PlaySound("dontstarve/birds/wingflap_cage")
    --inst.AnimState:PushAnimation("idle_bird")
	if item.components.edible and string.find(item.prefab, "seeds") then
		if (inst.data.seeds>= c_max_seeds) then
			giver.components.talker:Say(STRINGS.Aquarium.SEEDS)
		end
	elseif inst.data.frozen then
		giver.components.talker:Say(STRINGS.Aquarium.FROZEN)
	elseif (not inst.data.water)
		and (item.prefab=="fish" or item.prefab=="eel" or 
			(item.components.edible and item.components.edible.foodtype == "MEAT")) then
		if inst.data.wet>0 then
			giver.components.talker:Say(STRINGS.Aquarium.LITTLEWATER)
		else
			giver.components.talker:Say(STRINGS.Aquarium.NOWATER)
		end
	elseif (inst.data.fish) then
		if (item.prefab=="fish" or item.prefab=="eel") then
			giver.components.talker:Say(STRINGS.Aquarium.NOSPACE)
		elseif monsters[item.prefab] then
			giver.components.talker:Say(STRINGS.Aquarium.MONSTER)
		elseif already_eaten[item.prefab] then
			giver.components.talker:Say(STRINGS.Aquarium.ALREADY_EATEN)
		elseif item.prefab=="red_roe" or item.prefab=="black_roe" then
			giver.components.talker:Say(STRINGS.Aquarium.THEY_WONT_EAT)
		elseif cooking.ingredients[item.prefab] and cooking.ingredients[item.prefab].meat then
			giver.components.talker:Say(STRINGS.Aquarium.ENOUGH)
		else
			giver.components.talker:Say(STRINGS.Aquarium.WHY)
		end
	else -- not inst.fish
		giver.components.talker:Say(STRINGS.Aquarium.WHY)
	end
end

local function IsWet(inst)

	--jj: only DLC!!!!
    --local MoistureManager = GetWorld().components.moisturemanager
    --return MoistureManager and MoistureManager:IsEntityWet(inst.item)
end

local function Inspect(inst, viewer)
	if inst.data.frozen then
		return STRINGS.Aquarium.INSPECT_FROZEN
	elseif not inst.data.water then
		if inst.data.wet == 0 then
			return STRINGS.Aquarium.INSPECT_EMPTY
		elseif inst.data.wet<0.25 * c_need_wet then
			return STRINGS.Aquarium.INSPECT_WATER_1 --.. "("..tostring(inst.data.wet)..")"
		elseif inst.data.wet<0.5 * c_need_wet then
			return STRINGS.Aquarium.INSPECT_WATER_2 --.. "("..tostring(inst.data.wet)..")"
		else
			return STRINGS.Aquarium.INSPECT_WATER_3 --.. "("..tostring(inst.data.wet)..")"
		end
	elseif inst.data.fish then
		if inst.data.seeds==0 and inst.data.meat==0 then
			return STRINGS.Aquarium.FEEDER_EMPTY
		elseif inst.data.seeds==0 then
			return STRINGS.Aquarium.MEAT_NOT_FOOD
		elseif inst.data.seeds<3 then
			return STRINGS.Aquarium.FEEDER_ALMOST_EMPTY
		elseif inst.data.fish=="fish" then
			return inst.data.fishlife<1.1 and STRINGS.Aquarium.INSPECT_FISH or STRINGS.Aquarium.INSPECT_FISHES
		else
			return inst.data.fishlife<1.1 and STRINGS.Aquarium.INSPECT_EEL or STRINGS.Aquarium.INSPECT_EELS
		end
	else
		if inst.data.dead_fish then
			if inst.data.dead_fish=="fish" then
				return STRINGS.Aquarium.INSPECT_WATER_DEAD_FISH
			else
				return STRINGS.Aquarium.INSPECT_WATER_DEAD_EEL
			end
		else
			return STRINGS.Aquarium.INSPECT_WATER_4 --.. "("..tostring(inst.data.wet)..")"
		end
	end
end

local function OnUpdate(inst) --, dt)
	--��� �� ��� ��������?
	local dt = 5
	--����������� ���������...
	if not inst.data.water then
		local seasonmgr = TheWorld
		if seasonmgr and seasonmgr.state.israining then
			local new_wet = inst.data.wet + dt*seasonmgr.state.precipitationrate
			if new_wet > c_need_wet then
				inst.data.water = true
			end
			if (inst.data.wet<0.5*c_need_wet and new_wet>=0.5*c_need_wet) then --��������� �� ��������
				PlayNewAnim(inst,"zapol1_2",5)
			elseif (inst.data.wet<c_need_wet and new_wet>=c_need_wet) then --��������� �� �����
				PlayNewAnim(inst,"zapol1_1",5)
			else --����� ������ ����������� � ��.
				PlayAnim(inst)
			end
			inst.data.wet=new_wet
		end
	end
	--����� �����
	if inst.data.fish then
		inst.data.fishtime = inst.data.fishtime + dt --����������� ����� ����
		inst.data.fishgift = inst.data.fishgift + dt
		inst.data.fishhungry = inst.data.fishhungry + dt
		inst.data.fishlife = inst.data.fishlife - dt/1440 --���� ��������
		UpdateCount(inst,true)
		--����������� ������� �����, ���� ������ ���-�� ������
		if inst.data.fishlife<c_life_to_get_out then
			if inst.data.seeds>0 then
				inst.data.seeds = inst.data.seeds - 1
				inst.data.fishlife = inst.data. fishlife + 0.67 --2/3
				MakeFishFull(inst)
				PlayAnim(inst)
				inst.components.talker:Say(STRINGS.Aquarium.PLOP)
			elseif inst.data.meat > 0 then
				inst.data.meat = inst.data.meat - 0.5
				inst.data.fishlife = inst.data. fishlife + 0.33 --1/3
				MakeFishFull(inst)
				PlayAnim(inst)
				inst.components.talker:Say(STRINGS.Aquarium.PLOP)
			else
				inst.data.fishtalk = inst.data.fishtalk + 1
				local silence=true --��������� ���������
				local pp,dist=inst:GetNearestPlayer(true)
				if pp and dist and dist<25*25 then
					silence = false
				end
				if inst.data.fishtalk == 1 and not silence then
					pp.components.talker:Say(STRINGS.Aquarium.WANTEAT1,4)
				elseif inst.data.fishtalk == 2 and not silence then
					pp.components.talker:Say(STRINGS.Aquarium.WANTEAT2,4)
				elseif inst.data.fishtalk == 3 and not silence then
					pp.components.talker:Say(STRINGS.Aquarium.WANTEAT3,4)
				elseif inst.data.fishtalk == 4 and not silence then
					pp.components.talker:Say(STRINGS.Aquarium.WANTEAT4,4)
				-- tick 5 - ������ ��������.
				elseif inst.data.fishtalk == 6 and not silence then
					pp.components.talker:Say(STRINGS.Aquarium.WANTEAT5,4)
				elseif inst.data.fishtalk > 6 then
					--KickFish(inst)
					inst.data.dead_fish=inst.data.fish
					inst.data.fish=false
					inst.components.pickable.caninteractwith = false -- "���������" ��������
					PlayAnim(inst)
				end
			end
		end
		--���������� �������
		if inst.data.fishlife>=c_life_to_get_out then
			inst.data.fishtalk = 0
		end
		--������� ������
		if inst.data.seeds>0 and inst.data.fishhungry > inst.data.fisheat then
			inst.data.seeds = inst.data.seeds - 1
			inst.data.fishlife = inst.data. fishlife + 0.67 --2/3
			MakeFishFull(inst)
			if inst.data.fishlife>3 then --������.
				KickFish(inst)
			end
			PlayAnim(inst)
			inst.components.talker:Say(STRINGS.Aquarium.PLOP)
		end
		--�������
		if inst.data.meat>0 and inst.data.fishgift > 59 and math.random() > .9 then
			inst.data.meat = inst.data.meat - 0.5
			inst.components.lootdropper:SpawnLootPrefab(inst.data.fish=="fish" and "red_roe" or "black_roe")
			inst.data.fishgift = 0
			inst.components.talker:Say(STRINGS.Aquarium.PLOP)
		end
		UpdateCount(inst,true)
	end
	--���������� ���-������
	inst:DoTaskInTime(1,OnSnowCoverChange) --(inst) --���� ��������, ����� � �����, ����� ������.
	--inst:DoTaskInTime(10, function() OnUpdate(inst,10) end)
end



local function fn(Sim)
	local inst = CreateEntity()

	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork() --NEW in DST!!
	--inst.entity:AddLight()
	
    MakeObstaclePhysics(inst, 0.9)    

	--inst.AnimState:SetBank("aqvarium")
    anim:SetBank("aqvarium")
    anim:SetBuild("aqvarium")
    anim:PlayAnimation("idle")

	inst:AddTag("GLASS")
    
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon( "aqvarium.tex" )
	
	inst.anim_num = 0
	inst.net_anim_num = net_ushortint(inst.GUID, "anim_num", "aquarium_dirty") --������� �������-����������

    
	
    if not TheWorld.ismastersim then
		inst:ListenForEvent("aquarium_dirty", aquarium_dirty)
        return inst
    end
	
	inst.play_net_anim_save = ""
	
	inst.entity:SetPristine()


	if not inst.data then
		inst.data = { --���������, ������� ���� � ���������� ����
			frozen = false, --��������� �� ��������.
			water = false, --���� �� ����.
			wet = 0, --�������� ����
			fish = false, --���� "fish", ���� "eel" - ������ ���� ��������
			seeds = 0, --�������� �����. ���� �� 1
			meat = 0, --�������� ����. ���� �� 0.5
			fishlife = 0, --�� ����, ��� ����� ����� � ���������� ���.
			fishtime = 0, --����� ���������� ���� � ��������� (� ��������)
			fishtalk = 0, --����� ������� � ������
			fishgift = 0, --����� � ���������� �������
			fishhungry = 0, --������� (��� ���������� �����������)
			fisheat = 0, --����� ���� ������� ������ �������

			anim_name = 0, --������������ ��� �������� ��������. �������� ��������
			anim_target = 0, --�������� ����� ��������.
			
			need_wet = c_need_wet --support TellMe mod
		}
	end
	inst.fish_count=0
    
    inst:AddComponent("inspectable") --��, ��� ���
	inst.components.inspectable.getspecialdescription=Inspect
	inst.no_wet_prefix = true --������� ��������?) �� � ��� �������
    inst:AddComponent("lootdropper") --��� ����, ����� ����������� ������ ����

    inst:AddComponent("pickable") --��� ���� ����� ����� ���� �������� ���� �����
    inst.components.pickable.caninteractwith = false
    inst.components.pickable.onpickedfn = OnFishTaken

    inst:AddComponent("trader") --��� ����� ����� ���� �������� ���� ��� ����
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
    inst.components.trader.onaccept = OnFishGiven
	inst.components.trader.onrefuse = OnRefuseItem
	--inst.components.trader:Disable()

	inst:AddComponent("talker")
    inst.components.talker.ontalk = ontalk --��� ������ ������ ����� ��������� ���� �����-���
    inst.components.talker.fontsize = 35
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(140/255, 190/255, 255/255)
    inst.components.talker.offset = Vector3(0,-300,0)

	inst:AddComponent("lootdropper")
	
    inst:AddComponent("sanityaura")
    inst.components.sanityaura.aurafn = CalcSanityAura
    
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(1)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
 	MakeSnowCovered(inst, .01) --????
    inst.OnLoad = OnLoad
	inst.OnSave = OnSave
	
	--inst:ListenForEvent("snowcoverchange", function() OnSnowCoverChange(inst) end, TheWorld)
	inst:ListenForEvent("picked", OnPicked) --���� ����, ����� ��������.
	
	inst.last_anim = false
	PlayAnim(inst)
	
	--inst.OnLongUpdate=OnUpdate
	
	--inst:DoTaskInTime(10, function() OnUpdate end)
	inst:DoPeriodicTask(5+(math.random()/2), OnUpdate)
	
    return inst
end

return Prefab( "common/aqvarium", fn, assets),
		MakePlacer( "common/aqvarium_placer", "aqvarium", "aqvarium", "idle" ) 
