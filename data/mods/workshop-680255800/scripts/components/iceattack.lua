local Iceattack = Class(function(self, inst)
	self.inst = inst

	self.damage = 15
	self.effect = function(weapon, attacker, target)
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
end)

function Iceattack:SetProjDamage(dmg)
	self.damage = dmg
end

function Iceattack:DoAttack(attacker, target)
    local projectile = SpawnPrefab("ice_projectile")
    projectile:AddComponent("weapon")
	projectile.components.weapon.damage = self.damage
	projectile.components.weapon:SetOnAttack(self.effect)
    projectile.Transform:SetPosition(attacker.Transform:GetWorldPosition())
    projectile.components.projectile:Throw(attacker, target)
end

return Iceattack
