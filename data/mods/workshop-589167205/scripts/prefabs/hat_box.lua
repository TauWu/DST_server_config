local assets =
{ 
    Asset("ANIM", "anim/hat_box.zip"),
    Asset("ANIM", "anim/hat_box_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/hat_box.xml"),
    Asset("IMAGE", "images/inventoryimages/hat_box.tex"),
}

local prefabs = 
{
}
	
local function stopusingbox(inst, data)
        local hat = inst.components.inventory and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
        if hat and not (data.statename == "hide_idle" or data.statename == "hide") then
            hat.components.useableitem:StopUsingItem()
        end
end

	local function OnEquip(inst, owner)
        owner.AnimState:OverrideSymbol("swap_hat", "hat_box_swap", "swap_hat")
        owner.AnimState:Show("HAT")
        owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Hide("HAIR")
        
        if owner:HasTag("player") then
            owner.AnimState:Show("HEAD_HAIR")
        end
        
        if inst.components.fueled then
            inst.components.fueled:StartConsuming()        
        end

        inst:ListenForEvent("newstate", stopusingbox, owner) 
    end
	
	 local function OnUnequip(inst, owner)
        owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAT_HAIR")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")

        if owner:HasTag("player") then
            owner.AnimState:Show("HEAD")
            owner.AnimState:Hide("HEAD_HAIR")
        end

        if inst.components.fueled then
            inst.components.fueled:StopConsuming()        
        end

        inst:RemoveEventCallback("newstate", stopusingbox, owner)
    end

    local function onusebox(inst)
        local owner = inst.components.inventoryitem.owner
        if owner then
            owner.sg:GoToState("hide")
        end
    end
	
local function fn()
    local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("hat_box")
    inst.AnimState:SetBuild("hat_box")
    inst.AnimState:PlayAnimation("idle")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("hide")
	
	MakeHauntableLaunch(inst)
	
    inst.entity:SetPristine()
    inst:AddComponent("inspectable")
    inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(onusebox)
	inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "hat_box"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hat_box.xml"

    return inst
end

return  Prefab("common/inventory/hat_box", fn, assets, prefabs)