local assets=
{
	Asset("ANIM", "anim/cred.zip"),
	Asset("ATLAS", "images/inventoryimages/cred.xml"),
    Asset("IMAGE", "images/inventoryimages/cred.tex"),
	
	
}

local function fn()

	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
	
    MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("cred")
    inst.AnimState:SetBuild("cred")
    inst.AnimState:PlayAnimation("idle")    
	
	inst.MiniMapEntity:SetIcon("cred.tex")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:SetPristine()
	
    inst:AddComponent("stackable")	 
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM 
	
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "cred"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/cred.xml"

	return inst
end

return	Prefab( "common/inventory/cred", fn, assets)