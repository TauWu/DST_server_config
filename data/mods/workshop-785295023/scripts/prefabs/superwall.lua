require "prefabutil"

local assets=
{
	Asset("ATLAS", "images/inventoryimages/wooddoor.xml"),
    Asset("IMAGE", "images/inventoryimages/wooddoor.tex"),
	Asset("ATLAS", "images/inventoryimages/haydoor.xml"),
    Asset("IMAGE", "images/inventoryimages/haydoor.tex"),
	Asset("ATLAS", "images/inventoryimages/stonedoor.xml"),
    Asset("IMAGE", "images/inventoryimages/stonedoor.tex"),
	Asset("ATLAS", "images/inventoryimages/ruindoor.xml"),
    Asset("IMAGE", "images/inventoryimages/ruindoor.tex"),
	Asset("ATLAS", "images/inventoryimages/limestonedoor.xml"),
    Asset("IMAGE", "images/inventoryimages/limestonedoor.tex"),
	Asset("ATLAS", "images/inventoryimages/limestonewall.xml"),
    Asset("IMAGE", "images/inventoryimages/limestonewall.tex"),
	Asset("ATLAS", "images/inventoryimages/moonrockdoor.xml"),
    Asset("IMAGE", "images/inventoryimages/moonrockdoor.tex"),
	Asset("ATLAS", "images/inventoryimages/icedoor.xml"),
    Asset("IMAGE", "images/inventoryimages/icedoor.tex"),
	Asset("ATLAS", "images/inventoryimages/icewall.xml"),
    Asset("IMAGE", "images/inventoryimages/icewall.tex"),
	Asset("ATLAS", "images/inventoryimages/seadoor.xml"),
    Asset("IMAGE", "images/inventoryimages/seadoor.tex"),
	Asset("ATLAS", "images/inventoryimages/seawall.xml"),
    Asset("IMAGE", "images/inventoryimages/seawall.tex"),
	Asset("ATLAS", "images/inventoryimages/wallbuilder.xml"),
    Asset("IMAGE", "images/inventoryimages/wallbuilder.tex"),
	
	
	Asset("ANIM", "anim/dyc_wall_limestone.zip"),
	Asset("ANIM", "anim/dyc_wall_ice.zip"),
	Asset("ANIM", "anim/dyc_wall_sea.zip"),
	Asset("ANIM", "anim/dyc_square.zip"),
	Asset("ANIM", "anim/dyc_square2.zip"),
}

local prefabs =
{
	-- "collapse_small",
}

local ransuffix=math.random()

local function Clamp (n,nmin,nmax)
	if n<nmin then
		n=nmin
	elseif n>nmax then
		n=nmax
	end
	return n
end

local function Round (n)
	if n%1>=0.5 then
		return math.ceil(n)
	else
		return math.floor(n)
	end
end

local function OnIsPathFindingDirty(inst)
    if inst._ispathfinding:value() then
        if inst._pfpos == nil then
            inst._pfpos = inst:GetPosition()
            TheWorld.Pathfinder:AddWall(inst._pfpos:Get())
        end
    elseif inst._pfpos ~= nil then
        TheWorld.Pathfinder:RemoveWall(inst._pfpos:Get())
        inst._pfpos = nil
    end
end

local function InitializePathFinding(inst)
    inst:ListenForEvent("onispathfindingdirty", OnIsPathFindingDirty)
    OnIsPathFindingDirty(inst)
end



local function makeobstacle(inst)
    inst.Physics:SetActive(true)
    inst._ispathfinding:set(true)
end

local function clearobstacle(inst)
    inst.Physics:SetActive(false)
    inst._ispathfinding:set(false)
end

local function getwallanim_dyc (inst)
	local wallpercent=inst.wallpercent
	if wallpercent>=1 then
		return "fullA"
	elseif wallpercent>=0.75 then
		return "threequarter"
	elseif wallpercent>=0.5 then
		return "half"
	elseif wallpercent>=0.25 then
		return "onequarter"
	elseif wallpercent>=0 then
		return "broken"
	end
	return "broken"
end

local function GetWallPrefabs(t)
	if t=="haywall" then
		return {name=t,prefab="dyc_wall_hay",item="dyc_wall_hay_item",placerprefab="dyc_wall_hay_item_placer",}
	end
	if t=="woodwall" then
		return {name=t,prefab="dyc_wall_wood",item="dyc_wall_wood_item",placerprefab="dyc_wall_wood_item_placer",}
	end
	if t=="stonewall" then
		return {name=t,prefab="dyc_wall_stone",item="dyc_wall_stone_item",placerprefab="dyc_wall_stone_item_placer",}
	end
	if t=="ruinwall" then
		return {name=t,prefab="dyc_wall_ruin",item="dyc_wall_ruin_item",placerprefab="dyc_wall_ruin_item_placer",}
	end
	if t=="limestonewall" then
		return {name=t,prefab="dyc_wall_limestone",item="dyc_wall_limestone_item",placerprefab="dyc_wall_limestone_item_placer",}
	end
	if t=="moonrockwall" then
		return {name=t,prefab="dyc_wall_moonrock",item="dyc_wall_moonrock_item",placerprefab="dyc_wall_moonrock_item_placer",}
	end
	if t=="icewall" then
		return {name=t,prefab="dyc_wall_ice",item="dyc_wall_ice_item",placerprefab="dyc_wall_ice_item_placer",}
	end
	if t=="seawall" then
		return {name=t,prefab="dyc_wall_sea",item="dyc_wall_sea_item",placerprefab="dyc_wall_sea_item_placer",}
	end
	
	if t=="haydoor" then
		return {name=t,prefab="dyc_door_hay",item="dyc_door_hay_item",placerprefab="dyc_door_hay_item_placer",}
	end
	if t=="wooddoor" then
		return {name=t,prefab="dyc_door_wood",item="dyc_door_wood_item",placerprefab="dyc_door_wood_item_placer",}
	end
	if t=="stonedoor" then
		return {name=t,prefab="dyc_door_stone",item="dyc_door_stone_item",placerprefab="dyc_door_stone_item_placer",}
	end
	if t=="ruindoor" then
		return {name=t,prefab="dyc_door_ruin",item="dyc_door_ruin_item",placerprefab="dyc_door_ruin_item_placer",}
	end
	if t=="limestonedoor" then
		return {name=t,prefab="dyc_door_limestone",item="dyc_door_limestone_item",placerprefab="dyc_door_limestone_item_placer",}
	end
	if t=="moonrockdoor" then
		return {name=t,prefab="dyc_door_moonrock",item="dyc_door_moonrock_item",placerprefab="dyc_door_moonrock_item_placer",}
	end
	if t=="icedoor" then
		return {name=t,prefab="dyc_door_ice",item="dyc_door_ice_item",placerprefab="dyc_door_ice_item_placer",}
	end
	if t=="seadoor" then
		return {name=t,prefab="dyc_door_sea",item="dyc_door_sea_item",placerprefab="dyc_door_sea_item_placer",}
	end
	
	if t=="fence" then
		return {name=t,prefab="dyc_fence",item="dyc_fence_item",placerprefab="dyc_fence_item_placer",userotation=true,}
	end
	if t=="fencegate" then
		return {name=t,prefab="dyc_fence_gate",item="dyc_fence_gate_item",placerprefab="dyc_fence_gate_item_placer",userotation=true,}
	end
end

local Id2Player=SuperWall.Id2Player
local Player2Index=SuperWall.Player2Index
local IsAuthorized=SuperWall.IsAuthorized

local function updatewallphysics (inst)
	if inst.doorstate and inst.components.workable.workleft>0 then
		makeobstacle(inst)
	else 
		clearobstacle(inst)
	end
end

local function quantizeposition(pt)
	local retval = Vector3(math.floor(pt.x)+.5, 0, math.floor(pt.z)+.5)
	return retval
end 

local function ondeploywall(inst, pt, deployer)
	--inst.SoundEmitter:PlaySound("dontstarve/creatures/spider/spider_egg_sack")
	local wall = SpawnPrefab(inst.deployprefab) 
	
	if wall then 
		pt = quantizeposition(pt)
		wall.Physics:SetCollides(false)
		wall.Physics:Teleport(pt.x, 0, pt.z) 
		wall["dycfixedposition"..ransuffix]=wall:GetPosition()
		wall.Physics:SetCollides(true)
		inst.components.stackable:Get():Remove()

		TheWorld.Pathfinder:AddWall(pt.x, 0, pt.z)
		
		wall.dyc_ownerid=deployer.userid
		
		local height=deployer.dycsw_wallbuilderheight or 0  --SuperWall.wallBuilderHeightAdjustment
		wall:SetWallHeight(Clamp(height+4,1,4))
		
	end 		
end

local function onhammered(inst, worker)
	if not inst["dycislastworkvalid"..ransuffix] then
		return
	end

	if inst.loots and type(inst.loots)=="table" then
		for k,v in pairs(inst.loots) do
			for k2=1,v do
				inst.components.lootdropper:SpawnLootPrefab(k)
			end
		end
	elseif inst.loot then
		local num_loots = 1
		for k = 1, num_loots do
			inst.components.lootdropper:SpawnLootPrefab(inst.loot)
		end
	end
		
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
		
	if inst.destroysound then
		inst.SoundEmitter:PlaySound(inst.destroysound)
		-- ???
	end
	
	-- set material ?
	inst:Remove()
end





local function onhealthchange(inst, old_percent, new_percent)
	inst.components.health.currenthealth = inst.components.health.maxhealth
	new_percent=1
	if old_percent <= 0 and new_percent > 0 then makeobstacle(inst) end
	if old_percent > 0 and new_percent <= 0 then clearobstacle(inst) end

	local anim_to_play = getwallanim_dyc(inst)
	if inst.wallpercent==0 then
		inst.AnimState:PlayAnimation(anim_to_play)		
	else
		inst.AnimState:PlayAnimation(anim_to_play.."_hit")		
		inst.AnimState:PushAnimation(anim_to_play, false)
	end
	
end

local function dooritemfn(initfn)

		local inst = CreateEntity()
		inst:AddTag("wallbuilder")
		
		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddNetwork()
		MakeInventoryPhysics(inst)
		
		if initfn~=nil then
			initfn(inst)
		end
		
		inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

		inst:AddComponent("stackable")
		inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM

		inst:AddComponent("inspectable")
		inst:AddComponent("inventoryitem")
		
		inst:AddComponent("deployable")
		inst.components.deployable.ondeploy = ondeploywall
		inst.components.deployable:SetDeployMode(DEPLOYMODE.WALL)
		-- inst.components.deployable.test = test_wall
		-- inst.components.deployable.min_spacing = 0
		-- inst.components.deployable:SetQuantizeFunction(quantizeposition)
		-- inst.components.deployable.deploydistance = 1.5
		
		MakeHauntableLaunch(inst)
		
		return inst
end

local function onhit(inst)
	if inst.destroysound then
		inst.SoundEmitter:PlaySound(inst.destroysound)		
	end
	if inst.wallpercent>inst.components.workable.workleft/inst.iniworkleft then 
		inst.wallpercent=inst.components.workable.workleft/inst.iniworkleft
	end
	if inst.wallpercent<0 then 
		inst.wallpercent=0
	end
	local anim_to_play = getwallanim_dyc(inst)
	if inst.wallpercent==0 then
		inst.AnimState:PlayAnimation(anim_to_play)		
	else
		inst.AnimState:PlayAnimation(anim_to_play.."_hit")		
		inst.AnimState:PushAnimation(anim_to_play, false)
	end
	

end

local function onwork(inst,worker,workleft)
	
	local hashammer=false
	if worker.components.inventory then
		for k,v in pairs(worker.components.inventory.equipslots) do
			if v.components.tool and v.components.tool:CanDoAction(ACTIONS.HAMMER) then
				hashammer=true
				if v.components.finiteuses then
					v.components.finiteuses:Use(-1)
				end
				break
			end
		end
	end
	local authorized=false
	if IsAuthorized(inst,worker) then
		authorized=true
	end
	
	if TUNING.DYC_SUPERWALL_BOSSRES==true then
		if not hashammer or not authorized then
			inst["dycislastworkvalid"..ransuffix]=false
			inst.components.workable.destroyed=false
			inst.components.workable.workleft=inst.workleft
		else
			inst["dycislastworkvalid"..ransuffix]=true
			inst.workleft=inst.workleft-0.25*inst.iniworkleft
			inst.components.workable.workleft=inst.workleft
			onhit(inst)
		end
	else
		if hashammer and not authorized then
			inst["dycislastworkvalid"..ransuffix]=false
			inst.components.workable.destroyed=false
			inst.components.workable.workleft=inst.workleft
		else
			inst["dycislastworkvalid"..ransuffix]=true
			if not hashammer then
				inst.workleft=inst.components.workable.workleft
			else
				inst.workleft=inst.workleft-0.25*inst.iniworkleft
				inst.components.workable.workleft=inst.workleft
			end
			onhit(inst)
		end
	end
	if hashammer and not authorized and worker.components.talker then
		local str=""
		local typestr=""
		if inst.isdoor==true then
			typestr=TUNING.DYC_SUPERWALL_STRINGS.str1
		else
			typestr=TUNING.DYC_SUPERWALL_STRINGS.str0
		end
		local owner=Id2Player(inst.dyc_ownerid)
		if owner~=nil then
			if owner.components.talker then
				owner.components.talker:Say(worker.name..TUNING.DYC_SUPERWALL_STRINGS.str13..typestr..TUNING.DYC_SUPERWALL_STRINGS.str6,4)
			end
			str=TUNING.DYC_SUPERWALL_STRINGS.str3..typestr..TUNING.DYC_SUPERWALL_STRINGS.str5..owner.name..TUNING.DYC_SUPERWALL_STRINGS.str6.."\n"
		end
		
		str=str..TUNING.DYC_SUPERWALL_STRINGS.str12
		worker.components.talker:Say(str,4)
	end
end

local function onattacked(inst,attacker,damage)
	onhit(inst)
	-- print(attacker.name.."attacked"..inst.name.."   damage:"..damage)
	if attacker.components.combat then
		if TUNING.DYC_SUPERWALL_REBOUNDDAMAGE>0 then
			attacker.components.combat:GetAttacked(inst,TUNING.DYC_SUPERWALL_REBOUNDDAMAGE,nil)
		end
		-- if attacker.components.combat.target==inst then
			-- attacker.components.combat.target=nil
		-- end
	end

end

local function getdescription(inst,viewer)
	local olddes=GetDescription(viewer, inst, inst.components.inspectable:GetStatus(viewer))
	if TUNING.DYC_SUPERWALL_OWNERSHIP==0 then
		return olddes
	end
	local ownerid=inst.dyc_ownerid
	local typestr=""
	if inst.isdoor==true then
		typestr=TUNING.DYC_SUPERWALL_STRINGS.str1
	else
		typestr=TUNING.DYC_SUPERWALL_STRINGS.str0
	end
	if ownerid~=nil then
		local owner=Id2Player(ownerid)
		if owner==nil then
			if not IsAuthorized(inst,viewer) then
				return TUNING.DYC_SUPERWALL_STRINGS.str2
			else
				return TUNING.DYC_SUPERWALL_STRINGS.str2.."\n"..TUNING.DYC_SUPERWALL_STRINGS.str14..TUNING.DYC_SUPERWALL_STRINGS.str15
			end
		else
			
			if owner==viewer then
					
				return TUNING.DYC_SUPERWALL_STRINGS.str3..typestr..TUNING.DYC_SUPERWALL_STRINGS.str4.."\n"..olddes
			else
				if not IsAuthorized(inst,viewer) then
					if inst.dyc_lastclickuid~=viewer.userid then
						inst.dyc_clickcount=0
					end
					inst.dyc_lastclickuid=viewer.userid
					if inst.dyc_clickcount==nil then
						inst.dyc_clickcount=1
					else
						inst.dyc_clickcount=inst.dyc_clickcount+1
						if inst.dyc_clickcount>3 then
							inst.dyc_clickcount=0
							if owner.components.talker then
								owner.components.talker:Say(viewer.name..TUNING.DYC_SUPERWALL_STRINGS.str20..typestr..TUNING.DYC_SUPERWALL_STRINGS.str6.."\n"..TUNING.DYC_SUPERWALL_STRINGS.str21..Player2Index(viewer)..TUNING.DYC_SUPERWALL_STRINGS.str22,4)
							end
						end
					end
					return TUNING.DYC_SUPERWALL_STRINGS.str3..typestr..TUNING.DYC_SUPERWALL_STRINGS.str5..owner.name..TUNING.DYC_SUPERWALL_STRINGS.str6
				else
					return TUNING.DYC_SUPERWALL_STRINGS.str3..typestr..TUNING.DYC_SUPERWALL_STRINGS.str5..owner.name..TUNING.DYC_SUPERWALL_STRINGS.str6.."\n"..TUNING.DYC_SUPERWALL_STRINGS.str15.."\n"..olddes
				end
			end
		end
	end
	return olddes
end


local function onsave(inst,data)
	if inst.dyc_ownerid~=nil then
		data.dyc_ownerid=inst.dyc_ownerid
	end
	
end

local function onload(inst,data)
	if data then
		if data.dyc_ownerid~=nil then
			inst.dyc_ownerid=data.dyc_ownerid
		end
		
	end
	if inst.components.workable.workleft<0.25*inst.iniworkleft then
		inst.components.workable.workleft=inst.iniworkleft
	end
	inst.workleft=inst.components.workable.workleft
	inst.wallpercent=inst.components.workable.workleft/inst.iniworkleft
	inst.AnimState:PlayAnimation(getwallanim_dyc(inst))
	updatewallphysics(inst)
end

local function onremoveentity(inst)
	clearobstacle(inst)
	OnIsPathFindingDirty(inst)
	if inst.doortask then
		inst.doortask:Cancel()
	end
	if inst.doortask2 then
		inst.doortask2:Cancel()
	end
	if inst["dyccheckpostask"..ransuffix] then
		inst["dyccheckpostask"..ransuffix]:Cancel()
	end
end


local function update_door (inst)
	
	local opendoor = false
	local instpos = Vector3(inst.Transform:GetWorldPosition())
	for k,v in pairs(AllPlayers) do
		local playerpos = Vector3(v.Transform:GetWorldPosition())
		local distance = playerpos:Dist(instpos)
		-- print(distance)
		if distance<TUNING.DYC_SUPERWALL_DOORDETECTRANGE and IsAuthorized(inst,v) then
			opendoor=true
			break
		end
	end
	if  TUNING.DYC_SUPERWALL_COMPANION==true and TheWorld.dyc_superwall_companions~=nil then
		for k,v in pairs(TheWorld.dyc_superwall_companions) do
			if not v:IsValid() then
				table.remove(TheWorld.dyc_superwall_companions,k)
			else
				if v.components.follower and v.components.follower.leader and v.components.follower.leader.components.inventoryitem and v.components.follower.leader.components.inventoryitem.owner then
					local owner=v.components.follower.leader.components.inventoryitem.owner
					if IsAuthorized(inst,owner) then
						local pos = Vector3(v.Transform:GetWorldPosition())
						local distance = pos:Dist(instpos)
						if distance<TUNING.DYC_SUPERWALL_DOORDETECTRANGE then
							opendoor=true
							break
						end
					else
						if owner.components.container and owner.components.inventoryitem then
							--backpack
							local owner2=owner.components.inventoryitem.owner
							if owner2 and IsAuthorized(inst,owner2) then
								local pos = Vector3(v.Transform:GetWorldPosition())
								local distance = pos:Dist(instpos)
								if distance<TUNING.DYC_SUPERWALL_DOORDETECTRANGE then
									opendoor=true
									break
								end
							end
						end
					end
				elseif v.components.follower and v.components.follower.leader and v.components.follower.leader:HasTag("player") then
					local owner=v.components.follower.leader
					if IsAuthorized(inst,owner) then
						local pos = Vector3(v.Transform:GetWorldPosition())
						local distance = pos:Dist(instpos)
						if distance<TUNING.DYC_SUPERWALL_DOORDETECTRANGE then
							opendoor=true
							break
						end
					end
				end
			end
		end
	end
	
	if opendoor then
		inst.doorchanging=-1
	else
		inst.doorchanging=1
	end
	
end

local function update_door2 (inst)
	if inst.doorchanging<0 and inst.wallpercent>0 then
		inst.wallpercent = inst.wallpercent-0.25
		if inst.wallpercent<=0 then
			inst.wallpercent=0
			inst.doorstate=false
			updatewallphysics(inst)
		end
		inst.AnimState:PlayAnimation(getwallanim_dyc(inst))
	elseif inst.doorchanging>0 and inst.wallpercent<inst.components.workable.workleft/inst.iniworkleft then
		inst.wallpercent = inst.wallpercent+0.25
		if inst.wallpercent>=inst.components.workable.workleft/inst.iniworkleft then
			inst.wallpercent=inst.components.workable.workleft/inst.iniworkleft
			inst.doorstate=true
			updatewallphysics(inst)
		end
		inst.AnimState:PlayAnimation(getwallanim_dyc(inst))
	end
end

local function doorfn (initfn) 
		local inst = CreateEntity()
		local trans = inst.entity:AddTransform()
		
		
		inst.doorstate=true
		inst.doorchanging=1
		inst.wallpercent=1
		inst.iniworkleft=4
		inst.workleft=inst.iniworkleft
		inst["dycislastworkvalid"..ransuffix]=false
		inst.isdoor=true
		
		inst.entity:AddAnimState()
		inst.entity:AddSoundEmitter()
		inst.entity:AddNetwork()
		if TUNING.DYC_SUPERWALL_MINIMAPICON then
			inst.entity:AddMiniMapEntity()
			inst.MiniMapEntity:SetPriority(-1)
		end
		
		trans:SetEightFaced()
		
		--trans:SetScale(1.3,1.3,1.3)
		inst:AddTag("superwall")
		inst:AddTag("wall")
		inst:AddTag("noauradamage")
		inst:AddTag("floodblocker")
		MakeObstaclePhysics(inst, .5)    
		inst.Physics:SetDontRemoveOnSleep(true)
		
		initfn(inst)
		
		MakeSnowCoveredPristine(inst)
		
		inst._pfpos = nil
        inst._ispathfinding = net_bool(inst.GUID, "_ispathfinding", "onispathfindingdirty")
        makeobstacle(inst)
        
        inst:DoTaskInTime(0, InitializePathFinding)

        
	    inst.OnRemoveEntity = onremoveentity
		
		

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end
		
		inst:DoTaskInTime(FRAMES,function() 
			local x,y,z=inst:GetPosition():Get()
			if x==0 and y==0 and z==0 and inst.dyc_ownerid==nil then
				inst:Remove()
			end
		end)
		
		inst.OnSave = onsave
		inst.OnLoad = onload
		inst.doortask = inst:DoPeriodicTask(0.25, function() update_door(inst) end)
		inst.doortask2 = inst:DoPeriodicTask(2*FRAMES, function() update_door2(inst) end)
		inst["dyccheckpostask"..ransuffix] = inst:DoPeriodicTask(1.0, function() 
			local fixedpos=inst["dycfixedposition"..ransuffix]
			local pos=inst:GetPosition()
			if fixedpos==nil then 
				inst["dycfixedposition"..ransuffix]=pos	
			end
			if fixedpos and (fixedpos.x~=pos.x or fixedpos.y~=pos.y or fixedpos.z~=pos.z) then
				-- print("SuperWall: Brutal teleport detected!")
				inst.Physics:Teleport(fixedpos.x,fixedpos.y,fixedpos.z)
			end
		end)
		local OldRemove=inst.Remove
		inst.Remove=function(self)
			if not self["dycislastworkvalid"..ransuffix] then
				-- print("SuperWall: Brutal removal detected!")
				-- return
			end
			OldRemove(self)
		end
		
		function inst:SetWallHeight(height)
			self.wallpercent=height/4
			self.AnimState:PlayAnimation(getwallanim_dyc(self))
			self.components.workable.workleft=math.floor(self.wallpercent*self.iniworkleft)
			self.workleft=self.components.workable.workleft
		end
		
		function inst:GetWallHeight()
			return self.workleft
		end
		
		function inst:DYCDestroyWall()
			self["dycislastworkvalid"..ransuffix]=true
			self.components.workable.onfinish(self,self)
		end
		
		inst:AddComponent("inspectable")
		inst.components.inspectable.descriptionfn=getdescription
		inst:AddComponent("lootdropper")
		
		inst:AddComponent("combat")
		inst.components.combat.onhitfn = onattacked
		
		inst:AddComponent("health")
		inst.components.health:SetMaxHealth(1000)
		inst.components.health.currenthealth = 1000
		inst.components.health.ondelta = onhealthchange
		inst.components.health.nofadeout = true
		inst.components.health.canheal = false
		-- inst.components.health:SetAbsorptionAmount(1)
        -- inst.components.health:SetAbsorptionAmountFromPlayer(1)
        -- inst.components.health.fire_damage_scale = 0

		inst:AddComponent("workable")
		inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
		inst.components.workable:SetWorkLeft(inst.iniworkleft)
		inst.components.workable:SetOnFinishCallback(onhammered)
		inst.components.workable:SetOnWorkCallback(onwork) 	
		inst.components.workable.savestate=true

		MakeHauntableWork(inst)
		MakeSnowCovered(inst)
		
		return inst
end

local function wooddooritem (initfn2) 
	local inst = dooritemfn(function (inst) 
		inst.deployprefab="dyc_door_wood"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("wall_wood")
		inst.AnimState:PlayAnimation("idle")
		if initfn2 then
			initfn2(inst)
		end
	end)

	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages/wooddoor.xml"
	inst.components.inventoryitem.imagename = "wooddoor"
	-- inst.components.deployable.placer = "dyc_door_wood_placer"
	
	return inst
end

local function wooddooritem2 ()
	local inst = wooddooritem()
	return inst
end

local function wooddoor () 
	local inst = doorfn(function (inst) 
		inst.loot="log"
		inst.buildsound="dontstarve/common/place_structure_wood"
		inst.destroysound="dontstarve/common/destroy_wood"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("wall_wood")
		inst.AnimState:PlayAnimation("fullA", false)
		inst.SoundEmitter:PlaySound(inst.buildsound)
		inst:AddTag("wood")
		if inst.MiniMapEntity then
			inst.MiniMapEntity:SetIcon( "minimap_wall_wood.tex" )
		end
	end)

	return inst
end

local function haydooritem (initfn2) 
	local inst = dooritemfn(function (inst) 
		inst.deployprefab="dyc_door_hay"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("wall_hay")
		inst.AnimState:PlayAnimation("idle")
		if initfn2 then
			initfn2(inst)
		end
	end)

	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages/haydoor.xml"
	inst.components.inventoryitem.imagename = "haydoor"
	-- inst.components.deployable.placer = "dyc_door_hay_placer"
	
	return inst
end

local function haydooritem2 ()
	local inst = haydooritem()
	return inst
end

local function haydoor () 
	local inst = doorfn(function (inst) 
		inst.loot="cutgrass"
		inst.buildsound="dontstarve/common/place_structure_straw"
		inst.destroysound="dontstarve/common/destroy_straw"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("wall_hay")
		inst.AnimState:PlayAnimation("fullA", false)
		inst.SoundEmitter:PlaySound(inst.buildsound)
		inst:AddTag("grass")
		if inst.MiniMapEntity then
			inst.MiniMapEntity:SetIcon( "minimap_wall_hay.tex" )
		end
	end)

	return inst
end

local function stonedooritem (initfn2) 
	local inst = dooritemfn(function (inst) 
		inst.deployprefab="dyc_door_stone"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("wall_stone")
		inst.AnimState:PlayAnimation("idle")
		if initfn2 then
			initfn2(inst)
		end
	end)

	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages/stonedoor.xml"
	inst.components.inventoryitem.imagename = "stonedoor"
	-- inst.components.deployable.placer = "dyc_door_stone_placer"
	
	return inst
end

local function stonedooritem2 ()
	local inst = stonedooritem()
	return inst
end

local function stonedoor () 
	local inst = doorfn(function (inst) 
		inst.loot="rocks"
		inst.buildsound="dontstarve/common/place_structure_stone"
		inst.destroysound="dontstarve/common/destroy_stone"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("wall_stone")
		inst.AnimState:PlayAnimation("fullA", false)
		inst.SoundEmitter:PlaySound(inst.buildsound)
		inst:AddTag("stone")
		if inst.MiniMapEntity then
			inst.MiniMapEntity:SetIcon( "minimap_wall_stone.tex" )
		end
	end)

	return inst
end

local function ruindooritem (initfn2) 
	local inst = dooritemfn(function (inst) 
		inst.deployprefab="dyc_door_ruin"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("wall_ruins")
		inst.AnimState:PlayAnimation("idle")
		if initfn2 then
			initfn2(inst)
		end
	end)

	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages/ruindoor.xml"
	inst.components.inventoryitem.imagename = "ruindoor"
	-- inst.components.deployable.placer = "dyc_door_ruin_placer"
	
	return inst
end

local function ruindooritem2 ()
	local inst = ruindooritem()
	return inst
end

local function ruindoor () 
	local inst = doorfn(function (inst) 
		inst.loot="thulecite_pieces"
		inst.buildsound="dontstarve/common/place_structure_stone"
		inst.destroysound="dontstarve/common/destroy_stone"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("wall_ruins")
		inst.AnimState:PlayAnimation("fullA", false)
		inst.SoundEmitter:PlaySound(inst.buildsound)
		inst:AddTag("stone")
		inst:AddTag("ruins")
		if inst.MiniMapEntity then
			inst.MiniMapEntity:SetIcon( "minimap_wall_ruins.tex" )
		end
	end)

	return inst
end

local function limestonedooritem (initfn2) 
	local inst = dooritemfn(function (inst) 
		inst.deployprefab="dyc_door_limestone"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("dyc_wall_limestone")
		inst.AnimState:PlayAnimation("idle")
		if initfn2 then
			initfn2(inst)
		end
	end)

	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages/limestonedoor.xml"
	inst.components.inventoryitem.imagename = "limestonedoor"
	-- inst.components.deployable.placer = "dyc_door_limestone_placer"
	
	return inst
end

local function limestonedooritem2 ()
	local inst = limestonedooritem()
	return inst
end

local function limestonedoor () 
	local inst = doorfn(function (inst) 
		inst.loot="rocks"
		inst.buildsound="dontstarve/common/place_structure_stone"
		inst.destroysound="dontstarve/common/destroy_stone"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("dyc_wall_limestone")
		inst.AnimState:PlayAnimation("fullA", false)
		inst.SoundEmitter:PlaySound(inst.buildsound)
		inst:AddTag("stone")
		if inst.MiniMapEntity then
			inst.MiniMapEntity:SetIcon( "minimap_wall_limestone.tex" )
		end
	end)

	return inst
end

local function moonrockdooritem (initfn2) 
	local inst = dooritemfn(function (inst) 
		inst.deployprefab="dyc_door_moonrock"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("wall_moonrock")
		inst.AnimState:PlayAnimation("idle")
		if initfn2 then
			initfn2(inst)
		end
	end)

	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages/moonrockdoor.xml"
	inst.components.inventoryitem.imagename = "moonrockdoor"
	-- inst.components.deployable.placer = "dyc_door_limestone_placer"
	
	return inst
end

local function moonrockdooritem2 ()
	local inst = moonrockdooritem()
	return inst
end

local function moonrockdoor () 
	local inst = doorfn(function (inst) 
		inst.loot="moonrocknugget"
		inst.buildsound="dontstarve/common/place_structure_stone"
		inst.destroysound="dontstarve/common/destroy_stone"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("wall_moonrock")
		inst.AnimState:PlayAnimation("fullA", false)
		inst.SoundEmitter:PlaySound(inst.buildsound)
		inst:AddTag("stone")
		inst:AddTag("moonrock")
		if inst.MiniMapEntity then
			inst.MiniMapEntity:SetIcon( "minimap_wall_moonrock.tex" )
		end
	end)

	return inst
end

local function icedooritem (initfn2) 
	local inst = dooritemfn(function (inst) 
		inst.deployprefab="dyc_door_ice"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("dyc_wall_ice")
		inst.AnimState:PlayAnimation("idle")
		if initfn2 then
			initfn2(inst)
		end
	end)

	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages/icedoor.xml"
	inst.components.inventoryitem.imagename = "icedoor"
	-- inst.components.deployable.placer = "dyc_door_limestone_placer"
	
	return inst
end

local function icedooritem2 ()
	local inst = icedooritem()
	return inst
end

local function icedoor () 
	local inst = doorfn(function (inst) 
		inst.loot="ice"
		inst.buildsound="dontstarve/common/place_structure_stone"
		inst.destroysound="dontstarve/common/destroy_stone"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("dyc_wall_ice")
		inst.AnimState:PlayAnimation("fullA", false)
		inst.SoundEmitter:PlaySound(inst.buildsound)
		inst:AddTag("ice")
		if inst.MiniMapEntity then
			inst.MiniMapEntity:SetIcon( "minimap_wall_ice.tex" )
		end
	end)

	return inst
end

local function seadooritem (initfn2) 
	local inst = dooritemfn(function (inst) 
		inst.deployprefab="dyc_door_sea"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("dyc_wall_sea")
		inst.AnimState:PlayAnimation("idle")
		if initfn2 then
			initfn2(inst)
		end
	end)

	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages/seadoor.xml"
	inst.components.inventoryitem.imagename = "seadoor"
	-- inst.components.deployable.placer = "dyc_door_limestone_placer"
	
	return inst
end

local function seadooritem2 ()
	local inst = seadooritem()
	return inst
end

local function seadoor () 
	local inst = doorfn(function (inst) 
		inst.loots={cutreeds=1,rocks=1}
		inst.buildsound="dontstarve/common/place_structure_stone"
		inst.destroysound="dontstarve/common/destroy_stone"
		inst.AnimState:SetBank("wall")
		inst.AnimState:SetBuild("dyc_wall_sea")
		inst.AnimState:PlayAnimation("fullA", false)
		inst.SoundEmitter:PlaySound(inst.buildsound)
		inst:AddTag("stone")
		if inst.MiniMapEntity then
			inst.MiniMapEntity:SetIcon( "minimap_wall_sea.tex" )
		end
	end)

	return inst
end



-- ===============================walls=====================================================
local function woodwallitem () 
	local inst = wooddooritem(function (inst) 
		inst.deployprefab="dyc_wall_wood"
		
	end)

	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages.xml"
	inst.components.inventoryitem.imagename = "wall_wood_item"
	
	return inst
end

local function woodwall () 
	local inst = wooddoor()
	inst.isdoor=false
	if not TheWorld.ismastersim then
        return inst
    end
	inst.doortask:Cancel()
	inst.doortask2:Cancel()
	return inst
end

local function haywallitem () 
	local inst = haydooritem(function (inst) 
		inst.deployprefab="dyc_wall_hay"
		
	end)
	
	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages.xml"
	inst.components.inventoryitem.imagename = "wall_hay_item"
	
	return inst
end

local function haywall () 
	local inst = haydoor()
	inst.isdoor=false
	if not TheWorld.ismastersim then
        return inst
    end
	inst.doortask:Cancel()
	inst.doortask2:Cancel()
	return inst
end

local function stonewallitem () 
	local inst = stonedooritem(function (inst) 
		inst.deployprefab="dyc_wall_stone"
		
	end)
	
	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages.xml"
	inst.components.inventoryitem.imagename = "wall_stone_item"
	
	return inst
end

local function stonewall () 
	local inst = stonedoor()
	inst.isdoor=false
	if not TheWorld.ismastersim then
        return inst
    end
	inst.doortask:Cancel()
	inst.doortask2:Cancel()
	return inst
end

local function ruinwallitem () 
	local inst = ruindooritem(function (inst) 
		inst.deployprefab="dyc_wall_ruin"
		
	end)
	
	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages.xml"
	inst.components.inventoryitem.imagename = "wall_ruins_item"
	
	return inst
end

local function ruinwall () 
	local inst = ruindoor()
	inst.isdoor=false
	if not TheWorld.ismastersim then
        return inst
    end
	inst.doortask:Cancel()
	inst.doortask2:Cancel()
	return inst
end

local function limestonewallitem () 
	local inst = limestonedooritem(function (inst) 
		inst.deployprefab="dyc_wall_limestone"
		
	end)

	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages/limestonewall.xml"
	inst.components.inventoryitem.imagename = "limestonewall"
	
	return inst
end

local function limestonewall () 
	local inst = limestonedoor()
	inst.isdoor=false
	if not TheWorld.ismastersim then
        return inst
    end
	inst.doortask:Cancel()
	inst.doortask2:Cancel()
	return inst
end

local function moonrockwallitem () 
	local inst = moonrockdooritem(function (inst) 
		inst.deployprefab="dyc_wall_moonrock"
		
	end)

	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages.xml"
	inst.components.inventoryitem.imagename = "wall_moonrock_item"
	
	return inst
end

local function moonrockwall () 
	local inst = moonrockdoor()
	inst.isdoor=false
	if not TheWorld.ismastersim then
        return inst
    end
	inst.doortask:Cancel()
	inst.doortask2:Cancel()
	return inst
end

local function icewallitem () 
	local inst = icedooritem(function (inst) 
		inst.deployprefab="dyc_wall_ice"
		
	end)

	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages/icewall.xml"
	inst.components.inventoryitem.imagename = "icewall"
	
	return inst
end

local function icewall () 
	local inst = icedoor()
	inst.isdoor=false
	if not TheWorld.ismastersim then
        return inst
    end
	inst.doortask:Cancel()
	inst.doortask2:Cancel()
	return inst
end

local function seawallitem () 
	local inst = seadooritem(function (inst) 
		inst.deployprefab="dyc_wall_sea"
		
	end)

	if not TheWorld.ismastersim then
        return inst
    end
	inst.components.inventoryitem.atlasname = "images/inventoryimages/seawall.xml"
	inst.components.inventoryitem.imagename = "seawall"
	
	return inst
end

local function seawall () 
	local inst = seadoor()
	inst.isdoor=false
	if not TheWorld.ismastersim then
        return inst
    end
	inst.doortask:Cancel()
	inst.doortask2:Cancel()
	return inst
end



local function placersetheight(inst,height) 
	inst.wallpercent=height/4
	if inst.ChangeWallColor then
		inst:ChangeWallColor()
	else
		inst.AnimState:PlayAnimation(getwallanim_dyc(inst))
	end
end

local function getitemcounts(player)
	local counts={}
	local wallset=TUNING.DYC_SUPERWALL_WALLSETS[SuperWall.wallBuilderIndex]

	local inventory=player.replica.inventory
	
	if player and inventory and wallset then
		if wallset.smartbuilder and wallset.smartbuilder.walltype then
			local wallprefabs=GetWallPrefabs(wallset.smartbuilder.walltype)
			counts[wallprefabs.item]={}
			counts[wallprefabs.item].count=1
			counts[wallprefabs.item].name=wallprefabs.name
			if wallset.smartbuilder.walltype2 then
				local wallprefabs2=GetWallPrefabs(wallset.smartbuilder.walltype2)
				if counts[wallprefabs2.item]==nil then
					counts[wallprefabs2.item]={}
				end
				if counts[wallprefabs2.item].count==nil then
					counts[wallprefabs2.item].count=0
				end
				counts[wallprefabs2.item].name=wallprefabs2.name
			end
		else
			for k,v in pairs(wallset) do 
				if type(v)=="table" and v.walltype then
					local wallprefabs=GetWallPrefabs(v.walltype)
					if wallprefabs and wallprefabs.item then
						if counts[wallprefabs.item]==nil then
							counts[wallprefabs.item]={}
						end
						if counts[wallprefabs.item].count==nil then
							counts[wallprefabs.item].count=1
						else
							counts[wallprefabs.item].count=counts[wallprefabs.item].count+1
						end
						if counts[wallprefabs.item].count2==nil then
							counts[wallprefabs.item].count2=0
						end
						if counts[wallprefabs.item].name==nil then
							counts[wallprefabs.item].name=wallprefabs.name
						end
					end
					
				end
			end
		end
		
		for k,v in pairs(counts) do
			local hasitem,num=inventory:Has(k,v.count)
			v.count2=num
		end
		
		return counts
	end
	return counts
end

local function hasenoughitems(counts)
	for k,v in pairs(counts) do
		
		if v.count2<v.count then
			return false
		end
	end
	return true
end

local function rotateoffset (offset,rotation)
	if rotation==1 then
		offset=Vector3(offset.z,offset.y,-offset.x)
	elseif rotation==2 then
		offset=Vector3(-offset.x,offset.y,-offset.z)
	elseif rotation==3 then
		offset=Vector3(-offset.z,offset.y,offset.x)
	end
	return offset
end

local function getclosestsuperwall (pt,size)
	local radius=math.sqrt(size.x*size.x+size.y*size.y)+1
	local ents = TheSim:FindEntities(pt.x, pt.y, pt.z, radius)
	local wall=nil
	local dis=99999
	for k,v in pairs(ents) do
		if v:HasTag("superwall") and v:IsValid() then
			local disx=math.abs(v:GetPosition().x-pt.x)
			local disz=math.abs(v:GetPosition().z-pt.z)
			if disx<dis and disx<size.x/2+1.01 and disz<0.01 then
				dis=disx
				wall=v
			elseif disx<0.01 and disz<dis and disz<size.y/2+1.01 then
				dis=disz
				wall=v
			end
		end		
	end
	if dis>0.99 then
		return wall
	end
	return nil
end

local function updateplacers(inst, specialwallsetindexpassed)
	local mode="build"
	inst.wallbuildermode=mode
	
	inst.lastpos=quantizeposition(inst:GetPosition())
	if inst.dycswchildplacers==nil then
		inst.dycswchildplacers={}
	end
	for k,v in pairs(inst.dycswchildplacers) do
		
		v:Remove()
	end
	inst.dycswchildplacers={}
	local wallset=TUNING.DYC_SUPERWALL_WALLSETS[SuperWall.wallBuilderIndex]
	if wallset==nil then 
		print("SuperWall: Failed to load wall set.")
		return
	end
	
	local counts=nil
	local enough=true
	
	if specialwallsetindexpassed and TUNING.DYC_SUPERWALL_SPECIALWALLSETS[specialwallsetindexpassed] then
		wallset=TUNING.DYC_SUPERWALL_SPECIALWALLSETS[specialwallsetindexpassed]
	end
	
	if wallset.destroyer then
		mode="destroy"
		inst.wallbuildermode=mode
		local childplacer=inst:SpawnChild("dyc_wallbuilderitem_placersquare")
		childplacer.AnimState:SetMultColour(1,0,0,0.5)
		local offset=wallset.destroyer.offset or Vector3(0,0,0)
		local size=wallset.destroyer.size or {x=3,y=3,}
		if SuperWall.wallBuilderRotation==1 or SuperWall.wallBuilderRotation==3 then
			size={x=size.y,y=size.x,}
		end
		offset=rotateoffset(offset,SuperWall.wallBuilderRotation)
		childplacer.Transform:SetPosition(offset.x,offset.y,offset.z)
		childplacer.Transform:SetScale(math.sqrt(size.x*3),1,size.y*3)
		if size.x>=7 or size.y>=7 then
			childplacer:SetSquare2()
		end
		table.insert(inst.dycswchildplacers,childplacer)
	elseif wallset.heightbrush then
		mode="height"
		inst.wallbuildermode=mode
		local delta=wallset.heightbrush.delta or 1
		local childplacer=inst:SpawnChild("dyc_wallbuilderitem_placersquare")
		if delta>0 then
			childplacer.AnimState:SetMultColour(0,1,0,0.5)
		else
			childplacer.AnimState:SetMultColour(0,0,1,0.5)
		end
		local offset=wallset.heightbrush.offset or Vector3(0,0,0)
		local size=wallset.heightbrush.size or {x=3,y=3,}
		if SuperWall.wallBuilderRotation==1 or SuperWall.wallBuilderRotation==3 then
			size={x=size.y,y=size.x,}
		end
		offset=rotateoffset(offset,SuperWall.wallBuilderRotation)
		childplacer.Transform:SetPosition(offset.x,offset.y,offset.z)
		childplacer.Transform:SetScale(math.sqrt(size.x*3),1,size.y*3)
		if size.x>=7 or size.y>=7 then
			childplacer:SetSquare2()
		end
		table.insert(inst.dycswchildplacers,childplacer)
	elseif wallset.smartbuilder and wallset.smartbuilder.walltype and GetWallPrefabs(wallset.smartbuilder.walltype) then
		mode="smart"
		inst.wallbuildermode=mode
		local wallprefabs=GetWallPrefabs(wallset.smartbuilder.walltype)
		local wallprefabs2=wallset.smartbuilder.walltype2~=nil and GetWallPrefabs(wallset.smartbuilder.walltype2)
		local childplacer=inst:SpawnChild("dyc_wallbuilderitem_placersquare")
		childplacer.AnimState:SetMultColour(1,1,1,0.3)
		childplacer.AnimState:SetLightOverride(0.5)
		local offset=wallset.smartbuilder.offset or Vector3(0,0,0)
		local size=wallset.smartbuilder.size or {x=3,y=3,}
		if SuperWall.wallBuilderRotation==1 or SuperWall.wallBuilderRotation==3 then
			size={x=size.y,y=size.x,}
		end
		offset=rotateoffset(offset,SuperWall.wallBuilderRotation)
		childplacer.Transform:SetPosition(offset.x,offset.y,offset.z)
		childplacer.Transform:SetScale(math.sqrt(size.x*3),1,size.y*3)
		if size.x>=7 or size.y>=7 then
			childplacer:SetSquare2()
		end
		table.insert(inst.dycswchildplacers,childplacer)
		childplacer=inst:SpawnChild(wallprefabs.placerprefab)
		childplacer.dyc_noplacerpostinit=true
		if childplacer.components.placer then
			childplacer:RemoveComponent("placer")
		end
		childplacer.Transform:SetPosition(offset.x,offset.y,offset.z)
		local firstplacer=childplacer
		local newrotationtobepassed=nil
		if wallprefabs.userotation and childplacer.FixUpFenceOrientation then
			local tempx,tempy,tempz = childplacer.Transform:GetWorldPosition()
			local tempents= TheSim:FindEntities(tempx,0,tempz, 1.5, {"wall"})
			if tempents and tempents[1]==nil and TheCamera and TheCamera.headingtarget then
				local temprot=TheCamera.headingtarget
				if math.abs((temprot+45)%90)<1 or math.abs((temprot+45)%90-90)<1 then
					childplacer:FixUpFenceOrientation(temprot+90)
				else
					childplacer:FixUpFenceOrientation(temprot)
				end
			else
				childplacer:FixUpFenceOrientation(nil)
			end
			inst.rotationtobepassed=childplacer.Transform:GetRotation()
		end
		local height=wallset.smartbuilder.height or 4
		height=Clamp(height+SuperWall.wallBuilderHeightAdjustment,1,4)
		placersetheight(childplacer,height)
		if childplacer.wallcolor and childplacer.GetAnimState then
			childplacer:GetAnimState():SetMultColour(childplacer.wallcolor.r,childplacer.wallcolor.g,childplacer.wallcolor.b,0.5)
		else
			childplacer.AnimState:SetMultColour(1,1,1,0.5)
		end
		table.insert(inst.dycswchildplacers,childplacer)
		local newpt=inst:GetPosition()+offset
		local closestsuperwall=getclosestsuperwall(newpt,size)
		if closestsuperwall then
			local offsetx=closestsuperwall:GetPosition().x-newpt.x
			local offsetz=closestsuperwall:GetPosition().z-newpt.z
			local disx=math.abs(offsetx)
			local disz=math.abs(offsetz)
			if wallprefabs2 then
				height=wallset.smartbuilder.height2 or wallset.smartbuilder.height or 4
				height=Clamp(height+SuperWall.wallBuilderHeightAdjustment,1,4)
				wallprefabs=wallprefabs2
			end
			if disx<0.01 and disz>1.99 then
				local wallnum=Round(disz-1)
				counts=getitemcounts(ThePlayer)
				counts[wallprefabs.item].count=counts[wallprefabs.item].count+wallnum
				enough=hasenoughitems(counts)
				for i=1,wallnum do
					
					childplacer=inst:SpawnChild(wallprefabs.placerprefab)
					childplacer.dyc_noplacerpostinit=true
					if childplacer.components.placer then
						childplacer:RemoveComponent("placer")
					end
					if offsetz>0 then
						childplacer.Transform:SetPosition(offset.x,offset.y,offset.z+i)
					else
						childplacer.Transform:SetPosition(offset.x,offset.y,offset.z-i)
					end
					if wallprefabs.userotation and childplacer.FixUpFenceOrientation then
						childplacer:FixUpFenceOrientation(0)
					end
					placersetheight(childplacer,height)
					if childplacer.wallcolor and childplacer.GetAnimState then
						childplacer:GetAnimState():SetMultColour(childplacer.wallcolor.r,childplacer.wallcolor.g,childplacer.wallcolor.b,0.5)
					else
						childplacer.AnimState:SetMultColour(1,1,1,0.5)
					end
					table.insert(inst.dycswchildplacers,childplacer)
					newrotationtobepassed=0
				end
			elseif disz<0.01 and disx>1.99 then
				local wallnum=Round(disx-1)
				counts=getitemcounts(ThePlayer)
				counts[wallprefabs.item].count=counts[wallprefabs.item].count+wallnum
				enough=hasenoughitems(counts)
				for i=1,wallnum do
					
					childplacer=inst:SpawnChild(wallprefabs.placerprefab)
					childplacer.dyc_noplacerpostinit=true
					if childplacer.components.placer then
						childplacer:RemoveComponent("placer")
					end
					if offsetx>0 then
						childplacer.Transform:SetPosition(offset.x+i,offset.y,offset.z)
					else
						childplacer.Transform:SetPosition(offset.x-i,offset.y,offset.z)
					end
					if wallprefabs.userotation and childplacer.FixUpFenceOrientation then
						childplacer:FixUpFenceOrientation(90)
					end
					placersetheight(childplacer,height)
					if childplacer.wallcolor and childplacer.GetAnimState then
						childplacer:GetAnimState():SetMultColour(childplacer.wallcolor.r,childplacer.wallcolor.g,childplacer.wallcolor.b,0.5)
					else
						childplacer.AnimState:SetMultColour(1,1,1,0.5)
					end
					table.insert(inst.dycswchildplacers,childplacer)
					newrotationtobepassed=90
				end
			else
				counts=getitemcounts(ThePlayer)
				enough=hasenoughitems(counts)
			end
		else
			counts=getitemcounts(ThePlayer)
			enough=hasenoughitems(counts)
		end
		
		if newrotationtobepassed and newrotationtobepassed~=inst.rotationtobepassed and firstplacer and firstplacer.FixUpFenceOrientation then
			inst.rotationtobepassed=newrotationtobepassed
			firstplacer:FixUpFenceOrientation(newrotationtobepassed)
		end
		
	else
		counts=getitemcounts(ThePlayer)
		enough=hasenoughitems(counts)
		for k,v in pairs(wallset) do
			if type(v)=="table" and v.walltype then
				local wallprefabs=GetWallPrefabs(v.walltype)
				if wallprefabs then
					local childplacer=inst:SpawnChild(wallprefabs.placerprefab)
					childplacer.dyc_noplacerpostinit=true
					if childplacer.components.placer then
						childplacer:RemoveComponent("placer")
					end
					if v.offset then
						local offset=v.offset
						if wallset.pivot then
							offset=offset-wallset.pivot
						end
						offset=rotateoffset(offset,SuperWall.wallBuilderRotation)
						childplacer.Transform:SetPosition(offset.x,offset.y,offset.z)
					end
					if wallprefabs.userotation and childplacer.FixUpFenceOrientation then
						local rotation = v.rotation or 0
						rotation = rotation + SuperWall.wallBuilderRotation*90
						childplacer:FixUpFenceOrientation(rotation,v.isswingright)
					end
					local height=v.height or 4
					placersetheight(childplacer,Clamp(height+SuperWall.wallBuilderHeightAdjustment,1,4))
					if childplacer.wallcolor and childplacer.GetAnimState then
						childplacer:GetAnimState():SetMultColour(childplacer.wallcolor.r,childplacer.wallcolor.g,childplacer.wallcolor.b,0.5)
					else
						childplacer.AnimState:SetMultColour(1,1,1,0.5)
					end
					table.insert(inst.dycswchildplacers,childplacer)
				end
			end
		end
	end
	
	local name=wallset.name or "???"
	if wallset.names and SuperWall.R2L[TUNING.DYC_SUPERWALL_LANGUAGE] and wallset.names[SuperWall.R2L[TUNING.DYC_SUPERWALL_LANGUAGE]] then
		name=wallset.names[SuperWall.R2L[TUNING.DYC_SUPERWALL_LANGUAGE]]
	end
	if name then
		if TUNING.DYC_SUPERWALL_WALLSETNOCONSUMPTION==true then
			inst.Label:SetColour(1, 1, 1)
		else
			if enough then
				inst.Label:SetColour(0.5, 1, 0.5)
			else
				inst.Label:SetColour(1, 0.1, 0.1)
			end
		end
		local str=TUNING.DYC_SUPERWALL_STRINGS.fastbuild.."\n"
		str=str..SuperWall.wallBuilderIndex.."/"..#TUNING.DYC_SUPERWALL_WALLSETS.."   "..name
		str=str.."   ("..TUNING.DYC_SUPERWALL_STRINGS.rotation..":"..string.format("%d",SuperWall.wallBuilderRotation*90)..TUNING.DYC_SUPERWALL_STRINGS.degrees..")"
		
		if (mode=="build" or mode=="smart") then
			local heightadjustmentsign=(SuperWall.wallBuilderHeightAdjustment>0 and "+") or ""
			str=str.."   ("..TUNING.DYC_SUPERWALL_STRINGS.heightadjustment..":"..heightadjustmentsign..SuperWall.wallBuilderHeightAdjustment..")"
			if enough then
				str=str.."   "..TUNING.DYC_SUPERWALL_STRINGS.readytobuild
			else
				str=str.."   "..TUNING.DYC_SUPERWALL_STRINGS.insufficientwallitem
			end
			str=str.."\n"..TUNING.DYC_SUPERWALL_STRINGS.requiredmaterials
			for k,v in pairs(counts) do
				
				if TUNING.DYC_SUPERWALL_STRINGS[v.name] then
					str=str..TUNING.DYC_SUPERWALL_STRINGS[v.name].name.."("..v.count2.."/"..v.count..") "
					
				end
			end
		end
		
		local description=wallset.description or nil
		if wallset.descriptions and SuperWall.R2L[TUNING.DYC_SUPERWALL_LANGUAGE] and wallset.descriptions[SuperWall.R2L[TUNING.DYC_SUPERWALL_LANGUAGE]] then
			description=wallset.descriptions[SuperWall.R2L[TUNING.DYC_SUPERWALL_LANGUAGE]]
		end
		if description then
			str=str.."\n"..description
		end
		
		str=str.."\n  \n  \n  \n  \n  \n  \n  \n  \n  "
		inst.Label:SetText(str)
	end
end

local function finditemininventory(inst,itemtype)
	local inventory=inst.components.inventory
	if inventory==nil then
		return nil
	end
	for k,v in pairs(inventory.itemslots) do
		if v.components.inventoryitem and v.prefab==itemtype then
			return v
		end
	end
	for k,v in pairs(inventory.equipslots) do
		if v.components.inventoryitem and v.components.container then
			for k2,v2 in pairs(v.components.container.slots) do
				if v2.components.inventoryitem and v2.prefab==itemtype then
					return v2
				end
			end
		end
	end
end

local function ondeploywallset(inst, pt, deployer, rotationpassed, specialwallsetindexpassed, customwallsetpassed)
	local mode="build"
	pt = quantizeposition(pt)
	local index = deployer.dycsw_wallbuilderindex or 1 --SuperWall.wallBuilderIndex
	local wallset=TUNING.DYC_SUPERWALL_WALLSETS[index]
	local num=0
	local num2=0
	
	if specialwallsetindexpassed and TUNING.DYC_SUPERWALL_SPECIALWALLSETS[specialwallsetindexpassed] then
		wallset=TUNING.DYC_SUPERWALL_SPECIALWALLSETS[specialwallsetindexpassed]
	elseif customwallsetpassed then
		wallset=customwallsetpassed
	end
	
	if wallset==nil then
		print("SuperWall: Failed to load wall set.")
		return
	end
	
	if wallset.destroyer then
		mode="destroy"
		local offset=wallset.destroyer.offset or Vector3(0,0,0)
		local size=wallset.destroyer.size or {x=3,y=3,}
		local rotation = deployer.dycsw_wallbuilderrotation or 0 --SuperWall.wallBuilderRotation
		if rotation==1 or rotation==3 then
			size={x=size.y,y=size.x,}
		end
		offset=rotateoffset(offset,rotation)
		local radius=math.sqrt(size.x*size.x+size.y*size.y)+1
		local newpt=pt+offset
		local ents = TheSim:FindEntities(newpt.x, newpt.y, newpt.z, radius)
		for k,v in pairs(ents) do
			if v:HasTag("superwall") and v:IsValid() and v.DYCDestroyWall and IsAuthorized(v,deployer) then
				local pos=v:GetPosition()
				if math.abs(newpt.x-pos.x)<size.x/2+0.01 and math.abs(newpt.z-pos.z)<size.y/2+0.01 then
					v:DYCDestroyWall()
					num=num+1
				end
			end
		end
	elseif wallset.heightbrush then
		mode="height"
		local delta=wallset.heightbrush.delta or 1
		local offset=wallset.heightbrush.offset or Vector3(0,0,0)
		local size=wallset.heightbrush.size or {x=3,y=3,}
		local rotation = deployer.dycsw_wallbuilderrotation or 0 --SuperWall.wallBuilderRotation
		if rotation==1 or rotation==3 then
			size={x=size.y,y=size.x,}
		end
		offset=rotateoffset(offset,rotation)
		local radius=math.sqrt(size.x*size.x+size.y*size.y)+1
		local newpt=pt+offset
		local ents = TheSim:FindEntities(newpt.x, newpt.y, newpt.z, radius)
		for k,v in pairs(ents) do
			if v:HasTag("superwall") and v:IsValid() and v.GetWallHeight and v.SetWallHeight and IsAuthorized(v,deployer) then
				local pos=v:GetPosition()
				if math.abs(newpt.x-pos.x)<size.x/2+0.01 and math.abs(newpt.z-pos.z)<size.y/2+0.01 then
					v:SetWallHeight(Clamp(v:GetWallHeight()+delta,1,4))
					num=num+1
				end
			end
		end
	elseif wallset.smartbuilder and wallset.smartbuilder.walltype and GetWallPrefabs(wallset.smartbuilder.walltype) then
		mode="smart"
		local wallprefabs=GetWallPrefabs(wallset.smartbuilder.walltype)
		local wallprefabs2=wallset.smartbuilder.walltype2~=nil and GetWallPrefabs(wallset.smartbuilder.walltype2)
		local offset=wallset.smartbuilder.offset or Vector3(0,0,0)
		local size=wallset.smartbuilder.size or {x=3,y=3,}
		local rotation = deployer.dycsw_wallbuilderrotation or 0 --SuperWall.wallBuilderRotation
		if rotation==1 or rotation==3 then
			size={x=size.y,y=size.x,}
		end
		offset=rotateoffset(offset,rotation)
		local radius=math.sqrt(size.x*size.x+size.y*size.y)+1
		local newpt=pt+offset
		local height=wallset.smartbuilder.height or 4
		local height2=deployer.dycsw_wallbuilderheight or 0  --SuperWall.wallBuilderHeightAdjustment
		height=Clamp(height+height2,1,4)
		local closestsuperwall=getclosestsuperwall(newpt,size)
		if closestsuperwall then
			local offsetx=closestsuperwall:GetPosition().x-newpt.x
			local offsetz=closestsuperwall:GetPosition().z-newpt.z
			local disx=math.abs(offsetx)
			local disz=math.abs(offsetz)
			local height3=height
			if wallprefabs2 and wallset.smartbuilder.height2 then
				height3=wallset.smartbuilder.height2
				height3=Clamp(height3+height2,1,4)
			end
			if disx<0.01 then
				local wallnum=Round(disz)
				for i=1,wallnum do
					num=num+1
					local newpt2=nil
					if offsetz>0 then
						newpt2=Vector3(newpt.x, newpt.y, newpt.z+(i-1)) 
					else
						newpt2=Vector3(newpt.x, newpt.y, newpt.z-(i-1)) 
					end
					if TheWorld.Map:CanDeployWallAtPoint(newpt2, inst) then
						if i>1 and wallprefabs2 then
							height=height3
							wallprefabs=wallprefabs2
						end
						local wall=SpawnPrefab(wallprefabs.prefab)
						local item=finditemininventory(deployer,wallprefabs.item)
						if wall and (TUNING.DYC_SUPERWALL_WALLSETNOCONSUMPTION==true or item~=nil) then 
							if TUNING.DYC_SUPERWALL_WALLSETNOCONSUMPTION==false and item~=nil then
								if item.components.stackable then
									item.components.stackable:Get():Remove()
								else
									item:Remove()
								end
							end
							num2=num2+1
							wall.Physics:SetCollides(false)
							wall.Physics:Teleport(newpt2.x, newpt2.y, newpt2.z) 
							wall["dycfixedposition"..ransuffix]=wall:GetPosition()
							wall.Physics:SetCollides(true)
							TheWorld.Pathfinder:AddWall(newpt2.x, 0, newpt2.z)
							wall.dyc_ownerid=deployer.userid	
							wall:SetWallHeight(height)
							if wallprefabs.userotation and wall.FixUpFenceOrientation then
								wall:FixUpFenceOrientation(0)
							end
						elseif wall then
							wall:Remove()
						end 
					end
				end
			else
				local wallnum=Round(disx)
				for i=1,wallnum do
					num=num+1
					local newpt2=nil
					if offsetx>0 then
						newpt2=Vector3(newpt.x+(i-1), newpt.y, newpt.z) 
					else
						newpt2=Vector3(newpt.x-(i-1), newpt.y, newpt.z) 
					end
					if TheWorld.Map:CanDeployWallAtPoint(newpt2, inst) then
						if i>1 and wallprefabs2 then
							height=height3
							wallprefabs=wallprefabs2
						end
						local wall=SpawnPrefab(wallprefabs.prefab)
						local item=finditemininventory(deployer,wallprefabs.item)
						if wall and (TUNING.DYC_SUPERWALL_WALLSETNOCONSUMPTION==true or item~=nil) then 
							if TUNING.DYC_SUPERWALL_WALLSETNOCONSUMPTION==false and item~=nil then
								if item.components.stackable then
									item.components.stackable:Get():Remove()
								else
									item:Remove()
								end
							end
							num2=num2+1
							wall.Physics:SetCollides(false)
							wall.Physics:Teleport(newpt2.x, newpt2.y, newpt2.z) 
							wall["dycfixedposition"..ransuffix]=wall:GetPosition()
							wall.Physics:SetCollides(true)
							TheWorld.Pathfinder:AddWall(newpt2.x, 0, newpt2.z)
							wall.dyc_ownerid=deployer.userid	
							wall:SetWallHeight(height)
							if wallprefabs.userotation and wall.FixUpFenceOrientation then
								wall:FixUpFenceOrientation(90)
							end
						elseif wall then
							wall:Remove()
						end 
					end
				end
			end
		else
			num=1
			if TheWorld.Map:CanDeployWallAtPoint(newpt, inst) then
				local wall=SpawnPrefab(wallprefabs.prefab)
				local item=finditemininventory(deployer,wallprefabs.item)
				if wall and (TUNING.DYC_SUPERWALL_WALLSETNOCONSUMPTION==true or item~=nil) then 
					if TUNING.DYC_SUPERWALL_WALLSETNOCONSUMPTION==false and item~=nil then
						if item.components.stackable then
							item.components.stackable:Get():Remove()
						else
							item:Remove()
						end
					end
					num2=1
					wall.Physics:SetCollides(false)
					wall.Physics:Teleport(newpt.x, newpt.y, newpt.z) 
					wall["dycfixedposition"..ransuffix]=wall:GetPosition()
					wall.Physics:SetCollides(true)
					TheWorld.Pathfinder:AddWall(newpt.x, 0, newpt.z)
					wall.dyc_ownerid=deployer.userid	
					wall:SetWallHeight(height)
					if rotationpassed and wallprefabs.userotation and wall.FixUpFenceOrientation then
						wall:FixUpFenceOrientation(rotationpassed)
					end
				elseif wall then
					wall:Remove()
				end 
			end
		end
	else
		for k,v in pairs(wallset) do	
			if type(v)=="table" and v.walltype then
				local wallprefabs=GetWallPrefabs(v.walltype)
				local offset=Vector3(0,0,0)
				if v.offset then
					offset=v.offset
					if wallset.pivot then
						offset=offset-wallset.pivot
					end
					local rotation = deployer.dycsw_wallbuilderrotation or 0 --SuperWall.wallBuilderRotation
					offset=rotateoffset(offset,rotation)
				end
				local newpt=pt+offset
				
				if wallprefabs then
					num=num+1
				end
				
				if wallprefabs and TheWorld.Map:CanDeployWallAtPoint(newpt, inst) then
					local wall=SpawnPrefab(wallprefabs.prefab)
					local item=finditemininventory(deployer,wallprefabs.item)
					if wall and (TUNING.DYC_SUPERWALL_WALLSETNOCONSUMPTION==true or item~=nil) then 
						
						if TUNING.DYC_SUPERWALL_WALLSETNOCONSUMPTION==false and item~=nil then
							if item.components.stackable then
								item.components.stackable:Get():Remove()
							else
								item:Remove()
							end
						end
						num2=num2+1
						wall.Physics:SetCollides(false)
						wall.Physics:Teleport(newpt.x, newpt.y, newpt.z) 
						wall["dycfixedposition"..ransuffix]=wall:GetPosition()
						wall.Physics:SetCollides(true)
						TheWorld.Pathfinder:AddWall(newpt.x, 0, newpt.z)
						wall.dyc_ownerid=deployer.userid	
						local height=v.height or 4
						local height2=deployer.dycsw_wallbuilderheight or 0  --SuperWall.wallBuilderHeightAdjustment
						wall:SetWallHeight(Clamp(height+height2,1,4))
						if wallprefabs.userotation and wall.FixUpFenceOrientation then
							local rotation = (deployer.dycsw_wallbuilderrotation or 0)*90 --SuperWall.wallBuilderRotation
							rotation = rotation + (v.rotation or 0)
							wall:FixUpFenceOrientation(rotation,v.isswingright)
						end
					elseif wall then
						wall:Remove()
					end 	
					
				end
			end
		end
	end
	
	if (mode=="build" or mode=="smart") and num>0 and deployer.components.talker then
		local talker=deployer.components.talker
		local str=""
		if num2==0 then
			str=TUNING.DYC_SUPERWALL_STRINGS.buildingcomplete3
		elseif num2 <num then
			str=TUNING.DYC_SUPERWALL_STRINGS.buildingcomplete2
		else
			str=TUNING.DYC_SUPERWALL_STRINGS.buildingcomplete1
		end
		inst:DoTaskInTime(4*FRAMES,function() talker:Say(str,4) end) 
	elseif mode=="destroy" and deployer.components.talker then
		local talker=deployer.components.talker
		local str=""
		if num>0 then
			str=TUNING.DYC_SUPERWALL_STRINGS.walldestroyed1
		else
			str=TUNING.DYC_SUPERWALL_STRINGS.walldestroyed2
		end
		inst:DoTaskInTime(4*FRAMES,function() talker:Say(str,4) end) 
	elseif mode=="height" and deployer.components.talker then
		local talker=deployer.components.talker
		local str=""
		if num>0 then
			str=TUNING.DYC_SUPERWALL_STRINGS.wallheightchanged1
		else
			str=TUNING.DYC_SUPERWALL_STRINGS.wallheightchanged2
		end
		inst:DoTaskInTime(5*FRAMES,function() talker:Say(str,4) end) 
	end
	
	inst:DoTaskInTime(4*FRAMES,function() 
		if deployer.components.inventory and inst.components.inventoryitem and inst.components.inventoryitem.owner==nil then
			deployer.components.inventory:GiveActiveItem(inst) 
		end
	end)
	
end

local function testwallset(inst, pt)
	
	return true
end

local function wallbuilderitemchild()
	local inst = CreateEntity()
	inst:AddTag("FX")
	inst.entity:SetCanSleep(false)
	inst.persists = false
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.AnimState:SetBank("hammer")
    inst.AnimState:SetBuild("hammer")
    inst.AnimState:PlayAnimation("idle")
	inst.Transform:SetScale(0.85,0.85,0.85)
	
	return inst
end

local function wallbuilderitem () 
	local inst=dooritemfn()
	inst:AddTag("superwallfastbuilder")
	
	inst.AnimState:SetBank("wall")
	inst.AnimState:SetBuild("wall_stone")
	inst.AnimState:PlayAnimation("idle")
	inst:SpawnChild("dyc_wallbuilderitemchild").Transform:SetPosition(0,0.5,0)
	inst.Transform:SetScale(0.85,0.85,0.85)

	if not TheWorld.ismastersim then
        return inst
    end
	inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.MED_FUEL
	
	inst:RemoveComponent("stackable")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/wallbuilder.xml"
	inst.components.inventoryitem.imagename = "wallbuilder"

	-- inst.components.deployable:SetDeployMode(DEPLOYMODE.ANYWHERE)
	-- local oldcandeploy=inst.components.deployable.CanDeploy
	inst.components.deployable.CanDeploy=function(self,pt,mouseover)
		return testwallset(self.inst,pt)
	end
	-- inst.components.deployable:SetDeployMode(DEPLOYMODE.ANYWHERE)
	inst.components.deployable.ondeploy = ondeploywallset
	

	return inst
end

local function previouswallset(inst,specialwallsetindex)
	SuperWall.wallBuilderIndex=SuperWall.wallBuilderIndex-1
	if SuperWall.wallBuilderIndex<1 then
		SuperWall.wallBuilderIndex=#TUNING.DYC_SUPERWALL_WALLSETS
	end
	SuperWall.SetWallBuilderIndex(SuperWall.wallBuilderIndex)
	updateplacers(inst,specialwallsetindex)
end

local function nextwallset(inst,specialwallsetindex)
	SuperWall.wallBuilderIndex=SuperWall.wallBuilderIndex+1
	if SuperWall.wallBuilderIndex>#TUNING.DYC_SUPERWALL_WALLSETS then
		SuperWall.wallBuilderIndex=1
	end
	SuperWall.SetWallBuilderIndex(SuperWall.wallBuilderIndex)
	updateplacers(inst,specialwallsetindex)
end

local function rotatewallset_cw(inst,specialwallsetindex)
	SuperWall.wallBuilderRotation=SuperWall.wallBuilderRotation+1
	if SuperWall.wallBuilderRotation>=4 then
		SuperWall.wallBuilderRotation=0
	end
	SuperWall.SetWallBuilderRatation(SuperWall.wallBuilderRotation)
	updateplacers(inst,specialwallsetindex)	
end

local function increasewallsetheight(inst,specialwallsetindex)
	if SuperWall.wallBuilderHeightAdjustment<3 then
		SuperWall.wallBuilderHeightAdjustment=SuperWall.wallBuilderHeightAdjustment+1
	end
	SuperWall.SetWallBuilderHeight(SuperWall.wallBuilderHeightAdjustment)
	updateplacers(inst,specialwallsetindex)	
end

local function decreasewallsetheight(inst,specialwallsetindex)
	if SuperWall.wallBuilderHeightAdjustment>-3 then
		SuperWall.wallBuilderHeightAdjustment=SuperWall.wallBuilderHeightAdjustment-1
	end
	SuperWall.SetWallBuilderHeight(SuperWall.wallBuilderHeightAdjustment)
	updateplacers(inst,specialwallsetindex)	
end

local function onremove_dummyplacer(inst)
	local player=ThePlayer
	TheCamera.ZoomIn=inst.oldcamerazoomin
	TheCamera.ZoomOut=inst.oldcamerazoomout
	ThePlayer.components.playercontroller.OnRightClick=inst.oldonrightclick
	if inst.oldrightclick then
		player.components.playeractionpicker.GetRightClickActions=inst.oldrightclick
	end
	if inst.dycdummyplacertask then
		inst.dycdummyplacertask:Cancel()
	end
	
	SuperWall.PreviousWallSet=nil
	SuperWall.NextWallSet=nil
	SuperWall.RotateWallSet=nil
	SuperWall.IncreaseWallSetHeight=nil
	SuperWall.DecreaseWallSetHeight=nil
	
	-- ACTIONS.DEPLOY.distance=SuperWall.defaultWallBuildDis
	
end

local function getrightclickactions(self, position, target)
	target=nil
    if self.rightclickoverride ~= nil then
        local actions, usedefault = self.rightclickoverride(self.inst, target, position)
        if not usedefault or (actions ~= nil and #actions > 0) then
            return actions or {}
        end
    end

    local actions = nil
    local useitem = self.inst.replica.inventory:GetActiveItem()
    local equipitem = self.inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
    local ispassable = true

    if target ~= nil and self.containers[target] then
        actions = self:GetSceneActions(target, true)
    elseif useitem ~= nil then
        if useitem:IsValid() then
            if target == self.inst then
                actions = self:GetInventoryActions(useitem, true)
            elseif target ~= nil then
                actions = self:GetUseItemActions(target, useitem, true)
            elseif ispassable then
                actions = self:GetPointActions(position, useitem, true)
            end
        end
    elseif target ~= nil then
        if equipitem ~= nil and equipitem:IsValid() then
            actions = self:GetEquippedItemActions(target, equipitem, true)
        end

        if actions == nil or #actions == 0 then
            actions = self:GetSceneActions(target, true)
        end
    elseif equipitem ~= nil and equipitem:IsValid() and ispassable then
        actions = self:GetPointActions(position, equipitem, true)
    end

    return actions or {}
end

local function placersquare()
	local inst = CreateEntity()
	inst:AddTag("FX")
	inst.entity:SetCanSleep(false)
	inst.persists = false
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	-- inst.AnimState:SetBank("staff_purple_base_ground")
	-- inst.AnimState:SetBuild("staff_purple_base_ground")
	inst.AnimState:SetBank("dyc_superwall")
	inst.AnimState:SetBuild("dyc_square")
	inst.AnimState:PlayAnimation("idle")
	inst.AnimState:SetMultColour(1,1,1,0.5)
	inst.AnimState:SetLightOverride(1)
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(3)
	inst.Transform:SetScale(2,2,2)
	function inst:SetSquare2()
		self.AnimState:SetBank("dyc_superwall")
		self.AnimState:SetBuild("dyc_square2")
		self.AnimState:PlayAnimation("idle")
	end
	return inst
end

local function dummyplacer()
	local inst = CreateEntity()
	inst:AddTag("FX")
	inst.entity:SetCanSleep(false)
	inst.persists = false
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	-- inst.AnimState:SetLightOverride(1)
	
	inst.entity:AddLabel()
	inst.Label:SetFont(NUMBERFONT)
	inst.Label:SetFontSize(22)
	inst.Label:SetColour(1, 1, 1)
	inst.Label:SetText(" ")
	inst.Label:Enable(true)
	
	inst:AddComponent("placer")
	inst.components.placer.snaptogrid = false
	inst.components.placer.snap_to_meters = true
	inst.components.placer.fixedcameraoffset = nil
	inst.components.placer.onground = nil
	
	updateplacers(inst,nil)
	
	local specialwallsetindex=nil
	
	SuperWall.PreviousWallSet=function() previouswallset(inst,specialwallsetindex) end
	SuperWall.NextWallSet=function() nextwallset(inst,specialwallsetindex) end 
	SuperWall.RotateWallSet=function() rotatewallset_cw(inst,specialwallsetindex) end 
	SuperWall.IncreaseWallSetHeight=function() increasewallsetheight(inst,specialwallsetindex) end
	SuperWall.DecreaseWallSetHeight=function() decreasewallsetheight(inst,specialwallsetindex) end
	
	local player=ThePlayer
	
	inst.dycismidmouseup = true
	inst.dycisrightmouseup = true
	inst.dycisaltdown = false
	inst.dycdummyplacertask=inst:DoPeriodicTask(FRAMES,function()
	
		
		
		
		if TheSim:IsKeyDown(KEY_ALT) then
			specialwallsetindex=1
			if not inst.dycisaltdown then
				updateplacers(inst,specialwallsetindex)
			end
			inst.dycisaltdown = true
		else
			specialwallsetindex=nil
			if inst.dycisaltdown then
				updateplacers(inst,specialwallsetindex)
			end
			inst.dycisaltdown = false
		end
		
		if TheSim:GetMouseButtonState(MOUSEBUTTON_RIGHT) then
			if inst.dycisrightmouseup then
				
				local deployer=player
				
				local pt=TheInput:GetWorldPosition()
				local hudobj=TheInput:GetHUDEntityUnderMouse()
				if hudobj==nil then
					local index = SuperWall.wallBuilderIndex
					local wallset=TUNING.DYC_SUPERWALL_WALLSETS[index]
					if wallset and wallset.iscustom and specialwallsetindex==nil then
						SuperWall.BuildCustomWallSet(pt.x, pt.z, inst.rotationtobepassed, wallset)
					else
						SuperWall.BuildWallSet(pt.x, pt.z, inst.rotationtobepassed, specialwallsetindex)
					end
					inst:DoTaskInTime(0.15,function() if inst and inst:IsValid() then updateplacers(inst,specialwallsetindex) end end)
				end
			end
			inst.dycisrightmouseup = false
		else
			inst.dycisrightmouseup = true
		end
		
		
		
		if TheSim:GetMouseButtonState(MOUSEBUTTON_MIDDLE) then
			if inst.dycismidmouseup then
				rotatewallset_cw(inst,specialwallsetindex)
			end
			inst.dycismidmouseup = false
		else
			inst.dycismidmouseup = true
		end
		
		if TheSim:GetDigitalControl(CONTROL_ZOOM_OUT) then
			nextwallset(inst,specialwallsetindex)
		elseif TheSim:GetDigitalControl(CONTROL_ZOOM_IN) then
			previouswallset(inst,specialwallsetindex)
		end
		
		
		local dx,dy,dz=(inst.lastpos-quantizeposition(inst:GetPosition())):Get()
		if inst.wallbuildermode=="smart" and (dx~=0 or dz~=0) then
			-- print(inst.wallbuildermode,inst.lastpos,quantizeposition(inst:GetPosition()))
			updateplacers(inst,specialwallsetindex)
		end
	end)
	
	inst.oldcamerazoomin=TheCamera.ZoomIn
	inst.oldcamerazoomout=TheCamera.ZoomOut
	TheCamera.ZoomIn=function() end
	TheCamera.ZoomOut=function() end
	inst.oldonrightclick=player.components.playercontroller.OnRightClick
	player.components.playercontroller.OnRightClick=function() end
	if player.components.playeractionpicker then
		inst.oldrightclick=player.components.playeractionpicker.GetRightClickActions
		player.components.playeractionpicker.GetRightClickActions=getrightclickactions
	end
	-- ACTIONS.DEPLOY.distance=30
	
	inst.OnRemoveEntity = onremove_dummyplacer
	
	
	
	return inst
end

local function wallplacerpostinit(inst)
	inst:DoTaskInTime(FRAMES,function()
		if inst.dyc_noplacerpostinit then
			return
		end
		
		inst.entity:AddLabel()
		inst.Label:SetFont(NUMBERFONT)
		inst.Label:SetFontSize(22)
		inst.Label:SetColour(1, 1, 1)
		inst.Label:SetText(" ")
		inst.Label:Enable(true)
		
		local player=ThePlayer
		
		local function updateplacer(inst)
			placersetheight(inst,Clamp(4+SuperWall.wallBuilderHeightAdjustment,1,4))
			local heightadjustmentsign=(SuperWall.wallBuilderHeightAdjustment>0 and "+") or ""
			inst.Label:SetText(TUNING.DYC_SUPERWALL_STRINGS.singlewallbuild.."\n"..TUNING.DYC_SUPERWALL_STRINGS.heightadjustment..":"..heightadjustmentsign..SuperWall.wallBuilderHeightAdjustment.."\n  \n  \n  \n  \n  \n  \n  \n  \n  \n  ")
		end
		local function increaseheight(inst)
			if SuperWall.wallBuilderHeightAdjustment<3 then
				SuperWall.wallBuilderHeightAdjustment=SuperWall.wallBuilderHeightAdjustment+1
			end
			SuperWall.SetWallBuilderHeight(SuperWall.wallBuilderHeightAdjustment)
			updateplacer(inst)
		end

		local function decreaseheight(inst)
			if SuperWall.wallBuilderHeightAdjustment>-3 then
				SuperWall.wallBuilderHeightAdjustment=SuperWall.wallBuilderHeightAdjustment-1
			end
			SuperWall.SetWallBuilderHeight(SuperWall.wallBuilderHeightAdjustment)
			updateplacer(inst)
		end
		SuperWall.IncreaseWallSetHeight=function() increaseheight(inst) end
		SuperWall.DecreaseWallSetHeight=function() decreaseheight(inst) end
		
		inst.dycwallplacertask=inst:DoPeriodicTask(FRAMES,function()
			if TheSim:GetMouseButtonState(MOUSEBUTTON_RIGHT) then
				if inst.dycisrightmouseup then
					local deployer=player
					local pt=TheInput:GetWorldPosition()
					local mouseoverobj=TheInput:GetWorldEntityUnderMouse()
					local hudobj=TheInput:GetHUDEntityUnderMouse()
					if hudobj==nil and deployer and deployer.replica.inventory and deployer.replica.inventory:GetActiveItem() then
						local item=deployer.replica.inventory:GetActiveItem()
						if TheWorld.Map:CanDeployWallAtPoint(pt,item) and mouseoverobj==nil then
							SuperWall.BuildWall(pt.x, pt.z)
						else
							deployer.replica.inventory:ReturnActiveItem()
						end
					end
				end
				inst.dycisrightmouseup = false
			else
				inst.dycisrightmouseup = true
			end
		end)
		
		inst.oldonrightclick=player.components.playercontroller.OnRightClick
		player.components.playercontroller.OnRightClick=function() end
		
		inst.OnRemoveEntity = function(inst)
			player.components.playercontroller.OnRightClick=inst.oldonrightclick
			if inst.dycwallplacertask then
				inst.dycwallplacertask:Cancel()
			end
			SuperWall.IncreaseWallSetHeight=nil
			SuperWall.DecreaseWallSetHeight=nil
		end
		updateplacer(inst)
	end)
end


return 
Prefab( "common/dyc_wallbuilderitemchild", wallbuilderitemchild, assets, prefabs),
Prefab( "common/dyc_wallbuilderitem", wallbuilderitem, assets, prefabs),
Prefab( "common/dyc_wallbuilderitem_placersquare", placersquare, assets, prefabs),
Prefab( "common/dyc_wallbuilderitem_placer", dummyplacer, assets, prefabs),

Prefab( "common/dyc_wall_sea", seawall, assets, prefabs),
Prefab( "common/dyc_wall_sea_item", seawallitem, assets, prefabs),
MakePlacer("common/dyc_wall_sea_item_placer", "wall", "dyc_wall_sea", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,
Prefab( "common/dyc_wall_ice", icewall, assets, prefabs),
Prefab( "common/dyc_wall_ice_item", icewallitem, assets, prefabs),
MakePlacer("common/dyc_wall_ice_item_placer", "wall", "dyc_wall_ice", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,
Prefab( "common/dyc_wall_moonrock", moonrockwall, assets, prefabs),
Prefab( "common/dyc_wall_moonrock_item", moonrockwallitem, assets, prefabs),
MakePlacer("common/dyc_wall_moonrock_item_placer", "wall", "wall_moonrock", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,
Prefab( "common/dyc_wall_limestone", limestonewall, assets, prefabs),
Prefab( "common/dyc_wall_limestone_item", limestonewallitem, assets, prefabs),
MakePlacer("common/dyc_wall_limestone_item_placer", "wall", "dyc_wall_limestone", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,
Prefab( "common/dyc_wall_ruin", ruinwall, assets, prefabs),
Prefab( "common/dyc_wall_ruin_item", ruinwallitem, assets, prefabs),
MakePlacer("common/dyc_wall_ruin_item_placer", "wall", "wall_ruins", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,
Prefab( "common/dyc_wall_stone", stonewall, assets, prefabs),
Prefab( "common/dyc_wall_stone_item", stonewallitem, assets, prefabs),
MakePlacer("common/dyc_wall_stone_item_placer", "wall", "wall_stone", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,
Prefab( "common/dyc_wall_hay", haywall, assets, prefabs),
Prefab( "common/dyc_wall_hay_item", haywallitem, assets, prefabs),
MakePlacer("common/dyc_wall_hay_item_placer", "wall", "wall_hay", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,
Prefab( "common/dyc_wall_wood", woodwall, assets, prefabs),
Prefab( "common/dyc_wall_wood_item", woodwallitem, assets, prefabs),
MakePlacer("common/dyc_wall_wood_item_placer", "wall", "wall_wood", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,


Prefab( "common/dyc_door_sea", seadoor, assets, prefabs),
Prefab( "common/dyc_door_sea_item", seadooritem2, assets, prefabs),
MakePlacer("common/dyc_door_sea_item_placer", "wall", "dyc_wall_sea", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,
Prefab( "common/dyc_door_ice", icedoor, assets, prefabs),
Prefab( "common/dyc_door_ice_item", icedooritem2, assets, prefabs),
MakePlacer("common/dyc_door_ice_item_placer", "wall", "dyc_wall_ice", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,
Prefab( "common/dyc_door_moonrock", moonrockdoor, assets, prefabs),
Prefab( "common/dyc_door_moonrock_item", moonrockdooritem2, assets, prefabs),
MakePlacer("common/dyc_door_moonrock_item_placer", "wall", "wall_moonrock", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,
Prefab( "common/dyc_door_limestone", limestonedoor, assets, prefabs),
Prefab( "common/dyc_door_limestone_item", limestonedooritem2, assets, prefabs),
MakePlacer("common/dyc_door_limestone_item_placer", "wall", "dyc_wall_limestone", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,
Prefab( "common/dyc_door_ruin", ruindoor, assets, prefabs),
Prefab( "common/dyc_door_ruin_item", ruindooritem2, assets, prefabs),
MakePlacer("common/dyc_door_ruin_item_placer", "wall", "wall_ruins", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,
Prefab( "common/dyc_door_stone", stonedoor, assets, prefabs),
Prefab( "common/dyc_door_stone_item", stonedooritem2, assets, prefabs),
MakePlacer("common/dyc_door_stone_item_placer", "wall", "wall_stone", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,
Prefab( "common/dyc_door_hay", haydoor, assets, prefabs),
Prefab( "common/dyc_door_hay_item", haydooritem2, assets, prefabs),
MakePlacer("common/dyc_door_hay_item_placer", "wall", "wall_hay", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) ,
Prefab( "common/dyc_door_wood", wooddoor, assets, prefabs),
Prefab( "common/dyc_door_wood_item", wooddooritem2, assets, prefabs),
MakePlacer("common/dyc_door_wood_item_placer", "wall", "wall_wood", "fullA", false, false, true, nil, nil, "eight",wallplacerpostinit) 

