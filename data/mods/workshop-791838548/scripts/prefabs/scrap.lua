
local assets =
{
    Asset("ANIM", "anim/scrap.zip"),
	
    Asset("ATLAS", "images/inventoryimages/scrap.xml"),
    Asset("IMAGE", "images/inventoryimages/scrap.tex"),
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("scrap")
    inst.AnimState:SetBuild("scrap")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("molebait")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("bait")

    inst:AddComponent("inspectable")

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("repairer")
    inst.components.repairer.repairmaterial = MATERIALS.SCRAP
    inst.components.repairer.workrepairvalue = 20

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "scrap"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/scrap.xml"

    inst:AddComponent("edible")
    inst.components.edible.foodtype = FOODTYPE.GEARS
  --inst.components.edible.healthvalue = TUNING.HEALING_TINY
    inst.components.edible.hungervalue = TUNING.CALORIES_TINY
  --inst.components.edible.sanityvalue = TUNING.SANITY_TINY

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("common/inventory/scrap", fn, assets)
