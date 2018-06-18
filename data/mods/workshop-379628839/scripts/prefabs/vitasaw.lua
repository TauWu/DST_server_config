local assets =
{
	Asset("ANIM", "anim/vitasaw.zip"),
	Asset("ANIM", "anim/swap_vitasaw.zip"),

	Asset("ATLAS", "images/inventoryimages/vitasaw.xml"),
    Asset("IMAGE", "images/inventoryimages/vitasaw.tex"),
}

local function IsValidVictim(victim)
    return victim ~= nil
        and not (victim:HasTag("veggie") or
                victim:HasTag("structure") or
				victim:HasTag("butterfly") or
                victim:HasTag("wall"))
        and victim.components.health ~= nil
        and victim.components.combat ~= nil
end

local function GetVitaBonus(inst, data)
if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) ~= nil and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("vitasaw") then
	--This is probably the messiest and laziest way of going about this but, whatever! Not like I'm getting paid or anything.
	local victim = data.victim
    if IsValidVictim(victim) then
	if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("nilorgans") then
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon.damage = TUNING.VITASAW_MIN_DAMAGE+5
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):AddTag("1organs")
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):RemoveTag("nilorgans")
	elseif
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("1organs") and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("nilorgans") then
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon.damage = TUNING.VITASAW_MIN_DAMAGE+10
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):RemoveTag("1organs")
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):AddTag("2organs")
	elseif
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("2organs") and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("nilorgans") and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("1organs") then
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon.damage = TUNING.VITASAW_MIN_DAMAGE+15
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):RemoveTag("2organs")
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):AddTag("3organs")
	elseif
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("3organs") and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("nilorgans") and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("1organs") and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("2organs") then
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon.damage = TUNING.VITASAW_MIN_DAMAGE+20
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):RemoveTag("3organs")
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):AddTag("4organs")
	elseif
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("4organs") and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("nilorgans") and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("1organs") and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("2organs")
    and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("3organs") then
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon.damage = TUNING.VITASAW_MIN_DAMAGE+25
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):RemoveTag("4organs")
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):AddTag("5organs")
	elseif
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("5organs") and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("nilorgans") and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("1organs") and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("2organs")
    and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("3organs") and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("4organs") then
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon.damage = TUNING.VITASAW_MIN_DAMAGE+30
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):RemoveTag("5organs")
	inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):AddTag("6organs")
	end
	end
end
end

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_vitasaw", "vitasaw")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
	owner:ListenForEvent("killed", GetVitaBonus)

	if owner then
		owner.components.health.maxhealth = owner.components.health.maxhealth - TUNING.VITASAW_HEALTH   
        owner.components.health:DoDelta(0)
	end
	
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
	inst.components.weapon:SetDamage(TUNING.VITASAW_MIN_DAMAGE)
	owner:RemoveEventCallback("killed", GetVitaBonus)
	if not inst:HasTag("nilorgans") then
	inst:AddTag("nilorgans")
	inst:RemoveTag("1organs")
	inst:RemoveTag("2organs")
	inst:RemoveTag("3organs")
	inst:RemoveTag("4organs")
	inst:RemoveTag("5organs")
	inst:RemoveTag("6organs")
	end

	if owner then
	owner.components.health.maxhealth = owner.components.health.maxhealth + TUNING.VITASAW_HEALTH  
    owner.components.health:DoDelta(0)
	end
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	
    inst.AnimState:SetBank("vitasaw")
    inst.AnimState:SetBuild("vitasaw")
    inst.AnimState:PlayAnimation("idle")
	
	inst:AddTag("sharp")
	inst:AddTag("vitasaw")
	inst:AddTag("nilorgans")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.VITASAW_MIN_DAMAGE)
	
	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.VITASAW_USES)
    inst.components.finiteuses:SetUses(TUNING.VITASAW_USES)
	inst.components.finiteuses:SetOnFinished(inst.Remove)

    MakeHauntableLaunch(inst)

    inst:AddComponent("inspectable")
    inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
	inst.components.inventoryitem.imagename = "vitasaw"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/vitasaw.xml"

    return inst
end

return Prefab("common/inventory/vitasaw", fn, assets)