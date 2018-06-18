require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/eteleporter.zip"),
	Asset("ANIM", "anim/esentry_item.zip"),
}

local prefabs =
{
    "eshockfx",
    "eshealfx",
    "eteleringenter",
    "scrap",
    "collapse_small",
}

local function customfxend(inst)
    inst.tefx:Remove()
    inst.startfx:Cancel()
    inst.startfx = nil
end

local function customfxstart(inst)
    local x,y,z = inst.Transform:GetWorldPosition()
    inst.tefx = SpawnPrefab("ehealfx")
    inst.tefx.Transform:SetPosition(x,1,z)
    inst.tefx.Transform:SetScale(.5, .5, .5)
    if inst.startfx == nil then
        inst.startfx = inst:DoPeriodicTask(.2, function(inst)
            inst.ringfx = SpawnPrefab("eteleringenter")
            inst.ringfx.Transform:SetPosition(x,y,z)
        end)
    end
end

local function onpreload(inst, data)
    inst.maker = data.maker
    if data.tag == 1 then
	inst:AddTag("lookingtolink")
    end
    if data.tag == 0 then
    inst.pairedGUID = data.pairedGUID
    end
end

local function onsave(inst, data)
    data.maker = inst.maker
    if inst:HasTag("lookingtolink") then
	data.tag = 1
    else
	data.tag = 0
	data.pairedGUID = inst.pairedGUID
    end
end

local function onbuilt(inst, builder)
    inst.AnimState:PlayAnimation("place")
    local x,y,z = inst.Transform:GetWorldPosition()

    inst.SoundEmitter:PlaySound("dontstarve/creatures/rook/explo")
    inst:DoTaskInTime(.75, function()
	inst.fx = SpawnPrefab("eshockfx")
	inst.fx.Transform:SetPosition(x,y,z)
	inst.fx.Transform:SetScale(1, 0.5, 1)
	inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/lightninggoat/shocked_electric")
    end)

    inst:AddTag("lookingtolink")
    inst.maker = builder.name

    for k,v in pairs(Ents) do
	if v.maker == builder.name and v:HasTag("lookingtolink") and v:HasTag("eteleporter_exit") then
	    inst.paired = v
	    v.paired = inst
	    inst.pairedGUID = v.GUID
	    v.pairedGUID = v.GUID
	    inst.paired:RemoveTag("lookingtolink")
	    inst:RemoveTag("lookingtolink")
	    break
	end
    end
end

local function onhammered(inst, worker)
    if inst.ringfx then
	inst.ringfx:Remove()
    end
    if inst.tefx then
	inst.tefx:Remove()
    end
    if inst.paired then
	inst.paired:AddTag("lookingtolink")
	inst.paired.paired = nil
	inst.paired.pairedGUID = nil
    end

    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end

local function onhit(inst)
    inst.AnimState:PlayAnimation("hit")
    inst.AnimState:PushAnimation(inst.anim)
    local x,y,z = inst.Transform:GetWorldPosition()
    inst.fx = SpawnPrefab("eshockfx")
    inst.fx.Transform:SetPosition(x,y,z)
    inst.fx.Transform:SetScale(1, 0.5, 1)
	inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/lightninggoat/shocked_electric")
end

local function oninit(inst)
    if inst.pairedGUID then
	for k,v in pairs(Ents) do
	    if v.prefab == "eteleporter_exit" and v.pairedGUID == inst.pairedGUID then
	        inst.paired = v
	        v.paired = inst
	    end
        end
    end
    if inst.maker == 0 then
        local fx = SpawnPrefab("collapse_small")
        fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
        fx:SetMaterial("metal")
	inst:Remove()
    end
end

local function onnear(inst)
    inst.anim = "idle_loop"
    inst.AnimState:PlayAnimation(inst.anim, true)
    inst.SoundEmitter:PlaySound("dontstarve/common/ice_box_LP", "idlesound")
    customfxstart(inst)
end

local function onfar(inst)
    inst.anim = "exit"
    inst.AnimState:PlayAnimation(inst.anim)
    inst.AnimState:PushAnimation("idle")
    customfxend(inst)
end

local function fn(inst, self, range)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst.MiniMapEntity:SetIcon("eteleporter.tex")

    inst:AddTag("structure")
    inst:AddTag("eteleporter_enter")

    inst.AnimState:SetBank("eteleporter")
    inst.AnimState:SetBuild("eteleporter")
    inst.AnimState:PushAnimation("idle")

    inst.no_wet_prefix = true

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("teleporter")

    inst:AddComponent("engieteleporter")

    inst:AddComponent("inventory")

    inst:AddComponent("inspectable")

    inst:AddComponent("lootdropper")

    inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(2, 2)
    inst.components.playerprox.onnear = onnear
    inst.components.playerprox.onfar = onfar

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    MakeHauntableFreeze(inst) 
	
    inst.maker = 0
    inst.anim = "idle"

    inst.OnSave = onsave
    inst.OnPreLoad = onpreload
    inst.OnBuiltFn = onbuilt

    inst:DoTaskInTime(.1, oninit)

    return inst
end

local function eshockfxfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst:AddTag("NOCLICK")
    inst:AddTag("FX")

    inst.AnimState:SetBank("goosemoose_nest_fx")
    inst.AnimState:SetBuild("goosemoose_nest_fx")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetMultColour( 10/255, 10/255, 200/255, 0 )

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    inst:ListenForEvent("animover", inst.Remove)

    return inst
end

local function onenter(inst)
    local x,y,z = inst.Transform:GetWorldPosition()
    local shape = .5
    y = 1
    inst.Transform:SetPosition(x,y,z)
    inst:DoPeriodicTask(.1, function(inst)
	shape = shape - .02
	y = y - .1
	inst.Transform:SetPosition(x,y,z)
	inst.Transform:SetScale(shape, .10, shape)
	if y <= 0.0 then
	    inst:Remove()
	end
    end)
end

local function enterfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.AnimState:SetBank("forcefield")
    inst.AnimState:SetBuild("forcefield")
    inst.AnimState:PlayAnimation("open")
    inst.AnimState:PushAnimation("idle_loop", true)
    inst.AnimState:SetMultColour( 250/255, 25/255, 25/255, 0 )
    inst.Transform:SetScale(.5, .10, .5)

    inst:AddTag("NOCLICK")
    inst:AddTag("FX")
    inst.persists = false

    inst:DoTaskInTime(0, onenter)

    return inst
end

return Prefab("common/eteleporter", fn, assets, prefabs),
	Prefab("eshockfx", eshockfxfn, assets),
	Prefab("eteleringenter", enterfn, assets),
	MakePlacer("common/eteleporter_placer", "esentry_item", "esentry_item", "idle")