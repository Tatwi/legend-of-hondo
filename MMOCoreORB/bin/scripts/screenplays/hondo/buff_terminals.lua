-- Buff Terminals
-- Documentation: doc/features/add-buff-terminals.md

TarkinBuffTerminal = ScreenPlay:new {
	numberOfActs = 1,
	healingFee = 2000, -- Optional fee (in Credits) for healing wounds and battle fatigue
	buffPets = 1, -- 0 = No, 1 = Yes. Will buff all the player's active pets Health/Action/Mind with the same boost as the player.
	buffPetSecondaryStats = 0, -- 0 = No, 1 = Yes. Will also buff the pet's secondary stats.
	buffs = {
		-- Legend: {name, price, duration in hours, health, strength, constitution, action, quickness, stamina, mind, focus, willpower},
		{"Starter Buff", 0, 4, 500, 100, 50, 200, 100, 50, 200, 100, 50, requiredSkills = {}, requiredSkillNames = ""}, -- Free!
		{"Basic Buff", 5000, 3, 800, 300, 150, 500, 300, 150, 350, 200, 100, requiredSkills = {}, requiredSkillNames = ""},
		{"Advanced Buff", 15000, 2, 1100, 500, 250, 800, 500, 250, 500, 250, 150, requiredSkills = {"", ""}, requiredSkillNames = ""},
		{"Uber Buff", 25000, 1, 1500, 750, 250, 800, 750, 250, 800, 350, 200, requiredSkills = {"", ""}, requiredSkillNames = ""},
	},
	termModel = "object/tangible/terminal/terminal_light_enclave_voting.iff",
	termName = "Medical Services Terminal",
	terminals = {
		{planetName = "tatooine", x = -32.7499, z = 0.258537, y = 3.52207, ow = 0.729551, oy = 0.683926, cellID = 9995780}, -- Mos Espa Hospital
		{planetName = "tatooine", x = 7.73135, z = 0.26, y = -1.69846, ow = 0.353085, oy = 0.935591, cellID = 9995699}, -- Mos Espa Hospital
		{planetName = "tatooine", x = -2932.59, z = 5.0, y = 2117.02, ow = 0.899624, oy = 0.436665, cellID = 0}, -- Mos Espa starting area 
	}
}

registerScreenPlay("TarkinBuffTerminal", true)

function TarkinBuffTerminal:start()
	-- Spawn terminals
	for i = 1, #self.terminals, 1 do
		local pTerminal = spawnSceneObject(self.terminals[i].planetName, self.termModel , self.terminals[i].x, self.terminals[i].z, self.terminals[i].y, self.terminals[i].cellID, self.terminals[i].ow, 0, self.terminals[i].oy, 0)
		if (pTerminal ~= nil) then
			-- Add menu and custom name
			SceneObject(pTerminal):setObjectMenuComponent("TarkinBuffTerminalMenuComponent")
			SceneObject(pTerminal):setCustomObjectName(self.termName)
		end
	end
end


-- UI Window Functions

function TarkinBuffTerminal:openWindow(pCreatureObject, pUsingObject)
	local sui = SuiListBox.new("TarkinBuffTerminal", "defaultCallback")

	-- Using object ID, stored in PageData
	if (pUsingObject == nil) then
		sui.setTargetNetworkId(0)
	else
		sui.setTargetNetworkId(SceneObject(pUsingObject):getObjectID())
	end

	sui.setForceCloseDistance(16)

	sui.setTitle("Buff Terminal")
	
	local message = "Please select a service below. \n\nNotice: \nAll current buffs (of all types) will be removed when purchasing a buff from this terminal. Therefore, you should save your consumable buffs for after you've purchased a terminal buff."
	
	if (self.buffPets == 1) then
		message = message .. "\n\nAll of your currently active pets will also recieve a buff to their "
		
		if (self.buffPetSecondaryStats == 1) then 
			message = message .. "primary and secondary stats."
		else 
			message = message .. "primary stats."
		end
	else
		message = message .. "\n\nNo buffs will be applied to your pets."
	end
	
	sui.setPrompt(message)

	sui.add("Remove My Buffs and Empty My Stomach", "")
	sui.add("Remove Buffs from My Active Pets", "")
	
	local healMessage = "Heal My Wounds and Battle Fatigue"
	
	if (self.healingFee > 0) then
		healMessage = healMessage .. " (" .. tostring(self.healingFee) .. "cr)"
	end
	
	sui.add(healMessage, "")

	for i = 1, #self.buffs, 1 do
		sui.add("Apply " .. self.buffs[i][1] .. " (" .. tostring(self.buffs[i][2]) .. "cr/" .. tostring(self.buffs[i][3]) .. "h)", "")
	end

	sui.sendTo(pCreatureObject)
end

function TarkinBuffTerminal:defaultCallback(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	if (args == "-1") then
		CreatureObject(pPlayer):sendSystemMessage("No option was selected, please try again.")
		return
	end

	local selectedOption = tonumber(args) + 1
	
	if (selectedOption == 1) then
		self:removePlayerBuffs(pPlayer)
	elseif (selectedOption == 2) then
		self:removePetBuffs(pPlayer)
	elseif (selectedOption == 3) then
		self:healWounds(pPlayer)
	elseif (selectedOption > 3) then
		self:applyBuff(pPlayer, selectedOption - 3) -- The -3 is to compensate for the first four entries in the menu
	end
end


-- Buff Functions

function TarkinBuffTerminal:removePlayerBuffs(pPlayer)
	CreatureObject(pPlayer):removeBuffs()
	CreatureObject(pPlayer):emptyStomach()
	CreatureObject(pPlayer):sendSystemMessage("Your buffs have been removed and your stomach is now empty.")
end

function TarkinBuffTerminal:removePetBuffs(pPlayer)
	local numberOfPets = CreatureObject(pPlayer):getActivePetsSize()
		
	if (numberOfPets > 0) then
		for i = 1, numberOfPets, 1 do
			local pPet = CreatureObject(pPlayer):getActivePet(i - 1)
			CreatureObject(pPet):removeBuffs()
		end
		
		CreatureObject(pPlayer):sendSystemMessage("Your pet's buffs have been removed.")
	else
		CreatureObject(pPlayer):sendSystemMessage("You didn't have any pets out, so no buffs were removed. Please call a pet and try again.")
	end
end

function TarkinBuffTerminal:healWounds(pPlayer)
	local price = self.healingFee

	if (price > 0) then
		if (CreatureObject(pPlayer):getCashCredits() < price) then
			CreatureObject(pPlayer):sendSystemMessage("Insufficient Funds: You require " .. tostring(self.healingFee) .. " credits in cash to use the healing service.")
			return
		end
		
		CreatureObject(pPlayer):subtractCashCredits(price)
	end

	for i = 0, 8 do
		CreatureObject(pPlayer):setWounds(i, 0)
	end
	
	CreatureObject(pPlayer):setShockWounds(0)
	CreatureObject(pPlayer):sendSystemMessage("Your wounds have been healed and your mind is at ease.")
end

function TarkinBuffTerminal:applyBuff(pPlayer, buffSelected)
	local duration = self.buffs[buffSelected][3] * 60  * 60
	local price = self.buffs[buffSelected][2]
	
	if (price > 0)then
		if (CreatureObject(pPlayer):getCashCredits() < price) then
			CreatureObject(pPlayer):sendSystemMessage("Insufficient Funds: You require " .. tostring(self.buffs[buffSelected][2]) .. " credits in cash to purchase the selected buff.")
			return
		end
		
		CreatureObject(pPlayer):subtractCashCredits(price)
	end
	
	CreatureObject(pPlayer):removeBuffs()
	CreatureObject(pPlayer):emptyStomach()
	
	CreatureObject(pPlayer):buffSingleStat("health", self.buffs[buffSelected][4], duration)
	CreatureObject(pPlayer):buffSingleStat("strength", self.buffs[buffSelected][5], duration)
	CreatureObject(pPlayer):buffSingleStat("constitution", self.buffs[buffSelected][6], duration)
	CreatureObject(pPlayer):buffSingleStat("action", self.buffs[buffSelected][7], duration)
	CreatureObject(pPlayer):buffSingleStat("quickness", self.buffs[buffSelected][8], duration)
	CreatureObject(pPlayer):buffSingleStat("stamina", self.buffs[buffSelected][9], duration)
	CreatureObject(pPlayer):buffSingleStat("mind", self.buffs[buffSelected][10], duration)
	CreatureObject(pPlayer):buffSingleStat("focus", self.buffs[buffSelected][11], duration)
	CreatureObject(pPlayer):buffSingleStat("willpower", self.buffs[buffSelected][12], duration)
	
	CreatureObject(pPlayer):sendSystemMessage("Your buffs have been applied. They will last for " .. tostring(self.buffs[buffSelected][3]) .. " hours.")
	
	if (self.buffPets == 1) then
		local numberOfPets = CreatureObject(pPlayer):getActivePetsSize()
		
		if (numberOfPets > 0) then
			for i = 1, numberOfPets, 1 do
				local pPet = CreatureObject(pPlayer):getActivePet(i - 1)
				
				CreatureObject(pPet):removeBuffs()
		
				CreatureObject(pPet):buffSingleStat("health", self.buffs[buffSelected][4], duration)
				CreatureObject(pPet):buffSingleStat("action", self.buffs[buffSelected][7], duration)
				CreatureObject(pPet):buffSingleStat("mind", self.buffs[buffSelected][10], duration)
				
				if (self.buffPetSecondaryStats == 1) then
					CreatureObject(pPet):buffSingleStat("strength", self.buffs[buffSelected][5], duration)
					CreatureObject(pPet):buffSingleStat("constitution", self.buffs[buffSelected][6], duration)
					CreatureObject(pPet):buffSingleStat("quickness", self.buffs[buffSelected][8], duration)
					CreatureObject(pPet):buffSingleStat("stamina", self.buffs[buffSelected][9], duration)
					CreatureObject(pPet):buffSingleStat("focus", self.buffs[buffSelected][11], duration)
					CreatureObject(pPet):buffSingleStat("willpower", self.buffs[buffSelected][12], duration)
				end
			end
			
			CreatureObject(pPlayer):sendSystemMessage("Your active pets have also been buffed.")
		end
	end
end


-- Radial Menu Functions

TarkinBuffTerminalMenuComponent = { }

function TarkinBuffTerminalMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Use Terminal")
	menuResponse:addRadialMenuItem(120, 3, "About Buffs")
end

function TarkinBuffTerminalMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	if CreatureObject(pPlayer):isInCombat() then
		CreatureObject(pPlayer):sendSystemMessage("Terminal services are not available while you are in combat.")
		return 0
	end
	
	if (selectedID == 20) then
		TarkinBuffTerminal:openWindow(pPlayer, pObject)
	elseif (selectedID == 120) then
		local suiManager = LuaSuiManager()
		local helpMessage = "This window shows the stats that are increased for each buff type, as well as their price and duration.\n\n"
		
		for i = 1, #TarkinBuffTerminal.buffs, 1 do
			helpMessage = helpMessage .. TarkinBuffTerminal.buffs[i][1] .. " (" .. tostring(TarkinBuffTerminal.buffs[i][2]) .. "cr/" .. tostring(TarkinBuffTerminal.buffs[i][3]) .. "h):\n" -- BuffName (1234cr/2h):
			helpMessage = helpMessage .. "- - - - - - - - - - - - -\n"
			helpMessage = helpMessage .. "Health: " .. TarkinBuffTerminal.buffs[i][4] .. "\n"
			helpMessage = helpMessage .. "Strength: " .. TarkinBuffTerminal.buffs[i][5] .. "\n"
			helpMessage = helpMessage .. "Constitution: " .. TarkinBuffTerminal.buffs[i][6] .. "\n"
			helpMessage = helpMessage .. "Action: " .. TarkinBuffTerminal.buffs[i][7] .. "\n"
			helpMessage = helpMessage .. "Quickness: " .. TarkinBuffTerminal.buffs[i][8] .. "\n"
			helpMessage = helpMessage .. "Stamina: " .. TarkinBuffTerminal.buffs[i][9] .. "\n"
			helpMessage = helpMessage .. "Mind: " .. TarkinBuffTerminal.buffs[i][10] .. "\n"
			helpMessage = helpMessage .. "Focus: " .. TarkinBuffTerminal.buffs[i][11] .. "\n"
			helpMessage = helpMessage .. "Willpower: " .. TarkinBuffTerminal.buffs[i][12] .. "\n\n"
		end
		
		suiManager:sendMessageBox(pObject, pPlayer, "About Buffs", helpMessage, "@ok", "TarkinBuffTerminalMenuComponent", "noCallback")
	end 
	
	return 0
end

function TarkinBuffTerminalMenuComponent:noCallback(pPlayer, pSui, eventIndex)
	-- do nothing
end
