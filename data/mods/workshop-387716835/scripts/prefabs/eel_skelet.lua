local anim_name = "eel_skelet"

local assets=
{
	Asset("ANIM", "anim/fish_eggs.zip"),
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
    
    --inst:AddTag("honeyed")
    
    inst.AnimState:SetBuild("fish_eggs")
    inst.AnimState:SetBank("fish_eggs")
    inst.AnimState:PlayAnimation("eel_dead")
    
    inst:AddTag("meat")
    inst:AddTag("catfood")

    if not TheWorld.ismastersim then
        return inst
    end

	inst.entity:SetPristine()


    inst:AddComponent("edible")
    inst.components.edible.ismeat = true
    inst.components.edible.foodtype = "MEAT"
	inst.components.edible.healthvalue = -1
    inst.components.edible.hungervalue = 2

    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM --как у рыбы

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.MED_FUEL --как бревно
    
	MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
    MakeSmallPropagator(inst)
	
    --inst:AddComponent("tradable") --да не нужно...

    inst:AddComponent("inspectable")
    
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERSLOW)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"
    
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = anim_name
	inst.components.inventoryitem.atlasname = "images/inventoryimages/"..anim_name..".xml"
	
	inst:AddComponent("tradable")
    
    return inst
end

return Prefab( "common/inventory/"..anim_name, fn, assets, prefabs) 
