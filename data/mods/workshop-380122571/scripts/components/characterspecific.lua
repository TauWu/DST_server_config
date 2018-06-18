local function IsValidOwner(inst, owner)
    return owner:HasTag("reaper")
end

local SentientScythe = Class(function(self, inst)
    self.inst = inst
    self.owner = nil
end)

function SentientScythe:SetOwner(owner)
    if self.owner ~= owner then
        if self.convo_task ~= nil then
            self.convo_task:Cancel()
            self.convo_task = nil
        end
        if self.owner ~= nil then
            self.inst:RemoveEventCallback("ondropped", toground)
            self.inst:RemoveEventCallback("equipped", onequipped)
        end
        self.owner = owner
        self.warnlevel = 0
        self.waslow = false
        if owner ~= nil then
            self.inst:ListenForEvent("ondropped", toground)
            self.inst:ListenForEvent("equipped", onequipped) 
    end
end

local function OnCheckOwner(inst, self)
    local owner = inst.components.inventoryitem:GetGrandOwner()
    if owner:HasTag("reaper") then
        return
    elseif not IsValidOwner(inst, owner) then
        self:Drop()
    end
end
end