-----------------------------------------------------------------------------------
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
-- Esta funcao de biblioteca nos permite usar um arquivo em um local especificado. 
-- Permite usar para chamar variaveis globais de ambiente sem inicializa-los em nossos arquivos.
------------------------------------------
modimport("libs/env.lua")
modimport("libs/engine.lua")

------------------------------------------
-- Scripts a carregar
------------------------------------------
Load "chatinputscreen"
Load "consolescreen"
Load "textedit"

------------------------------------------
-- Acao de inicializacao.
------------------------------------------
use "data/actions/init"

------------------------------------------
-- Componente de inicializacao.
------------------------------------------
use "data/components/init"

------------------------------------------
-- Scripts necessarios
------------------------------------------
PrefabFiles = 
{
    "jao", "jaostaff",        "sourceofmagic",
    "summons/summonskip",     "runes/summonstone",
    "summons/summonrhino",    "runes/summonstonerhino",
    "summons/summonchop",     "runes/summonstonechop", 
    "summons/summonjill",     "runes/summonstonejill",
    "summons/summonaron",     "runes/summonstonearon", 
    "summons/summonminichop",
    "summons/summonjarvi",
}

------------------------------------------
-- Arquivos de importacao de imagens e animacao
------------------------------------------
Assets = 
{
    Asset( "IMAGE", "images/saveslot_portraits/jao.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/jao.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/selectscreen_portraits/jao.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/jao.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/selectscreen_portraits/jao_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/jao_silho.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "bigportraits/jao.tex" ),
    Asset( "ATLAS", "bigportraits/jao.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/map_icons/jao.tex" ),
    Asset( "ATLAS", "images/map_icons/jao.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/avatars/avatar_jao.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_jao.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/avatars/avatar_ghost_jao.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_jao.xml" ),
    ------------------------------------------
    Asset("ATLAS", "images/hud/magictab.xml"),
    Asset("IMAGE", "images/hud/magictab.tex"),
    ------------------------------------------
    Asset( "IMAGE", "images/inventoryimages/sourceofmagic.tex" ),
    Asset( "ATLAS", "images/inventoryimages/sourceofmagic.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/inventoryimages/runes/summonstone.tex" ),
    Asset( "ATLAS", "images/inventoryimages/runes/summonstone.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/inventoryimages/runes/summonstonerhino.tex" ),
    Asset( "ATLAS", "images/inventoryimages/runes/summonstonerhino.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/inventoryimages/runes/summonstonechop.tex" ),
    Asset( "ATLAS", "images/inventoryimages/runes/summonstonechop.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/inventoryimages/runes/summonstonejill.tex" ),
    Asset( "ATLAS", "images/inventoryimages/runes/summonstonejill.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/inventoryimages/runes/summonstonearon.tex" ),
    Asset( "ATLAS", "images/inventoryimages/runes/summonstonearon.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/inventoryimages/summons/summonaron.tex" ),
    Asset( "ATLAS", "images/inventoryimages/summons/summonaron.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/inventoryimages/summons/summonjill.tex" ),
    Asset( "ATLAS", "images/inventoryimages/summons/summonjill.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/inventoryimages/summons/summonchop.tex" ),
    Asset( "ATLAS", "images/inventoryimages/summons/summonchop.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/inventoryimages/summons/summonrhino.tex" ),
    Asset( "ATLAS", "images/inventoryimages/summons/summonrhino.xml" ),
    ------------------------------------------
    Asset( "IMAGE", "images/inventoryimages/summons/summonskip.tex" ),
    Asset( "ATLAS", "images/inventoryimages/summons/summonskip.xml" ),
    ------------------------------------------
}

------------------------------------------
-- Variaveis globais
------------------------------------------
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
------------------------------------------
local SITCOMMAND = GLOBAL.Action(4, true, true, 10,	false, false, nil)
local SITCOMMAND_CANCEL = GLOBAL.Action(4, true, true, 10, false, false, nil)
------------------------------------------
local MARCAR = GLOBAL.Action(4, true, true, 10,	false, false, nil)
local HUNT = GLOBAL.Action(4, true, true, 10,	false, false, nil)
------------------------------------------
local petSpeech = require "speech_pets"
local SPEECHBR = petSpeech.SPEECH_PETS.PORTUGUES
local SPEECHEN = petSpeech.SPEECH_PETS.ENGLISH

------------------------------------------
-- Variaveis Recebidas do ModInfo
------------------------------------------
GLOBAL.TUNING.JAO = {}
GLOBAL.TUNING.JAO.LANG  = GetModConfigData("lang")
GLOBAL.TUNING.JAO.KEYF1 = GetModConfigData("keyf1") or 282
GLOBAL.TUNING.JAO.KEYF2 = GetModConfigData("keyf2") or 283
GLOBAL.TUNING.JAO.KEYF3 = GetModConfigData("keyf3") or 284
GLOBAL.TUNING.JAO.KEYF4 = GetModConfigData("keyf4") or 285
GLOBAL.TUNING.JAO.KEYF5 = GetModConfigData("keyf5") or 286
GLOBAL.TUNING.JAO.KEYZ  = GetModConfigData("keyz")  or 122
GLOBAL.TUNING.JAO.KEYX  = GetModConfigData("keyx")  or 120
GLOBAL.TUNING.JAO.KEYC  = GetModConfigData("keyc")  or 99
GLOBAL.TUNING.JAO.KEYV  = GetModConfigData("keyv")  or 118
GLOBAL.TUNING.JAO.KEYB  = GetModConfigData("keyb")  or 98
 
 GLOBAL.TUNING.JAO.GROUNDTEST1 = GLOBAL.GROUND.IMPASSABLE
 GLOBAL.TUNING.JAO.GROUNDTEST2 = GLOBAL.GROUND.INVALID;
 
------------------------------------------
-- Recuperar Linguagem Definida Pelo Usario
------------------------------------------
local function definirLinguagem( )
    local speech_choosed = TUNING.JAO.LANG
    if speech_choosed == 0 then
        return SPEECHEN
    else
        return SPEECHBR
    end
    return SPEECHEN      
end


------------------------------------------
-- Definir Linguagem Padrao
------------------------------------------
local SPEECH = definirLinguagem( )
GLOBAL.TUNING.JAO.SPEECH  = SPEECH

------------------------------------------
-- Resposta do Skip
------------------------------------------
local function saySkipResp(inst)
    local x,y,z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x,y,z, 25, {"summonskip"})
    for k,skip in pairs(ents) do
        if skip ~= nil and skip ~= 0 then
            local health = skip.components.health:GetPercent()
            if health == 1 then
                skip.components.talker:Say(SPEECH.SKIP.STATUS.FULL)--"Estou bem senhor!\n Pronto para trabalhar!")
            elseif health > 0.5 then
                skip.components.talker:Say(SPEECH.SKIP.STATUS.HALF)
            else
                skip.components.talker:Say(SPEECH.SKIP.STATUS.EMPTY)
            end            
            print("SKIP VIDA".. health)
        end
    end
end

------------------------------------------
-- Esperando pelo clique de F1
------------------------------------------
AddModRPCHandler("jao", "infoSkip", saySkipResp )

------------------------------------------
-- Trocar se o Skip pode pegar coisas no chao ou nao
------------------------------------------
local function actionSkip(inst)   
    local x,y,z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x,y,z, 25, {"summonskip"})
    for k,skip in pairs(ents) do
        if skip ~= nil and skip ~= 0 then
            skip.components.talker:Say(SPEECH.SKIP.ACTION.PICK)
            skip.pick = not (skip.pick)           
        end
    end
end

------------------------------------------
-- Esperando pelo clique de Z
------------------------------------------
AddModRPCHandler("jao", "actionSkip", actionSkip )

------------------------------------------
-- Trocar se o Skip pode jogar coisas no chao
------------------------------------------
local function dropSkip(inst)
    local x,y,z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x,y,z, 25, {"summonskip"})
    for k,skip in pairs(ents) do
        if skip ~= nil and skip ~= 0 then
            if skip.components.inventory:NumItems( ) > 0 then
                skip.components.talker:Say(SPEECH.SKIP.ACTION.DROP)
                skip.components.inventory:DropEverything(true)      
            else
                skip.components.talker:Say(SPEECH.SKIP.ACTION.FAIL)       
            end
        end     
    end
end

------------------------------------------
-- Esperando pelo clique de X
------------------------------------------
AddModRPCHandler("jao", "actionDrop", dropSkip )

------------------------------------------
-- Falas Do Rhino
------------------------------------------
local function sayRhinoInfo( inst )
    local x,y,z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x,y,z, 25, {"summonrhino"})
    for k,rhino in pairs(ents) do
        if rhino ~= nil and rhino ~= 0 then
            local health = rhino.components.health:GetPercent()
            if health == 1 then
                rhino.components.talker:Say(SPEECH.RHINO.STATUS.FULL)
            elseif health > 0.5 then
                rhino.components.talker:Say(SPEECH.RHINO.STATUS.HALF)
            else    
                rhino.components.talker:Say(SPEECH.RHINO.STATUS.EMPTY)       
            end
            print("RHINO VIDA".. health)
        end
    end              
end

------------------------------------------
-- Esperando pelo clique de F1
------------------------------------------
AddModRPCHandler("jao", "infoRhino", sayRhinoInfo )

------------------------------------------
-- Definir Alvo Para o Rhino
------------------------------------------
local function alvoRhino(inst)   
    local x,y,z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x,y,z, 40, {"summonrhino"})
    local alvos = TheSim:FindEntities(x,y,z, 3)
    for k,rhino in pairs(ents) do
        if rhino ~= nil and rhino ~= 0  then
            for t,alvo in pairs(alvos) do
                if alvo:HasTag("workable") or alvo:HasTag("boulder") or 
                   alvo:HasTag("tree") or alvo:HasTag("structure") or ("wall") then
                    rhino.target = Point(alvo.Transform:GetWorldPosition())
                    rhino.targetEntity = alvo
                    print(alvo.prefab)
                    print(rhino.target)
                    break
                end
            end
         
            if not rhino.destroy and rhino.target ~= nil then     
                rhino.destroy = true
                rhino.components.talker:Say(SPEECH.RHINO.ACTION.SMASH)
            else        
                rhino.components.talker:Say(SPEECH.RHINO.ACTION.FAIL)    
            end
        end     
    end
end

------------------------------------------
-- Esperando pelo clique de C
------------------------------------------
AddModRPCHandler("jao", "actionDestroy", alvoRhino )

------------------------------------------
-- Falas Do Chop
------------------------------------------
local function sayChopInfo( inst )
    local x,y,z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x,y,z, 25, {"summonchop"})
    for k,chop in pairs(ents) do
        if chop ~= nil and chop ~= 0 then
            local health = chop.components.health:GetPercent()
            if health == 1 then
                chop.components.talker:Say(SPEECH.CHOP.STATUS.FULL)
            elseif health > 0.5 then
                chop.components.talker:Say(SPEECH.CHOP.STATUS.HALF)
            else    
                chop.components.talker:Say(SPEECH.CHOP.STATUS.EMPTY)       
            end
            print("CHOP VIDA".. health)
        end
    end              
end

------------------------------------------
-- Esperando pelo clique de F1
------------------------------------------
AddModRPCHandler("jao", "infoChop", sayChopInfo )

------------------------------------------
-- Fazer Chop Proteger ou Nao a Area
------------------------------------------ 
local function protectPerimeter(inst)
    local x,y,z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x,y,z, 25, {"summonchop"})
    for k,chop in pairs(ents) do
        if chop ~= nil and chop ~= 0 then
            local x1,y1,z1 = chop.Transform:GetWorldPosition()
            local chopinhos = TheSim:FindEntities(x1,y1,z1, 25, {"summonminichop"})
            for n,minichop in pairs(chopinhos) do
                minichop.components.health:Kill()
            end
            ------------------------------------------
            if not chop.protegendo then
                chop.components.followersitcommand:SetStaying(true)
                chop.components.followersitcommand:RememberSitPos("currentstaylocation", GLOBAL.Point(chop.Transform:GetWorldPosition()))
                chop.components.talker:Say(SPEECH.CHOP.ACTION.PROTECT)
                ------------------------------------------
                local guarda1 = SpawnPrefab("summonminichop")
                guarda1.Transform:SetPosition( (Point(x1+5, y1, z1+5)):Get() )
                guarda1.components.knownlocations:ForgetLocation("torre")
                guarda1.components.knownlocations:RememberLocation("torre", (Point(x1+10, y1, z1+10)), true)
                ------------------------------------------
                local fx1 = SpawnPrefab("green_leaves")
                fx1.Transform:SetScale(3, 2, 3)
                fx1.Transform:SetPosition(guarda1:GetPosition():Get())
                ------------------------------------------
                local guarda2 = SpawnPrefab("summonminichop")
                guarda2.Transform:SetPosition( (Point(x1-5, y1, z1+5)):Get() )
                guarda2.components.knownlocations:ForgetLocation("torre")
                guarda2.components.knownlocations:RememberLocation("torre", (Point(x1-10, y1, z1+10)), true)
                ------------------------------------------
                local fx2 = SpawnPrefab("green_leaves")
                fx2.Transform:SetScale(3, 2, 3)
                fx2.Transform:SetPosition(guarda2:GetPosition():Get())
                ------------------------------------------
                local guarda3 = SpawnPrefab("summonminichop")
                guarda3.Transform:SetPosition( (Point(x1-5, y1, z1-5)):Get() )
                guarda3.components.knownlocations:ForgetLocation("torre")
                guarda3.components.knownlocations:RememberLocation("torre", (Point(x1-10, y1, z1-10)), true)
                ------------------------------------------
                local fx3 = SpawnPrefab("green_leaves")
                fx3.Transform:SetScale(3, 2, 3)
                fx3.Transform:SetPosition(guarda3:GetPosition():Get())
                ------------------------------------------
                local guarda4 = SpawnPrefab("summonminichop")
                guarda4.Transform:SetPosition( (Point(x1+5, y1, z1-5)):Get() )
                guarda4.components.knownlocations:ForgetLocation("torre")
                guarda4.components.knownlocations:RememberLocation("torre", (Point(x1+10, y1, z1-10)), true)
                ------------------------------------------
                local fx4 = SpawnPrefab("green_leaves")
                fx4.Transform:SetScale(3, 2, 3)
                fx4.Transform:SetPosition(guarda4:GetPosition():Get())
                ------------------------------------------  
            else
                chop.components.talker:Say(SPEECH.CHOP.ACTION.FAIL)
                chop.components.followersitcommand:SetStaying(false)   
            end
            chop.protegendo = not chop.protegendo     
        end     
    end
end

------------------------------------------
-- Esperando pelo clique de C
------------------------------------------
AddModRPCHandler("jao", "actionProtect", protectPerimeter )

------------------------------------------
-- Respostas Jill
------------------------------------------
local function sayJillInfo( inst )
    local x,y,z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x,y,z, 25, {"summonjill"})
    for k,jill in pairs(ents) do
        if jill ~= nil and jill ~= 0 then
            local health = jill.components.health:GetPercent()
            if health == 1 then
                jill.components.talker:Say(SPEECH.JILL.STATUS.FULL)
            elseif health > 0.5  then
                jill.components.talker:Say(SPEECH.JILL.STATUS.HALF)    
            else
                aron.components.talker:Say(SPEECH.JILL.STATUS.EMPTY)       
            end
            print("JILL VIDA".. health)
        end
    end              
end

------------------------------------------
-- Esperando pelo clique de F4
------------------------------------------
AddModRPCHandler("jao", "infoJill", sayJillInfo )

------------------------------------------
-- Resposta do Aron
------------------------------------------
local function sayAronInfo( inst )
    local x,y,z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x,y,z, 25, {"summonaron"})
    for k,aron in pairs(ents) do
        if aron ~= nil and aron ~= 0 then
            local health = aron.components.health:GetPercent()
            local isWere = aron:HasTag("werearon")
            if health == 1 and isWere then
                aron.components.talker:Say(SPEECH.WEREARON.STATUS.FULL)
            elseif health == 1 and isWere == false then
                aron.components.talker:Say(SPEECH.ARON.STATUS.FULL)
            elseif health > 0.5 and isWere then
                aron.components.talker:Say(SPEECH.ARON.STATUS.HALF)
            elseif health > 0.5 and isWere == false then
                aron.components.talker:Say(SPEECH.ARON.STATUS.HALF)    
            else
                aron.components.talker:Say(SPEECH.ARON.STATUS.EMPTY)       
            end
            print("ARON VIDA".. health)
        end
    end              
end

------------------------------------------
-- Esperando pelo clique de F5
------------------------------------------
AddModRPCHandler("jao", "infoAron", sayAronInfo )

------------------------------------------
-- Dizer Para o Aron Ativar o Modo Cacador ou Nao
------------------------------------------
local function transformAron(inst)
    local x,y,z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x,y,z, 25, {"summonaron"})
    for k,aron in pairs(ents) do
        if aron ~= nil and aron ~= 0 then  
            if aron.transformed then
                aron.hunterMode = false
                aron:morph()
            else
                aron.hunterMode = true
                aron:morph()
            end     
        end     
    end
end

------------------------------------------
-- Esperando pelo clique de B
------------------------------------------
AddModRPCHandler("jao", "actionTransform", transformAron )

------------------------------------------
-- RECEITAS ------------------------------
------------------------------------------

------------------------------------------
-- Codigo da aba de receitas
------------------------------------------
local recipe_tab = AddRecipeTab("Invocations and Spells", 999, "images/hud/magictab.xml", "magictab.tex", "jaobuilder" )

------------------------------------------
-- Receita da gema roxa
------------------------------------------
local purplegem_recipe = AddRecipe("purplegem", {Ingredient("goldnugget",5), Ingredient("tentaclespots", 3)}, recipe_tab, TECH.NONE, nil, nil, nil, 3)

------------------------------------------
-- Receita da gema 
------------------------------------------
local redgem_recipe = AddRecipe("redgem", {Ingredient("goldnugget",5), Ingredient("mosquitosack", 3)}, recipe_tab, TECH.NONE, nil, nil, nil, 3)

------------------------------------------
-- Receita da gema 
------------------------------------------
local bluegem_recipe = AddRecipe("bluegem", {Ingredient("goldnugget",5), Ingredient("ice", 3)}, recipe_tab, TECH.NONE, nil, nil, nil, 3)

------------------------------------------
-- Receitas do livro - Passaros
------------------------------------------
AddRecipe("book_birds", {Ingredient("papyrus", 2), Ingredient("bird_egg", 2)}, recipe_tab, TECH.NONE)

------------------------------------------
-- Receitas do livro - Jardim
------------------------------------------
AddRecipe("book_gardening", {Ingredient("papyrus", 2), Ingredient("seeds", 1), Ingredient("poop", 1)}, recipe_tab, TECH.NONE)

------------------------------------------
-- Receitas do livro - Dormir
------------------------------------------
AddRecipe("book_sleep", {Ingredient("papyrus", 2), Ingredient("nightmarefuel", 2)}, recipe_tab, TECH.NONE)

------------------------------------------
-- Receitas do livro - Fogo
------------------------------------------
AddRecipe("book_brimstone", {Ingredient("papyrus", 2), Ingredient("redgem", 1)}, recipe_tab, TECH.NONE)

------------------------------------------
-- Receitas do livro - Tentaculos
------------------------------------------
AddRecipe("book_tentacles", {Ingredient("papyrus", 2), Ingredient("tentaclespots", 1)}, recipe_tab, TECH.NONE)							

------------------------------------------
-- Receita para invoca o Aron
------------------------------------------
local summonaron_recipe = AddRecipe("summonaron", {GLOBAL.Ingredient("summonstonearon", 1, "images/inventoryimages/runes/summonstonearon.xml")}, recipe_tab, TECH.NONE, nil, nil, nil, nil, nil,
"images/inventoryimages/summons/summonaron.xml", "summonaron.tex")
summonaron_recipe.tagneeded = false
summonaron_recipe.builder_tag ="jaobuilder"
summonaron_recipe.atlas = resolvefilepath("images/inventoryimages/summons/summonaron.xml")

------------------------------------------
-- Receita para invoca o Jill
------------------------------------------
local summonjill_recipe = AddRecipe("summonjill", {GLOBAL.Ingredient("summonstonejill", 1, "images/inventoryimages/runes/summonstonejill.xml")}, recipe_tab, TECH.NONE, nil, nil, nil, nil, nil,
"images/inventoryimages/summons/summonjill.xml", "summonjill.tex")
summonjill_recipe.tagneeded = false
summonjill_recipe.builder_tag ="jaobuilder"
summonjill_recipe.atlas = resolvefilepath("images/inventoryimages/summons/summonjill.xml")

------------------------------------------
-- Receita para invoca o Chop
------------------------------------------
local summonchop_recipe = AddRecipe("summonchop", {GLOBAL.Ingredient("summonstonechop", 1, "images/inventoryimages/runes/summonstonechop.xml")}, recipe_tab, TECH.NONE, nil, nil, nil, nil, nil,
"images/inventoryimages/summons/summonchop.xml", "summonchop.tex")
summonchop_recipe.tagneeded = false
summonchop_recipe.builder_tag ="jaobuilder"
summonchop_recipe.atlas = resolvefilepath("images/inventoryimages/summons/summonchop.xml")

------------------------------------------
-- Receita para invoca o Skip
------------------------------------------
local summonskip_recipe = AddRecipe("summonskip", {GLOBAL.Ingredient("summonstone", 1, "images/inventoryimages/runes/summonstone.xml")}, recipe_tab, TECH.NONE, nil, nil, nil, nil, nil,
"images/inventoryimages/summons/summonskip.xml", "summonskip.tex")
summonskip_recipe.tagneeded = false
summonskip_recipe.builder_tag ="jaobuilder"
summonskip_recipe.atlas = resolvefilepath("images/inventoryimages/summons/summonskip.xml")

------------------------------------------
-- Receita para invocar o Rhino
------------------------------------------
local summonrhino_recipe = AddRecipe("summonrhino", {GLOBAL.Ingredient("summonstonerhino", 1, "images/inventoryimages/runes/summonstonerhino.xml")}, recipe_tab, TECH.NONE, nil, nil, nil, nil, nil,
"images/inventoryimages/summons/summonrhino.xml", "summonrhino.tex")
summonrhino_recipe.tagneeded = false
summonrhino_recipe.builder_tag = "jaobuilder"
summonrhino_recipe.atlas = resolvefilepath("images/inventoryimages/summons/summonrhino.xml")

------------------------------------------
-- Dados do persongem
------------------------------------------
STRINGS.CHARACTER_TITLES.jao = "The Great Summoner"
STRINGS.CHARACTER_NAMES.jao = "Jao"
STRINGS.CHARACTER_DESCRIPTIONS.jao = "*Teleport\n*Range Attack\n*Summons"
STRINGS.CHARACTER_QUOTES.jao = "\"Die asshole!\""

------------------------------------------
-- Dados do cajado
------------------------------------------
GLOBAL.STRINGS.NAMES.JAOSTAFF = "Jao's Staff"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.JAOSTAFF = "Teleportation source, light and fire Jão"

------------------------------------------
-- Dados do item
------------------------------------------
GLOBAL.STRINGS.NAMES.SOURCEOFMAGIC = "The Source of Magic"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SOURCEOFMAGIC = "Grants power of invocation of John!"

------------------------------------------
-- Dados do item
------------------------------------------
GLOBAL.STRINGS.NAMES.SUMMONSTONEARON = "Rune Aron"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONSTONEARON = "It allow invokes Aron."

------------------------------------------
-- Dados do item
------------------------------------------
GLOBAL.STRINGS.NAMES.SUMMONSTONEJILL = "Rune Jill"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONSTONEJILL = "It allow invokes Jill."

------------------------------------------
-- Dados do item
------------------------------------------
GLOBAL.STRINGS.NAMES.SUMMONSTONECHOP = "Rune Chop"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONSTONECHOP = "It allow invokes Chop."

------------------------------------------
-- Dados do item
------------------------------------------
GLOBAL.STRINGS.NAMES.SUMMONSTONERHINO = "Rune Rhino"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONSTONERHINO = "It allow invokes Rhino."

------------------------------------------
-- Dados do item
------------------------------------------
GLOBAL.STRINGS.NAMES.SUMMONSTONE = "Rune Skip"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONSTONE = "It allow invokes any invocation be combined with the right item."

------------------------------------------
-- Dados do item
------------------------------------------
GLOBAL.STRINGS.NAMES.SOURCEOFMAGIC = "The Source of Magic"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SOURCEOFMAGIC = "Grants power of invocation of Jao!"

------------------------------------------
-- Dados do Jarvi
------------------------------------------
GLOBAL.STRINGS.NAMES.SUMMONJARVI = "Jarvi"
GLOBAL.STRINGS.RECIPE_DESC.SUMMONJARVI = "A shadow that always helps to John"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONJARVI = ""

------------------------------------------
-- Dados do MiniChops
------------------------------------------
GLOBAL.STRINGS.NAMES.SUMMONMINICHOP = "Chop's guard"
GLOBAL.STRINGS.RECIPE_DESC.SUMMONMINICHOP = "A guard for base."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONMINICHOP = "I already feel safer!"

------------------------------------------
-- Dados do Aron
------------------------------------------
GLOBAL.STRINGS.NAMES.SUMMONARON = "Aron"
GLOBAL.STRINGS.RECIPE_DESC.SUMMONARON = "A cute rabbit."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONARON = "Be useful or turn you into a hat!"

------------------------------------------
-- Dados do Jill
------------------------------------------
GLOBAL.STRINGS.NAMES.SUMMONJILL = "Jill"
GLOBAL.STRINGS.RECIPE_DESC.SUMMONJILL = "High speed riding."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONJILL = "Their hair is beautifull today, Jill..."

------------------------------------------
-- Dados do Chop
------------------------------------------
GLOBAL.STRINGS.NAMES.SUMMONCHOP = "Chop"
GLOBAL.STRINGS.RECIPE_DESC.SUMMONCHOP = "Great strength but very slowly."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONCHOP = "Even a stone is faster than that! Let's Chop accelerates!..."

------------------------------------------
-- Dados do Skip
------------------------------------------
GLOBAL.STRINGS.NAMES.SUMMONSKIP = "Skip"
GLOBAL.STRINGS.RECIPE_DESC.SUMMONSKIP = "Great defense and aura of sanity."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONSKIP = "It's just a bunch of rocks..."

------------------------------------------
--Dados do Rhino
------------------------------------------
GLOBAL.STRINGS.NAMES.SUMMONRHINO = "Rhino"
GLOBAL.STRINGS.RECIPE_DESC.SUMMONRHINO = "Very strong, but quickly loses control."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONRHINO = "He is smarter than a door?!"

------------------------------------------
-- Icones do mapa de cada objeto/summon/jao
------------------------------------------
AddMinimapAtlas("images/map_icons/jao.xml")
------------------------------------------
AddMinimapAtlas("images/map_icons/summons/chop.xml")
AddMinimapAtlas("images/map_icons/summons/rocky.xml")
AddMinimapAtlas("images/map_icons/summons/rhino.xml")
AddMinimapAtlas("images/map_icons/summons/jill.xml")
AddMinimapAtlas("images/map_icons/summons/aron.xml")
AddMinimapAtlas("images/map_icons/summons/shelly.xml")
------------------------------------------
AddMinimapAtlas("images/map_icons/sourceofmagic_atlas.xml")
------------------------------------------
AddMinimapAtlas("images/map_icons/runes/summonstone_map.xml")
AddMinimapAtlas("images/map_icons/runes/summonstonerhino_map.xml")
AddMinimapAtlas("images/map_icons/runes/summonstonechop_map.xml")
AddMinimapAtlas("images/map_icons/runes/summonstonejill_map.xml")
AddMinimapAtlas("images/map_icons/runes/summonstonearon_map.xml")

------------------------------------------
-- Funcoes de comando dos pets
------------------------------------------
AddReplicableComponent("followersitcommand")

------------------------------------------
-- Esperar
------------------------------------------
SITCOMMAND.id = "SITCOMMAND"
SITCOMMAND.str = "Wait"
SITCOMMAND.fn = function(act)
    local targ = act.target
    if targ and targ.components.followersitcommand and (not targ:HasTag("summonminichop")) and act.doer:HasTag("jaobuilder") then
        act.doer.components.locomotor:Stop()
        if targ:HasTag("summonskip") then
            act.doer.components.talker:Say(SPEECH.JAO.WAIT.SKIP)
        elseif targ:HasTag("summonrhino") then
            act.doer.components.talker:Say(SPEECH.JAO.WAIT.RHINO)    
        elseif targ:HasTag("summonchop") then
            act.doer.components.talker:Say(SPEECH.JAO.WAIT.CHOP)
        elseif targ:HasTag("summonjill") then
            act.doer.components.talker:Say(SPEECH.JAO.WAIT.JILL)
        elseif targ:HasTag("summonaron") then
            act.doer.components.talker:Say(SPEECH.JAO.WAIT.ARON)        
        end
        targ.components.followersitcommand:SetStaying(true)
        targ.components.followersitcommand:RememberSitPos("currentstaylocation", GLOBAL.Point(targ.Transform:GetWorldPosition())) 
        return true
    end
end
AddAction(SITCOMMAND)

------------------------------------------
-- Chamar
------------------------------------------
SITCOMMAND_CANCEL.id = "SITCOMMAND_CANCEL"
SITCOMMAND_CANCEL.str = "Call"
SITCOMMAND_CANCEL.fn = function(act)
    local targ = act.target
    if targ and targ.components.followersitcommand and (not targ:HasTag("summonminichop")) and (not targ:HasTag("summonchop")) and act.doer:HasTag("jaobuilder") then
        act.doer.components.locomotor:Stop()
        if targ:HasTag("summonskip") then
            act.doer.components.talker:Say(SPEECH.JAO.CALL.SKIP)
        elseif targ:HasTag("summonrhino") then
            act.doer.components.talker:Say(SPEECH.JAO.CALL.RHINO)                
        elseif targ:HasTag("summonjill") then
            act.doer.components.talker:Say(SPEECH.JAO.CALL.JILL)
        elseif targ:HasTag("summonaron") then
            act.doer.components.talker:Say(SPEECH.JAO.CALL.ARON)        
        end
        targ.components.followersitcommand:SetStaying(false)
        return true
    elseif targ and targ.components.followersitcommand and targ:HasTag("summonchop") and act.doer:HasTag("jaobuilder")  then
        act.doer.components.locomotor:Stop()
        act.doer.components.talker:Say(SPEECH.JAO.CALL.CHOP)
        targ.components.followersitcommand:SetStaying(false)
        local x1,y1,z1 = targ.Transform:GetWorldPosition()
        local chopinhos = TheSim:FindEntities(x1,y1,z1, 25, {"summonminichop"})
        for n,minichop in pairs(chopinhos) do
            minichop.components.health:Kill()
        end
        return true
    end    
end
AddAction(SITCOMMAND_CANCEL)

------------------------------------------
-- Comando de Esperar/Seguir
------------------------------------------
AddComponentAction("SCENE", "followersitcommand", function(inst, doer, actions, rightclick)      
    if rightclick and inst.replica.followersitcommand then  
        if not inst.replica.followersitcommand:IsCurrentlyStaying() and doer:HasTag("jaobuilder") and (not inst:HasTag("summonminichop")) and (not inst:HasTag("summonjarvi"))then
            table.insert(actions, GLOBAL.ACTIONS.SITCOMMAND)
        elseif inst.replica.followersitcommand:IsCurrentlyStaying() and (not inst:HasTag("summonminichop")) and (not inst:HasTag("summonjarvi")) and doer:HasTag("jaobuilder") then
            table.insert(actions, GLOBAL.ACTIONS.SITCOMMAND_CANCEL)
        end
    end
end)

------------------------------------------
-- Arquivo de falas do personagem
------------------------------------------
STRINGS.CHARACTERS.JAO = require "speech_jao"

------------------------------------------
-- Nome no jogo
------------------------------------------
STRINGS.NAMES.JAO = "Jao"

------------------------------------------
-- Falas genericas
------------------------------------------
STRINGS.CHARACTERS.GENERIC.DESCRIBE.JAO = 
{
    GENERIC = "It's Jao!",
    ATTACKER = "This Jão seems wise....",
    MURDERER = "Murderer!",
    REVIVER = "Jão, friend of lost souls.",
    GHOST = "Jão could use a heart.",
}

------------------------------------------
-- Genero do personagem (male, female, or robot)
------------------------------------------
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "jao")

------------------------------------------
-- Inicio
------------------------------------------
AddModCharacter("jao")