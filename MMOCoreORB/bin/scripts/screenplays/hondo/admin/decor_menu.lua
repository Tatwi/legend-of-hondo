-- Legend of Hondo
-- Admin items for decorating / world building

local ObjectManager = require("managers.object.object_manager")
includeFile("hondo/admin/decor_items.lua")

AdminDecor = ScreenPlay:new {
	numberOfActs = 1,
}
registerScreenPlay("AdminDecor", true)

function AdminDecor:openWindow(pPlayer)
	if (pPlayer == nil) then
		return
	end

	self:showCategories(pPlayer)
end

function AdminDecor:showCategories(pPlayer)
	local sui = SuiListBox.new("AdminDecor", "showItems") -- calls showItems on SUI window event

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	sui.setTitle("Admin Decor")
	sui.setPrompt("Decorative items for admin use. These items may be placed outside. \n\nSelect a catagory from the list below.")

	for i = 1, #decor, 1 do
		sui.add(decor[i].catName, "")
	end

	sui.sendTo(pPlayer)
end

function AdminDecor:showItems(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end


	if (args == "-1") then
		CreatureObject(pPlayer):sendSystemMessage("No category was selected...")
		return
	end


	local selectedIndex = tonumber(args) + 1

	writeScreenPlayData(pPlayer, "AdminDecor", "categorySelected", selectedIndex) 

	local sui = SuiListBox.new("AdminDecor", "itemSelection") -- calls itemSelection on SUI window event

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID())

	sui.setTitle("Admin Decor")
	sui.setPrompt(decor[selectedIndex].catName .. "\n\n Press Cancel to return to the main menu.")

	for i = 1, #decor[selectedIndex].items, 2 do
		sui.add(decor[selectedIndex].items[i], decor[selectedIndex].items[i+1])
	end

	sui.sendTo(pPlayer)
end

function AdminDecor:itemSelection(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return self:showCategories(pPlayer)
	end

	if (args == "-1") then
		CreatureObject(pPlayer):sendSystemMessage("No item was selected...")
		return
	end

	local selectedItemIndex = tonumber(args) + 1
	local catIndex = tonumber(readScreenPlayData(pPlayer, "AdminDecor", "categorySelected"))

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	local pItem = giveItem(pInventory, decor[catIndex].items[selectedItemIndex*2], -1)

	self:showItems(pPlayer, pSui, eventIndex, catIndex-1) -- Opens the current screen again
end


