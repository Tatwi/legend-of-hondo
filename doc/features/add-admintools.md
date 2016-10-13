###Admin Tools
*July - August 2016*

I figured that since I was restarting the project again (for the last time lol...), I may as well spend some time making some new tools while I was adding back the tools I already created. In the process, I significantly improved all the tools I made for Legend of Hondo Classic! Here is a list the tools...

####Legend of Hondo Command
The /hondo command adds functionality for both players and the server admin (level 15).

**Player syntax:** /hondo <option> [params]
**Admin syntax:** /hondo admin <option> [params]

**Player Commands:**
/hondo aboutMe
- Displays helpful information about your buildings, vendors, and account.
/hondo rotate <left right yaw pitch roll reset> [number]
- Rotate an object. If the above directions fail, try yxx pxx rxx instead.
/hondo move <forward back up down> [number]

**Admin Commands:**
- Move a decorative object that is outside in Mos Espa.
/hondo admin decor
- Opens a list of decorative items that may be used anywhere.
/hondo admin placeStructure
- Opens a window that alows you to place a listed structure as a player structure.
/hondo admin showRuler
- Displays a green line to help visualize structure alignment.
/hondo admin getBuildingInfo [optional: log]
- Emails you content creation related info about the building you are standing in. Use log at the end to add the output to bin/custom_scripts/spout/building_info_log.lua.

**Screenplay Builder Commands:**
*Writes screenplay calls in bin/custom_scripts/spout/file_name.lua on the server.*

/hondo admin spoutMobile [file_name]
- spawnMobile for the targeted creature.
/hondo admin spoutOnme [file_name]
- spawnMobile based on where you are standing and facing. Default mobile type: commoner.
/hondo admin spoutObject [file_name]
- spawnSceneObject for the targeted object.
/hondo admin spoutStatic [file_name]
- spawnSceneObject for the static version of a LoH specific outdoor decor items.
/hondo admin spoutRoom [file_name]
- spawnSceneObject for all decorations in the room (cell) you are standing in. Layout iff loaded items excluded.
/hondo admin spoutBuilding [file_name]
- spawnSceneObject for all decorations in the whole building you are standing in. Layout iff loaded items excluded.

####Drop Objects Outside
I've brought back the ability for an admin to drop any inventory object outside, as well as adding many "tangible versions of static objects" (most static objects can't be targetted, making them useless for world building by default) that can be moved and rotated (LoH Decor). For normal SWG object, simply stand outside and select "Admin Drop Outside" from the object's radial menu. For the LoH Decor, choose the "Drop Outside" option.

####Legend of Hondo Decor
These are items that the player can place outside anywhere in Mos Espa to decorate outside. I decided to make this THE way the player can decorate outside, rather than modding a whack of different systems (city decorations, event promoter, etc) to achieve the same effect. As the server admin, I also wanted to be able to manipulate filler buildings, walls, trees, and whatnot outside as well, so I put the time into killing the two birds with one stone. Therefore, these items are persistent and saved in the playerstrucures.db.

Note: Any player can pick up them or drop them in Mos Espa, as there isn't any ownership tied to them. I don't need to worry about such things in a single player situation. :)

All the LoH decor items that are "tangible versions of static objects" are available to the admin using the */hondo admin decor* command. It brings up a menu to place the items into your inventory. For world building, I suggest using */hondo admin spoutStatic* on these items, as that will make a spawnSceneObject call to load the normal, non-targetable static object version. For all other items that are normally able to be targetted, just go ahead and use the normal version and */hondo admin spoutObject* to auto-create the spawnSceneObject calls.

Players will be able to purchase many of these same items from NPC Merchants (excluding the filler buildings for instance). To allow the player to place them outside, much of the LoH Decor will be duplicates of other tangible objects. Don't worry, I won't clutter up the admin decor list with such redundant items! That way you'll *know* that anything from that menu is a static object.

Any number of additional items can be added to the lua list very easily, as it is set up similarly to the Character Builder Terminal.
bin/scripts/screenplays/hondo/admin/decor_items.lua

####Structure Placement Menu
This is the new way for an admin to bypass all restrictions and place any building anywhere they'd like (outside, of course). Use /hondo admin placeStructure to bring up a handy menu of nearly every possible structure in the game, both player and NPC/default structures alike! The buildings are loaded into the world as normal player houses (using the same C++ function even), so they get stored in the playerstructures.db, they persist through server reboots, and the interior objects only load when a player enters the structure. The placement method is a remake of "House Plop", meaning the building is dropped on you where you're standing. Use the green ruler to help visualize the alignment.

I didn't bother with setting the name, sending and email, or creating a waypoint, as those are frivolities that an admin doesn't really need and usually doesn't even want. While you can use this tool to set players up with their very own NPC structures as a house, you'll want to edit the lua template files for said structures before hand, as they lack maint fees, lots, and other such data. However, this is mainly meant to be used as a world building tools, so you can place a structure and build decorations around it outside, then later add the buildind to your planet snapshot file.

To get the location and rotation information of any building (that you want to add to a WS file for instance), simply stand inside it and type */hondo admin getBuildingInfo* and it will be emailed to you. To log the output to a file on the server, type */hondo admin getBuildingInfo log* instead.

Any number of additional buildings can be added to the lua list very easily, as it is set up similarly to the Character Builder Terminal.
bin/scripts/screenplays/hondo/admin/placestructure_items.lua

####Screenplay Builder Commands
As noted above in the details of the /hondo command, there are several */hondo admin spout* commands. What is spout?

Spout is short for Screenplay Out and it signifies the ability for the computer to do all the busy work, while you get down to the exciting stuff!

One of the most time consuming and tedious aspects of developing in the SWGEmu construct is place characters and objects using screenplays. By default, we're left to use a mashup of commands, UI windows, emails, etc. to just get the values we need to enter into the screenplay calls. Looking into the future at how often I would be doing this sort of thing, I decided it was a great use of my time to make some commands that unify and simply the process.

The idea here is to use the game itself as a basic "world builder tool", where you log into your development server, decorate using the normal SWG decoration workflow (I highly suggest making some move and roate macros!), and then "spout" the screenplay calls required to load that stuff on your live server. You can even use the output as a quick reference for adding things to a snapshot file. While it's certainly not a true world editor, at least being able to use the familiar SWG decoration workflow while completely removing the need to type/edit values is a time saver, eh?

The output of the spout commands is straight up copy and paste code screenplay code that is already conveniently located on the server in a Lua file. The two most powerful commands are the *spoutRoom* and *spoutBuilding* commands, which will output spawnSceneObject calls for every item in the room or in the building respectively. Because a wall of text isn't always useful, I added the building room numbers (building-relative cell number) to the *spoutRoom* and *spoutBuilding* commands as sections, as well as the world location of the building itself.

For individual objects or when decorating outside, simply select an item and use the appropriate spout command. You can also spawn mobs and *spoutMobile* on them or simply stand where you'd like a mob to be placed and do a *spoutOnMe*. After using *spoutOnMe* you'll need to manually change the mob type from commoner to the one you'd like, but that's a pretty quick edit.

####Future Admin Tools
Down the road I may create some additional tools, both to be used in the game as well as to be run directly in Linux, depending on my needs. I have already shared some Bash shell scripts (in Legend of Hondo Classic) and the pretty basic UI Color Theme Editor (which only seems to work flawlessly in Opera 12...), as well as posted other information on my blog at https://tatwi.wordpress.com/ and that stuff, along with this repo itself can be considered tools for admins. As far as what tools I am thinking I may end up needing, here's a short list,

- Lua-based custom conversation builder.
- Lua mob outfit generator.
- New item lua script generator (paste path-shared-filename, get all files/entries made for you).
- Loot table / group generator.

####Files
These are the files that were added or updated in this feature.

C++ Files  
Lua Files  
TRE Files  
- What they were used for

MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp
MMOCoreORB/src/server/zone/managers/director/DirectorManager.h
MMOCoreORB/src/server/zone/managers/objectcontroller/command/CommandConfigManager.cpp
MMOCoreORB/src/server/zone/objects/creature/commands/commands.h
MMOCoreORB/src/server/zone/objects/creature/commands/hondoCommand.h
MMOCoreORB/bin/scripts/commands/commands.lua
MMOCoreORB/bin/scripts/commands/hondo.lua
tre_required/datatables/command/command_table.iff
- /hondo command
- Drop LoH Decor outside functions in DirectorManager, used by SuiHondoDecoration.lua
- Other new lua functions in DirectorManager

MMOCoreORB/bin/scripts/screenplays/hondo/admin/placestructure_items.lua
MMOCoreORB/bin/scripts/screenplays/hondo/admin/placestructure_menu.lua
- /hondo admin placestructure command menu and items

MMOCoreORB/src/server/zone/objects/scene/SceneObject.idl
MMOCoreORB/src/server/zone/objects/scene/SceneObjectImplementation.cpp
MMOCoreORB/src/server/zone/objects/scene/components/ObjectMenuComponent.cpp
- Admin drop items outside

MMOCoreORB/bin/scripts/object/allobjects.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_block_64x16_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_block_64x16_style_02.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_block_64x32_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_block_64x32_style_02.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_slave_quarters_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_tatt_style01_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_tatt_style01_02.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_tatt_style01_03.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_tatt_style01_04.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_tatt_style01_05.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_tatt_style01_06.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_tatt_style01_07.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_tatt_style01_08.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_tatt_style01_09.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_tatt_style01_10.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/filler_building_tatt_style01_11.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/building/tatooine/objects.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/flora/flora_plant_tato_hubba.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/flora/flora_tree_palm_fngi.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/flora/flora_tree_palm_sm.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/flora/flora_tree_palm_thk.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/flora/flora_tree_rori_windswept_s00.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/flora/flora_tree_rori_windswept_s01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/flora/flora_tree_rori_windswept_s02.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/flora/flora_tree_rori_windswept_s03.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/flora/flora_tree_tato_touchnot.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/flora/objects.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/objects.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/planter_generic_style_1.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/planter_generic_style_2.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/planter_generic_style_3.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/planter_generic_style_4.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/poi_tato_corral_half_32x32_s01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/poi_tato_corral_half_32x32_s02.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/poi_tato_corral_half_32x32_s03.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/poi_tato_corral_half_32x32_s04.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/poi_tato_corral_half_64x64_s01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/poi_tato_corral_half_64x64_s02.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/poi_tato_corral_half_64x64_s03.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/poi_tato_corral_half_64x64_s04.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/poi_tato_corral_pen_16x8_s01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/poi_tato_farm_32x32_s01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/poi_tato_farm_32x32_s02.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/general/xwing.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/antenna_tatt_style_1.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/antenna_tatt_style_2.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/beam_tatooine_overhead_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/beam_tatooine_overhead_style_02.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/bridge_tatooine_small_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/bridge_tatooine_small_style_02.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/bridge_tatooine_small_style_03.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/concrete_slab_tatooine_16x8.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/debris_tatt_pipe_dual_unconnected.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/debris_tatt_pipe_narrow_1.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/debris_tatt_pipe_narrow_2.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/debris_tatt_pipe_widemouth.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/objects.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/pillar_damaged_large_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/pillar_pristine_large_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/pillar_pristine_small_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/pillar_pristine_tall_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/pillar_ruined_large_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/pillar_ruined_small_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/pillar_watto_junkshop.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/shed_junkshop_watto.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/stair_tatooine_large_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/stair_tatooine_large_style_02.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/stair_tatooine_small_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/stair_tatooine_small_style_02.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/stone_hovel_tatooine_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_archway_tatooine_large_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_archway_tatooine_wide_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_cleft_tatooine_large_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_damaged_tatooine_large_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_gate_tatooine_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_gate_tatooine_style_02.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_gate_tatooine_style_03.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_gate_tatooine_wide_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_junkshop_watto.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_pristine_tatooine_large_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_pristine_tatooine_large_style_02.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_pristine_tatooine_small_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_pristine_tatooine_tall_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_ruined_tatooine_large_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_ruined_tatooine_large_style_02.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/decoration/structure/tatooine/wall_ruined_tatooine_small_style_01.lua
MMOCoreORB/bin/scripts/object/tangible/hondo/serverobjects.lua
MMOCoreORB/bin/scripts/object/tangible/serverobjects.lua
MMOCoreORB/bin/scripts/screenplays/hondo/admin/decor_items.lua
MMOCoreORB/bin/scripts/screenplays/hondo/admin/decor_menu.lua
MMOCoreORB/bin/scripts/screenplays/screenplays.lua
MMOCoreORB/bin/scripts/screenplays/sui/custom/SuiHondoDecoration.lua
tre_required/misc/object_template_crc_string_table.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_block_64x16_style_01.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_block_64x16_style_02.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_block_64x32_style_01.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_block_64x32_style_02.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_slave_quarters_style_01.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_tatt_style01_01.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_tatt_style01_02.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_tatt_style01_03.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_tatt_style01_04.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_tatt_style01_05.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_tatt_style01_06.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_tatt_style01_07.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_tatt_style01_08.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_tatt_style01_09.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_tatt_style01_10.iff
tre_required/object/tangible/hondo/decoration/building/tatooine/shared_filler_building_tatt_style01_11.iff
tre_required/object/tangible/hondo/decoration/flora/shared_flora_plant_tato_hubba.iff
tre_required/object/tangible/hondo/decoration/flora/shared_flora_tree_palm_fngi.iff
tre_required/object/tangible/hondo/decoration/flora/shared_flora_tree_palm_sm.iff
tre_required/object/tangible/hondo/decoration/flora/shared_flora_tree_palm_thk.iff
tre_required/object/tangible/hondo/decoration/flora/shared_flora_tree_rori_windswept_s00.iff
tre_required/object/tangible/hondo/decoration/flora/shared_flora_tree_rori_windswept_s01.iff
tre_required/object/tangible/hondo/decoration/flora/shared_flora_tree_rori_windswept_s02.iff
tre_required/object/tangible/hondo/decoration/flora/shared_flora_tree_rori_windswept_s03.iff
tre_required/object/tangible/hondo/decoration/flora/shared_flora_tree_tato_touchnot.iff
tre_required/object/tangible/hondo/decoration/structure/general/00000000_copy-paste-template.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_planter_generic_style_1.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_planter_generic_style_2.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_planter_generic_style_3.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_planter_generic_style_4.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_poi_tato_corral_half_32x32_s01.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_poi_tato_corral_half_32x32_s02.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_poi_tato_corral_half_32x32_s03.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_poi_tato_corral_half_32x32_s04.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_poi_tato_corral_half_64x64_s01.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_poi_tato_corral_half_64x64_s02.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_poi_tato_corral_half_64x64_s03.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_poi_tato_corral_half_64x64_s04.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_poi_tato_corral_pen_16x8_s01.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_poi_tato_farm_32x32_s01.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_poi_tato_farm_32x32_s02.iff
tre_required/object/tangible/hondo/decoration/structure/general/shared_xwing.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_antenna_tatt_style_1.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_antenna_tatt_style_2.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_beam_tatooine_overhead_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_beam_tatooine_overhead_style_02.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_bridge_tatooine_small_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_bridge_tatooine_small_style_02.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_bridge_tatooine_small_style_03.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_concrete_slab_tatooine_16x8.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_debris_tatt_pipe_dual_unconnected.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_debris_tatt_pipe_narrow_1.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_debris_tatt_pipe_narrow_2.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_debris_tatt_pipe_widemouth.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_orchard_tatooine_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_orchard_tatooine_style_02.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_pillar_damaged_large_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_pillar_pristine_large_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_pillar_pristine_small_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_pillar_pristine_tall_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_pillar_ruined_large_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_pillar_ruined_small_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_pillar_watto_junkshop.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_shed_junkshop_watto.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_stair_tatooine_large_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_stair_tatooine_large_style_02.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_stair_tatooine_small_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_stair_tatooine_small_style_02.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_stone_hovel_tatooine_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_archway_tatooine_large_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_archway_tatooine_wide_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_cleft_tatooine_large_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_damaged_tatooine_large_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_gate_tatooine_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_gate_tatooine_style_02.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_gate_tatooine_style_03.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_gate_tatooine_wide_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_junkshop_watto.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_pristine_tatooine_large_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_pristine_tatooine_large_style_02.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_pristine_tatooine_small_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_pristine_tatooine_tall_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_ruined_tatooine_large_style_01.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_ruined_tatooine_large_style_02.iff
tre_required/object/tangible/hondo/decoration/structure/tatooine/shared_wall_ruined_tatooine_small_style_01.iff
tre_required/string/en/frn_d.stf
tre_required/string/en/frn_n.stf
- LoH exterior decor items
- /hondo admin decor command menu
