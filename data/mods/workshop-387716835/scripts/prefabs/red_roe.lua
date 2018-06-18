local assets=
{
	Asset("ANIM", "anim/fish_eggs.zip"),
	--Asset("ATLAS", "images/inventoryimages/red_roe.xml")
}

local prefabs = 
{
	"spoiled_food",
}

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
    
    MakeInventoryPhysics(inst)
    
    inst.AnimState:SetBank("fish_eggs")
    inst.AnimState:SetBuild("fish_eggs")
    inst.AnimState:PlayAnimation("red1")
   
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:SetPristine()

   
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "red_roe"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/red_roe.xml"
	 
    inst:AddComponent("edible")
    inst.components.edible.foodtype = "MEAT"
    inst.components.edible.healthvalue = TUNING.HEALING_TINY -- +1
    inst.components.edible.hungervalue = TUNING.CALORIES_SMALL -- +12
	inst.components.edible.sanityvalue = TUNING.SANITY_SUPERTINY -- +1
	
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_ONE_DAY/2)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"
	
    inst:AddComponent("tradable")
	
    return inst
end

return Prefab( "common/inventory/red_roe", fn, assets, prefabs) 
