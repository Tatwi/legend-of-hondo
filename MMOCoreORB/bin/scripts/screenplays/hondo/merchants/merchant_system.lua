-- Legend of Hondo Merchant System
-- By R. Bassett Jr. (Tatwi) - www.tpot.ca
-- July 2015, updated for Lua 5.3 compatibility July 2017

local ObjectManager = require("managers.object.object_manager")

MerchantSystem = ScreenPlay:new {
	numberOfActs = 1,
	states = {
		active = 2,
		complete = 4,
	}, 
	screenplayName = "MerchantSystem",
	selectedItemName = "Monkey",
	selectedOptName	= "George",
	selectedLineNum = 0,
}

registerScreenPlay("MerchantSystem", true)


function MerchantSystem:startShopping(pObject)
  ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
    creatureObject:setScreenPlayState(MerchantSystem.states.active, MerchantSystem.screenplayName)
  end)
end


function MerchantSystem:endShopping(pObject)
  ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
    creatureObject:removeScreenPlayState(MerchantSystem.states.active, MerchantSystem.screenplayName)
    creatureObject:setScreenPlayState(MerchantSystem.states.complete, MerchantSystem.screenplayName)
  end)
end


function MerchantSystem:resetStates(pObject)
  ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
    creatureObject:removeScreenPlayState(MerchantSystem.states.active, MerchantSystem.screenplayName)
    creatureObject:removeScreenPlayState(MerchantSystem.states.complete, MerchantSystem.screenplayName)
  end)
end


function MerchantSystem:firstToUpper(str)
	-- Convert word to Word
    return (str:gsub("^%l", string.upper))
end


function MerchantSystem:adjustPrice(conversingPlayer, cost, relationsTable)
	return ObjectManager.withCreatureAndPlayerObject(conversingPlayer, function(creatureObject, playerObject)
		-- Calculate price adjustment
		local finalPrice = cost
		for lc = 1, #relationsTable , 1 do
			local playerStanding = playerObject:getFactionStanding(relationsTable[lc].name)
			playerStanding = math.min(playerStanding, 5000) -- cap faction due to Rebel/Imperial
			
			local adjustment = relationsTable[lc].priceAdjust

			if (playerStanding ~= nil) then
				if (playerStanding > 0 and (relationsTable[lc].npcStanding > 0 or relationsTable[lc].npcStanding == -9000)) then
					-- Discount: You are my friend or are a friend of my friend
					finalPrice = finalPrice / ((adjustment * playerStanding / 5000 ) / 100 + 1)
				elseif (playerStanding < 0 and relationsTable[lc].npcStanding < 0 and relationsTable[lc].npcStanding ~= -9000) then
					-- Discount: You are also the enemy of my enemy
					finalPrice = finalPrice / ((adjustment / 4 * math.abs(playerStanding) / 5000 ) / 100 + 1)
				elseif (playerStanding > 0 and relationsTable[lc].npcStanding < 0 ) then
					-- Surcharge: You are friendly with my enemy
					finalPrice = finalPrice * ((adjustment * playerStanding / 5000 ) / 100 + 1)
				elseif (playerStanding < 0 and relationsTable[lc].npcStanding == -9000) then
					-- Surcharge: You are an enemy of my friend
					finalPrice = finalPrice * ((adjustment * math.abs(playerStanding) / 5000 ) / 100 + 1)
				end	
			end
		end
		return math.floor(finalPrice)
	end)
end


function MerchantSystem:refuseService(conversingPlayer, relationsTable)
	return ObjectManager.withCreatureAndPlayerObject(conversingPlayer, function(creatureObject, playerObject)
		-- Check NPC/Player relations
		for lc = 1, #relationsTable , 1 do
			local playerStanding = playerObject:getFactionStanding(relationsTable[lc].name)
			
			if (playerStanding ~= -9000) then -- Ignore special case price adjust standing
				if (playerStanding < relationsTable[lc].npcStanding and relationsTable[lc].npcStanding > 0) then
					creatureObject:sendSystemMessage("Hint: Increase your " .. MerchantSystem:firstToUpper(relationsTable[lc].name) .. " faction and speak with the NPC again.")
					return 2 -- Not friendly enough for service
				elseif (relationsTable[lc].npcStanding < 0 and (relationsTable[lc].npcStanding + playerStanding) > 0) then
					creatureObject:sendSystemMessage("Hint: Decrease your " .. MerchantSystem:firstToUpper(relationsTable[lc].name) .. " faction and speak with the NPC again.")
					return 1 -- Too friendly with my enemy for service
				end
			end
		end
		return 0 -- Will talk to player
	end)
end


function MerchantSystem:processSelection(pObject, optionLink, goodsTable, gtlc)
	ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject,playerObject)
		if (optionLink == goodsTable[gtlc].optName) then
			-- save selection data for use in confirmation step
			writeScreenPlayData(pObject, "MerchantSystem", "selectedItemName", goodsTable[gtlc].itemName) 
			writeScreenPlayData(pObject, "MerchantSystem", "selectedOptName", goodsTable[gtlc].optName) 
			writeScreenPlayData(pObject, "MerchantSystem", "selectedLineNum", gtlc) 
		end
	end)
end


function MerchantSystem:getSelectedOptName(pObject)
	return ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
		return readScreenPlayData(pObject, "MerchantSystem", "selectedOptName")
	end)
end


function MerchantSystem:getSelectedItemName(pObject)
	return ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
		return readScreenPlayData(pObject, "MerchantSystem", "selectedItemName")
	end)
end

function MerchantSystem:getSelectedLineNum(pObject)
	return ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
		return readScreenPlayData(pObject, "MerchantSystem", "selectedLineNum")
	end)
end

function MerchantSystem:completeSale(pObject, creature, relationsTable, goodsTable)
	ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
		local gtlc = MerchantSystem:getSelectedLineNum(pObject)
		gtlc = tonumber(gtlc)
		local credits = creature:getCashCredits()
		local pInventory = creature:getSlottedObject("inventory")
		local inventory = LuaSceneObject(pInventory)
		local numberOfItems = inventory:getContainerObjectsSize()
		local freeSpace = 80 - numberOfItems
		local pieces = #goodsTable[gtlc].items

		if (freeSpace < pieces) then
			creature:sendSystemMessage("Transaction Failed. You need " .. pieces .. " available inventory spaces to complete the transaction.")
		elseif (credits < goodsTable[gtlc].cost) then
			creature:sendSystemMessage("Transaction Failed. You do not have enough cash on hand to complete this transaction.")
		else
			-- Make the sale
			local chargePlayer = MerchantSystem:adjustPrice(pObject, goodsTable[gtlc].cost, relationsTable)
			
			if (chargePlayer ~= nil) then -- Error checking
				creature:subtractCashCredits(chargePlayer)
				-- Grant items
				for ic = 1, pieces , 1 do
					if (string.match(goodsTable[gtlc].items[ic], "draft_schematic")) then
						-- Crafted item
						local template = goodsTable[gtlc].items[ic]
						local crateQuantity = goodsTable[gtlc].crateSize
						local quality = goodsTable[gtlc].quality
						
						-- Apply relationship to item quality (min 1%, max 150%)
						if (quality > 1) then 
							local qualAdjust = goodsTable[gtlc].quality - MerchantSystem:adjustPrice(pObject, goodsTable[gtlc].quality, relationsTable) -- Because a good value from adjustPrice() is a smaller number
							
							quality = math.max(1, quality + qualAdjust)
							quality = math.min(150, quality)
						end
						
						local altTemplate = goodsTable[gtlc].altTemplate
						
						local pItem = bazaarBotMakeCraftedItem(pObject, template, crateQuantity, quality, altTemplate) -- Automatically targets the inventory
					else
						-- Generic item
						local pItem = giveItem(pInventory, goodsTable[gtlc].items[ic], -1)
					end
				end
			else 
				creature:sendSystemMessage("Transaction Failed. System error in price calculation.")
			end	
		end
	end)
end


-- The below functions allow each Merchant to have a unique conversation (in their convo template file)
-- while keeping the actual convo logic in just this one location.
function MerchantSystem:nextConvoScreenInnards(conversationTemplate, conversingPlayer, selectedOption, relationsTable, goodsTable)
	local creature = LuaCreatureObject(conversingPlayer)
	local convosession = creature:getConversationSession()
	lastConversation = nil
	local conversation = LuaConversationTemplate(conversationTemplate)
	local nextConversationScreen 
	
	if ( conversation ~= nil ) then
		if ( convosession ~= nil ) then 
			 local session = LuaConversationSession(convosession)
			 
			 if ( session ~= nil ) then
			 	lastConversationScreen = session:getLastConversationScreen()
			 end
		end
		
		if ( lastConversationScreen == nil ) then
			MerchantSystem:resetStates(conversingPlayer)
			-- See if NPC will talk to player
			local canTalk = MerchantSystem:refuseService(conversingPlayer, relationsTable)
		
			if (canTalk == 1) then
				nextConversationScreen = conversation:getScreen("get_lost")
			elseif (canTalk == 2) then
				nextConversationScreen = conversation:getScreen("faction_too_low")
			else 
				nextConversationScreen = conversation:getInitialScreen()
			end
		else		
			local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
			local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)
			
			local isShopping = creature:hasScreenPlayState(MerchantSystem.states.active, MerchantSystem.screenplayName)
			local checkingOut = creature:hasScreenPlayState(MerchantSystem.states.complete, MerchantSystem.screenplayName)
			
			-- Process sale 
			if (isShopping) then
				for lc = 1, #goodsTable , 1 do
					MerchantSystem:processSelection(conversingPlayer, optionLink, goodsTable, lc)
				end
				MerchantSystem:endShopping(conversingPlayer)
				nextConversationScreen = conversation:getScreen("confirm_purchase")
			elseif (checkingOut and optionLink ~= "nope") then 
				MerchantSystem:completeSale(conversingPlayer, creature, relationsTable, goodsTable)
				MerchantSystem:resetStates(conversingPlayer)
				nextConversationScreen = conversation:getScreen("bye")
			else
				nextConversationScreen = conversation:getScreen(optionLink)
			end
		end 
	end
	
	return nextConversationScreen
end


function MerchantSystem:runScreenHandlerInnards(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen, relationsTable, goodsTable)
	local creature = LuaCreatureObject(conversingPlayer)
	local player = LuaSceneObject(conversingPlayer)
	local screen = LuaConversationScreen(conversationScreen)
	local screenID = screen:getScreenID()
		
	-- Open shop and add items to choose	
	if (screenID == "shop") then
		conversationScreen = screen:cloneScreen()
		local clonedConversation = LuaConversationScreen(conversationScreen)
	
		for lc = 1, #goodsTable , 1 do
			local price = MerchantSystem:adjustPrice(conversingPlayer, goodsTable[lc].cost, relationsTable)
			clonedConversation:addOption(goodsTable[lc].itemName .. "  (" .. price .. ")" , goodsTable[lc].optName)
		end 
		MerchantSystem:startShopping(conversingPlayer)
	end
	
	if (screenID == "confirm_purchase") then
		conversationScreen = screen:cloneScreen()
		local clonedConversation = LuaConversationScreen(conversationScreen)
		local selectedOptName = MerchantSystem:getSelectedOptName(conversingPlayer)
		local selectedItemName = MerchantSystem:getSelectedItemName(conversingPlayer)

		clonedConversation:addOption("Yes, I want to buy a " .. selectedItemName, selectedOptName)
		clonedConversation:addOption("Nope", "nope")
	end
	
	return conversationScreen
end
