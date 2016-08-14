-- Legend of Hondo
-- Outdoor Decoration System
-- July - Aug 2016
-- Lua calls added for this feature: getAdminLevel, getCityRegionNameAt, dropDecoration, pickupDecoration
-- C++ portions in src/server/zone/managers/director/DirectorManager.cpp

local ObjectManager = require("managers.object.object_manager")

SuiHondoDecoration = {}
function SuiHondoDecoration:placeDecoration(pPlayer, pUsingObject)
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	local regionName = getCityRegionNameAt(SceneObject(pPlayer):getZoneName(), SceneObject(pPlayer):getWorldPositionX(), SceneObject(pPlayer):getWorldPositionY())

	if (getAdminLevel(pPlayer) < 10) then
		if not (regionName == "@tatooine_region_names:mos_espa") then
			CreatureObject(pPlayer):sendSystemMessage("You may only place decorations in Mos Espa.")
			return
		end
	end
	
	if (SceneObject(pUsingObject):getParent() == pInventory) then
		dropDecoration(pPlayer, pUsingObject)
	else
		pickupDecoration(pPlayer, pUsingObject) 
	end

end

function SuiHondoDecoration:notifyOkPressed()
	-- Do nothing.
end

hondoDecorationMenuComponent = { }

function hondoDecorationMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	
	-- If outside, show options
	if (SceneObject(pPlayer):getParent() == nil) then
		if (SceneObject(pSceneObject):getParent() == pInventory) then
			menuResponse:addRadialMenuItem(20, 3, "Drop Outside")
		elseif not (SceneObject(pSceneObject):getParent() == pInventory) then
			menuResponse:addRadialMenuItem(20, 3, "Pickup")
		end
	end
	
	menuResponse:addRadialMenuItem(120, 3, "@quest/quest_journal/fs_quests_sad:instructions_title") -- Instructions
end

function hondoDecorationMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end

	if (selectedID == 120) then
		local suiManager = LuaSuiManager()
		suiManager:sendMessageBox(pObject, pPlayer, "Decoration Help", "In Legend of Hondo, you are able to decorate outside in Mos Espa, using many items such as this one. Items placed in this way will remain in the world until you remove them. \n\nThe object's initial rotation is based on the way you are facing at the time you drop it. You may further adjust its position using the /hondo move and /hondo rotate commands. \n\nYou may purchase these items from Merchants throughout the galaxy.", "@ok", "SuiHondoDecoration", "notifyOkPressed")
	elseif (selectedID == 20) then
		SuiHondoDecoration:placeDecoration(pPlayer, pObject)
	end

	return 0
end
