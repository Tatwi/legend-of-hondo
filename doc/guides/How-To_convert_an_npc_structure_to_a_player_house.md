###How-To Convert an NPC Structure to a Player House
There are many nice structures in SWG that players aren't able to use as their home. In order to make that possible, as well as to help diversify the Hondo Housing System, I went through the process of figuring out the easiest way to convert an NPC structure to player house. Believe it or not, the whole process is essentially a bunch of copying and pasting!

**Requires:** IFF data table editor (TRE Explorer, Jawa ToolBox, Sytner's IFF Editor)
Note: Spelling mistakes and typos in this process *will* crash the client or server.

1. Create the building template...
Create a new Lua file in bin/scripts/object/building/player/ called player_npc_cantina_corellia.lua (or anything else you think is sensible)and add the following code:

```
object_building_player_player_npc_cantina_corellia = object_building_player_shared_player_npc_cantina_corellia:new {
	lotSize = 8,
	baseMaintenanceRate = 90,
	allowedZones = {"corellia", "dantooine", "lok", "naboo", "rori", "talus", "tatooine"},
	publicStructure = 0,
	skillMods = {
		{"private_medical_rating", 100},
		{"private_buff_mind", 100},
		{"private_med_battle_fatigue", 5},
		{"private_safe_logout", 1}
	},
	childObjects = {
		{templateFile = "object/tangible/sign/player/house_address.iff", x = 51.3, z = 2.45, y = 0, ox = 0, oy = 0.707107, oz = 0, ow = -0.707107, cellid = -1, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = -17.11, z = -0.894, y = 16.13, ox = 0, oy = 1, oz = 0, ow = 0, cellid = 12, containmentType = -1},
	},
	shopSigns = {
		{templateFile = "object/tangible/sign/player/house_address.iff", x = 51.3, z = 2.45, y = 0, ox = 0, oy = 0.707107, oz = 0, ow = -0.707107, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_address"},
		{templateFile = "object/tangible/sign/player/shop_sign_s01.iff", x = 53.1, z = 0.0, y = 0, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_01", suiItem = "@player_structure:shop_sign1"},
		{templateFile = "object/tangible/sign/player/shop_sign_s02.iff", x = 53.1, z = 0.0, y = 0, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_02", suiItem = "@player_structure:shop_sign2"},
		{templateFile = "object/tangible/sign/player/shop_sign_s03.iff", x = 53.1, z = 0.0, y = 0, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_03", suiItem = "@player_structure:shop_sign3"},
		{templateFile = "object/tangible/sign/player/shop_sign_s04.iff", x = 53.1, z = 0.0, y = 0, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_04", suiItem = "@player_structure:shop_sign4"},
	},
	constructionMarker = "object/building/player/construction/construction_player_house_corellia_medium_style_01.iff",
	structureFootprintFileName = "footprint/building/player/shared_player_house_generic_medium_style_01.sfp",
	length = 3,
	width = 4
}

ObjectTemplates:addTemplate(object_building_player_player_npc_cantina_corellia, "object/building/player/player_npc_cantina_corellia.iff")
```

Normal NPC structures don't have the lotSize, baseMaintenanceRate, structure terminal, shop signs, and constructionMarker. They also often lack a footprint. Realistically, it doesn't much matter which existing constructionMarker, structureFootprintFileName, length, and width you choose, just have a look at the other player building Lua templates pick values that are around the same size as the new building you're adding. Note: By default, housing storage for player structures is LotSize * 250 and players have 10 lots per character.

You will need to find the location for both the signs and the terminals yourself, as they won't exist. If you have the Legend of Hondo Admin Tools installed on your test server, you can do this the same way I did, as I will describe below. If you're not using my admin tools, the process described will at least give you an idea of what needs to be done.
- Teleport to 0 0 on the simple testing planet. 
- Open the debug window with CTL+SHIFT+G
- Use /hondo admin placeStructure to place an NPC version of the cantina (Facing -90 for particular odd-duck building , so it "plops" tall-wise).
- Go stand under where you think you'd like the House Address to be and note your x,y values.
- Use /hondo admin decor to select a small decoration to drop outside. Drop it outside and use /hondo move up/down/left/right to get it where you'd like the sign to be.
- If you have admin debug examine on in your client, just double click the object you placed where you want the sign to go and note its z value. Otherwise target it and type /hondo admin spoutObject newsign and then get the z value from the bin/custom_scripts/spout/newsign.lua file that you just created on the server.
- Go stand where you want the shop signs to be and note your x,y,z values (or do the above steps again if you want those signs to be in a place where your character can't stand).
- Moving on to the structure terminal, spawn one into your inventory with /object createitem object/tangible/terminal/terminal_player_structure.iff 
- Drop the terminal into the building, move it where you'd like it as you would normally, then type /hondo admin spoutObject terminal to get its cell-relative x,y,z,oy,ow information.
- The cell number of the building style you are in can be found using /hondo admin getBuildingInfo, opening the email, and looking at the section for You Position Inside. 


2. Register the object...
Open up bin/scripts/object/building/player/objects.lua and add the following code to register the new object. Note that you do not need to have the enormous comment section, like the other entries. This file already part of the server, as it's for the existing player structures, so you won't need to register your objects.lua file in the bin/scripts/object/allobjects.lua file (as you would if you were making your buildings in a new folder).
```
object_building_player_shared_player_npc_cantina_corellia = SharedBuildingObjectTemplate:new {
	clientTemplateFileName = "object/building/player/shared_player_npc_cantina_corellia.iff"
}
ObjectTemplates:addClientTemplate(object_building_player_shared_player_npc_cantina_corellia, "object/building/player/shared_player_npc_cantina_corellia.iff")

```


3. Tell the server to load the object...
Open up bin/scripts/object/building/player/serverobjects.lua and add the following code so that server loads your new building template:
```
includeFile("building/player/player_npc_cantina_corellia.lua")
```


4. Make a new iff template file...
- What you want to change in here is call to the POB file, because doing that will allow the client and server to load your desired building design rather than the medium house design that is listed in the file. The rest of the file remains the same, allowing the building to be treated just like any other player house.
- Open Sytner's IFF Editor and extract object/building/player/shared_player_house_generic_medium_style_01.iff to the desktop.
- Rename the new file shared_player_npc_cantina_corellia.lua. The shared_ thing is critical, as the name needs to match what is called by the Lua files.
- Open the file in SIE and navigate to the file editor. On the left there is a panel with an expanding tree of data.
- Scroll to the bottom of the data tree, then scroll back up a bit. Click the XXXX entriies until you find the one that loads the appearance POB. Its entry in the top, middle window will look like:

portalLayoutFilename.appearance/ply_all_house_m_s01_fp1.pob..

The dots ARE NOT periods! They are null data.

Editing this part of an iff file is tricky, as the format is super finicky. While you can edit the values by typing them over in the top right window, I have found that doing so (no matter how carefully) ends up creating a corrupted and useless iff file. As such, I recommend editing values by doing the following...

- Open up the iff file for the NPC version of the structure, object/building/corellia/shared_cantina_corellia.iff, and navigate its tree to find its POB line, as you did above. 
- Use your mouse to select only the *thm_corl_cantina.pob* portion and right click > copy it.
- Now go back to the tab for your new iff file and use your mouse to highlight the  *ply_all_house_m_s01_fp1.pob* portion, then right click > paste over top of it. 
- Save the file, you're finished editing.
- Note that you can do the same thing for the thing for the objectName, detailedDescription, and lookAtText too if you'd like, if you plan on using this building with player house deeds or crafting schematics.


5. Add the object to the client CRC table...
- If you have already modded this, open up your most recent version of the file.
- The client needs to know what files exist, so misc/object_template_crc_string_table.iff keeps track of them all. Extact a copy to your desktop and open it up in SIE.
- Add the path/filename for your new building in the big text box object/building/player/shared_player_npc_cantina_corellia.iff and press the blue + button to add it to the list.
- Save the file.


6. Pack your TRE file...
- Go to your desktop and create a new folder called TRE_ROOT (or whatever you'd like). 
- Move the object folder and the misc folder from the desktop into the TRE_ROOT folder
- Switch over to the Repository View of SIE and go to Tree Builder > Create .tre from directory on disk. 
- Navigate in the pop up window to Desktop > TRE_Root and click OK. This will ensure that files inside the new tre file will have the correct path.
- Name the new file my_test_building.tre


7. Add the my_test_building.tre to the client and the server...
- Copy the file into the client folder and to where you keep tre files on the server.
- In the client directory, open swgemu_live.cfg and add a line to call your new file near the top, like so searchTree_00_27=my_test_building.tre, where 00_27 should be 1 number higher than the highest number already listed. You may need to bump up the maxSearchPriority value by 1 so that it will include your new file.
- On the server, open up bin/conf/config.lua and add a line to include your new tre file (being sure to remember the comma at the end): "my_test_building.tre", 


At this point you have a new building template that is ready to use! However, the only way you can use it is by loading it with admin commands or in a spawnBuilding or spawnSceneObject call inside a screenplay. In the case of Legend of Hondo, I made it available by simply adding player_npc_cantina_corellia.iff to a layout in my Hondo Housing System layout table, as that's how I wanted to use it. You may want to go a step further by adding:

- A player house deed.
- A crafting draft schematic.
- A loot schematic (and adding said schematic to a loot table).

Creating those items follows the same general process as converting a the npc house to a player house, as you basically need the lua template file, a tre file, and the edits to register the new files on the client. You will also need to add new entries in the deed/schematic name and description files for your new items, which you can find references to in the tree of the iff you are editing. Editing the string file is as easy as finding it, opening it in SIE, and adding a new entry key/value combo. The just copy/paste the key over top of the one in your new iff file, so the name/desc/etc in the new iff file points your new string file entry. I personally made deed for a couple Tatooine buildings in the past and I can confirm that they worked exactly like any other house deed when placing a structure as one normally would in SWG.

Draft schematics and deeds will allow the lua file entries to over-ride the iff file entries, so you really only need an iff file (and object_template_crc_string_table.iff entry) for them so the client knows they exist. Have a look at the existing ones on the server to see how they work.

In the future I will most likely add a guide for how to make a new draft schematic, house deed, and loot schematic.
