###Admin Tools - Patch 001
*2016.09.21*

####Purpose
- Solve the problem of items being placed under a building rather than on the balcony where the player is standing.
- Fix some NPC type buildings that don't work in the /hondo placeStructure commands.
- Remove some server console debugging output that I had forgotten to remove.

####Fixes
- Hondo decor now use the player's Z position in DirectorManager:dropDecrortation().
- Corrected files names in entries in bin/scripts/screenplays/hondo/admin/placestructure_items.lua. I also added player versions of 3 NPC bunkers that depend on add-housingsystem_patch001.
- Removed debugging output from ObjectMenuComponent.cpp.

####Files
These are the files that were added or updated in this patch.

src/server/zone/managers/director/DirectorManager.cpp
src/server/zone/objects/scene/components/ObjectMenuComponent.cpp
bin/scripts/screenplays/hondo/admin/placestructure_items.lua
