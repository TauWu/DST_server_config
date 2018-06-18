

local maxweapon = GetModConfigData("maxweapon")
local bonus = GetModConfigData("bonus")

local function RepairablePostInit(self)
    if not (GLOBAL.TheNet:GetIsServer() or GLOBAL.TheNet:IsDedicated()) then 
        return
    end
    local Old_Repair = self.Repair
    self.Repair = function(self, doer, repair_item)
        -- print("Repair Combine: repare "..tostring(self.inst.prefab).." with "..tostring(repair_item.prefab))
        if repair_item==nil or repair_item.components==nil or repair_item.components.repairer == nil or self.repairmaterial ~= repair_item.components.repairer.repairmaterial then
			-- wrong material
			return false
        end
        local actualbonus = bonus
        if actualbonus == 0.05 then
            actualbonus = math.random(5) -- between 1 and 5
        elseif actualbonus==0.1 then
            actualbonus = math.random(10) -- between 1 and 10
        end
        actualbonus = actualbonus/100
        if self.inst.components.finiteuses then
            if repair_item.components.repairer.finiteusesrepairpercent_fn then
                self.inst.components.finiteuses:SetPercent(math.min((repair_item.components.repairer.finiteusesrepairpercent_fn() + self.inst.components.finiteuses:GetPercent())+actualbonus,maxweapon))
            elseif repair_item.components.repairer.finiteusesrepairpercent then
                self.inst.components.finiteuses:SetPercent(math.min((repair_item.components.repairer.finiteusesrepairpercent + self.inst.components.finiteuses:GetPercent())+actualbonus,maxweapon))
            else
                return false
            end
        elseif self.inst.components.armor then
            if repair_item.components.repairer.armorrepairpercent_fn then
                self.inst.components.armor:SetPercent((repair_item.components.repairer.armorrepairpercent_fn() + self.inst.components.armor:GetPercent())+actualbonus) -- a max of 100% is in component
            elseif repair_item.components.repairer.armorrepairpercent then
                self.inst.components.armor:SetPercent((repair_item.components.repairer.armorrepairpercent + self.inst.components.armor:GetPercent())+actualbonus) 
            else
                return false
            end
        elseif self.inst.components.fueled then
            if repair_item.components.repairer.fuelrepairpercent_fn then
                self.inst.components.fueled:SetPercent((repair_item.components.repairer.fuelrepairpercent_fn() + self.inst.components.fueled:GetPercent())+actualbonus) -- a max of 100% is in component
            elseif repair_item.components.repairer.fuelrepairpercent then
                self.inst.components.fueled:SetPercent((repair_item.components.repairer.fuelrepairpercent + self.inst.components.fueled:GetPercent())+actualbonus)
            else
                return false
            end
        elseif self.inst.components.perishable and self.inst.components.equippable then
            if self.inst.components.perishable.perishremainingtime >= self.inst.components.perishable.perishtime then 
                return false
            end
            if repair_item.components.repairer.perishrepairpercent_fn then
                self.inst.components.perishable:SetPercent((self.inst.components.perishable:GetPercent() + repair_item.components.repairer.perishrepairpercent_fn())+actualbonus) -- a max of 100% is in component
            else
                return Old_Repair(self, doer, repair_item)
            end
        else
            return Old_Repair(self, doer, repair_item)
        end
        if bonus~=0 then
            print("Repair Combine: Give repair bonus of +"..tostring(actualbonus*100).."% to "..tostring(self.inst.prefab))
        end
        if repair_item.components.stackable ~= nil then
			repair_item.components.stackable:Get():Remove()
		else
			repair_item:Remove()
		end

		if self.onrepaired ~= nil then
			self.onrepaired(self.inst, doer, repair_item)
		end
		return true
    end
end
AddComponentPostInit("repairable",RepairablePostInit)


local function MakeRepairWithItself(inst)
    if inst and (inst:HasTag("musha_items") or inst:HasTag("yamche")) then
        return -- do not change musha items from musha mod
    end
    if not (GLOBAL.TheNet:GetIsServer() or GLOBAL.TheNet:IsDedicated()) then 
        GLOBAL.MATERIALS[string.upper(inst.prefab)] = inst.prefab -- has to be done also for clients... but clients have no components.. so we have to add everything to the materials table -.-
        return
    end
    if inst.components.finiteuses then
        if inst.components.repairable==nil and inst.components.repairer==nil then -- add this only tho things that aren't repairable already
            GLOBAL.MATERIALS[string.upper(inst.prefab)] = inst.prefab -- now also add the correct things to the materials table from server
            inst:AddComponent("repairable")
            inst.components.repairable.repairmaterial = GLOBAL.MATERIALS[string.upper(inst.prefab)]
            inst.components.repairable.announcecanfix = false
            -- Tag to allow repairs
            inst:AddTag("workrepairable")
            
            inst:AddComponent("repairer")
            inst.components.repairer.repairmaterial = GLOBAL.MATERIALS[string.upper(inst.prefab)]
            -- Placeholder value to trigger the repair prompt
            inst.components.repairer.workrepairvalue = 1
            -- Actual repair value, a percent that is given back to the repairable
            inst.components.repairer.finiteusesrepairpercent_fn = function() return inst.components.finiteuses:GetPercent() end
        else
            print("Repair Combine: "..tostring(inst.prefab).." is alrealy repairer or repairable, so dont give combine repairer")
        end
    elseif inst.components.armor then
        if inst.components.repairable==nil and inst.components.repairer==nil then -- add this only tho things that aren't repairable already
            GLOBAL.MATERIALS[string.upper(inst.prefab)] = inst.prefab
            inst:AddComponent("repairable")
            inst.components.repairable.repairmaterial = GLOBAL.MATERIALS[string.upper(inst.prefab)]
            inst.components.repairable.announcecanfix = false
            -- Tag to allow repairs
            inst:AddTag("workrepairable")
            
            inst:AddComponent("repairer")
            inst.components.repairer.repairmaterial = GLOBAL.MATERIALS[string.upper(inst.prefab)]
            -- Placeholder value to trigger the repair prompt
            inst.components.repairer.workrepairvalue = 1
            -- Actual repair value, a percent that is given back to the repairable
            inst.components.repairer.armorrepairpercent_fn = function() return inst.components.armor:GetPercent() end
        else
            print("Repair Combine: "..tostring(inst.prefab).." is alrealy repairer or repairable, so dont give combine repairer")
        end
    elseif inst.components.fueled then
        if inst.components.repairable==nil and inst.components.repairer==nil then -- add this only tho things that aren't repairable already
            GLOBAL.MATERIALS[string.upper(inst.prefab)] = inst.prefab
            inst:AddComponent("repairable")
            inst.components.repairable.repairmaterial = GLOBAL.MATERIALS[string.upper(inst.prefab)]
            inst.components.repairable.announcecanfix = false
            -- Tag to allow repairs
            inst:AddTag("workrepairable")
            
            inst:AddComponent("repairer")
            inst.components.repairer.repairmaterial = GLOBAL.MATERIALS[string.upper(inst.prefab)]
            -- Placeholder value to trigger the repair prompt
            inst.components.repairer.workrepairvalue = 1
            -- Actual repair value, a percent that is given back to the repairable
            inst.components.repairer.fuelrepairpercent_fn = function() return inst.components.fueled:GetPercent() end
        else
            print("Repair Combine: "..tostring(inst.prefab).." is alrealy repairer or repairable, so dont give combine repairer")
        end
    elseif inst.components.perishable and inst.components.equippable then
        if inst.components.repairable==nil and inst.components.repairer==nil then -- add this only tho things that aren't repairable already
            GLOBAL.MATERIALS[string.upper(inst.prefab)] = inst.prefab
            inst:AddComponent("repairable")
            inst.components.repairable.repairmaterial = GLOBAL.MATERIALS[string.upper(inst.prefab)]
            inst.components.repairable.announcecanfix = false
            -- Tag to allow repairs
            inst:AddTag("workrepairable")
            
            inst:AddComponent("repairer")
            inst.components.repairer.repairmaterial = GLOBAL.MATERIALS[string.upper(inst.prefab)]
            -- Placeholder value to trigger the repair prompt
            inst.components.repairer.workrepairvalue = 1
            -- Actual repair value, a percent that is given back to the repairable
            inst.components.repairer.perishrepairpercent_fn = function() return inst.components.perishable:GetPercent() end
        else
            print("Repair Combine: "..tostring(inst.prefab).." is alrealy repairer or repairable, so dont give combine repairer")
        end
    end
end


AddPrefabPostInitAny(MakeRepairWithItself)
