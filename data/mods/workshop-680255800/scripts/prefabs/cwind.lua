local assets=
{
	Asset("ANIM", "anim/cwind.zip"),
	Asset("ATLAS", "images/inventoryimages/cwind.xml"),
    Asset("IMAGE", "images/inventoryimages/cwind.tex"),
	
	
}

local function fn()

	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
	
    MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("cwind")
    inst.AnimState:SetBuild("cwind")
    inst.AnimState:PlayAnimation("idle")    
	
	inst.MiniMapEntity:SetIcon("cwind.tex")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:SetPristine()
	
    inst:AddComponent("stackable")	 
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM 
	
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "cwind"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/cwind.xml"

	return inst
end

return	Prefab( "common/inventory/cwind", fn, assets)