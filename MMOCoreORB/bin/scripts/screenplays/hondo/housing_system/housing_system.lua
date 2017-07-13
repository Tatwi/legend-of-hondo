-- Legend of Hondo
-- Hondo Housing System
-- Created by R. Bassett Jr. (Tatwi) 2016 www.tpot.ca
-- Player purchases a structure from terminals at predefined locations.
-- Documentation: doc/features/add-housingsystem.md

local ObjectManager = require("managers.object.object_manager")
includeFile("hondo/housing_system/housing_system_layouts.lua")
includeFile("hondo/housing_system/locations_corellia.lua")
includeFile("hondo/housing_system/locations_dantooine.lua")
includeFile("hondo/housing_system/locations_dathomir.lua")
includeFile("hondo/housing_system/locations_endor.lua")
includeFile("hondo/housing_system/locations_lok.lua")
includeFile("hondo/housing_system/locations_naboo.lua")
includeFile("hondo/housing_system/locations_rori.lua")
includeFile("hondo/housing_system/locations_talus.lua")
includeFile("hondo/housing_system/locations_tatooine.lua")
includeFile("hondo/housing_system/locations_yavin4.lua")
--includeFile("hondo/housing_system/locations_simple.lua") -- debug

HondoHousingSystem = ScreenPlay:new {
	numberOfActs = 1,
	termModel = "object/tangible/furniture/imperial/data_terminal_s1.iff",
	layoutTestTime = 15, -- Seconds until a layout is deleted when you plop one down with /hondo admin testLayout...
	maxOwnedPlots = 0, -- Max account-wide plots a player can own. 0 = unlimited.
	waypointSpecialType = 12,  -- Any int 12 and up will do. Use a unique number per quest/purpose so they don't over-write each other.
}

registerScreenPlay("HondoHousingSystem", true)

-- Load terminals at server boot
function HondoHousingSystem:start()
	local pOwnerMan = spawnMobile("tatooine", "r3", 1, 7679, 0, 7679, 0, 0)
	CreatureObject(pOwnerMan):setCustomObjectName("R3-0WN3R") -- Owns the filler and tour buildings so they don't get auto-deleted. MUST BE THIS NAME! Move him anywhere though.
	setQuestStatus("HondoHousingSystem:R3-0WN3R", SceneObject(pOwnerMan):getObjectID())

	printf("Hondo Housing System: Loading terminals and temp buildings....\n")

	self:spawnSites("corellia", corellia_locations, pOwnerMan)
	self:spawnSites("dantooine", dantooine_locations, pOwnerMan)
	self:spawnSites("dathomir", dathomir_locations, pOwnerMan)
	self:spawnSites("endor", endor_locations, pOwnerMan)
	self:spawnSites("lok", lok_locations, pOwnerMan)
	self:spawnSites("naboo", naboo_locations, pOwnerMan)
	self:spawnSites("rori", rori_locations, pOwnerMan)
	self:spawnSites("talus", talus_locations, pOwnerMan)
	self:spawnSites("tatooine", tatooine_locations, pOwnerMan)
	self:spawnSites("yavin4", yavin4_locations, pOwnerMan)
	--self:spawnSites("simple", simple_locations, pOwnerMan) -- debug

	SceneObject(pOwnerMan):switchZone("tatooine", 7679, 0, 7679, 0)

	printf("Hondo Housing System: Finished loading terminals temp buildings.\n")
end

function HondoHousingSystem:spawnSites(planetName, locTable, pOwnerMan)
	if (not isZoneEnabled(planetName)) then
		return
	end

	if (#locTable < 1) then
		return
	end

	-- Move R3-0WN3R
	SceneObject(pOwnerMan):switchZone(planetName, 7679, 0, 7679, 0)

	for i = 1, #locTable, 1 do
		-- Get terminal world location
		local worldX, worldY = self:getWorldPosition(locTable[i].center.angle, layouts[locTable[i].layout].terminal.x, layouts[locTable[i].layout].terminal.y, locTable[i].center.x, locTable[i].center.y)

		-- Spawn terminal
		local pTerminal = spawnSceneObject(planetName, self.termModel , worldX, locTable[i].center.z, worldY, 0, locTable[i].center.ow, 0, locTable[i].center.oy, 0)
		if (pTerminal ~= nil) then
			-- Add menu and custom name
			SceneObject(pTerminal):setObjectMenuComponent("HondoHousingSystemMenuComponent")
			SceneObject(pTerminal):setCustomObjectName(layouts[locTable[i].layout].terminal.name)
			setQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(i) .. "TerminalID", SceneObject(pTerminal):getObjectID())
		end

		-- Spawn temporary structures (1 per plot per site) to fill the space, if a player hasn't moved here yet
		for j = 1, #layouts[locTable[i].layout].plots, 1 do
			local plotUsed = tonumber(getQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(i) .. "Plot" .. tostring(j) .. "InUse"))

			-- Initialize plot use status the first time the server boots after adding a site.
			if (plotUsed == nil) then
				setQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(i) .. "Plot" .. tostring(j) .. "InUse", 0)
				printf("... One-time InUse values initialized to 0 for " .. planetName .. " site " .. i .. " plot " .. j .. ".\n")
			end

			if (plotUsed ~= 1) then
				local buildingTemplate = layouts[locTable[i].layout].plots[j].buildings[1].template -- default is first template
				worldX, worldY = self:getWorldPosition(locTable[i].center.angle, layouts[locTable[i].layout].plots[j].x, layouts[locTable[i].layout].plots[j].y, locTable[i].center.x, locTable[i].center.y)

				local rotation = locTable[i].center.angle + layouts[locTable[i].layout].plots[j].localRotation

				if (layouts[locTable[i].layout].plots[j].buildings[1].rotationFudge ~= nil) then
					rotation = rotation + layouts[locTable[i].layout].plots[j].buildings[1].rotationFudge
				end

				local pBuilding = spawnBuilding(pOwnerMan, buildingTemplate, worldX, worldY, rotation)
				setQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(i) .. "Plot" .. tostring(j) .. "BuildingID", tostring(SceneObject(pBuilding):getObjectID()))
			end
		end
	end
end


-- Helper Functions

function HondoHousingSystem:getWorldPosition(angle, childX, childY, orgX, orgY)
	angle = math.rad(angle)

	local x = (math.cos(angle) * childX) + (childY * math.sin(angle))
	local y = (math.cos(angle) * childY) - (childX * math.sin(angle))

	x = x + orgX
	y = y + orgY

	return x, y
end

function HondoHousingSystem:getLocationTable(planetName)
	if (planetName == "corellia") then
		return corellia_locations
	elseif (planetName == "dantooine") then
		return dantooine_locations
	elseif (planetName == "dathomir") then
		return dathomir_locations
	elseif (planetName == "endor") then
		return endor_locations
	elseif (planetName == "lok") then
		return lok_locations
	elseif (planetName == "naboo") then
		return naboo_locations
	elseif (planetName == "rori") then
		return rori_locations
	elseif (planetName == "talus") then
		return talus_locations
	elseif (planetName == "tatooine") then
		return tatooine_locations
	elseif (planetName == "yavin4") then
		return yavin4_locations
	elseif (planetName == "simple") then
		return simple_locations
	else
		return nil
	end
end

function HondoHousingSystem:roundNumber(num)
	local mult = 10 ^ (0)
	return math.floor(num * mult + 0.5) / mult
end


-- Admin Functions

-- /hondo admin housingFixPlotStatus [planetName] [site] [plot] [status]
function HondoHousingSystem:adminFixPlotStatus(pPlayer, planetName, site, plot, status)
	setQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(site) .. "Plot" .. tostring(plot) .. "InUse", status) -- 0 unused, 1 used
	CreatureObject(pPlayer):sendSystemMessage("Hondo Housing System: Plot statis has been set to (" .. status .. ").")
end

-- /hondo admin housingFixPlayerPlotsUsed [playerAccountID] [plotsUsed]
function HondoHousingSystem:adminFixPlayerPlotsUsed(pPlayer, playerAccountID, plotsUsed)
	setQuestStatus("HondoHousingSystem:PlotsUsedOnAccount" .. playerAccountID, plotsUsed)

	local plotsUsed = getQuestStatus("HondoHousingSystem:PlotsUsedOnAccount" .. playerAccountID)
	CreatureObject(pPlayer):sendSystemMessage("Hondo Housing System: Player plots used value is now (" .. plotsUsed .. ").")
end

-- /hondo admin housingFixPlayerTourStatus [playerID]
function HondoHousingSystem:adminFixPlayerTourStatus(pPlayer, playerID)
	local pTargetPlayer = getCreatureObject(playerID)

	if (pTargetPlayer ~= nil) then
		writeScreenPlayData(pTargetPlayer, "HondoHousingSystem", "tourBuildingID", "")
		CreatureObject(pPlayer):sendSystemMessage("Hondo Housing System: Player tour statis reset.")
	else
		CreatureObject(pPlayer):sendSystemMessage("Error: Invalid Player ID.")
	end
end

function HondoHousingSystem:adminTestLayout(pPlayer, layoutName, buildingNumber)
	if (layouts[layoutName] == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid template name.")
		return
	end

	local startTime = tonumber(readScreenPlayData(pPlayer, "HondoHousingSystem", "testLayoutStartTime"))

	if (startTime ~= nil) then
		local now = getTimestampMilli()
		local deltaT = (now - startTime) / 1000 -- Convert to seconds

		if (deltaT < self.layoutTestTime + 1) then
			local timeLeft = self.layoutTestTime + 1 - deltaT
			CreatureObject(pPlayer):sendSystemMessage("Ability is on cooldown for " .. timeLeft .. " more seconds.")
			return
		end
	end

	local num = tonumber(buildingNumber)
	local planetName = SceneObject(pPlayer):getZoneName()
	local x = SceneObject(pPlayer):getPositionX()
	local y = SceneObject(pPlayer):getPositionY()
	local z = SceneObject(pPlayer):getPositionZ()
	local angle = tonumber(SceneObject(pPlayer):getDirectionAngle())

	if (angle > 180) then
		angle = -360 + angle
	elseif (angle < -180) then
		angle = 360 + angle
	end

	printf("Start Testing Structure Layout\n - - - - - - - - - - - - - - - \n")
	printf("adminTestLayout planetName = " .. planetName .. "\n")
	printf("adminTestLayout layoutName = " .. layoutName .. "\n")
	printf("adminTestLayout x = " .. x .. "\n")
	printf("adminTestLayout y = " .. y .. "\n")
	printf("adminTestLayout z = " .. z .. "\n")
	printf("adminTestLayout angle = " .. angle .. "\n")

	printf("Terminal\n - - - - - - - - - - - - - - - \n")

	local worldX, worldY = self:getWorldPosition(angle, layouts[layoutName].terminal.x, layouts[layoutName].terminal.y, x, y)

	printf("adminTestLayout worldX = " .. worldX .. "\n")
	printf("adminTestLayout worldY = " .. worldY .. "\n")


	-- Spawn terminal
	local pTerminal = spawnSceneObject(planetName, HondoHousingSystem.termModel , worldX, z, worldY, 0, 0, 0, 0, 0)

	printf("Terminal Spawned \n")

	if (pTerminal ~= nil) then
		SceneObject(pTerminal):setCustomObjectName("Dummy Terminal -  Rotation values ignored...")

		writeScreenPlayData(pPlayer, "HondoHousingSystem", "testLayoutTerminalID", SceneObject(pTerminal):getObjectID())

		printf("Dummy terminal added OK\n - - - - - - - - - - - - - - - \n")
	end

	-- Spawn temporary structures (1 per plot per site) to fill the space, if a player hasn't moved here yet
	for j = 1, #layouts[layoutName].plots, 1 do
		printf("Building ".. j .." \n - - - - - - - - - - - - - - - \n")

		local buildNum = num

		if (#layouts[layoutName].plots[j].buildings < num) then
			buildNum = 1
			CreatureObject(pPlayer):sendSystemMessage("Plot " .. j ..": Building number provided greater than number of buildings available. First building used.")
		end

		local buildingTemplate = layouts[layoutName].plots[j].buildings[buildNum].template

		printf("adminTestLayout buildingTemplate = " .. buildingTemplate .. "\n")

		worldX, worldY = self:getWorldPosition(angle, layouts[layoutName].plots[j].x, layouts[layoutName].plots[j].y, x, y)

		printf("adminTestLayout worldX = " .. worldX .. "\n")
		printf("adminTestLayout worldY = " .. worldY .. "\n")

		local rot = HondoHousingSystem:roundNumber(angle + layouts[layoutName].plots[j].localRotation)

		if (layouts[layoutName].plots[j].buildings[buildNum].rotationFudge ~= nil) then
			rot = rot + layouts[layoutName].plots[j].buildings[buildNum].rotationFudge
		end

		printf("adminTestLayout Local rotation = " .. layouts[layoutName].plots[j].localRotation .. "\n")
		printf("adminTestLayout Final rotation = " .. rot .. "\n")

		local pBuilding = spawnBuilding(pPlayer, buildingTemplate, worldX, worldY, rot)

		writeScreenPlayData(pPlayer, "HondoHousingSystem", "testLayoutBuildingID" .. tostring(j), SceneObject(pBuilding):getObjectID())
		writeScreenPlayData(pPlayer, "HondoHousingSystem", "testLayoutBuildings", j)
		printf("Building was spawned OK \n - - - - - - - - - - - - - - - \n")
	end

	local now = getTimestampMilli()
	writeScreenPlayData(pPlayer, "HondoHousingSystem", "testLayoutStartTime", tostring(now))

	createEvent(15*1000, "HondoHousingSystem", "endTestLayout", pPlayer, "")
	CreatureObject(pPlayer):sendSystemMessage("Testing layout.... will self destruct in " .. self.layoutTestTime .. " seconds...")
end

function HondoHousingSystem:endTestLayout(pPlayer)
	local terminalID = readScreenPlayData(pPlayer, "HondoHousingSystem", "testLayoutTerminalID")
	local pTerminal = getSceneObject(terminalID)
	SceneObject(pTerminal):destroyObjectFromWorld()

	local buildings = tonumber(readScreenPlayData(pPlayer, "HondoHousingSystem", "testLayoutBuildings"))

	for i = 1, buildings, 1 do
		local buildingID = readScreenPlayData(pPlayer, "HondoHousingSystem", "testLayoutBuildingID".. tostring(i))
		destroyBuilding(buildingID)
	end
end


-- Menu functions, step by step

function HondoHousingSystem:openWindow(pPlayer, pObject, loc, locTable, planetName)
	local sui = SuiListBox.new("HondoHousingSystem", "showAvailableBuildings") -- callback

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	sui.setTitle(planetName .. " Site " .. tostring(loc))

	local promptText = "Welcome Citizen,\n\n"
	promptText = (promptText .. "With this terminal you may purchase and build a structure of your choice at this. Please select a plot to see the buildings that may be built there.\n\n")
	promptText = (promptText .. "- Mos Espa Housing Authority")

	local layoutName = locTable[loc].layout

	for i = 1, #layouts[layoutName].plots, 1 do
		local plotUsed = tonumber(getQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(loc) .. "Plot" .. tostring(i) .. "InUse"))

		if (plotUsed == 1) then
			sui.add("Plot " .. tostring(i) .. ": Unavailable", "")
		else
			sui.add("Plot " .. tostring(i) .. ": " .. layouts[layoutName].plots[i].plotName, "")
		end
	end

	sui.setPrompt(promptText)
	sui.sendTo(pPlayer)
end

function HondoHousingSystem:showAvailableBuildings(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	if (args == "-1") then
		CreatureObject(pPlayer):sendSystemMessage("No plot was selected, please try again.")
		return
	end

	local selectedPlot = tonumber(args) + 1
	local planetName = SceneObject(pPlayer):getZoneName()
	local locTable = HondoHousingSystem:getLocationTable(planetName)
	local loc = tonumber(readScreenPlayData(pPlayer, "HondoHousingSystem", "activeLocation"))
	local layoutName = locTable[loc].layout

	-- Prevent use of unavailable plot
	local plotUsed = tonumber(getQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(loc) .. "Plot" .. tostring(selectedPlot) .. "InUse"))
	if (plotUsed == 1) then
		CreatureObject(pPlayer):sendSystemMessage("Unavailable plot was selected. Please try again.")
		return
	end

	writeScreenPlayData(pPlayer, "HondoHousingSystem", "selectedPlot", selectedPlot)

	local sui = SuiListBox.new("HondoHousingSystem", "showDetails") -- callback

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())
	sui.setTitle("Structures")
	sui.setPrompt("Please select a building type for more information about it. Prices are conveniently shown in brackets after the building name.")

	for i = 1, #layouts[layoutName].plots[selectedPlot].buildings, 1 do
		sui.add(layouts[layoutName].plots[selectedPlot].buildings[i].buildingName .. " (" .. tostring(layouts[layoutName].plots[selectedPlot].buildings[i].price) .. ")", "")
	end

	sui.sendTo(pPlayer)
end

function HondoHousingSystem:showDetails(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	if (args == "-1") then
		CreatureObject(pPlayer):sendSystemMessage("No structure was selected, please try again.")
		return
	end

	local selectedBuilding = tonumber(args) + 1
	writeScreenPlayData(pPlayer, "HondoHousingSystem", "selectedBuilding", selectedBuilding)

	local planetName = SceneObject(pPlayer):getZoneName()
	local selectedPlot = tonumber(readScreenPlayData(pPlayer, "HondoHousingSystem", "selectedPlot"))
	local locTable = HondoHousingSystem:getLocationTable(planetName)
	local loc = tonumber(readScreenPlayData(pPlayer, "HondoHousingSystem", "activeLocation"))
	local layoutName = locTable[loc].layout
	local buildingTemplate = layouts[layoutName].plots[selectedPlot].buildings[selectedBuilding].template

	local sui = SuiListBox.new("HondoHousingSystem", "buyOrTour") -- callback

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	sui.setTitle("Details")

	local zoning = "Residential"

	if (layouts[layoutName].plots[selectedPlot].buildings[selectedBuilding].zoning == 1) then
		zoning = "Commercial"
	end

	local promptText = layouts[layoutName].plots[selectedPlot].buildings[selectedBuilding].buildingName .. "\n\n"
	promptText = (promptText .. "Zoning: " .. zoning .. "\n")
	promptText = (promptText .. "Maintenance Rate: " .. getMaintenanceRate(buildingTemplate) .. " credits/hour.\n")
	if (buildingTemplate:find("factory")) then
		promptText = (promptText .. "Power Rate: " .. getPowerRate(buildingTemplate) .. " units/hour.\n")
	end
	promptText = (promptText .. "Storage Capacity: " .. getMaxStorage(buildingTemplate) .. " items.\n")
	promptText = (promptText .. "\nSelect the 'Take a Tour' option below for a five minute preview of the completed structure.")
	sui.setPrompt(promptText)

	sui.add("Take a Tour", "tour")
	sui.add("Purchase Structure", "buy")

	sui.sendTo(pPlayer)
end

function HondoHousingSystem:buyOrTour(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end

	if (args == "-1") then
		CreatureObject(pPlayer):sendSystemMessage("No option was selected. Have a nice day.")
		return
	end

	local selectedIndex = tonumber(args) + 1

	if (selectedIndex == 1) then
		HondoHousingSystem:startTour(pPlayer)
	elseif (selectedIndex == 2) then
		HondoHousingSystem:confirmPurchase(pPlayer)
	else
		CreatureObject(pPlayer):sendSystemMessage("Transaction Failed. Sorry, something went wrong, but no money was spent. (buyOrTour)") -- should not happen
	end
end


-- Tour functions

function HondoHousingSystem:startTour(pPlayer)
	local planetName = SceneObject(pPlayer):getZoneName()
	local selectedPlot = tonumber(readScreenPlayData(pPlayer, "HondoHousingSystem", "selectedPlot"))
	local selectedBuilding = tonumber(readScreenPlayData(pPlayer, "HondoHousingSystem", "selectedBuilding"))
	local locTable = HondoHousingSystem:getLocationTable(planetName)
	local loc = tonumber(readScreenPlayData(pPlayer, "HondoHousingSystem", "activeLocation"))
	local layoutName = locTable[loc].layout
	local buildingTemplate = layouts[layoutName].plots[selectedPlot].buildings[selectedBuilding].template
	local worldX, worldY = self:getWorldPosition(locTable[loc].center.angle, layouts[layoutName].plots[selectedPlot].x, layouts[layoutName].plots[selectedPlot].y, locTable[loc].center.x, locTable[loc].center.y)
	local rot = HondoHousingSystem:roundNumber(locTable[loc].center.angle + layouts[layoutName].plots[selectedPlot].localRotation)

	if (layouts[layoutName].plots[selectedPlot].buildings[selectedBuilding].rotationFudge ~= nil) then
		rot = rot + layouts[layoutName].plots[selectedPlot].buildings[selectedBuilding].rotationFudge
	end

	-- Destroy filler building
	local tempBuildingID = getQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. loc .. "Plot" .. selectedPlot .. "BuildingID")
	if (tempBuildingID ~= nil) then
		destroyBuilding(tempBuildingID)
	end

	-- Move OwnerMan!
	local ownerManID = getQuestStatus("HondoHousingSystem:R3-0WN3R")
	local pOwnerMan = getCreatureObject(ownerManID)
	SceneObject(pOwnerMan):switchZone(planetName, 7679, 0, 7679, 0)

	-- Place tour building
	local pBuilding = spawnBuilding(pOwnerMan, buildingTemplate, worldX, worldY, rot)
	writeScreenPlayData(pPlayer, "HondoHousingSystem", "tourBuildingID", SceneObject(pBuilding):getObjectID())
	setQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(loc) .. "Plot" .. tostring(selectedPlot) .. "InUse", 1)

	if (buildingTemplate:find("factory")) then
		SceneObject(pBuilding):setObjectMenuComponent("HondoHousingSystemFactoryMenuComponent")
	end

	-- Create waypoint
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local waypointID = PlayerObject(pGhost):addWaypoint(planetName, layouts[layoutName].plots[selectedPlot].buildings[selectedBuilding].buildingName, "", worldX, worldY, WAYPOINTGREEN, true, true, self.waypointSpecialType, 0)

	createEvent(240*1000, "HondoHousingSystem", "endTourWarning", pPlayer, "")
	CreatureObject(pPlayer):sendSystemMessage("Building constructed. You have five minutes to explore the building before it will self destruct.")
end

function HondoHousingSystem:endTourWarning(pPlayer)
	createEvent(60*1000, "HondoHousingSystem", "endTour", pPlayer, "")
	CreatureObject(pPlayer):sendSystemMessage("Notice: Your tour will end in 1 minute.")
end

function HondoHousingSystem:endTour(pPlayer)
	local tourBuildingID = readScreenPlayData(pPlayer, "HondoHousingSystem", "tourBuildingID")
	destroyBuilding(tourBuildingID)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	PlayerObject(pGhost):removeWaypointBySpecialType(self.waypointSpecialType)
	CreatureObject(pPlayer):sendSystemMessage("Your tour has ended. Please use the terminal again if you would like to purchase the structure.")

	-- Replace temp building
	local planetName = SceneObject(pPlayer):getZoneName()
	local selectedPlot = tonumber(readScreenPlayData(pPlayer, "HondoHousingSystem", "selectedPlot"))
	local locTable = HondoHousingSystem:getLocationTable(planetName)
	local loc = tonumber(readScreenPlayData(pPlayer, "HondoHousingSystem", "activeLocation"))
	local layoutName = locTable[loc].layout
	local buildingTemplate = layouts[layoutName].plots[selectedPlot].buildings[1].template -- default
	local worldX, worldY = self:getWorldPosition(locTable[loc].center.angle, layouts[layoutName].plots[selectedPlot].x, layouts[layoutName].plots[selectedPlot].y, locTable[loc].center.x, locTable[loc].center.y)
	local rot = HondoHousingSystem:roundNumber(locTable[loc].center.angle + layouts[layoutName].plots[selectedPlot].localRotation)

	if (layouts[layoutName].plots[selectedPlot].buildings[1].rotationFudge ~= nil) then
		rot = rot + layouts[layoutName].plots[selectedPlot].buildings[1].rotationFudge
	end

	local ownerManID = getQuestStatus("HondoHousingSystem:R3-0WN3R")
	local pOwnerMan = getCreatureObject(ownerManID)
	SceneObject(pOwnerMan):switchZone(planetName, 7679, 0, 7679, 0)

	local pBuilding = spawnBuilding(pOwnerMan, buildingTemplate, worldX, worldY, rot)
	setQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(loc) .. "Plot" .. tostring(selectedPlot) .. "BuildingID", tostring(SceneObject(pBuilding):getObjectID()))

	writeScreenPlayData(pPlayer, "HondoHousingSystem", "tourBuildingID", "")
	setQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(loc) .. "Plot" .. tostring(selectedPlot) .. "InUse", 0)
end


-- Build structure functions

function HondoHousingSystem:confirmPurchase(pPlayer)
	local sui = SuiMessageBox.new("HondoHousingSystem", "build") -- callback
	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())
	sui.setTitle("Confirm Purchase")
	sui.setPrompt("Press OK if you are sure you would like to purchase this structure.")
	sui.sendTo(pPlayer)
end

function HondoHousingSystem:canBuildMore(pPlayer)
	if (self.maxOwnedPlots == 0) then
		return true
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local playerAccountID = PlayerObject(pGhost):getStationID()

	local plotsUsed = tonumber(getQuestStatus("HondoHousingSystem:PlotsUsedOnAccount" .. playerAccountID))

	if (plotsUsed == nil) then
		setQuestStatus("HondoHousingSystem:PlotsUsedOnAccount" .. playerAccountID, 1)
		return true
	end

	if (plotsUsed < self.maxOwnedPlots) then
		setQuestStatus("HondoHousingSystem:PlotsUsedOnAccount" .. playerAccountID, plotsUsed + 1)
		return true
	end

	return false
end

function HondoHousingSystem:hasEnoughCredits(pPlayer, price)
	local cash = CreatureObject(pPlayer):getCashCredits()
	local bank = CreatureObject(pPlayer):getBankCredits()

	if (cash + bank >= price) then
		if (cash >= price) then
			CreatureObject(pPlayer):subtractCashCredits(price)
		else
			local difference = price - cash
			CreatureObject(pPlayer):subtractCashCredits(cash)
			CreatureObject(pPlayer):subtractBankCredits(difference)
		end

		return true
	end

	return false
end

function HondoHousingSystem:build(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		CreatureObject(pPlayer):sendSystemMessage("Purchase aborted. Have a nice day!")
		return
	end

	if (not self:canBuildMore(pPlayer)) then
		CreatureObject(pPlayer):sendSystemMessage("Sorry, you already own the maximum amount of properties (" .. self.maxOwnedPlots .. ").")
		return
	end

	local planetName = SceneObject(pPlayer):getZoneName()
	local selectedPlot = tonumber(readScreenPlayData(pPlayer, "HondoHousingSystem", "selectedPlot"))
	local selectedBuilding = tonumber(readScreenPlayData(pPlayer, "HondoHousingSystem", "selectedBuilding"))
	local locTable = HondoHousingSystem:getLocationTable(planetName)
	local loc = tonumber(readScreenPlayData(pPlayer, "HondoHousingSystem", "activeLocation"))
	local layoutName = locTable[loc].layout

	if (not self:hasEnoughCredits(pPlayer, layouts[layoutName].plots[selectedPlot].buildings[selectedBuilding].price)) then
		CreatureObject(pPlayer):sendSystemMessage("Sorry, you don't have enough credits to make this purchase.")
		return
	end

	local buildingTemplate = layouts[layoutName].plots[selectedPlot].buildings[selectedBuilding].template
	local worldX, worldY = self:getWorldPosition(locTable[loc].center.angle, layouts[layoutName].plots[selectedPlot].x, layouts[layoutName].plots[selectedPlot].y, locTable[loc].center.x, locTable[loc].center.y)
	local rot = HondoHousingSystem:roundNumber(locTable[loc].center.angle + layouts[layoutName].plots[selectedPlot].localRotation)

	if (layouts[layoutName].plots[selectedPlot].buildings[selectedBuilding].rotationFudge ~= nil) then
		rot = rot + layouts[layoutName].plots[selectedPlot].buildings[selectedBuilding].rotationFudge
	end

	-- Destroy filler building
	local tempBuildingID = getQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. loc .. "Plot" .. selectedPlot .. "BuildingID")
	if (tempBuildingID ~= nil) then
		destroyBuilding(tempBuildingID)
	end

	-- Place player owned building
	local pBuilding = objectPlaceStructure(pPlayer, buildingTemplate, worldX, worldY, rot)

	-- Create waypoint
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local waypointID = PlayerObject(pGhost):addWaypoint(planetName, layouts[layoutName].plots[selectedPlot].buildings[selectedBuilding].buildingName, "", worldX, worldY, WAYPOINTBLUE, true, true, 1)


	setQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(loc) .. "Plot" .. tostring(selectedPlot) .. "BuildingID", tostring(SceneObject(pBuilding):getObjectID()))
	setQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(loc) .. "Plot" .. tostring(selectedPlot) .. "InUse", 1)
end


-- Destroy Structure Session Functions

function HondoHousingSystem:updateSite(pPlayer, buildingID, planetName)
	local locTable = self:getLocationTable(planetName)
	local loc = 0
	local plot = 0

	-- See if the deleted building is one saved in the Hondo Housing System
	for i = 1, #locTable, 1 do
		for j = 1, #layouts[locTable[i].layout].plots, 1 do
			local savedBuildingID = getQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(i) .. "Plot" .. tostring(j) .. "BuildingID")

			if (buildingID == savedBuildingID) then
				loc = i
				plot = j
			end
		end
	end

	-- No match found
	if (loc == 0) then
		printf("Building ID " .. buildingID .. " was not found in the Hondo Housing System.\n")
		return
	end

	-- Replace temp building
	local layoutName = locTable[loc].layout
	local buildingTemplate = layouts[layoutName].plots[plot].buildings[1].template -- default
	local worldX, worldY = self:getWorldPosition(locTable[loc].center.angle, layouts[layoutName].plots[plot].x, layouts[layoutName].plots[plot].y, locTable[loc].center.x, locTable[loc].center.y)
	local rot = HondoHousingSystem:roundNumber(locTable[loc].center.angle + layouts[layoutName].plots[plot].localRotation)

	if (layouts[layoutName].plots[plot].buildings[1].rotationFudge ~= nil) then
		rot = rot + layouts[layoutName].plots[plot].buildings[1].rotationFudge
	end

	local ownerManID = getQuestStatus("HondoHousingSystem:R3-0WN3R")
	local pOwnerMan = getCreatureObject(ownerManID)
	SceneObject(pOwnerMan):switchZone(planetName, 7679, 0, 7679, 0)

	local pBuilding = spawnBuilding(pOwnerMan, buildingTemplate, worldX, worldY, rot)

	setQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(loc) .. "Plot" .. tostring(plot) .. "BuildingID", tostring(SceneObject(pBuilding):getObjectID()))
	setQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(loc) .. "Plot" .. tostring(plot) .. "InUse", 0)

	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local playerAccountID = PlayerObject(pGhost):getStationID()
	local plotsUsed = tonumber(getQuestStatus("HondoHousingSystem:PlotsUsedOnAccount" .. playerAccountID))

	setQuestStatus("HondoHousingSystem:PlotsUsedOnAccount" .. playerAccountID, plotsUsed - 1)
end


-- Radial Menu Functions

HondoHousingSystemMenuComponent = { }

function HondoHousingSystemMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(20, 3, "Purchase Structure")
	menuResponse:addRadialMenuItem(120, 3, "Information")
end

function HondoHousingSystemMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end

	if (selectedID == 120) then
		local maxPlots = HondoHousingSystem.maxOwnedPlots
		if (maxPlots == 0) then
			maxPlots = "Unlimited"
		end

		local pGhost = CreatureObject(pPlayer):getPlayerObject()
		local playerAccountID = PlayerObject(pGhost):getStationID()
		local plotsUsed = tonumber(getQuestStatus("HondoHousingSystem:PlotsUsedOnAccount" .. playerAccountID))

		if (plotsUsed == nil) then
			plotsUsed = 0
		end

		local suiManager = LuaSuiManager()
		local helpMessage = "Hondo Housing System\n\nIn Legend of Hondo you are able to purchase various types of structures from terminals such as this one. The buildings available vary from site to site, with many sites offering a selection far greater than the buildings that are already built there. Once purchased, the structure will be built near the location of the terminal, in accordance with city zoning laws. \n\nSome locations are zoned for commercial as well as residential buildings, allowing you to potentially increase your wealth and renown by operating businesses.\n\n"
		helpMessage = helpMessage .. "Your Plot Usage:  " .. plotsUsed .. " / " .. maxPlots .. "\n\nNote that these plots are account bound rather than character bound. For more detailed information about this character's structures, please type:\n\n /hondo aboutMe"
		suiManager:sendMessageBox(pObject, pPlayer, "About Housing", helpMessage, "@ok", "HondoHousingSystemMenuComponent", "noCallback")
	elseif (selectedID == 20) then
		-- Deny terminal access if player is currently touring a building.
		local tourBuildingID = tonumber(readScreenPlayData(pPlayer, "HondoHousingSystem", "tourBuildingID"))

		if (tourBuildingID ~= nil) then
			CreatureObject(pPlayer):sendSystemMessage("You are already touring another structure.")
			return
		end

		-- Match the terminal to the location and open the correct window for it
		local location = 0
		local terminalID = SceneObject(pObject):getObjectID()
		local planetName = SceneObject(pObject):getZoneName()
		local locTable = HondoHousingSystem:getLocationTable(planetName)

		for i = 1, #locTable, 1 do
			local savedTermID = getQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. tostring(i) .. "TerminalID")
			if (tonumber(terminalID) == tonumber(savedTermID)) then
				location = i
			end
		end

		if (location > 0) then
			HondoHousingSystem:openWindow(pPlayer, pObject, location, locTable, planetName)

			writeScreenPlayData(pPlayer, "HondoHousingSystem", "activeLocation", location)
			writeScreenPlayData(pPlayer, "HondoHousingSystem", "activeTerminalID", SceneObject(pObject):getObjectID()) -- referenced in HondoHousingSystem:build()
		else
			CreatureObject(pPlayer):sendSystemMessage("Sorry, this terminal has not been configured.")
		end
	end

	return 0
end

function HondoHousingSystemMenuComponent:noCallback(pPlayer, pSui, eventIndex)
	-- do nothing
end


-- Dummy radial menu to help prevent players from using a factory for free while "touring" it.

HondoHousingSystemFactoryMenuComponent = { }

function HondoHousingSystemFactoryMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	menuResponse:addRadialMenuItem(120, 3, "@quest/quest_journal/fs_quests_sad:instructions_title") -- Instructions
end

function HondoHousingSystemFactoryMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end

	if (selectedID == 120) then
		local suiManager = LuaSuiManager()
		local helpMessage = "Factories are used to craft crates of components and final products. Factories require both credits and power to operate. Power is only used while the factory is running, however credits are used continuously. Ingredients are loaded into the ingredients hopper, which has 100 units of storage. Final products are placed into the output hopper automatically. The schematics used by factories are created with a crafting tool by choosing the Create Draft Schematic option during the crafting process."
		suiManager:sendMessageBox(pObject, pPlayer, "About Factories", helpMessage, "@ok", "HondoHousingSystemMenuComponent", "noCallback")
	end

	return 0
end
