

AddPrefabPostInit("firestaff",  function (inst)
inst:AddComponent("spellcaster")	
	inst.components.spellcaster.CanCast = (function (inst, target, pos)
		return true
	end)
	inst.components.spellcaster:SetSpellFn((function (inst, target, pos) 
	local caster = inst.components.inventoryitem.owner
		if target~=nil and target.prefab =="rock_ice" then       
			target:Remove()
			if inst.components.finiteuses then
				inst.components.finiteuses:Use(1)
			end
		elseif pos~=nil then
			local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 8, { "NOCLICK" }, { "player", "playerghost" })
			for i, v in ipairs(ents) do
				if v.prefab =="penguin_ice" then
					v:Remove()
					if inst.components.finiteuses then
						inst.components.finiteuses:Use(1)
					end
				end
			end
		end	
	end))
	inst.components.spellcaster.canuseontargets = true
	inst.components.spellcaster.canuseonpoint = true   
end )