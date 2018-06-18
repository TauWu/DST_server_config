------------------------ PART I -------------------------
------------------------ Common -------------------------
local _G = GLOBAL
local require = GLOBAL.require
local TheNet = _G.rawget(_G, "TheNet")
show_type = 0

local random_health_value = 0

if random_health_value ~= 0 then
    VARIATION_PRECENT = " (±" ..(random_health_value * 100) .. "%)"
    VARIATION_HP_MIN =  0
    -- 0.1
    VARIATION_HP_MAX = 1 - VARIATION_HP_MIN
    -- 0.9
end

local DISABLE_HELATHINFO_RECURSIVE = 0 -- Must be disabled if > 0

local config = {
    healthbarSize = GetModConfigData("HealthbarSize"),
    wideHealthbar = GetModConfigData("WideHealthbar"),
    fontSize = GetModConfigData("FontSize"),
    showHealthText = GetModConfigData("ShowHealthText"),
    showTraitsText = GetModConfigData("ShowTraitsText")
}

local MonsterHealthbar = require "monsterhealthbar"

AddClassPostConstruct("widgets/controls", function(hud)
    MonsterHealthbar.init(hud, config)
end )

-- Small easy tech function for injection
local function InjectFull(comp, fn_name, fn)
    local old_fn = comp[fn_name]
    -- Saving and publishing all old functions. Someone may need it.
    comp[fn_name] = function(self, ...)
        local res = old_fn(self, ...)
        return fn(res, self, ...)
    end
end


---------------------------- PART II -----------------------
---------------------------- Only DST ----------------------

local IsServer = TheNet:GetIsServer()
local IsDedicated = TheNet:IsDedicated()

-- Two dirty client functions

local GetRandomMinMax = _G.GetRandomMinMax
local function OnHealthInfoDirty(inst)
    inst.health_info_exact = inst.net_health_info:value()
    if random_health_value == 0 or inst.health_info_max_exact <= 0 then
        inst.health_info = inst.health_info_exact
        return
    end
    local hp_max = VARIATION_HP_MAX * inst.health_info_max_exact
    local hp_min = VARIATION_HP_MIN * inst.health_info_max_exact
    if inst.health_info_exact >= hp_max or inst.health_info_exact <= hp_min then
        inst.health_info = inst.health_info_exact
        return
    end

    if inst.health_info_wait_task == nil then
        inst.health_info = GetRandomMinMax(inst.health_info_exact *(1 - random_health_value), inst.health_info_exact *(1 + random_health_value))
        inst.health_info_shown = inst.health_info_exact
        inst.health_info_wait_task = inst:DoTaskInTime(3, function(inst)
            -- Can't change health while timer is running.
            inst.health_info_wait_task = nil
            if inst.health_info_shown ~= inst.health_info_exact then
                OnHealthInfoDirty(inst)
                -- recursive
            end
        end )
    end
end

function OnHealthInfoMaxDirty(inst)
    local old = inst.health_info_max_exact
    inst.health_info_max_exact = inst.net_health_info_max:value()
    inst.health_info_max = random_health_value ~= 0 and show_type == 0 and -1 or inst.health_info_max_exact
    if old == 0 and show_type == 3 and inst.health_info_max_exact > 0 and inst.health_info_exact ~= 0 then
        OnHealthInfoDirty(inst)
    end
end

local TheWorld = _G.TheWorld
if _G.TheNet.GetIsMasterSimulation then
    _G.getmetatable(_G.TheNet).__index.GetIsMasterSimulation =( function()
        local oldObj = _G.getmetatable(_G.TheNet).__index.GetIsMasterSimulation
        return function(...)
            TheWorld = _G.TheWorld
            return oldObj(...)
        end
    end )()
end

AddPrefabPostInit("world", function(inst)
    TheWorld = inst
end )

local boss32bit = { toadstool = true, dragonfly = true, } -- Prefabs with over 65535 hp.

-- Initialization of all prefabs.
local net_uint, net_ushortint = _G.net_uint, _G.net_ushortint
AddPrefabPostInitAny( function(inst)
    inst.health_info = 0
    inst.health_info_max = 0
    -- should be exact 0 because we will check it later if it's not zero.
    if boss32bit[inst.prefab] then
        -- 32bit. Max 4kkk hp.
        inst.net_health_info = net_uint(inst.GUID, "health_info", "health_info_dirty")
        inst.net_health_info_max = net_uint(inst.GUID, "health_info_max", "health_info_max_dirty")
    else
        -- 16bit. Maximum of 65535 health.
        inst.net_health_info = net_ushortint(inst.GUID, "health_info", "health_info_dirty")
        inst.net_health_info_max = net_ushortint(inst.GUID, "health_info_max", "health_info_max_dirty")
    end
    inst.health_info_max_exact = 0
    if not IsDedicated then
        -- Means client OR host.
        inst:ListenForEvent("health_info_dirty", OnHealthInfoDirty)
        inst:ListenForEvent("health_info_max_dirty", OnHealthInfoMaxDirty)
    end
    if not TheWorld.ismastersim then
        -- Means only client.
        return
    end
    -- Only server code...
    if inst.components.health then
        inst.net_health_info:set(inst.components.health.currenthealth)
        inst.net_health_info_max:set(inst.components.health.maxhealth)
    end
end )



local img = require "widgets/image"
local function FOverride(comp, fn_name, fn)
    local old_fn = comp[fn_name]
    comp[fn_name] = function(self, w, h)
		local w0, h0 = self.inst.ImageWidget:GetSize()
		if w0 == nil or h0 == nil then
			w0 = 1
			h0 = 1
		end
		
		if w == nil or h == nil then
			w = 1
			h = 1
		end
		
		local scalex = w / w0
		local scaley = h / h0
		self:SetScale(scalex, scaley, 1)
    end
end
	
FOverride(img, "ScaleToSize", function(w, h, self) end )

-----Only Server Side -----
if not IsServer then

    return
end




--------------------------------- PART III ------------------------------
------------------------- Only Server Side code -------------------------


local health = require "components/health"
InjectFull(health, "SetCurrentHealth", function(aaa, self)
    if self.inst.health_info ~= nil then
        self.inst.net_health_info:set(self.currenthealth)
    end
end )
InjectFull(health, "SetMaxHealth", function(aaa, self)
    if self.inst.health_info ~= nil then
        self.inst.net_health_info:set(self.currenthealth)
        self.inst.net_health_info_max:set(self.maxhealth)
    end
end )
InjectFull(health, "DoDelta", function(aaa, self)
    if self.inst.health_info ~= nil then
        self.inst.net_health_info:set(self.currenthealth)
    end
end )

InjectFull(health, "OnRemoveFromEntity", function(aaa, self)
    if self.inst.health_info ~= nil then
        self.inst.net_health_info_max:set(0)
    end
end )