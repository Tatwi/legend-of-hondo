###Hondo Housing System
*July - September 2016*

####Purpose
The Hondo Housing System is the result of my testing various methods that allow players to live in NPC cities. There are so many ways to achieve this goal, each with their own positives and negatives. After much consideration, I chose to go the route of using outdoor terminals that allow players to purchase their houses at pre-defined locations, because I felt it would be easier for the players and more rewarding for both the players and the admin/world builders.

The system is comprised of sites, layouts, and terminals. Much like a construction site in the real world, a site in the HHS is a location in the world that is oriented facing an imaginary road. The terminal that controls the site is placed at the imaginary roadside. Sites can use one of a number of layouts and each layout contains one or more plots. Each plot contains one structure that physically fits inside its imaginary boundaries, again similar to a construction site in the real world.

Players use the system by opening the terminal menu, selecting an available plot, selecting their choice of building (from a list of ones the admin has made available for that plot), and purchasing the building. When they want to move out, they simply destroy the structure as they would any other player structure. Very straightforward.

Admins use the system by placing sites in desired locations, using either a layout that I have created or a layout they have tailor made to fit their desires for the site in question. Setup and customization is really easy once you get the hang of the work-flow.

####Temporary Structures
In order to make the world look a little more interesting and less of an eyesore of blank ground with a bunch of terminals sticking out, I created a system that loads a temporary structure into plots each time the server boots. The default style is Tatooine, but you can change that to anything you'd like by changing the first building in each layout table's plot to the style/building you'd like. When a player purchases a structure, the temp building is destroyed and the player's choice is placed on the plot. When the player destroys their building, a new temp building is immediately put back in its place. From a realistic perspective this is kind of weird, but it works well to keep cities looking alive and well structured. 

####Layouts
Layouts are the backbone of the HHS, as they are both the both the blueprints for sites and the values for pricing, etc. I made the layouts to support heavy customization, which on the surface can look like a whole lot of redundancy, but from that redundancy will come the magic that makes your imagination shine! 

Here is an example of a layout, 
```
mediumTwo = {
	terminal = {name = "Medium Duplex", x = 0, y = 15.8, localRotation = 0},
	plots = {
		{ -- Plot 1
			plotName = "Medium House (Your Left)", x = 14.5, y = 0, localRotation = 0,
			buildings = {
				{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
				{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
				{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
				{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
				{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
				{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
			},
		},
		{ -- Plot 2
			plotName = "Medium House (Your Right)", x = -14.5, y = 0, localRotation = 0,
			buildings = {
				{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
				{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
				{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
				{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
				{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
				{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
			},
		},
	},
}, 
```
This example is two medium player houses sitting side by side, similar to a real world detached duplex. The compents of the table are the layout name (mediumTwo), the terminal name and location, the plots and their names, buildings, locations, prices, and templates.

The location values you see in the table are offsets from the site center 0x, 0y. When used with the site's world x, y, and angle (aka direction) values, the housing system applies a "rotation matrix" algorithm and some other math to determine the real world position and rotation of the buildings. This is a really powerful setup, as it allows you the human being to gather the easy data while the computer computes the rest! 

The easiest way to create a new layout is to copy/paste an existing one, give it a new name, and then customize it to your liking. However, if you would like to make a new one from scratch, I suggest loading up the simple testing planet and creating the layout at its world 0,0 location. Building your layout there makes it super easy to determine the x,y offsets from the site center, as the location values of whatever you place literally *IS* that offset. Then it's just a matter of placing your buildings how you'd like them to be and translating that into a layout table (copy/paste a simple one, strip it down to the basic template, then add in your new data). Keep in mind that you can fudge the numbers when you put them into the table, so if your testing layout is 89.81 degrees and you want it to be 90, just make it 90 in your table.

Speaking of fudging values, the rotationFudge value you see there in the table exists to fix inconsistencies in SOE's POB layout file. Some of the POBs put the door of the buildings facing 90 or 180 degrees away from the imaginary "0 Degrees North" of the POB, so I added the rotation fudge to compensate. Merchant tents are also sunken down about 0.5m, but I didn't add a z fudge for them, as they were the only buildings I encountered the issue with and it didn't effect their functionality.

The localRotation value is used to change the orientation of a building relative to the site. So if you want two buildings to face each other, one would be rotated -90 degrees and the other would be rotated 90 degrees. For consistency, always use the rotationFudge where needed and think of that as the proper 0 degree rotation (because it really should already be...) and then apply the desired rotation using the localRotation value. The localRotation value for the terminals isn't used by default, because I set up the terminals to always face out toward the imaginary road, such that the player can stand at is they would a terminal in the real world and look into the site. However, if you would like to move a terminal to somewhere else on a site, the localRotation value is there to help you achieve your goal.

Prices and names can be anything you'd like, so change them as you see fit. I'll most likely change many of them myself when I put the HHS to use in Legend of Hondo. The nice thing about the redundancy here is that you set prices based on the type of building, rather than just the plot. You can also base the prices on the location of a site if you have some prime realestate that you want to be sold for a premium, by making a layout specifically for that site which has the customized prices and structures you'd like. 

The layout table is enormous already, but it's also easy to read and as extensible as you'd like it to be. My suggestion is to customize the existing layouts to your liking, then head into the world to determine where you'd like to use them. For any place where you'd like to use a layout that doesn't exist, go ahead and make that layout and add it to the table! Then it's there for you to use in that instance and in the future too. 

To assist in creating layouts, I also made a slash command that plops a dummy layout into the world for 15 seconds, facing the way you are facing. The command also outputs a whack of useful data to server's command line. You can use it along with the server command line command "updatescreenplays" to fine tune the positions of the buildings in your layout by making adjustments to the values, typing updatescreenplays on the server command line, then using the following command in the game:

/hondo admin testLayout [layoutName] [BuildingTypeNumber]

The arguements accepted are the layout name (case sensitive) and the index number of the building type you'd like to look at on the plots. The building number will be the same for all the plots on sites that have multiple plots, sorry. As an example, if wanted to see Large Corellian Houses on layout largeFourOut you would use:

/hondo admin testLayout largeFourOut 2  

####Sites
The place where you actually put a layout into the world is called a site. For your convenience, each planet has its own file for its site table. Sites are super easy to create, due to how the layout system was created. To make a site, all you need is the desired layout, the angle/direction the site faces, and its world x,y,ow,oy values. You can get these values, based on where you are standing, by using the CTL+SHIFT+G menu and the /dumpZoneInformation in the game. Alternately, you can place a structure where you'd like the center of the site to be, then enter the structure and use the "/hondo admin getBuildingInfo log" command to dump that data into a log file on the server (bin/custom_scripts/spout/building_info_log.lua). Here is an example of a site table:
```
simple_locations = {
	{ -- Site 1
		layout = "singleHugest",
		center = {x = 976.42, z = 0, y = 1169.38, angle = 177, ow = 0.026177, oy = 0.999657},
	},
		{ -- Site 2
		layout = "smallFourIn",
		center = {x = 1091.88, z = 0, y = 1045, angle = -92, ow = -0.694658, oy = 0.71934},
	},
}
```
You may notice that I added a comment with the Site #. I did this, because the system keeps track of the sites by their index number in the table, which is not easily inferred by a human when reading the table. You will always want to do this in your site tables, in case you want to come back later and adjust a value or change the layout selection. 

Speaking of changing layout tables: Don't change the layout of a site from the table after players have started using it, as it will screw up the data for every site that came after it, because what was recorded as Site5 would now be Site4, for instance. TIn this example, this will result in the system deleting potentially deleting a player's house on Site4 when someone takes a tour of the new Site5. So rather than deleting an unwanted site from the table, use it for somewhere else (or plan ahead better in the first place).

Similarly to not deleting sites from the table after players have used them, it's also a good idea not change the number of plots in a layout after players have used them, especially if you are reducing the number of plots. You can add plots to a layout or add buildings to a plot in a layout without introducing issues to a live server, but ideally you should "get it right the first time" to avoid potentially overloading GMs with requests to fix player issues.

####Plots
Inside each layout, as you've seen above, are a number of plots. The easiest way to visualise a plot is to imagine a square divided into four equal parts by a cross going through the center. Each of the four sub-subsquares are a plot and at the center of each is the structure the player can purchase. 

When making plots, the big thing you will want to do is to ensure all the buildings you make available will actually fit inside the imaginary boundaries you've created, so they don't end up overlapping structures on the other plots. Given how the building is always place at the center of a plot, it's easy to end up a bunch of empty space around smaller buildings when you offer both large and small buildings for purchase. A good example of this would be plots 1 and 2 of the factories layout, where the plots can host the large Structures Factory as well as the much smaller factories. You just have to "take the good with the bad" in this case, because having sub-plots to better use that extra space would add a level of complexity that would be a pain in the rear to setup, while also being a potential nightmare to maintain.

The zoning value in the buildings for each plot is not used by the housing system for anything at the moment. I intend to use it later on.

####Touring
The tough parts about having a lot of options in life is that a lot of the time, you just don't know much about the options, so you have to research them. When it comes to housing in SWG, there are a ton of options and there just isn't a good way to describe them in the game itself. Sure, you can scour the web for screenshots and diagrams, but wouldn't it be better if you could just take a tour of the building as you would in real life? That way you can actually see the rooms and get a feel for their size, flow, and whatnot. With this in mind, I decided to make a simple system that does exactly that! When using a terminal, players have the option to take a five minute tour of their desired building. The default building is removed, the tour building is placed, and after five minutes the tour building is deleted and the temp building is rebuilt. 

To prevent inconsistencies, players are locked out of using the Hondo Housing System terminals while they are on a tour. Similarly, the lot being toured also becomes unavailable for selection, as if it was already owned.

####Data Management
The status of sites, plots, and the player's plot usage are stored and retrieved using setQuestStatus and getQuestStatus. While using the terminal and touring a structure, some data is stored on the player directly using the writeScreenplayData/readScreenplayData functions. This can be quite opaque to an administrator, due to the way the data is stored in the Berkely DB, so to help with that I created three slash commands to fix any inconsistencies that happen to pop up.

/hondo admin housingFixPlotStatus [planetName] [site] [plot] [status]
- Fix a plot that gotten out of sync. Status: 0 or 1.

/hondo admin housingFixPlayerPlotsUsed [playerStationID] [plotsUsed]
- Adjust how many HHS buildings a player owns by overwriting the value.

/hondo admin housingFixPlayerTourStatus [playerID]
- Remove erroneous status of touring a structure, as touring prevents use of the system.

Here is a list of all the variables that are tracked:

**Global:**
Terminal ObjectIDs: setQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. NUMBER .. "TerminalID", OBJECTID)
Plot Usage: setQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. NUMBER .. "Plot" .. NUMBER .. "InUse", 0)
BuildingID on Plot: setQuestStatus("HondoHousingSystem:" .. planetName .. "Site" .. NUMBER .. "Plot" .. NUMBER .. "BuildingID", OBJECTID)
Plots Used on Account: setQuestStatus("HondoHousingSystem:PlotsUsedOnAccount" .. playerAccountID, NUMBER)

**Player:**
Plot Index# Selected In Menu: writeScreenPlayData(pPlayer, "HondoHousingSystem", "selectedPlot", selectedPlot)
Building Index# Selected In Menu: writeScreenPlayData(pPlayer, "HondoHousingSystem", "selectedBuilding", selectedBuilding)
Tour Building ID: writeScreenPlayData(pPlayer, "HondoHousingSystem", "tourBuildingID", OBJECTID)

####Tools

####Limitations
The big thing I should point out is that by default, SWGEmu limits the draw distance of script loaded, server side objects (such as player housing and screenplay decorations) to 192 meters. This is considerably lower than what we had in live SWG and can be quite disappointing when playing in a player city. Of course, it also limits the beauty of the Hondo Housing System too.

On my end, I changed this limitation from 192m to 512m. That's plenty far enough to see the whole example city on the sample planet. However, I didn't include this change in the Hondo Housing System, because it may negatively impact server performance on multi-player servers. If you would also like to make this change, you can do so here:

src/server/zone/ZoneServer.idl at line 125:
public static final float CLOSEOBJECTRANGE = 192; 

Apart from that, the system is fairly robust and *should* play nicely on a multi-player server. Of course, I don't host such a server to test that theory with, but I tried my best to make it multi-player friendly. As always, feedback is welcome!

I suppose it should also be noted that almost all NPC style buildings do not have any ramps underneath them, so they should only be used on completely flat ground. Using them on a minor slant can work, provided they are placed at the lowest point and somewhat buried by the slanting terrain, otherwise the player will be able see underneath them. Even player housing doesn't play super nicely with hilly terrain, so I recommend only putting HHS sites on flat ground. Single plot sites that only have player structures as options can *probably* used anywhere, but it's worth testing it for every house style you'd want to place there just to be sure they load sensibly.

####R3-0WN3R
By default, the server's structure clean up event (Structure Maintenance Task) will delete all server loaded structures that don't belong to a player. Unfortunately, this included the temp buildings loaded by the Hondo Housing System. To solve this problem, I made a droid who owns all the temp buildings and named him R3-0WN3R. When the Structure Maintenance Task discovers a building that doesn't belong to a player, before deleting the structure it checks if the owner's name is R3-0WN3R and if it is, the structure is not deleted.

This is a bit of a weird thing to do, as R3-0WN3R is teleported around the galaxy each time a HHS building is placed into the world, however it works consistently and doesn't crash the server or the client. Unfortunately, in my testing the same cannot be said for buildings loaded using the spawnSceneObject() lua function. Building loaded with spawnSceneObject() aren't automatically deleted by the Structure Maintenance Task, even though they don't have an owner, however they can sometimes crash the client or the server (or both), which is why I went the route I did with using R3-0WN3R.

###Files
These are the files that were added or updated in this feature.

C++ Files  
Lua Files  
TRE Files  
- What they were used for  

src/server/zone/managers/director/DirectorManager.cpp  
src/server/zone/managers/director/DirectorManager.h  
- Fixed objectPlaceStructure and spawnBuilding so they work with this system.
- Added lua calls for getting the storage size, power rate, and maintainance rate of building templates.

src/server/zone/objects/creature/LuaCreatureObject.cpp  
src/server/zone/objects/creature/LuaCreatureObject.h  
- Added a lua call to subtrack bank credits.

src/server/zone/objects/creature/commands/hondoCommand.h
- Added slash commands for this system.

src/server/zone/objects/player/LuaPlayerObject.cpp  
src/server/zone/objects/player/LuaPlayerObject.h  
- Added a lua call to get a player's StationID

src/server/zone/objects/player/sessions/DestroyStructureSession.idl  
src/server/zone/objects/player/sessions/DestroyStructureSessionImplementation.cpp  
- Added a function that calls the lua function HondoHousingSystem:updateSite
- The lua function handles replacing the default temp building when a player "moves out".

src/server/zone/objects/structure/events/StructureMaintenanceTask.cpp
- Added a check to see if buildings that aren't owned by a player are owned by R3-0WN3R instead. If so, they aren't automatically deleted.

bin/conf/config.lua
- Enabled the "simple" planet for layout building and to host a demo city at 1000x,1000y.

bin/scripts/object/allobjects.lua
bin/scripts/object/tangible/hondo/objects.lua
bin/scripts/object/tangible/hondo/serverobjects.lua
- Originally I was going to made a custom terminal, but it was more trouble than it was worth. The above changes are therefore just a time saver for later when I do add misc items.

bin/scripts/screenplays/hondo/housing_system/housing_system.lua
- The logic for the housing system, including the radial menu for the terminal. 

bin/scripts/screenplays/hondo/housing_system/housing_system_layouts.lua
- Layout table containing the site templates. Add/modify them to your liking!

bin/scripts/screenplays/hondo/housing_system/locations_corellia.lua
bin/scripts/screenplays/hondo/housing_system/locations_dantooine.lua
bin/scripts/screenplays/hondo/housing_system/locations_dathomir.lua
bin/scripts/screenplays/hondo/housing_system/locations_endor.lua
bin/scripts/screenplays/hondo/housing_system/locations_lok.lua
bin/scripts/screenplays/hondo/housing_system/locations_naboo.lua
bin/scripts/screenplays/hondo/housing_system/locations_rori.lua
bin/scripts/screenplays/hondo/housing_system/locations_simple.lua
bin/scripts/screenplays/hondo/housing_system/locations_talus.lua
bin/scripts/screenplays/hondo/housing_system/locations_tatooine.lua
- Planet site tables, consisting of the location and orientation of all sites and the layout styles used by them. See locations_simple.lua for an example. 

bin/scripts/screenplays/hondo/housing_system/locations_simple_demo_city.lua
- Starport, filler buildings, and decor for the demo city.
