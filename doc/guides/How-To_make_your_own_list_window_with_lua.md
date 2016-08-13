###How-To Make Your Own SUI List Window Using Lua
Sometime in the last year or so, the SWGEmu team added many SUI (server user interface) Lua calls to the SWGEmu Lua system. One of the nifty things you can make with the new functionality is your very own customized list box system, similar to (or exactly the same as!) the Character Builder Terminal ("Blue Frog").

Why would you want to do this, rather than just use the Blue Frog? Well for one, the Character Builder Terminal was created in C++ in what appears to be a very opaque, "spaghetti coded" manner, which makes it more difficult to work with than it needs to be. On the other hand, the Lua based one I will show you is made with 4 functions inside a single file. Woot!

Apart from programming simplicity, it's also nice to know how to make a totally new list with its own unique purpose, because there are many purposes such a list can have! Maybe you want to make a terminal that sells buffs or items to the player? How about a slash command that opens a window for admins that lets them pick virtually any building in existance and plop it down into the world (I made that!)? Or perhaps you want to make a robust NPC merchant system? Sure, list box windows have limits, but I think the biggest one is our imaginations!

Enough chatter!

The list box system consists of two files, for the sake of organization. You could put them into a single file, but when you can have one file for the code and another for the list, why cram them both into a single file! :)

There are three ways to invoke the list window,

1. Clicking on an item and choosing it from the radial menu (or setting it as the default click).

2. By calling it in a screenplay as when "something happens", such as the player chooses X option in a conversation or the player gets eaten by a giant lizard, etc.

3. Invoking it with a slash command.

I will cover all three of these, after I show you how to program the actual list itself.

For the creation example, I will use the list of Legend of Hondo decorations I made to make my life as an "world builder" much easier. Rather than having to type or copy/paste a command, I can just fire out items from the list in the same way as the Blue Frog, only this list is smaller and easier to edit.

Here is a truncated version of the item table:
MMOCoreORB/bin/scripts/screenplays/hondo/admin/decor_items.lua
```
decor = {
	{catName = "Tatooine: Bridges, Walkways, Stairs",
		 items = {
			"Walking Bridge - Small", "object/tangible/hondo/decoration/structure/tatooine/bridge_tatooine_small_style_01.iff",
			"Walking Bridge - Medium", "object/tangible/hondo/decoration/structure/tatooine/bridge_tatooine_small_style_02.iff",
			"Walking Bridge - Large", "object/tangible/hondo/decoration/structure/tatooine/bridge_tatooine_small_style_03.iff",
			"Stairs - Large 45 Degree", "object/tangible/hondo/decoration/structure/tatooine/stair_tatooine_large_style_01.iff",
			"Stairs - Large Steep", "object/tangible/hondo/decoration/structure/tatooine/stair_tatooine_large_style_02.iff",
			"Stairs - Small 45 Degree", "object/tangible/hondo/decoration/structure/tatooine/stair_tatooine_small_style_01.iff",
			"Stairs - Small Steep", "object/tangible/hondo/decoration/structure/tatooine/stair_tatooine_small_style_02.iff",
		}
	},
	{catName = "Tatooine: Gates, Archways",
		 items = {
			"Gate - Style 1", "object/tangible/hondo/decoration/structure/tatooine/wall_gate_tatooine_style_01.iff",
			"Gate - Style 2", "object/tangible/hondo/decoration/structure/tatooine/wall_gate_tatooine_style_02.iff",
			"Gate - Style 3", "object/tangible/hondo/decoration/structure/tatooine/wall_gate_tatooine_style_03.iff",
			"Gate - Wide", "object/tangible/hondo/decoration/structure/tatooine/wall_gate_tatooine_wide_style_01.iff",
			"Archway - Large", "object/tangible/hondo/decoration/structure/tatooine/wall_archway_tatooine_large_style_01.iff",
			"Archway - Wide", "object/tangible/hondo/decoration/structure/tatooine/wall_archway_tatooine_wide_style_01.iff",
			"Overhead Beam - Style 1", "object/tangible/hondo/decoration/structure/tatooine/beam_tatooine_overhead_style_01.iff",
			"Overhead Beam - Style 2", "object/tangible/hondo/decoration/structure/tatooine/beam_tatooine_overhead_style_02.iff",
		}
	},
}
```
As you can see, the table is broken down into categories, where each category is an "index" of the decor "table structure". Each category has two indexes, the first being its name and second being the items themselves. The item index, rather than just being a word or number, is actually a table itself, where all of its values are the item names and the item object files.

Items are organized like so, FriendlyName1, ObjectName1, FriendlyName2, ObjectName2... and so on for as many objects as you'd like. This allows us to use some simple math to reference both the FriendlyName and the ObjectFile. It was funny, but to grasp this simple math when I sat down to use it, I had to take a moment to draw it out form myself so I could visualize it. So, I'll do the same for you:

Row 1 - 1,2,
Row 2 - 3,4,
Row 3 - 5,6,
Row 4 - 7,8,

Row 1 - 1,2,3
Row 2 - 4,5,6
Row 3 - 7,8,9
Row 4 - 10,11,12

See the pattern there? They're times tables!

To get the value of any item in the able, simply multiply its row number by its column postion. Or lists of FriendlyName1, ObjectName1, are a "two times table", so when it comes time to reference an ObjectName in the code, we do like this:

decor[catIndex].items[selectedItemIndex*2]

selectedItemIndex is the column number, saved from the list of options shown to the player when he clicks an item in the list window. catIndex is the catagory of items the player is choosing from. So if catIndex=2 and selectedItemIndex=4, then we should spawn...
 object/tangible/hondo/decoration/structure/tatooine/wall_gate_tatooine_wide_style_01.iff
for the player!

While I am sure that was probably pretty obvious to some folks, to others it might not have made much sense without the explanation. Like I said, I had to write down for my old-man brain to "get it" lol...

You can have as many categories and items as you'd like and you can add more columns too if you need extra features such as price, dates, etc. Sky's the limit!


Moving on the code that makes it the list function, I will explain by showing you the actual code and commenting its functions. This will be a lot easier to read in a text editor that has code coloration!
MMOCoreORB/bin/scripts/screenplays/hondo/admin/decor_menu.lua

```
-- We include the ObjectManager so we can address the player as a "creature object" as well as a "player object"
local ObjectManager = require("managers.object.object_manager")

-- Next we include the file that contains our list.
-- Note that when we do this we refer to it by just its name "decor" rather than "self.decor".
includeFile("hondo/admin/decor_items.lua")

-- Register it as a screenplay or as a simple class, depending on your needs.
AdminDecor = ScreenPlay:new {
	numberOfActs = 1,
}
registerScreenPlay("AdminDecor", true)

-- While you don't really NEED this function, it's a handy name to call from somewhere else,
-- because AdminDecor:openWindow(pPlayer) is quite self explanitory.
function AdminDecor:openWindow(pPlayer)
	if (pPlayer == nil) then
		return
	end

	self:showCategories(pPlayer) -- Here we actually open the window for real!
end

-- The first window is a list of categories that the player can choose
function AdminDecor:showCategories(pPlayer)
	-- Setup the SUI Window variables / data
	local sui = SuiListBox.new("AdminDecor", "showItems") -- calls showItems on SUI window event

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID()) -- says where the window will go, which is to the player that requested it!

	-- Set the title bar text and the description text in the box above the list.
	sui.setTitle("Admin Decor")
	sui.setPrompt("Decorative items for admin use. These items may be placed outside. \n\nSelect a catagory from the list below.")

	-- Now we loop though the table and for every "index" of decor, adding the value of catName as a list option.
	for i = 1, #decor, 1 do
		sui.add(decor[i].catName, "")
	end

	sui.sendTo(pPlayer) 
end

-- This function is called when the player clicks on something in the window we just opened.
-- We need to pass the player, the pointer to the sui box, the event, and the arguements related to the event into the function.
function AdminDecor:showItems(pPlayer, pSui, eventIndex, args)
	local cancelPressed = (eventIndex == 1)

	-- Events haves values called "indexes". Pressing the cancel button = 1
	if (cancelPressed) then
		return
	end

	-- If the player clicks OK without selecting anything, then the args value is -1
	-- Here we just close the window and make them have to run /hondo admin decor again
	if (args == "-1") then
		CreatureObject(pPlayer):sendSystemMessage("No category was selected...")
		return
	end


	local selectedIndex = tonumber(args) + 1 -- The thing they selected is starts at 0, but the table we work with later starts at 1

	writeScreenPlayData(pPlayer, "AdminDecor", "categorySelected", selectedIndex) -- we save their selection for use later. This is why I made it as a screenplay!

	local sui = SuiListBox.new("AdminDecor", "itemSelection") -- calls itemSelection on SUI window event

	sui.setTargetNetworkId(SceneObject(pPlayer):getObjectID()) -- send target again

	-- Information for the item window.
	-- You make this whatever you like really, but adding a unique desription per category will mean adding another index to each item table, such as catDesc = "Blah blah...",
	sui.setTitle("Admin Decor")
	sui.setPrompt(decor[selectedIndex].catName .. "\n\n Press Cancel to return to the main menu.")

	-- Again we iterate through a table and add the "friendly name" as a list option, this time the item table of the selected category.
	-- FriendlyName = decor[selectedIndex].items[i], ObjectName = decor[selectedIndex].items[i+1]
	-- FriendlyName = where we are, ObjectName = where we are + 1
	for i = 1, #decor[selectedIndex].items, 2 do
		sui.add(decor[selectedIndex].items[i], decor[selectedIndex].items[i+1])
	end

	sui.sendTo(pPlayer) -- Send the list to the player
end

-- The final function handles what happens when the player takes an action in the item window.
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

	-- Now we read the catagory selection that we saved earlier, so that we can use it to determine what item they chose.
	local catIndex = tonumber(readScreenPlayData(pPlayer, "AdminDecor", "categorySelected"))

	-- Get the player's inventor
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	-- Place the selected item into the player's inventory
	-- Notice here how I the catagory we saved and the selected item index value * 2 to find the ObjectName the player chose.
	-- While the ObjectName may have been passed to this function in args, I wasn't able to determine how to use it, so I did what I described above instead. The result is the same.
	local pItem = giveItem(pInventory, decor[catIndex].items[selectedItemIndex*2], -1)

	self:showItems(pPlayer, pSui, eventIndex, catIndex-1) -- Opens the current screen again so the player can easily pick another item from the same category
end
```

####Calling With a Radial Menu
This is super easy to do now and requires only one small lua file. For this example, I will use my call for dropping a LoH decoration outside.
MMOCoreORB/bin/scripts/screenplays/sui/custom/SuiHondoDecoration.lua

Note that you can put this file anywhere you'd like, I simply put it in here with some of the other custom SUI calls that the SWGEmu team made. Once again, I'll walk you though the code with comments.

-- Lua calls added for this feature: getAdminLevel, getCityRegionNameAt, dropDecoration, pickupDecoration
-- C++ portions in src/server/zone/managers/director/DirectorManager.cpp

local ObjectManager = require("managers.object.object_manager")

SuiHondoDecoration = {} -- Does not need to be registered as a screenplay

-- This gets called when we go to perform the desired action, which in this case is drop an item outside.
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

-- Proabably don't need this function!
function SuiHondoDecoration:notifyOkPressed()
	-- Do nothing.
end

hondoDecorationMenuComponent = { } -- Register the thing that actually calls the radial menu options

-- Add the options to the radial menu when the player clicks the object
-- Two options are added, with one depending on where the player is (inside or outside)
-- Always "Instructions", Depends "Drop Outside" or "Drop Inside"
-- The numbers in addRadialMenuItem(Location, ID, "name") and they can be (Location, SubLocation, ID, "name")
-- I'm not 100% sure what the ID does.
-- Location needs to be unique for each menu on the radial menu "wheel".
-- SubLocation reference their parent, but each SubLocation also needs to be unique.
-- Location: (20, 3, "Foot")
----- SubLocation1: (20, 21, 3, "Toe 1")
----- SubLocation2: (20, 22, 3, "Toe 2") 
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

-- This function gets called when the player selects one of the radial menu options
-- If they selected the Instructions option, open a SUI message box that shows them instructions
-- Else if they selected to drop the item, run the function that drops the item!
-- You don't really NEED a separate function for dropping the item, but it has a bunch of rules so having a different function keeps things tidy.
function hondoDecorationMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then -- This really shouldn't happen, but if it did then going farther would crash the server.
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

Now we need to add this functionality to the lua template of object by adding the objectMenuComponent value, like so:
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/flora/flora_plant_tato_hubba.lua
```
object_tangible_hondo_decoration_flora_flora_plant_tato_hubba = object_tangible_hondo_decoration_flora_shared_flora_plant_tato_hubba:new {
	objectMenuComponent = "hondoDecorationMenuComponent",
}
ObjectTemplates:addTemplate(object_tangible_hondo_decoration_flora_flora_plant_tato_hubba, "object/tangible/hondo/decoration/flora/flora_plant_tato_hubba.iff")
```

####Calling From Another Screenplay
This is pretty simple. Anywhere, under any condition you see fit, you can call up this window by simply using the following code:

AdminDecor:openWindow(pPlayer)

All you need to do is pass a pointer to the player object into it.

In a conversation, you would want something like this...
```
function woltenkinharafromespa_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
	local screen = LuaConversationScreen(conversationScreen)
	local screenID = screen:getScreenID()
	
	if (screenID == "openWindow") then
		AdminDecor:openWindow(pPlayer)
	end
end
```

####Calling From a Slash Command
The code to call any lua function in the C++ is quite small,
```
Lua* lua = DirectorManager::instance()->getLuaInstance();

Reference<LuaFunction*> myLuaFunction = lua->createFunction("MyLuaClass", "myLuaFunctionName", 0);
*myLuaFunction << creature;

myLuaFunction->callFunction();
```

For a full tutorial on how to add it to a new slash command see,
doc/guides/How-To_add_a_new_slash_command.md
