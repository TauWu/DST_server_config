local assets=
{
    Asset("ANIM", "anim/black_cavair.zip"),
    --Asset("IMAGE", "images/inventoryimages/black_cavair.tex"),
    --Asset("ATLAS", "images/inventoryimages/black_cavair.xml"),
}


local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddNetwork()
    MakeInventoryPhysics(inst)
    
	inst.AnimState:SetBank("black_cavair")
    inst.AnimState:SetBuild("black_cavair")
    inst.AnimState:PlayAnimation("idle")

    if not TheWorld.ismastersim then
        return inst
    end

	inst.entity:SetPristine()

    
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "black_cavair"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/black_cavair.xml"


    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    
    inst:AddComponent("edible")
    inst.components.edible.ismeat = true
    inst.components.edible.foodtype = "MEAT"
    inst.components.edible.healthvalue = TUNING.HEALING_SMALL -- +3
    inst.components.edible.hungervalue = TUNING.CALORIES_MED*2 -- +50
	inst.components.edible.sanityvalue = TUNING.SANITY_SMALL -- +10
	
    inst:AddComponent("perishable")

	inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"
    
    inst:AddComponent("tradable")
    
    return inst
end



return Prefab( "common/inventory/black_cavair", fn, assets)