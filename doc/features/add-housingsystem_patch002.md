###Hondo Housing System - Patch 002
*September 2016*

####Issues
- Buildings that are placed using the tour function are private, thus blocking non-admin characters from entering them.

####Fixes
- Set all buildings placed using the StructureManager::placeStructure() function as public.

####Comments
Initially I tested a new Lua call that changed the privacy setting of a building, but I found that it wouldn't update the client, causing the client to show the red force field until the player logged out and back in. This was strange, because the C++ to update the client was in the call, but it didn't actually update the player who placed the building or any other player standing around. 

What did work, however, was setting the privacy level to public when the building was placed into the world in the StructureManager::placeStructure(), so that's what I chose as the solution as it doesn't negatively impact normal play. 

####Files
These are the files that were added or updated in this patch.

src/server/zone/managers/structure/StructureManager.cpp
