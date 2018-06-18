require "prefabutil"

local wall_prefabs =
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

local IsAuthorized=SuperWall.IsAuthorized
local Id2Player=SuperWall.Id2Player
local Player2Index=SuperWall.Player2Index

local function quantizeposition(pt)
	local retval = Vector3(math.floor(pt.x)+.5, 0, math.floor(pt.z)+.5)
	return retval
end 

local function updatewallphysics (inst)
	if inst.doorstate and inst.components.workable.workleft>0 then
		makeobstacle(inst)
	else 
		clearobstacle(inst)
	end
end


local function CalcRotationEnum(rot, isdoor)
    return math.floor((math.floor(rot + 0.5) / 45) % (isdoor and 8 or 4))
end

local function CalcFacingAngle(rot, isdoor)
    return CalcRotationEnum(rot, isdoor) * 45 
end

local function IsNarrow(inst)
    return CalcRotationEnum(inst.Transform:GetRotation()) % 2 == 0
end

local function IsSwingRight(inst)
    if inst._isswingright ~= nil then
        return inst._isswingright:value()
    end
    return inst.isswingright == true
end

local function IsOpen(inst)
    return inst._isopen ~= nil and inst._isopen:value()
end

local function GetAnimName(inst, basename)
    return basename
        ..(IsSwingRight(inst) and "right" or "")
        ..(IsOpen(inst) and "_open" or "")
end

local function GetAnimState(inst)
    return (inst.dooranim or inst).AnimState
end

local function ChangeWallColor (inst)
	local wallpercent = inst.wallpercent
	if wallpercent>=1 then
		GetAnimState(inst):SetMultColour(1,1,1,1)
		inst.wallcolor={r=1,g=1,b=1,a=1,}
	elseif wallpercent>=0.75 then
		GetAnimState(inst):SetMultColour(1,0,0,1)
		inst.wallcolor={r=1,g=0,b=0,a=1,}
	elseif wallpercent>=0.5 then
		GetAnimState(inst):SetMultColour(0,1,0,1)
		inst.wallcolor={r=0,g=1,b=0,a=1,}
	elseif wallpercent>=0.25 then
		GetAnimState(inst):SetMultColour(0,0,1,1)
		inst.wallcolor={r=0,g=0,b=1,a=1,}
	elseif wallpercent>=0 then
		GetAnimState(inst):SetMultColour(0,0,0,1)
		inst.wallcolor={r=0,g=0,b=0,a=1,}
	else
		GetAnimState(inst):SetMultColour(1,1,1,1)
		inst.wallcolor={r=1,g=1,b=1,a=1,}
	end
end

-------------------------------------------------------------------------------
--Networked data
local function GetDoorRotationOffset(inst, rot)
    --angle1 to get back to hinge
    --angle2 to open door using hinge as pivot
    local sign = IsSwingRight(inst) and -1 or 1
    local angle1 = inst.Transform:GetRotation() * DEGREES
    local angle2 = angle1 + sign * rot * DEGREES
    local len = sign * (IsNarrow(inst) and .5 or .707)
    return
        len * (math.sin(angle2) - math.sin(angle1)),
        0,
        len * (math.cos(angle2) - math.cos(angle1))
end

local function OnDoorStateDirty(inst)
	if inst.dooranim.AnimState.SetSortWorldOffset==nil then
		return
	end
    --V2C: AnimState:SetSortWorldOffset is client side
    if inst.dooranim ~= nil and inst._isopen ~= nil then
        if inst._isopen:value() then
            inst.dooranim.AnimState:SetSortWorldOffset(GetDoorRotationOffset(inst, 100))
        else
            inst.dooranim.AnimState:SetSortWorldOffset(0, 0, 0)
        end
    end
end

local function OnInitDoorClient(inst)
    --V2C: No point doing it any earlier because we need to wait for rotation to set
    inst:ListenForEvent("doorstatedirty", OnDoorStateDirty)
    OnDoorStateDirty(inst)
end

local function OnWallAnimReplicated(inst)
    local parent = inst.entity:GetParent()
    if parent ~= nil then
        parent.highlightforward = inst
        parent.dooranim = inst
    end
end

-------------------------------------------------------------------------------
-- Fence/Gate Alignment

local function SetIsSwingRight(inst, is_swing_right)
    if inst._isswingright ~= nil then
        inst._isswingright:set(is_swing_right)
    else
        inst.isswingright = is_swing_right
    end
    OnDoorStateDirty(inst)
end

local function FindPairedDoor(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local rot = inst.Transform:GetRotation()

    local swingright = IsSwingRight(inst)
    local search_dist = IsNarrow(inst) and 1 or 1.4

    local search_x = -math.sin(rot / RADIANS) * search_dist
    local search_y = math.cos(rot / RADIANS) * search_dist

    search_x = x + (swingright and search_x or -search_x)
    search_y = z + (swingright and -search_y or search_y)

    local other_door = TheSim:FindEntities(search_x,0,search_y, 0.25, {"door"})[1]
    if other_door then
        local opposite_swing = swingright ~= IsSwingRight(other_door)
        local opposite_rotation = inst.Transform:GetRotation() ~= other_door.Transform:GetRotation()
        return (opposite_swing ~= opposite_rotation) and other_door or nil
    end

    return nil
end

local function GetNeighbors(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    return TheSim:FindEntities(x,0,z, 1.5, {"wall"})
end

local function SetOffset(inst, offset)
    if inst.dooranim ~= nil then
        inst.dooranim.Transform:SetPosition(offset, 0, 0)
    end
end

local function ApplyDoorOffset(inst)
    SetOffset(inst, inst.offsetdoor and 0.45 or 0)
end

local function SetOrientation(inst, rotation)
    rotation = CalcFacingAngle(rotation, inst.isdoor)

    inst.Transform:SetRotation(rotation)
    if inst.dooranim ~= nil then
        inst.dooranim.Transform:SetRotation(rotation)
    end

    if inst.builds.narrow then
        if IsNarrow(inst) then
            GetAnimState(inst):SetBuild(inst.builds.narrow)
            GetAnimState(inst):SetBank(inst.builds.narrow)
        else
            GetAnimState(inst):SetBuild(inst.builds.wide)
            GetAnimState(inst):SetBank(inst.builds.wide)
        end

        if inst.isdoor then
            ApplyDoorOffset(inst)
        end
    end
end

local function _calcdooroffset(inst, neighbors)
    if inst == nil or not inst.isdoor then
        return false
    end

    local x, y, z = inst.Transform:GetWorldPosition()
    local rot = inst.Transform:GetRotation()

    local search_x = -math.sin(rot / RADIANS) * 1.2
    local search_y = math.cos(rot / RADIANS) * 1.2

    local walls = TheSim:FindEntities(x + search_x,0, z - search_y, 0.25, {"wall"}, {"alignwall"})
    if #walls == 0 then
        walls = TheSim:FindEntities(x - search_x,0, z + search_y, 0.25, {"wall"}, {"alignwall"})
    end
    return #walls > 0
end

local function RefreshDoorOffset(inst, neighbors)
    if inst == nil or (not inst.isdoor) then
        return
    end

    if not IsNarrow(inst) then
        inst.offsetdoor = false
        ApplyDoorOffset(inst)
        return
    end

    local do_offset = _calcdooroffset(inst, neighbors)

    local otherdoor = FindPairedDoor(inst)
    if otherdoor and do_offset == false then
        do_offset = _calcdooroffset(otherdoor)
    end
        
    if inst.offsetdoor ~= do_offset then
        inst.offsetdoor = do_offset
        ApplyDoorOffset(inst)
    end
end

local function FixUpFenceOrientation(inst, deployedrotation, isswingright) -- rotates the placer but not the any near by "alignwall"
    local neighbors = GetNeighbors(inst)
	if isswingright~=nil then
		neighbors={}
	end

    if deployedrotation ~= nil then
        if inst.isdoor then
            local neighbor = neighbors[2]
            if neighbor ~= nil then
                if neighbor.isdoor then
                    SetIsSwingRight(inst, not IsSwingRight(neighbor))
                else
                    local x, y, z = inst.Transform:GetWorldPosition()
                    local x1, y1, z1 = neighbor.Transform:GetWorldPosition()
                    local rot = math.atan2(x - x1, z - z1) * RADIANS
                    SetIsSwingRight(inst, CalcRotationEnum(deployedrotation, true) ~= CalcRotationEnum(rot, true))
                end
            else
				if isswingright~=nil then
					SetIsSwingRight(inst, isswingright)
				end
			end
        end

        SetOrientation(inst, deployedrotation)
        RefreshDoorOffset(inst, neighbors)
    else
        local neighbor = neighbors[1]
        if neighbor ~= nil then
            local x, y, z = inst.Transform:GetWorldPosition()
            local x1, y1, z1 = neighbor.Transform:GetWorldPosition()
            local rot_to_neighbor = math.atan2(x - x1, z - z1) * RADIANS
            local rot = CalcFacingAngle(rot_to_neighbor, inst.isdoor)
            
            if inst.isdoor then
                if Vector3(x - x1, 0, z - z1):Dot(TheCamera:GetRightVec()) < 0 then
                    rot = rot + 180
                end
                
                if neighbor.isdoor then
                    if CalcRotationEnum(neighbor.Transform:GetRotation(), false) == CalcRotationEnum(rot, false) then
						rot = neighbor.Transform:GetRotation()
					end
                    SetIsSwingRight(inst, not IsSwingRight(neighbor))
                else
                    SetIsSwingRight(inst, CalcRotationEnum(rot, true) ~= CalcRotationEnum(rot_to_neighbor, true))

					-- some extra fixup to handle the case when two doors are placed with opposite camera angles, but the found neighbour was a wall even though there is a door on the otherside
					inst.Transform:SetRotation(rot)
					local otherdoor = FindPairedDoor(inst)
					if otherdoor ~= nil then
						rot = otherdoor.Transform:GetRotation()
						SetIsSwingRight(inst, not IsSwingRight(otherdoor))
					end
                end
            end

            SetOrientation(inst, rot)

            RefreshDoorOffset(inst, neighbors)
        else
            if inst.isdoor then
                SetIsSwingRight(inst, false)
            end
            SetOrientation(inst, inst.Transform:GetRotation())
        end
    end

    GetAnimState(inst):PlayAnimation(GetAnimName(inst, "idle"))
end

-------------------------------------------------------------------------------

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

local function onremove(inst)
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

local function keeptargetfn()
    return false
end

-- local function onhammered(inst)
    -- inst.components.lootdropper:DropLoot()

    -- local fx = SpawnPrefab("collapse_small")
    -- fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    -- fx:SetMaterial("wood")

    -- inst:Remove()
-- end

local function onhammered(inst, worker)
	if not inst["dycislastworkvalid"..ransuffix] then
		return
	end
	
	if inst.loot then
		local num_loots = inst.lootnum
		for k = 1, num_loots do
			inst.components.lootdropper:SpawnLootPrefab(inst.loot)
		end
	end
		
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
		
	if inst.destroysound then
		inst.SoundEmitter:PlaySound(inst.destroysound)
	end

	inst:Remove()
end

local function onhealthchange(inst, old_percent, new_percent)
	inst.components.health.currenthealth = inst.components.health.maxhealth
	new_percent=1
end

-- local function onhit(inst, attacker, damage)
    -- inst.components.workable:WorkedBy(attacker)
-- end

local function onhit(inst)
	-- if inst.destroysound then
		-- inst.SoundEmitter:PlaySound(inst.destroysound)		
	-- end
	if inst.wallpercent>inst.components.workable.workleft/inst.iniworkleft then 
		inst.wallpercent=inst.components.workable.workleft/inst.iniworkleft
	end
	if inst.wallpercent<0 then 
		inst.wallpercent=0
	end
	
	GetAnimState(inst):PlayAnimation(GetAnimName(inst, "hit"))
    GetAnimState(inst):PushAnimation(GetAnimName(inst, "idle"), false)
	ChangeWallColor(inst)

end

-- local function onworked(inst)
    -- GetAnimState(inst):PlayAnimation(GetAnimName(inst, "hit"))
    -- GetAnimState(inst):PushAnimation(GetAnimName(inst, "idle"), false)
-- end

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
			typestr=TUNING.DYC_SUPERWALL_STRINGS.str1_2
		else
			typestr=TUNING.DYC_SUPERWALL_STRINGS.str0_2
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



-------------------------------------------------------------------------------
local function SetIsOpen(inst, isopen)
    inst._isopen:set(isopen)
    OnDoorStateDirty(inst)
end

local function OpenDoor(inst, skiptransition)
    if inst == nil then
        return
    end
	inst.doorstate=false
    SetIsOpen(inst, true)
    clearobstacle(inst)

    if not skiptransition then
        inst.SoundEmitter:PlaySound("dontstarve/common/together/gate/open")
    end

    GetAnimState(inst):PlayAnimation(GetAnimName(inst, "idle"))
end

local function CloseDoor(inst, skiptransition)
    if inst == nil then
        return
    end
	inst.doorstate=true
    SetIsOpen(inst, false)
    makeobstacle(inst)

    if not skiptransition then
        inst.SoundEmitter:PlaySound("dontstarve/common/together/gate/close")
    end

    GetAnimState(inst):PlayAnimation(GetAnimName(inst, "idle"))
end

-- local function ToggleDoor(inst)
    -- inst.components.activatable.inactive = true

    -- if IsOpen(inst) then
        -- CloseDoor(inst)
        -- CloseDoor(FindPairedDoor(inst))
    -- else
        -- OpenDoor(inst)
        -- OpenDoor(FindPairedDoor(inst))
    -- end
-- end

local function SetLock(inst,b)
	if inst == nil then
        return
    end
	inst.islocked=b
	if inst.islocked and not inst.doorstate then
		CloseDoor(inst)
	end
end

local function ToggleLock(inst, doer)
    inst.components.activatable.inactive = true
	if doer==nil then 
		return
	end
	local authorized=IsAuthorized(inst,doer)
	
	if authorized then
		local b = not inst.islocked
		SetLock(inst,b)
		local paireddoor=FindPairedDoor(inst)
		if paireddoor and IsAuthorized(paireddoor,doer) then
			SetLock(paireddoor,b)
		end
	end
	
	if doer.components.talker then
		local str=""
		local typestr=""
		if inst.isdoor==true then
			typestr=TUNING.DYC_SUPERWALL_STRINGS.str1_2
		else
			typestr=TUNING.DYC_SUPERWALL_STRINGS.str0_2
		end
		if not authorized then
			local owner=Id2Player(inst.dyc_ownerid)
			if owner~=nil then
				if owner.components.talker then
					owner.components.talker:Say(doer.name..TUNING.DYC_SUPERWALL_STRINGS.str13_2..typestr..TUNING.DYC_SUPERWALL_STRINGS.str6,4)
				end
				str=TUNING.DYC_SUPERWALL_STRINGS.str3..typestr..TUNING.DYC_SUPERWALL_STRINGS.str5..owner.name..TUNING.DYC_SUPERWALL_STRINGS.str6.."\n"
			end
			str=str..TUNING.DYC_SUPERWALL_STRINGS.str12
			doer.components.talker:Say(str,4)
		else
			if inst.islocked then
				str=str..TUNING.DYC_SUPERWALL_STRINGS.str27
			else
				str=str..TUNING.DYC_SUPERWALL_STRINGS.str28
			end
			doer.components.talker:Say(str,4)
		end
	end
	
end

local function getdooractionstring(inst)
    return IsOpen(inst) and "CLOSE" or "OPEN"
end
-------------------------------------------------------------------------------

local function getdescription(inst,viewer)
	local olddes=GetDescription(viewer, inst, inst.components.inspectable:GetStatus(viewer))
	if TUNING.DYC_SUPERWALL_OWNERSHIP==0 then
		return olddes
	end
	local ownerid=inst.dyc_ownerid
	local typestr=""
	if inst.isdoor==true then
		typestr=TUNING.DYC_SUPERWALL_STRINGS.str1_2
	else
		typestr=TUNING.DYC_SUPERWALL_STRINGS.str0_2
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

local function onsave(inst, data)
    local rot = CalcRotationEnum(inst.Transform:GetRotation(), inst.isdoor)
    data.rot = rot > 0 and rot or nil
    data.offsetdoor = inst.offsetdoor
    data.swingright = inst._isswingright ~= nil and inst._isswingright:value() or nil
    data.isopen = inst._isopen ~= nil and inst._isopen:value() or nil
	if inst.dyc_ownerid~=nil then
		data.dyc_ownerid=inst.dyc_ownerid
	end
	
	if inst.islocked~=nil then
		data.islocked=inst.islocked
	end
end

local function onload(inst, data)
    if data ~= nil then
        inst.offsetdoor = data.offsetdoor

        if inst._isswingright ~= nil then
            SetIsSwingRight(inst, data.swingright or (data.doorpairside == 2)) -- data.doorpairside is deprecated v2, swingright is v3 
        end

        local rotation = 0
        if data.rotation ~= nil then
            -- very old style of save data. updates save data to v2 format, safe to remove this when we go out of the beta branch
            rotation = data.rotation - 90
        elseif data.rot ~= nil then
            rotation = data.rot*45
        end
        SetOrientation(inst, rotation)

        if data.isopen then
            OpenDoor(inst, true)
        elseif inst._isswingright ~= nil and inst._isswingright:value() then
            GetAnimState(inst):PlayAnimation(GetAnimName(inst, "idle"))
        end
		
		if data.dyc_ownerid~=nil then
			inst.dyc_ownerid=data.dyc_ownerid
		end
		
		if data.islocked~=nil then
			inst.islocked=data.islocked
		end
    end
	if inst.components.workable.workleft<0.25*inst.iniworkleft then
		inst.components.workable.workleft=inst.iniworkleft
	end
	inst.workleft=inst.components.workable.workleft
	inst.wallpercent=inst.components.workable.workleft/inst.iniworkleft
	ChangeWallColor(inst)
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
	
	if not inst.islocked then
		if inst.doorchanging<0 and inst.doorstate then
			OpenDoor(inst)
			-- OpenDoor(FindPairedDoor(inst))
		elseif inst.doorchanging>0 and not inst.doorstate then
			CloseDoor(inst)
			-- CloseDoor(FindPairedDoor(inst))
		end
	end
end



local function MakeWall(name, builds, isdoor)
    local assets, custom_wall_prefabs

    if isdoor then
        custom_wall_prefabs = { name.."_anim" }
        for i, v in ipairs(wall_prefabs) do
            table.insert(custom_wall_prefabs, v)
        end
    else
        assets =
        {
            -- Asset("ANIM", "anim/"..builds.wide..".zip"),
        }
        -- if builds.narrow then
            -- table.insert(assets, Asset("ANIM", "anim/"..builds.narrow..".zip"))
        -- end
    end

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState() --V2C: need this even if we are door, for mouseover sorting
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()
		if TUNING.DYC_SUPERWALL_MINIMAPICON then
			inst.entity:AddMiniMapEntity()
			inst.MiniMapEntity:SetPriority(-1)
			if isdoor then
				inst.MiniMapEntity:SetIcon( "minimap_fence_gate.tex" )
			else
				inst.MiniMapEntity:SetIcon( "minimap_fence.tex" )
			end
		end

        inst.Transform:SetEightFaced()

        MakeObstaclePhysics(inst, .5)
        inst.Physics:SetDontRemoveOnSleep(true)

        inst:AddTag("wall")
		inst:AddTag("superwall")
        inst:AddTag("alignwall")
        inst:AddTag("noauradamage")
        inst:AddTag("nointerpolate")
		inst:AddTag("floodblocker")
		
		inst.doorstate=true
		inst.doorchanging=1
		inst.iniworkleft=4
		inst.workleft=inst.iniworkleft
		inst.wallpercent=1
		inst.loot=isdoor and "log" or "twigs"
		inst.lootnum=isdoor and 2 or 1
		inst.destroysound="dontstarve/common/destroy_wood"
		inst["dycislastworkvalid"..ransuffix]=false
		inst.islocked=false

        if isdoor then
            inst.isdoor = true
            inst:AddTag("door")
            inst._isopen = net_bool(inst.GUID, name.."._open", "doorstatedirty")
            inst._isswingright = net_bool(inst.GUID, name.."._swingright", "doorstatedirty")
            inst.GetActivateVerb = getdooractionstring
        else
            inst.AnimState:SetBank(builds.wide)
            inst.AnimState:SetBuild(builds.wide)
            inst.AnimState:PlayAnimation("idle")

            MakeSnowCoveredPristine(inst)
        end

        inst._pfpos = nil
        inst._ispathfinding = net_bool(inst.GUID, "_ispathfinding", "onispathfindingdirty")
        makeobstacle(inst)
        --Delay this because makeobstacle sets pathfinding on by default
        --but we don't to handle it until after our position is set
        inst:DoTaskInTime(0, InitializePathFinding)
		
		inst.OnRemoveEntity = onremove
		

        -----------------------------------------------------------------------
        inst.entity:SetPristine()
        if not TheWorld.ismastersim then
            if isdoor then
                inst:DoTaskInTime(0, OnInitDoorClient)   --这个是什么玩意？。。。
            end

            return inst
        end
		
		inst:DoTaskInTime(FRAMES,function() 
			local x,y,z=inst:GetPosition():Get()
			if x==0 and y==0 and z==0 and inst.dyc_ownerid==nil then
				inst:Remove()
			end
		end)

        if isdoor then
            inst.dooranim = SpawnPrefab(name.."_anim")
            inst.dooranim.entity:SetParent(inst.entity)
            inst.highlightforward = inst.dooranim
        end

        inst.builds = builds

        inst:AddComponent("inspectable")
		inst.components.inspectable.descriptionfn=getdescription
        inst:AddComponent("lootdropper")
        inst.components.lootdropper:SetLoot(
            isdoor and
            { "boards", "boards", "rope" } or
            { "twigs" }
        )

        inst:AddComponent("workable")
        inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
        inst.components.workable:SetWorkLeft(inst.iniworkleft)
        inst.components.workable:SetOnFinishCallback(onhammered)
        inst.components.workable:SetOnWorkCallback(onwork)
		inst.components.workable.savestate=true

        inst:AddComponent("combat")
        inst.components.combat:SetKeepTargetFunction(keeptargetfn)
        inst.components.combat.onhitfn = onattacked

        inst:AddComponent("health")
		inst.components.health:SetMaxHealth(1000)
		inst.components.health.currenthealth = 1000
		inst.components.health.ondelta = onhealthchange
        inst.components.health.canheal = false
        inst.components.health.nofadeout = true
		-- inst.components.health:SetAbsorptionAmount(1)
        -- inst.components.health:SetAbsorptionAmountFromPlayer(1)
        -- inst.components.health.fire_damage_scale = 0



        MakeHauntableWork(inst)

        if isdoor then
            inst:AddComponent("activatable")
            inst.components.activatable.OnActivate = ToggleLock
            inst.components.activatable.standingaction = true
        else
            MakeSnowCovered(inst)
        end

        

        inst.OnSave = onsave
        inst.OnLoad = onload
		if isdoor then
			inst.doortask = inst:DoPeriodicTask(0.25, function() update_door(inst) end)
		end
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
		
		inst.FixUpFenceOrientation=FixUpFenceOrientation
		inst.ChangeWallColor=ChangeWallColor
		inst.GetAnimState=GetAnimState
		
		function inst:SetWallHeight(height)
			self.wallpercent=height/4
			ChangeWallColor(self)
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

        return inst
    end

    return Prefab(name, fn, assets, custom_wall_prefabs or wall_prefabs)
end

-------------------------------------------------------------------------------
local function MakeWallAnim(name, builds, isdoor)
    local assets =
    {
        -- Asset("ANIM", "anim/"..builds.wide..".zip"),
    }
    -- if builds.narrow then
        -- table.insert(assets, Asset("ANIM", "anim/"..builds.narrow..".zip"))
    -- end

    local function fn()
        local inst = CreateEntity()

        if isdoor then
            --V2C: speecial =) must be the 1st tag added b4 AnimState component
            inst:AddTag("can_offset_sort_pos")
        end

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        inst.Transform:SetEightFaced()

        inst.AnimState:SetBank(builds.wide)
        inst.AnimState:SetBuild(builds.wide)
        inst.AnimState:PlayAnimation("idle")

        inst:AddTag("FX")
        inst:AddTag("nointerpolate")

        if isdoor then
            inst.AnimState:Hide("mouseover")
        end

        MakeSnowCoveredPristine(inst)

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            inst.OnEntityReplicated = OnWallAnimReplicated

            return inst
        end

        MakeSnowCovered(inst)

        inst.persists = false

        return inst
    end

    return Prefab(name, fn, assets)
end

-------------------------------------------------------------------------------
local function MakeInvItem(name, placement, animdata, isdoor)
    local assets =
    {
        -- Asset("ANIM", "anim/"..animdata..".zip"),
    }
    local item_prefabs =
    {
        placement,
    }

    local function ondeploywall(inst, pt, deployer, rot)
        local wall = SpawnPrefab(placement) 
        if wall ~= nil then 
			
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

            FixUpFenceOrientation(wall, rot or 0)

            wall.SoundEmitter:PlaySound("dontstarve/common/place_structure_wood")
        end
    end

    local function itemfn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst:AddTag(isdoor and "gatebuilder" or "fencebuilder")

        inst.AnimState:SetBank(animdata)
        inst.AnimState:SetBuild(animdata)
        inst.AnimState:PlayAnimation("inventory")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM

        inst:AddComponent("inspectable")
        inst:AddComponent("inventoryitem")
		inst.components.inventoryitem.atlasname = "images/inventoryimages.xml"
		inst.components.inventoryitem.imagename = string.sub(name,5)

        inst:AddComponent("deployable")
        inst.components.deployable.ondeploy = ondeploywall
        inst.components.deployable:SetDeployMode(DEPLOYMODE.WALL)

        -- MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
        -- MakeSmallPropagator(inst)

        -- inst:AddComponent("fuel")
        -- inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL

        -- MakeDragonflyBait(inst, 3)

        MakeHauntableLaunch(inst)

        return inst
    end

    return Prefab(name, itemfn, assets, item_prefabs)
end


-------------------------------------------------------------------------------
local function placersetheight(inst,height) 
	inst.wallpercent=height/4
	if inst.ChangeWallColor then
		inst:ChangeWallColor()
	else
		inst.AnimState:PlayAnimation(getwallanim_dyc(inst))
	end
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
			inst.Label:SetText(TUNING.DYC_SUPERWALL_STRINGS.singlewallbuild_2.."\n"..TUNING.DYC_SUPERWALL_STRINGS.heightadjustment_2..":"..heightadjustmentsign..SuperWall.wallBuilderHeightAdjustment.."\n  \n  \n  \n  \n  \n  \n  \n  \n  \n  ")
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
							SuperWall.BuildWall(pt.x, pt.z,inst.Transform:GetRotation())
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


local function placerupdate(inst)
    FixUpFenceOrientation(inst, nil)
end

local function MakeWallPlacer(placer, placement, builds, isdoor)
    local CreateDoorAnim = isdoor and function(inst)
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()

        inst.Transform:SetEightFaced()

        inst.AnimState:SetBank(builds.wide)
        inst.AnimState:SetBuild(builds.wide)
        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:Hide("mouseover")
        inst.AnimState:SetLightOverride(1)

        inst:AddTag("FX")
        inst:AddTag("placer")
        inst:AddTag("NOCLICK")
        --[[Non-networked entity]]
        inst.entity:SetCanSleep(false)
        inst.persists = false

        return inst
    end or nil

    return MakePlacer(
        placer,
        builds.wide,
        builds.wide,
        not isdoor and "idle" or "",
        nil, nil, true, nil, 0, "eight", 
        function(inst)
			
			local oldonupdate=inst.components.placer.OnUpdate
			inst.components.placer.OnUpdate=function(self,dt)
				oldonupdate(self,dt)
				if self.onupdatetransform ~= nil then
					self.onupdatetransform(self.inst)
				end
			end
			
            inst.components.placer.onupdatetransform = placerupdate
			inst.FixUpFenceOrientation=FixUpFenceOrientation
			inst.ChangeWallColor=ChangeWallColor
			inst.GetAnimState=GetAnimState
			
			
            inst.builds = builds
            if isdoor then
                inst.isdoor = true
                inst.isswingright = false
                inst.dooranim = CreateDoorAnim()
                inst.dooranim.entity:SetParent(inst.entity)
                inst.components.placer:LinkEntity(inst.dooranim)
            end
			wallplacerpostinit(inst)
        end)
end

return MakeWall("dyc_fence", {wide="fence", narrow="fence_thin"}, false),
    MakeInvItem("dyc_fence_item", "dyc_fence", "fence", false),
    MakeWallPlacer("dyc_fence_item_placer", "dyc_fence", {wide="fence", narrow="fence_thin"}, false),

    MakeWall("dyc_fence_gate", {wide="fence_gate", narrow="fence_gate_thin"}, true),
    MakeWallAnim("dyc_fence_gate_anim", {wide="fence_gate", narrow="fence_gate_thin"}, true),
    MakeInvItem("dyc_fence_gate_item", "dyc_fence_gate", "fence_gate", true),
    MakeWallPlacer("dyc_fence_gate_item_placer", "dyc_fence_gate", {wide="fence_gate", narrow="fence_gate_thin"}, true)
