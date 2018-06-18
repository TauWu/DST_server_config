local assets=
{
    Asset("ANIM", "anim/red_cavair.zip"),
    --Asset("IMAGE", "images/inventoryimages/red_cavair.tex"),
    --Asset("ATLAS", "images/inventoryimages/red_cavair.xml"),
}


local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddNetwork()
    MakeInventoryPhysics(inst)
    
	inst.AnimState:SetBank("red_cavair")
    inst.AnimState:SetBuild("red_cavair")
    inst.AnimState:PlayAnimation("idle")
    
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:SetPristine()


    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "red_cavair"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/red_cavair.xml"


    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    
    inst:AddComponent("edible")
    inst.components.edible.ismeat = true
    inst.components.edible.foodtype = "MEAT"
    inst.components.edible.healthvalue = TUNING.HEALING_MEDSMALL -- +8
    inst.components.edible.hungervalue = TUNING.CALORIES_LARGE -- +37
	inst.components.edible.sanityvalue = TUNING.SANITY_SMALL -- +10
	
    inst:AddComponent("perishable")

	inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"
    
    inst:AddComponent("tradable")
    
    return inst
end



return Prefab( "common/inventory/red_cavair", fn, assets)