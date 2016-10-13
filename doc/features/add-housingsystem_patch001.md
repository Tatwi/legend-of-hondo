###Hondo Housing System - Patch 001
*September 2016*

####Purpose
- Make the NPC style structures used by the system more like player houses, by adding signs and structure management terminals.
- Add missing config values for lots, footprints, construction markers, and maintainance.
- Adjust the layout table accordingly.

####Fixes
- Created 34 new building templates, rather than changing the default ones (I added a guide for how this is done in doc/guides/How-To_convert_an_npc_structure_to_a_player_house.md).
- Fixed a couple minor errors in the layout table.

####Files
These are the files that were added or updated in this patch.

C++ Files  
Lua Files  
TRE Files  
- What they were used for 

bin/scripts/object/building/player/objects.lua
bin/scripts/object/building/player/serverobjects.lua
- Registered new building objects.
 
bin/scripts/screenplays/hondo/housing_system/housing_system_layouts.lua
- Adjusted the layout table.

bin/scripts/object/building/player/player_house_tatooine_large_style_02.lua
bin/scripts/object/building/player/player_house_tatooine_medium_style_02.lua
bin/scripts/object/building/player/player_npc_bunker_large.lua
bin/scripts/object/building/player/player_npc_bunker_medium.lua
bin/scripts/object/building/player/player_npc_bunker_small.lua
bin/scripts/object/building/player/player_npc_cantina_corellia.lua
bin/scripts/object/building/player/player_npc_cantina_naboo.lua
bin/scripts/object/building/player/player_npc_cantina_tatooine.lua
bin/scripts/object/building/player/player_npc_capitol_corellia.lua
bin/scripts/object/building/player/player_npc_capitol_naboo.lua
bin/scripts/object/building/player/player_npc_capitol_tatooine.lua
bin/scripts/object/building/player/player_npc_combat_guildhall_corellia.lua
bin/scripts/object/building/player/player_npc_combat_guildhall_naboo.lua
bin/scripts/object/building/player/player_npc_combat_guildhall_tatooine.lua
bin/scripts/object/building/player/player_npc_commerce_guildhall_corellia.lua
bin/scripts/object/building/player/player_npc_commerce_guildhall_naboo.lua
bin/scripts/object/building/player/player_npc_commerce_guildhall_tatooine.lua
bin/scripts/object/building/player/player_npc_hospital_corellia.lua
bin/scripts/object/building/player/player_npc_hospital_naboo.lua
bin/scripts/object/building/player/player_npc_hospital_tatooine.lua
bin/scripts/object/building/player/player_npc_hotel_corellia.lua
bin/scripts/object/building/player/player_npc_hotel_naboo.lua
bin/scripts/object/building/player/player_npc_hotel_tatooine.lua
bin/scripts/object/building/player/player_npc_police_station_imperial.lua
bin/scripts/object/building/player/player_npc_police_station_rebel.lua
bin/scripts/object/building/player/player_npc_template.lua
bin/scripts/object/building/player/player_npc_theater_corellia.lua
bin/scripts/object/building/player/player_npc_theater_naboo.lua
bin/scripts/object/building/player/player_npc_theater_tatooine.lua
bin/scripts/object/building/player/player_npc_university_corellia.lua
bin/scripts/object/building/player/player_npc_university_naboo.lua
bin/scripts/object/building/player/player_npc_university_tatooine.lua
bin/scripts/object/building/player/player_salon_tent_style_01.lua
bin/scripts/object/building/player/player_salon_tent_style_02.lua
bin/scripts/object/building/player/player_salon_tent_style_03.lua
- Lua templates for each new structure.

tre_required/misc/object_template_crc_string_table.iff
- Registered the new object iff files.

tre_required/object/building/player/shared_player_house_tatooine_large_style_02.iff
tre_required/object/building/player/shared_player_house_tatooine_medium_style_02.iff
tre_required/object/building/player/shared_player_npc_bunker_large.iff
tre_required/object/building/player/shared_player_npc_bunker_medium.iff
tre_required/object/building/player/shared_player_npc_bunker_small.iff
tre_required/object/building/player/shared_player_npc_cantina_corellia.iff
tre_required/object/building/player/shared_player_npc_cantina_naboo.iff
tre_required/object/building/player/shared_player_npc_cantina_tatooine.iff
tre_required/object/building/player/shared_player_npc_capitol_corellia.iff
tre_required/object/building/player/shared_player_npc_capitol_naboo.iff
tre_required/object/building/player/shared_player_npc_capitol_tatooine.iff
tre_required/object/building/player/shared_player_npc_combat_guildhall_corellia.iff
tre_required/object/building/player/shared_player_npc_combat_guildhall_naboo.iff
tre_required/object/building/player/shared_player_npc_combat_guildhall_tatooine.iff
tre_required/object/building/player/shared_player_npc_commerce_guildhall_corellia.iff
tre_required/object/building/player/shared_player_npc_commerce_guildhall_naboo.iff
tre_required/object/building/player/shared_player_npc_commerce_guildhall_tatooine.iff
tre_required/object/building/player/shared_player_npc_hospital_corellia.iff
tre_required/object/building/player/shared_player_npc_hospital_naboo.iff
tre_required/object/building/player/shared_player_npc_hospital_tatooine.iff
tre_required/object/building/player/shared_player_npc_hotel_corellia.iff
tre_required/object/building/player/shared_player_npc_hotel_naboo.iff
tre_required/object/building/player/shared_player_npc_hotel_tatooine.iff
tre_required/object/building/player/shared_player_npc_police_station_imperial.iff
tre_required/object/building/player/shared_player_npc_police_station_rebel.iff
tre_required/object/building/player/shared_player_npc_theater_corellia.iff
tre_required/object/building/player/shared_player_npc_theater_naboo.iff
tre_required/object/building/player/shared_player_npc_theater_tatooine.iff
tre_required/object/building/player/shared_player_npc_university_corellia.iff
tre_required/object/building/player/shared_player_npc_university_naboo.iff
tre_required/object/building/player/shared_player_npc_university_tatooine.iff
tre_required/object/building/player/shared_player_salon_tent_style_01.iff
tre_required/object/building/player/shared_player_salon_tent_style_02.iff
tre_required/object/building/player/shared_player_salon_tent_style_03.iff
- Template files for each building, based on the medium generic player house.
