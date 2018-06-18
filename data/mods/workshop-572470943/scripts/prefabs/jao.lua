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

------------------------------------------
-- import
------------------------------------------
local MakePlayerCharacter = require "prefabs/player_common"

------------------------------------------
-- Imagens e animacoes
------------------------------------------
local assets = {
    Asset( "ANIM", "anim/jao.zip" ),
    Asset( "ANIM", "anim/ghost_jao_build.zip" ),
}

------------------------------------------
-- Scripts
------------------------------------------
local prefabs = {}

------------------------------------------
-- Itens iniciais de inventario
------------------------------------------
local start_inv = {
    "jaostaff", 	-- Cajado
    "runes/summonstone",	-- Item para invocar
    "book_tentacles",	-- Livro dos tentaculos
}

------------------------------------------
-- Recuperar Linguagem Definida 
------------------------------------------
local SPEECH = TUNING.JAO.SPEECH

------------------------------------------
-- Perca de sanidade proximo de fogo
------------------------------------------
local function sanityfn(inst)
    local x,y,z = inst.Transform:GetWorldPosition()	
    local delta = 0
    local max_rad = 10
    local ents = TheSim:FindEntities(x,y,z, max_rad, {"fire"})
    for k,v in pairs(ents) do 
    	if v.components.burnable and v.components.burnable.burning then
            local sz = -TUNING.SANITYAURA_TINY
            local rad = v.components.burnable:GetLargestLightRadius() or 5
            sz = sz * ( math.min(max_rad, rad) / max_rad )
            local distsq = inst:GetDistanceSqToInst(v)
            delta = delta + sz/math.max(1, distsq)
    	end
    end
    return delta
end

------------------------------------------
-- Falas Com Skip para Comer
------------------------------------------
local function saySkipInfo( inst )
    local random = math.random(0,4)
    if inst.skipInvocado then
        if random == 1 then
            inst.components.talker:Say(SPEECH.JAO.FEED.SKIP.ZERO)--"Como voce esta, Skip?")
        elseif random == 2 then
            inst.components.talker:Say(SPEECH.JAO.FEED.SKIP.UM)
        else
            inst.components.talker:Say(SPEECH.JAO.FEED.SKIP.DOIS)    
        end
    else
        inst.components.talker:Say(SPEECH.JAO.FEED.SKIP.FAIL)
    end    
end

------------------------------------------
-- Falas Com Skip para Pegar
------------------------------------------
local function saySkipAction( inst )
    local random = math.random(0,3)
    if inst.skipInvocado then
        if random == 1 then
            inst.components.talker:Say(SPEECH.JAO.ACTION.SKIP.ZERO)
        elseif random == 2 then
            inst.components.talker:Say(SPEECH.JAO.ACTION.SKIP.UM) 
        end  
    else
        inst.components.talker:Say(SPEECH.JAO.ACTION.SKIP.FAIL)
    end
end

------------------------------------------
-- Falas Com Skip para Jogar No Chão
------------------------------------------
local function saySkipDrop( inst )
    local random = math.random(0,3)
    if inst.skipInvocado then
        if random == 1 then
            inst.components.talker:Say(SPEECH.JAO.SECONDACTION.SKIP.ZERO)
        elseif random == 2 then
            inst.components.talker:Say(SPEECH.JAO.SECONDACTION.SKIP.UM) 
        end  
    else
        inst.components.talker:Say(SPEECH.JAO.SECONDACTION.SKIP.FAIL)
    end
end

------------------------------------------
-- Falas Com Rhino para Comer
------------------------------------------
local function sayRhinoInfo( inst )
    local random = math.random(0,4)
    if inst.rhinoInvocado then
        if random == 1 then
            inst.components.talker:Say(SPEECH.JAO.FEED.RHINO.ZERO)
        elseif random == 2 then
            inst.components.talker:Say(SPEECH.JAO.FEED.RHINO.UM)
        else
            inst.components.talker:Say(SPEECH.JAO.FEED.RHINO.DOIS)    
        end
    else
        inst.components.talker:Say(SPEECH.JAO.FEED.RHINO.FAIL)
    end    
end

------------------------------------------
-- Falas Com Rhino para Quebrar
------------------------------------------
local function sayRhinoDestroy( inst )
    local random = math.random(0,3)
    if inst.rhinoInvocado then
        if random == 1 then
            inst.components.talker:Say(SPEECH.JAO.ACTION.RHINO.ZERO)
        elseif random == 2 then
            inst.components.talker:Say(SPEECH.JAO.ACTION.RHINO.UM) 
        end  
    else
        inst.components.talker:Say(SPEECH.JAO.ACTION.RHINO.FAIL)
    end
end

------------------------------------------
-- Falas Com Chop para Comer
------------------------------------------
local function sayChopInfo( inst )
    local random = math.random(0,4)
    if inst.chopInvocado then
        if random == 1 then
            inst.components.talker:Say(SPEECH.JAO.FEED.CHOP.ZERO)
        elseif random == 2 then
            inst.components.talker:Say(SPEECH.JAO.FEED.CHOP.UM)    
        else
            inst.components.talker:Say(SPEECH.JAO.FEED.CHOP.DOIS)     
        end
    else
        inst.components.talker:Say(SPEECH.JAO.FEED.CHOP.FAIL)
    end    
end

------------------------------------------
-- Falas Com Chop para Proteger
------------------------------------------
local function sayChopAction( inst )
    local random = math.random(0,3)
    if inst.chopInvocado then
        if random == 1 then
            inst.components.talker:Say(SPEECH.JAO.ACTION.CHOP.ZERO)
        elseif random == 2 then
            inst.components.talker:Say(SPEECH.JAO.ACTION.CHOP.UM) 
        end  
    else
        inst.components.talker:Say(SPEECH.JAO.ACTION.CHOP.FAIL)
    end
end

------------------------------------------
-- Falas Com Jill para Comer
------------------------------------------
local function sayJillInfo( inst )
    local random = math.random(0,3)
    if inst.jillInvocado then
        if random == 1 then
            inst.components.talker:Say(SPEECH.JAO.FEED.JILL.UM)
        else
            inst.components.talker:Say(SPEECH.JAO.FEED.JILL.DOIS)    
        end
    else
        inst.components.talker:Say(SPEECH.JAO.FEED.JILL.FAIL)
    end    
end

------------------------------------------
-- Falas Com Aron para Comer
------------------------------------------
local function sayAronInfo( inst )
    local random = math.random(0,3)
    if inst.aronInvocado then
        if random == 1 then
            inst.components.talker:Say(SPEECH.JAO.FEED.ARON.UM)
        else 
            inst.components.talker:Say(SPEECH.JAO.FEED.ARON.DOIS)   
        end
    else
        inst.components.talker:Say(SPEECH.JAO.FEED.ARON.FAIL)
    end    
end

------------------------------------------
-- Falas Com Aron para Transformar
------------------------------------------
local function sayAronTransform( inst )
    local random = math.random(0,3)
    if inst.aronInvocado then
        if random == 1 then
            inst.components.talker:Say(SPEECH.JAO.ACTION.ARON.UM)
        elseif random == 2 then
            inst.components.talker:Say(SPEECH.JAO.ACTION.ARON.DOIS) 
        end  
    else
        inst.components.talker:Say(SPEECH.JAO.ACTION.ARON.FAIL)
    end
end

------------------------------------------
-- Falas Com Aron Ativar/Desativar Modo cacador
------------------------------------------
local function sayAronHunt( inst )
    local random = math.random(0,3)
    if inst.aronInvocado then
        if random == 1 then
            inst.components.talker:Say(SPEECH.JAO.SECONDACTION.ARON.UM)
        elseif random == 2 then
            inst.components.talker:Say(SPEECH.JAO.SECONDACTION.ARON.DOIS) 
        end  
    else
        inst.components.talker:Say(SPEECH.JAO.SECONDACTION.ARON.FAIL)
    end
end

local function OnDespawn(inst, data)
    for k,v in pairs(inst.components.leader.followers) do
        if k.prefab=="summonjarvi" then
            k:Remove()
        end
    end
end

------------------------------------------
-- Inicializacao no cliente e no host
------------------------------------------
local common_postinit = function(inst) 
    ------------------------------------------
    -- Icone do minimapa
    ------------------------------------------
    inst.MiniMapEntity:SetIcon( "jao.tex" )
    ------------------------------------------
    -- Tags
    ------------------------------------------
    inst:AddTag("bookbuilder")
    inst:AddTag("jaobuilder")
    inst:AddTag("insomniac")
    ------------------------------------------
    -- Adicionar Acao para a Tecla F1
    ------------------------------------------
    inst:AddComponent("keyhandler")
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYF1, "infoSkip")
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYF1, "infoSkip2")
    AddModRPCHandler("jao", "infoSkip2", saySkipInfo )
    ------------------------------------------
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYZ, "actionSkip")
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYZ, "actionSkip2")
    AddModRPCHandler("jao", "actionSkip2", saySkipAction )
    ------------------------------------------
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYX, "actionDrop")
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYX, "actionDrop2")
    AddModRPCHandler("jao", "actionDrop2", saySkipDrop )
    ------------------------------------------
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYF2, "infoRhino")
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYF2, "infoRhino2")
    AddModRPCHandler("jao", "infoRhino2", sayRhinoInfo )
    ------------------------------------------
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYC, "actionDestroy")
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYC, "actionDestroy2")
    AddModRPCHandler("jao", "actionDestroy2", sayRhinoDestroy )       
    ------------------------------------------
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYF3, "infoChop")
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYF3, "infoChop2")
    AddModRPCHandler("jao", "infoChop2", sayChopInfo )
    ------------------------------------------
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYV, "actionProtect")
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYV, "actionProtect2")
    AddModRPCHandler("jao", "actionProtect2", sayChopAction ) 
    ------------------------------------------
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYF4, "infoJill")
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYF4, "infoJill2")
    AddModRPCHandler("jao", "infoJill2", sayJillInfo )
    ------------------------------------------
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYF5, "infoAron")
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYF5, "infoAron2")
    AddModRPCHandler("jao", "infoAron2", sayAronInfo )
    ------------------------------------------
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYB, "actionTransform")
    inst.components.keyhandler:AddActionListener("jao", TUNING.JAO.KEYB, "actionTransform2")
    AddModRPCHandler("jao", "actionTransform2", sayAronTransform )
    ------------------------------------------
end

------------------------------------------
-- Principal
------------------------------------------
local master_postinit = function(inst)
    ------------------------------------------
    -- Sons que o persongem ira fazer
    ------------------------------------------
    inst.soundsname = "wilson"	
    ------------------------------------------
    -- Permitir que leia livros
    ------------------------------------------
    inst:AddComponent("reader")	
    ------------------------------------------
    inst:AddComponent("leader")
    ------------------------------------------
    inst:AddComponent("knownlocations")
    ------------------------------------------
    -- Estatisticas
    ------------------------------------------
    ------------------------------------------
    -- Vida
    ------------------------------------------
    inst.components.health.fire_damage_scale = 1
    inst.components.health:SetMaxHealth(80)
    inst.components.health:StartRegen(1, 10)
    ------------------------------------------
    -- Fome
    ------------------------------------------
    inst.components.hunger:SetMax(80)
    inst.components.hunger:SetRate(0.05)
    ------------------------------------------
    -- Sanidade
    ------------------------------------------
    inst.components.sanity:SetMax(170)
    inst.components.sanity.custom_rate_fn = sanityfn
    inst.components.sanity.night_drain_mult = 0
    inst.components.sanity.neg_aura_mult = 0
    ------------------------------------------
    -- Dano realizado
    ------------------------------------------
    inst.components.combat.damagemultiplier = 0.8
     ------------------------------------------
    local self = inst.components.combat
    local old = self.GetAttacked
    ------------------------------------------
    function self:GetAttacked(attacker, damage, weapon, stimuli)
        if attacker and attacker:HasTag("summonedbyplayer") then
            return true
        end
        return old(self, attacker, damage, weapon, stimuli)
    end
    ------------------------------------------
    -- Conhecimento de magia
    ------------------------------------------
    inst.components.builder.magic_bonus = 2
    ------------------------------------------
    -- Taxas de temperatura
    ------------------------------------------
    inst.components.temperature.mintemp = 20
    inst.components.temperature.inherentsummerinsulation = TUNING.INSULATION_LARGE
    inst.components.temperature.inherentinsulation = TUNING.INSULATION_LARGE 
    ------------------------------------------
    inst.skipInvocado  = false
    ------------------------------------------
    inst.rhinoInvocado = false
    ------------------------------------------
    inst.chopInvocado  = false
    ------------------------------------------
    inst.jillInvocado  = false
    ------------------------------------------
    inst.aronInvocado  = false
    ------------------------------------------
    inst.objective = nil
    ------------------------------------------
    inst.prey = nil
    ------------------------------------------
    inst.OnDespawn = OnDespawn
    ------------------------------------------
    -- Penalidade de ressucitar
    ------------------------------------------
    inst.components.health.SetPenalty = function(self, penalty)
        self.penalty = math.clamp(penalty, 0, 0)
    end
    ------------------------------------------
    local x, y, z =  inst.Transform:GetWorldPosition()
    ------------------------------------------  
    inst:DoTaskInTime(0, function(inst) 
        SpawnPrefab("summonjarvi").Transform:SetPosition( Point(inst.Transform:GetWorldPosition()):Get() )
    end)
    ------------------------------------------   
    inst:ListenForEvent("death", function ( inst )
        local x,y,z = inst.Transform:GetWorldPosition()
        local ents = TheSim:FindEntities(x,y,z, 25, {"summonjarvi"})
        for k,jarvi in pairs(ents) do
             jarvi:Remove()
        end
    end)    
    ------------------------------------------
    inst:ListenForEvent("ms_respawnedfromghost", function ( inst )
        SpawnPrefab("summonjarvi").Transform:SetPosition( Point(inst.Transform:GetWorldPosition()):Get() )
    end)
    ------------------------------------------
    -- Desinvocar pets
    ------------------------------------------
    inst:ListenForEvent("onattackother", function(inst, data)
        local damage_mult = 1
        if (data.target:HasTag("summonedbyplayer")      or
            data.target.prefab == "summons/summonskip"  or 
            data.target.prefab == "summons/summonrhino" or 
            data.target.prefab == "summons/summonchop"  or 
            data.target.prefab == "summons/summonjill"  or 
            data.target.prefab == "summons/summonaron") then
            inst.components.talker:Say("Go rest for a while...!")
            damage_mult = 10000 
        else
            damage_mult = 0.8               
        end
        inst.components.combat.damagemultiplier = damage_mult
    end)
    ------------------------------------------
end

return MakePlayerCharacter("jao", prefabs, assets, common_postinit, master_postinit, start_inv)