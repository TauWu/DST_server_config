local assets=
{
	Asset("ANIM", "anim/cice.zip"),
	Asset("ATLAS", "images/inventoryimages/cice.xml"),
    Asset("IMAGE", "images/inventoryimages/cice.tex"),
	
	
}

local function fn()

	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
	
    MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("cice")
    inst.AnimState:SetBuild("cice")
    inst.AnimState:PlayAnimation("idle")    
	
	inst.MiniMapEntity:SetIcon("cice.tex")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:SetPristine()
	
    inst:AddComponent("stackable")	 
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM 
	
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "cice"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/cice.xml"

	return inst
end

return	Prefab( "common/inventory/cice", fn, assets)