local assets =
{
	Asset("ANIM", "anim/medickits.zip"),

	Asset("ATLAS", "images/inventoryimages/small_medkit.xml"),
    Asset("IMAGE", "images/inventoryimages/small_medkit.tex"),
	Asset("ATLAS", "images/inventoryimages/med_medkit.xml"),
    Asset("IMAGE", "images/inventoryimages/med_medkit.tex"),
	Asset("ATLAS", "images/inventoryimages/medkit_large.xml"),
    Asset("IMAGE", "images/inventoryimages/medkit_large.tex"),
}

local function commonfn(size, tag)
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("medickits")
    inst.AnimState:SetBuild("medickits")
    inst.AnimState:PlayAnimation(size.."_medkit")

    if not TheWorld.ismastersim then
        return inst
    end
	
    if tag ~= nil then
        inst:AddTag(tag)
    end

	MakeHauntableLaunch(inst)
	
    inst.entity:SetPristine()
	
	inst:AddComponent("edible")
	
    inst:AddComponent("inspectable")
	
	inst:AddComponent("inventoryitem")
	
	inst:AddComponent("tradable")

    return inst
end

local function OnEatenSmall(inst, eater)
    if eater:HasTag("player") then
	local delta = eater.components.health.maxhealth  * TUNING.SMALLHEALTH_HEALTH--0.1
    	    eater.components.health:DoDelta(delta) --Heals your for 10% of your Max Health
    end
end
local function OnEatenMedi(inst, eater)
    if eater:HasTag("player") then
	local delta = eater.components.health.maxhealth * TUNING.MEDIUMHEALTH_HEALTH--0.5
    	    eater.components.health:DoDelta(delta) --Heals you for 50% of your Max Health
    end
end
local function OnEatenLarge(inst, eater)
    if eater:HasTag("player") then
	local delta = eater.components.health.maxhealth * TUNING.LARGEHEALTH_HEALTH--0.9
    	    eater.components.health:DoDelta(delta) --Heals you for 90% of your Max Health
    end
end

local function small()
    local inst = commonfn("small")

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst.components.edible.foodtype = FOODTYPE.GOODIES
    inst.components.edible.healthvalue = 0--TUNING.SMALLHEALTH_HEALTH
    inst.components.edible.hungervalue = -10
    inst.components.edible.sanityvalue = 0
	inst.components.edible:SetOnEatenFn(OnEatenSmall)
	
	inst.MiniMapEntity:SetIcon("smallmedkit.tex")

	inst:AddComponent("perishable")
	inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERSLOW)
		
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

	inst.components.inventoryitem.imagename = "small_medkit"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/small_medkit.xml"
	
	return inst
end

local function med()
    local inst = commonfn("med")

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst.components.edible.foodtype = FOODTYPE.GOODIES
    inst.components.edible.healthvalue = 0
    inst.components.edible.hungervalue = -5
    inst.components.edible.sanityvalue = 5
	inst.components.edible:SetOnEatenFn(OnEatenMedi)
	
	inst.MiniMapEntity:SetIcon("medimedkit.tex")
	inst:AddTag("heftyheal")

	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	inst.components.inventoryitem.imagename = "med_medkit"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/med_medkit.xml"

	return inst
end

local function large()
    local inst = commonfn("large")

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst.components.edible.foodtype = FOODTYPE.GOODIES
    inst.components.edible.healthvalue = 0--TUNING.LARGEHEALTH_HEALTH
    inst.components.edible.hungervalue = 0
    inst.components.edible.sanityvalue = 10
	inst.components.edible:SetOnEatenFn(OnEatenLarge)
	
	inst.MiniMapEntity:SetIcon("largemedkit.tex")
	inst:AddTag("heftyheal")

	inst.components.inventoryitem.imagename = "medkit_large"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/medkit_large.xml"

	return inst
end

return Prefab("common/inventory/small_medkit", small, assets),
    Prefab("common/inventory/med_medkit", med, assets),
	Prefab("common/inventory/large_medkit", large, assets)