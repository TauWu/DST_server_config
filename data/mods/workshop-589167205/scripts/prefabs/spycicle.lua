local assets =
{
	Asset("ANIM", "anim/spycicle.zip"),
	Asset("ANIM", "anim/swap_spycicle.zip"),

	Asset("ATLAS", "images/inventoryimages/spycicle.xml"),
    Asset("IMAGE", "images/inventoryimages/spycicle.tex"),
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_spycicle", "spycicle")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function onattack(inst, attacker, target)
    if target.components.sleeper ~= nil and target.components.sleeper:IsAsleep() then
    target.components.sleeper:WakeUp()
    end

    if target.components.burnable ~= nil then
        if target.components.burnable:IsBurning() then
            target.components.burnable:Extinguish()
        elseif target.components.burnable:IsSmoldering() then
            target.components.burnable:SmotherSmolder()
        end
    end

    if target.components.combat ~= nil then
        target.components.combat:SuggestTarget(attacker)
    end

    if target.sg ~= nil and not target.sg:HasStateTag("frozen") then
        target:PushEvent("attacked", { attacker = attacker, damage = 0 })
    end

    if target.components.freezable ~= nil then
        target.components.freezable:AddColdness(1)
        target.components.freezable:SpawnShatterFX()
end
end

local function onperish(inst)
    local owner = inst.components.inventoryitem.owner
    if owner ~= nil then
        if owner.components.moisture ~= nil then
            owner.components.moisture:DoDelta(4)
        elseif owner.components.inventoryitem ~= nil then
            owner.components.inventoryitem:AddMoisture(8)
        end
        inst:Remove()
    else
        inst.components.inventoryitem.canbepickedup = false
        inst.AnimState:PlayAnimation("melt")
        inst:ListenForEvent("animover", inst.Remove)
    end
end

local function onfiremelt(inst)
    inst.components.perishable.frozenfiremult = true
end

local function onstopfiremelt(inst)
    inst.components.perishable.frozenfiremult = false
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("spycicle")
    inst.AnimState:SetBuild("spycicle")
    inst.AnimState:PlayAnimation("idle")

	inst:AddTag("sharp")
	inst:AddTag("frozen")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.SPYCICLE_DAMAGE)
	inst.components.weapon:SetOnAttack(onattack)
	
	inst:ListenForEvent("firemelt", onfiremelt)
    inst:ListenForEvent("stopfiremelt", onstopfiremelt)
	
	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.SPYCICLE_USES)
    inst.components.finiteuses:SetUses(TUNING.SPYCICLE_USES)

    inst.components.finiteuses:SetOnFinished(inst.Remove)
	
	inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
    inst.components.perishable:StartPerishing()
    inst.components.perishable:SetOnPerishFn(onperish)

    inst:AddComponent("tradable")
	
	MakeHauntableLaunch(inst)
	
	inst:AddComponent("repairer")
    inst.components.repairer.repairmaterial = MATERIALS.ICE
    inst.components.repairer.perishrepairpercent = .15

    inst:AddComponent("bait")
    inst:AddTag("molebait")
	
    inst.entity:SetPristine()
    inst:AddComponent("inspectable")
    inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "spycicle"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/spycicle.xml"

    --inst:AddComponent("characterspecific")	
    --inst.components.characterspecific:SetOwner("spy")
    return inst
end

return Prefab("common/inventory/spycicle", fn, assets)