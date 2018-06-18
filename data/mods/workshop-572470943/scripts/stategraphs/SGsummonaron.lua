-----------------------------------------------------------------------------------
-- This file has been developed exclusively for the mod "Jão the Great Summoner" --
--(http://steamcommunity.com/sharedfiles/filedetails/?id=572470943). 		     --
-- Any unauthorized use will be reported to the DMCA. 				             --
-- To use any file or sprite ask my permission.					                 --
--										                                         --
-- Author: Paulo Victor de Oliveira Leal					                     --
-- Contact: ciclopiano@gmail.com						                         --
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

require("stategraphs/commonstates")

local actionhandlers = 
{
    ActionHandler(ACTIONS.GOHOME, "gohome"),
    ActionHandler(ACTIONS.EAT, "eat"),
    ActionHandler(ACTIONS.PICKUP, "pickup"),
    ActionHandler(ACTIONS.EQUIP, "pickup"),
    ActionHandler(ACTIONS.ADDFUEL, "pickup"),
}

local function SpawnIceFx(inst, target)
    if not inst or not target then return end
    local numFX = math.random(15,20)
    local pos = inst:GetPosition()
    local targetPos = target:GetPosition()
    local vec = targetPos - pos
    vec = vec:Normalize()
    local dist = pos:Dist(targetPos)
    local angle = inst:GetAngleToPoint(targetPos:Get())

    for i = 1, numFX do
        inst:DoTaskInTime(math.random() * 0.25, function(inst)
            local prefab = "icespike_fx_"..math.random(1,4)
            local fx = SpawnPrefab(prefab)
            if fx then
                local x = GetRandomWithVariance(0, 3)
                local z = GetRandomWithVariance(0, 3)
                local offset = (vec * math.random(dist * 0.25, dist)) + Vector3(x,0,z)
                fx.Transform:SetPosition((offset+pos):Get())
            end
        end)
    end
end

local events=
{
    CommonHandlers.OnStep(),
    CommonHandlers.OnLocomote(true,true),
    CommonHandlers.OnSleep(),
    CommonHandlers.OnFreeze(),
    CommonHandlers.OnAttack(),
    CommonHandlers.OnAttacked(true),
    CommonHandlers.OnDeath(),
    
}

local function beardit(inst, anim)
    return inst.beardlord and "beard_"..anim or anim
end

local states=
{
    State{
        name= "funnyidle",
        tags = {"busy"},
        
        onenter = function(inst)
        inst.Physics:Stop()
            
            if inst.beardlord then
                inst.AnimState:PlayAnimation("beard_taunt")
                inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/wererabbit_taunt")
			elseif inst.components.health:GetPercent() < TUNING.BUNNYMAN_PANIC_THRESH then
				inst.AnimState:PlayAnimation("idle_angry")
				inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/angry_idle")
            elseif inst.components.follower.leader and inst.components.follower:GetLoyaltyPercent() < 0.05 then
                inst.AnimState:PlayAnimation("hungry")
                inst.SoundEmitter:PlaySound("dontstarve/wilson/hungry")
            elseif inst.components.combat.target then
                inst.AnimState:PlayAnimation("idle_angry")
                inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/angry_idle")
            elseif inst.components.follower.leader and inst.components.follower:GetLoyaltyPercent() > 0.3 then
                inst.AnimState:PlayAnimation("idle_happy")
                inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/happy")
            else
                inst.AnimState:PlayAnimation("idle_creepy")
                inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/idle_med")
            end
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },        
    },
    
    State {
    name = "frozen",
    tags = {"busy"},
    
        onenter = function(inst)
            inst.AnimState:PlayAnimation("frozen")
            inst.Physics:Stop()
            --inst.components.highlight:SetAddColour(Vector3(82/255, 115/255, 124/255))
        end,
    },

    
    
    State{
        name = "death",
        tags = {"busy"},
        
        onenter = function(inst, data)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/death")
            inst.AnimState:PlayAnimation("death")
            inst.Physics:Stop()
            RemovePhysicsColliders(inst)            
            inst.causeofdeath = data and data.afflicter or nil
            inst.components.lootdropper:DropLoot(Vector3(inst.Transform:GetWorldPosition()))            
        end,
        
    },
    
    State{
    name = "abandon",
    tags = {"busy"},
    
    onenter = function(inst, leader)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("abandon")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/angry_idle")
            inst:FacePoint(Vector3(leader.Transform:GetWorldPosition()))
    end,
    
        events =
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },        
    },
    
    State{
        name = "attack",
        tags = {"attack", "busy"},
        
        onenter = function(inst)
            if inst.beardlord then
                inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/wererabbit_attack")
            else
                inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/attack")       
            end
            
            local x,y,z = inst.Transform:GetWorldPosition()
            local ents = TheSim:FindEntities(x,y,z, 6)
            for k,v in pairs(ents) do
                if v:HasTag("wall") or v:HasTag("structure") or v:HasTag("player") or v:HasTag("beaverness") then
                    inst.components.combat:SetAreaDamage(0, TUNING.DEERCLOPS_AOE_SCALE)
                    inst.area = false
                    break
                else
                    inst.components.combat:SetAreaDamage(4, TUNING.DEERCLOPS_AOE_SCALE)
                    inst.area = true
                end  
            end  
            
            inst.components.combat:StartAttack()
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation(beardit(inst,"atk"))
        end,
        
        timeline=
        {
            TimeEvent(4*FRAMES, function(inst) if inst.area then SpawnIceFx(inst, inst.components.combat.target) end end),
            TimeEvent(6*FRAMES, function(inst) 
                inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/bite")        
                inst.components.combat:DoAttack() inst.sg:RemoveStateTag("attack") 
                inst.sg:RemoveStateTag("busy") 
            end),
        },
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },
    },

    State{
        name = "eat",
        tags = {"busy"},
        
        onenter = function(inst)
            inst.Physics:Stop()            
            inst.AnimState:PlayAnimation("eat")
      inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/eat")            
        end,
        
        timeline=
        {
            TimeEvent(20*FRAMES, function(inst) inst:PerformBufferedAction() end),
        },
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },        
    },
    State{
        name = "hit",
        tags = {"busy"},
        
        onenter = function(inst)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/hurt")
            inst.AnimState:PlayAnimation("hit")
            inst.Physics:Stop()            
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },        
    },    
}

CommonStates.AddWalkStates(states,
{
  walktimeline = {
    TimeEvent(0*FRAMES, function(inst)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/hop")
        end),
    TimeEvent(4*FRAMES, function(inst)
            inst.components.locomotor:WalkForward()
        end),
    TimeEvent(12*FRAMES, PlayFootstep ),
    TimeEvent(12*FRAMES, function(inst)
            inst.Physics:Stop()
        end),
  },
},
{
    startwalk = function(inst) return beardit(inst,"walk_pre") end,
    walk = function(inst) return beardit(inst,"walk_loop") end,
    stopwalk = function(inst) return beardit(inst,"walk_pst") end,
},
function(inst) return not inst.beardlord end
)

CommonStates.AddRunStates(states,
{
  runtimeline = {
    TimeEvent(0*FRAMES, function(inst)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/hop")
        end),
    TimeEvent(4*FRAMES, function(inst)
            inst.components.locomotor:RunForward()
        end),
    TimeEvent(8*FRAMES, PlayFootstep ),
    TimeEvent(8*FRAMES, function(inst)
            inst.Physics:Stop()
        end),
  },
},
{
    startrun = function(inst) return beardit(inst,"run_pre") end,
    run = function(inst) return beardit(inst,"run_loop") end,
    stoprun = function(inst) return beardit(inst,"run_pst") end,
},
function(inst) return not inst.beardlord end
)

CommonStates.AddSleepStates(states,
{
  sleeptimeline = 
  {
    TimeEvent(35*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/sleep") end ),
  },
})

CommonStates.AddIdle(states,"funnyidle", function(inst) return beardit(inst,"idle_angry") end, 
{
    TimeEvent(0*FRAMES, function(inst) if inst.beardlord then inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/wererabbit_breathin") end end ),
    TimeEvent(15*FRAMES, function(inst) if inst.beardlord then inst.SoundEmitter:PlaySound("dontstarve/creatures/bunnyman/wererabbit_idle") end end ),
})

CommonStates.AddSimpleState(states,"refuse", "pig_reject", {"busy"})
CommonStates.AddFrozenStates(states)

CommonStates.AddSimpleActionState(states,"pickup", "pig_pickup", 10*FRAMES, {"busy"})

CommonStates.AddSimpleActionState(states, "gohome", "pig_pickup", 4*FRAMES, {"busy"})

    
return StateGraph("pig", states, events, "idle", actionhandlers)

