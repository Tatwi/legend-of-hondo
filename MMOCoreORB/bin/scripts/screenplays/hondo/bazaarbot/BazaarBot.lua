-- BazaarBot
-- A simple way to populate the bazaar with goods
-- Documentation: doc/features/mod-bazaarbot.md

includeFile("hondo/bazaarbot/table_resources.lua")
includeFile("hondo/bazaarbot/table_armor.lua")
includeFile("hondo/bazaarbot/table_medicine.lua")
includeFile("hondo/bazaarbot/table_food.lua")
includeFile("hondo/bazaarbot/table_weapons.lua")
includeFile("hondo/bazaarbot/table_item_artisan.lua")
includeFile("hondo/bazaarbot/table_structures.lua")
includeFile("hondo/bazaarbot/table_furniture.lua")
includeFile("hondo/bazaarbot/table_clothing.lua")
includeFile("hondo/bazaarbot/table_loot.lua")

BazaarBot = ScreenPlay:new {
	numberOfActs = 1,
	BazaarBotID = 281474993618333, -- Make a character named BazaarBot and put its PlayerID number here (/getPlayerID BazaarBot).
	terminalIDs = {3945386}, -- One SNAPSHOT FILE LOADED Bazaar Terminal ObjectID per region/city you want to (randomly) sell items in
	itemDescription = "", -- Optional message in the description window.
	listingsInit = 30, -- On first boot after this system is installed, the server will loop this many times through the add functions
}

registerScreenPlay("BazaarBot", true)

function BazaarBot:start()
	local pBazaarBot = getCreatureObject(self.BazaarBotID)
	
	if (pBazaarBot == nil) then
		printf("ERROR: BazaarBot character does not exist! Please create it on an ADMIN ACCOUNT and configure bin/screenplays/hondo/bazaarbot/BazaarBot.lua to use the system.")
		return
	end

	-- Testing trigger object (WARNING: ANY PLAYER CAN INTERACT WITH IT!)
	--self:loadTestingObject()
	
	-- Populate a new server's bazaar 
	local init = getQuestStatus("BazaarBot:Initialized")
	
	if (init == nil) then
		createServerEvent(300*1000, "BazaarBot", "initializeListings", "BazaarBotInitializeListings")
	else
		-- Schedule the lister events for after server has fully booted
		if (hasServerEvent("BazaarBotStartEvents")) then
		rescheduleServerEvent("BazaarBotStartEvents", 300*1000)
		else
			createServerEvent(300*1000, "BazaarBot", "startEvents", "BazaarBotStartEvents")
		end
		
		-- Schedule inventory purging
		if (hasServerEvent("BazaarBotCleanInventory")) then
		rescheduleServerEvent("BazaarBotCleanInventory", 4*60*1000)
		else
			createServerEvent(4*60*1000, "BazaarBot", "checkInventory", "BazaarBotCleanInventory")
		end
	end
end

function BazaarBot:startEvents()
	self:addMoreResources()
	self:addMoreArmor()
	self:addMoreMedicine()
	self:addMoreFood()
	self:addMoreWeapons()
	self:addMoreArtisanItems()
	self:addMoreStructures()
	self:addMoreFurniture()
	self:addMoreClothing()
	self:addMoreLoot()
	printf("BazaarBot: All listing events have now started and will repeat on their own periodically.\n")
end

function BazaarBot:initializeListings()
	printf("BazaarBot: Populating bazaar with items and resources for the first time...\n")
	for i = 1, self.listingsInit do
		self:addMoreResources()
		self:addMoreArmor()
		self:addMoreMedicine()
		self:addMoreFood()
		self:addMoreWeapons()
		self:addMoreArtisanItems()
		self:addMoreStructures()
		self:addMoreFurniture()
		self:addMoreClothing()
		self:addMoreLoot()
	end
	setQuestStatus("BazaarBot:Initialized", 1)
	printf("BazaarBot: Initialized!\n")
end

-- A full inventory will prevent the creation and listing of new items
function BazaarBot:checkInventory()
	local pBazaarBot = getCreatureObject(self.BazaarBotID)
	local pInventory = CreatureObject(pBazaarBot):getSlottedObject("inventory")
	local itemInInventory = math.tointeger(SceneObject(pInventory):getContainerObjectsSize())
	
	if (itemInInventory > 50) then
		self:cleanInventory(pBazaarBot, pInventory)
	end
end

function BazaarBot:cleanInventory(pBazaarBot, pInventory)
	printf("BazaarBot: Cleaning my inventory. This may kick out an error message about a table not being in range, which you can igone.\n")
	
	while (itemInInventory ~= nil) do
		local pItem = SceneObject(pInventory):getContainerObject(i)
		
		SceneObject(pItem):destroyObjectFromWorld()
		SceneObject(pItem):destroyObjectFromDatabase()
		
		itemInInventory = math.tointeger(SceneObject(pInventory):getContainerObjectsSize())
	end
	
	printf("BazaarBot: Done!\n")
end

function BazaarBot:logListing(message)
	local outputFile = "log/bazaarbot_listings.log"
	logToFile(message, outputFile)
end

function BazaarBot:chooseBazaarTerminal()
	local vendorID = 0

	if (#self.terminalIDs > 1) then
		vendorID = self.vendorIDs[getRandomNumber(1, #self.terminalIDs)]
	else
		vendorID = self.terminalIDs[1]
	end
	
	local pVendor = getSceneObject(vendorID)
	
	return pVendor
end

-- Resource Functions

function BazaarBot:addMoreResources()
	self:checkInventory()
	self:listResources()
	
	local nextTime = BBResConfig.freq * 60*1000 + getRandomNumber(1,300000)
	
	if (hasServerEvent("BazaarBotAddResources")) then
		rescheduleServerEvent("BazaarBotAddResources", nextTime)
	else
		createServerEvent(nextTime, "BazaarBot", "addMoreResources", "BazaarBotAddResources")
	end
end

function BazaarBot:pickResource()
	local resourceName = nil
	
	while (resourceName == nil) do
		-- Pick a family
		local famGroup = getRandomNumber(1,#BBResFamWeighted)
		local family = getRandomNumber(1,#BBResFamWeighted[famGroup])
		local familyName = BBResFamWeighted[famGroup][family]
		
		-- Pick a specific resource that is in spawn
		local rand = getRandomNumber(1,#BBResCats[familyName])
		local resourceCategory = BBResCats[familyName][rand]
		resourceName = getRandomResource(resourceCategory, BBResConfig.onlyInSpawn)
	end
	
	return resourceName
end

function BazaarBot:listResources()
	local pVendor = self:chooseBazaarTerminal()
	local pBazaarBot = getCreatureObject(self.BazaarBotID)
	local loggingNames = ""
	
	for i = 1, BBResConfig.quantity do -- x number of resources
		local resourceName = self:pickResource()
		local listedOK = false
		
		for j = 1, #BBResConfig.stackSizes do -- x number of stack sizes
			for k = 1, BBResConfig.stacks do -- x number of stacks
				local pItem = bazaarBotMakeResources(pBazaarBot, resourceName, BBResConfig.stackSizes[j])
				local price = BBResConfig.stackSizes[j] * BBResConfig.creditsPerUnit
				
				if (pItem ~= nil) then
					bazaarBotListItem(pBazaarBot, pItem, pVendor, self.itemDescription, price)
					listedOK = true
				else
					printf("BazaarBot: Failed to generate a stack of resource using the following name: " .. resourceName .. "\n")
				end
			end
		end
		
		if (listedOK == true) then
			self:logListing("Resource: " .. resourceName .. " " .. tostring(#BBResConfig.stackSizes * BBResConfig.stacks) .. " stacks")
		else
			self:logListing("Resource: " .. resourceName .. " Failed")
		end
	end
	
end


-- Crafted Item Functions

function BazaarBot:addMoreArmor()
	self:addMoreCraftedItems(BBArmorConfig, BBArmorItems)
end

function BazaarBot:addMoreMedicine()
	self:addMoreCraftedItems(BBMedicineConfig, BBMedicineItems)
end

function BazaarBot:addMoreFood()
	self:addMoreCraftedItems(BBFoodConfig, BBMFoodItems)
end

function BazaarBot:addMoreWeapons()
	self:addMoreCraftedItems(BBWeaponsConfig, BBWeaponsItems)
end

function BazaarBot:addMoreArtisanItems()
	self:addMoreCraftedItems(BBArtisanConfig, BBArtisanItems)
end

function BazaarBot:addMoreStructures()
	self:addMoreCraftedItems(BBStructuresConfig, BBStructuresItems)
end

function BazaarBot:addMoreFurniture()
	self:addMoreCraftedItems(BBFurnitureConfig, BBFurnitureItems)
end

function BazaarBot:addMoreClothing()
	self:addMoreCraftedItems(BBClothingConfig, BBClothingItems)
end

function BazaarBot:addMoreCraftedItems(configTable, itemTable)
	self:checkInventory()
	self:listCraftedItems(configTable, itemTable)
	
	local nextTime = configTable.freq * 1000 + getRandomNumber(1,300000)
	
	if (hasServerEvent(configTable.eventName)) then
		rescheduleServerEvent(configTable.eventName, nextTime)
	else
		createServerEvent(nextTime, "BazaarBot", configTable.functionName, configTable.eventName)
	end
end

function BazaarBot:listCraftedItems(configTable, itemTable)
	local pVendor = self:chooseBazaarTerminal()
	local pBazaarBot = getCreatureObject(self.BazaarBotID)
	local listedOK = false
	
	for j = 1, #itemTable do
		for i = 1, itemTable[j][2] do -- quantity
			for k = 5, #itemTable[j] do -- items in each group/index
				local template = configTable.path .. itemTable[j][k] .. ".iff"
				local altTemplate = itemTable[j][4]
				local crateQuantity = itemTable[j][3]
			
				-- Determine item quality
				local excellent = getRandomNumber(1, 100)
				local minQuality = configTable.qualityMin
				local maxQuality = configTable.qualityAvg
				
				if (excellent > 89) then
					minQuality = configTable.qualityAvg
					maxQuality = configTable.qualityMax
				elseif (excellent > 99) then
					minQuality = configTable.qualityMax + 1
					maxQuality = configTable.qualityMax + 5
				end
			
				local quality = getRandomNumber(minQuality,maxQuality)
				local price = itemTable[j][1] * ((quality/200) + 1) * crateQuantity
				
				local pItem = bazaarBotMakeCraftedItem(pBazaarBot, template, crateQuantity, quality, altTemplate)
				
				if (pItem ~= nil) then
					bazaarBotListItem(pBazaarBot, pItem, pVendor, self.itemDescription, price)
				else
					self:logListing("Craft: " .. configTable.functionName .. "() Failed: " .. template)
					return
				end
			end
		end
	end
	
	self:logListing("Craft: " .. configTable.functionName .. "() OK")
end


-- Loot functions

function BazaarBot:addMoreLoot()
	self:checkInventory()
	-- Schedule Event
	local nextTime = BBLootConfig.freq * 1000 + getRandomNumber(1,300000)
	
	if (hasServerEvent(BBLootConfig.eventName)) then
		rescheduleServerEvent(BBLootConfig.eventName, nextTime)
	else
		createServerEvent(nextTime, "BazaarBot", BBLootConfig.functionName, BBLootConfig.eventName)
	end

	-- Create and list the loot
	local pVendor = self:chooseBazaarTerminal()
	local pBazaarBot = getCreatureObject(self.BazaarBotID)
	
	for i = 1, BBLootConfig.quantity do
		local rarity = getRandomNumber(1,100)
		local indexGroup = 1 
		
		if (rarity == 100) then
			indexGroup = 9 -- Extremely Rare		
		elseif (rarity > 96) then
			indexGroup = getRandomNumber(7,8) -- Rare
		elseif (rarity > 69) then
			indexGroup = getRandomNumber(5,6) -- Uncommon
		elseif (rarity > 0) then
			indexGroup = getRandomNumber(1,4) -- Common
		end
	
		local lootName = BBLootItems[indexGroup][getRandomNumber(1,#BBLootItems[indexGroup])]
		local lootLevel = getRandomNumber(BBLootConfig.minLevel,BBLootConfig.maxLevel)
		 
		local pItem = bazaarBotMakeLootItem(pBazaarBot, lootName, lootLevel, false)
	
		if (pItem ~= nil) then
			local lootLevelFactor = (BBLootPriceRanges[indexGroup].minPrice) * (lootLevel / 250 + 1)
			
			local price = getRandomNumber(lootLevelFactor, BBLootPriceRanges[indexGroup].maxPrice)
			
			local junkValue = TangibleObject(pItem):getJunkValue()
			
			if (junkValue > price) then
				price = junkValue * 2
			end

			bazaarBotListItem(pBazaarBot, pItem, pVendor, self.itemDescription, price)
			self:logListing("Loot: " .. SceneObject(pItem):getObjectName() .. " (" .. tostring(lootLevel) .. ") " .. tostring(price) .. "cr")
		else
			self:logListing("Loot: " .. lootName .. " (" .. tostring(lootLevel) .. ") Failed")
		end
	end
end


-- Testing
--[[
function BazaarBot:test(pPlayer, pObject)
	--self:addMoreResources()
	--self:addMoreArmor()
	--self:addMoreMedicine()
	--self:addMoreFood()
	--self:addMoreWeapons()
	--self:addMoreArtisanItems()
	--self:addMoreStructures()
	--self:addMoreFurniture()
	self:addMoreClothing()
	--for i = 1, 100 do
	--	self:addMoreLoot()
	--end
	CreatureObject(pPlayer):sendSystemMessage("Test Complete!")
end

function BazaarBot:loadTestingObject()
	local pTerminal = spawnSceneObject("tatooine", "object/tangible/furniture/decorative/foodcart.iff" , 1591, 7, 3031, 0, 0, 0, 0, 0)
	
	if (pTerminal ~= nil) then
		-- Add menu and custom name
		SceneObject(pTerminal):setObjectMenuComponent("ABTestMenuComponent")
		SceneObject(pTerminal):setCustomObjectName("BazaarBot Trigger")
	end
end

ABTestMenuComponent = { }

function ABTestMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Run Test")
end

function ABTestMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	if CreatureObject(pPlayer):isInCombat() then
		CreatureObject(pPlayer):sendSystemMessage("Terminal services are not available while you are in combat.")
		return 0
	end
	
	if (selectedID == 20) then
		BazaarBot:test(pPlayer, pObject)
	end 
	
	return 0
end

function ABTestMenuComponent:noCallback(pPlayer, pSui, eventIndex)
	-- do nothing
end
--]]
