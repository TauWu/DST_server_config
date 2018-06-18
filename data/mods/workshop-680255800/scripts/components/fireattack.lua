local FireAttack = Class(function(self, inst)
	self.inst = inst

	self.damage = 5
	self.effect = function(weapon, attacker, target)
		if target.components.burnable and not target.components.burnable:IsBurning() then
			if target.components.freezable and target.components.freezable:IsFrozen() then           
				target.components.freezable:Unfreeze()
			else
				if not target:HasTag("campfire") then
					target.components.burnable:Ignite(true)
				end
			end   
		end

		if target.components.freezable then
			target.components.freezable:AddColdness(-1) --Does this break ice staff?
			if target.components.freezable:IsFrozen() then
				target.components.freezable:Unfreeze()            
			end
		end

		if target.components.sleeper and target.components.sleeper:IsAsleep() then
			target.components.sleeper:WakeUp()
		end

		if target.components.combat then
			target.components.combat:SuggestTarget(attacker)
		end

		attacker.SoundEmitter:PlaySound("dontstarve/wilson/fireball_explo")
		target:PushEvent("attacked", {attacker = attacker, damage = 0})
	end
end)

function FireAttack:SetProjDamage(dmg)
	self.damage = dmg
end

function FireAttack:DoAttack(attacker, target)
	-- inst.components.container:ConsumeByName("cred", 1)
    local projectile = SpawnPrefab("fire_projectile")
    projectile:AddComponent("weapon")
	projectile.components.weapon.damage = self.damage
	projectile.components.weapon:SetOnAttack(self.effect)
    projectile.Transform:SetPosition(attacker.Transform:GetWorldPosition())
    projectile.components.projectile:Throw(attacker, target)
end

return FireAttack
