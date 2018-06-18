local EngieTeleporter = Class(function(self, inst)
    self.inst = inst
    self.boundEntrance = nil
end)

local tp_sayings = {
	GENERIC = { "Thanks for the ride!", "I'm back!", "Thanks!", "Thanks.", "Woah, thanks for the ride!", "I'm back everyone!", "Hello again!", "Thanks for the ride.", "Thanks for the trip!"},
	wilson = { "Woah! Thanks for the trip, Engineer!", "You must tell me more about this teleportation, Engineer!", "Scientific!"},
	willow = { "Ha! Thanks, Engineer!", "Next Level!", "Haha, woah! Nice!"},
	wolfgang = { "Wolfgang love tiny egg-head man!", "Wolfgang is dizzy."},
	wx78 = { "RELOCATION SUCCESSFUL.", "RELOCATION: SUCCESS"},
	wendy = { "I am reborn.", "I have been reborn.", "I have been brought back into this world, sadly."},
	wickerbottom = { "I appreciate the transportation, Engineer.", "Thank you for the transportation, Engineer."},
	woodie = { "Woah! Thanks for the trip, builder man!", "Hoo, thanks for the crazy trip, builder man!"},
	waxwell = { "Good work, construction worker.", "You've done me well, construction worker."},
	wathgrithr = { "Back into the fray!", "The curtains open once more!", "I have returned!", "I've returned! I am glad to have the Engineer by my side!", "A triumphant return!"},
	webber = { "Woah! Now we're dizzy!", "Haha! Again!", "We can't believe it! Thank you Mr.Engineer!"},
	wes = { " "},
	walani = { "Nice. I could get used to this.", "Thanks, dude.", "Thanks, Engie guy."},
    warly = { "Oh, uh, Thank you!", "Gah, magic. Thanks anyhow!", "Thank you for the easy access route!", "My head's spinning, might I still have it?"},
    woodlegs = { "Arrr!", "Thank ye fer whatever thet was.", "Whut kind o'travel this be?", "This be how the youngins travelling nowadays?", "Thanks fer the fast travel, me hard-hatted matey."},
	wilbur = { "Oah ooh.. oh!", "Ooo Oah oo.", "Oah ooa oh ooh!"},
	medic = { "Danke, Engineer!", "Thank you, Engineer!", "Danke, mein hard-hatted friend!"},
	spy = { "Thank you, laborer!", "Thank you, my friend!", "Cheers, Engineers."},
	engineer = { "Much obliged, pardner!", "Thanks for the ride, pardner." },
	tf2soldier = { "Thanks, Engie.", "Thanks.", "Thanks for the Teleporter."},
	demoman = { "Thanks, lad!", "Thanks fer the ride!", "Woooo! Wooh... What?"},
    tf2scout = { "Thanks for the ride!", "Hey good job there, hardhat!", "Thanks for that, tough guy!"},
	sniper = { "Thanks, mate!", "Thanks!", "Thanks for that, Truckie!"},
	heavy = { "Thanks for ride!", "Was good trip!", "Engineer is credit to team!"},
}

function EngieTeleporter:TeleportAction(doer)	
    local char_accounce_table = tp_sayings[doer.prefab] or tp_sayings["GENERIC"]
    local say_index = math.floor(GetRandomMinMax(0,#char_accounce_table)) + 1

    if self.boundEntrance.pairedGUID then
	self.boundEntrance.paired:PushEvent("startfx")
	doer.SoundEmitter:PlaySound("dontstarve/common/researchmachine_lvl3_run", "sound")
	doer.sg:GoToState("forcetele")
	doer:Show()
	doer:ScreenFade(true, 0)
        doer:DoTaskInTime(1.3, function()
	    doer.Physics:Teleport(self.boundEntrance.paired:GetPosition():Get())


    if doer.components.leader ~= nil then
        for follower, v in pairs(doer.components.leader.followers) do
            follower.Physics:Teleport(self.boundEntrance.paired:GetPosition():Get())
        end
    end

    --special case for the chester_eyebone: look for inventory items with followers
    if doer.components.inventory ~= nil then
        for k, item in pairs(doer.components.inventory.itemslots) do
            if item.components.leader ~= nil then
                for follower, v in pairs(item.components.leader.followers) do
                    follower.Physics:Teleport(self.boundEntrance.paired:GetPosition():Get())
                end
            end
        end
        -- special special case, look inside equipped containers
        for k, equipped in pairs(doer.components.inventory.equipslots) do
            if equipped.components.container ~= nil then
                for j, item in pairs(equipped.components.container.slots) do
                    if item.components.leader ~= nil then
                        for follower, v in pairs(item.components.leader.followers) do
                            follower.Physics:Teleport(self.boundEntrance.paired:GetPosition():Get())
                        end
                    end
                end
            end
        end
    end

	    doer:SnapCamera()
	    doer.sg:GoToState("idle")
	    doer.SoundEmitter:KillSound("sound")
	    self.boundEntrance.paired:PushEvent("endfx")
	    doer:DoTaskInTime(3*FRAMES, function()
		doer.components.talker:Say( char_accounce_table[say_index] )
		doer.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/lightninggoat/shocked_electric")
		local telefx = SpawnPrefab("eshockfx")
		telefx.Transform:SetScale(.80, 0.5, .80)
		telefx.entity:AddFollower()
		telefx.Follower:FollowSymbol(doer.GUID, "swap_body", 0, 0, 0)
	    end)
	end)
    end
end

return EngieTeleporter