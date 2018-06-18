local require = GLOBAL.require
local Builder = require "components/builder"

GLOBAL.goidle = function()
    IdleGodmode()
end
function IdleGodmode()
    for k,v in pairs(GLOBAL.AllPlayers) do
        if v ~= nil then
            if v:HasTag("playerghost") then
                v.components.sanity.ignore = false
                v:PushEvent("respawnfromghost")
            end
            if v.components.beaverness ~= nil then
                v.components.beaverness:SetPercent(1)
            end
            v.components.health:SetPercent(1)
            v.components.hunger:SetPercent(1)
            v.components.sanity:SetPercent(1)
            v.components.temperature:SetTemperature(25)
            v.components.moisture:SetPercent(0)
            v.components.health:SetInvincible(true)
            v.components.builder.freebuildmode = true
            v:PushEvent("unlockrecipe")
        end
    end
end

if GetModConfigData("无敌模式") == "true" then 
    AddPrefabPostInit("world", function(inst)
        inst:ListenForEvent("ms_playerjoined", function(inst, player)
            IdleGodmode()
        end)
    end)
end

AddStategraphPostInit("wilson", function(sg)

	local state_opengift = sg.states["opengift"]
	state_opengift.onenter = function(inst)

		inst.components.locomotor:Stop()
	    inst.components.locomotor:Clear()
	    inst:ClearBufferedAction()

        inst.sg.statemem.isfailed = true
        inst.sg:GoToState("idle")
        
        inst.SoundEmitter:PlaySound("dontstarve/common/player_receives_gift")
        inst.AnimState:PlayAnimation("gift_pre")
        inst.AnimState:PushAnimation("giift_loop", true)
        -- NOTE: the previously used ripping paper anim is called "giift_loop"

        -- if inst.components.playercontroller ~= nil then
        --     inst.components.playercontroller:RemotePausePrediction()
        --     inst.components.playercontroller:EnableMapControls(false)
        --     inst.components.playercontroller:Enable(false)
        -- end
        inst.components.inventory:Hide()
        inst:PushEvent("ms_closepopups")
        inst:ShowActions(false)
        inst:ShowGiftItemPopUp(true)

        if inst.components.giftreceiver ~= nil then
            inst.components.giftreceiver:OnStartOpenGift()
        end
    end
    state_opengift.onexit = function(inst)
    if inst.sg.statemem.isfailed then
            return
        elseif not inst.sg.statemem.isopeningwardrobe then
            -- if inst.components.playercontroller ~= nil then
            --     inst.components.playercontroller:EnableMapControls(true)
            --     inst.components.playercontroller:Enable(true)
            -- end
            inst.components.inventory:Show()
            inst:ShowActions(true)
        end
        inst:ShowGiftItemPopUp(false)
    end
end)
