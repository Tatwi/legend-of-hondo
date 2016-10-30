###Junk Dealers Buy Crafted Items

Due to the single player nature of the game, it makes sense to allow generic Junk Dealers to buy any player crafted item, including those that have been removed from factory crates. More interesting, item specific, crafting missions may be added later, where the payout will be considerably more than what a Junk Dealer is willing to pay. However, the Junk Dealers will buy any quantity of items at what is usually a fair price. 

####Details
"Junk Value" prices are associated with loot object when they are created. I simply did the same for crafted items and removed the "if the item was crafted by a player, tell them to get lost" check from the Junk Dealer logic. To set the price, the system takes into account the resource quality, quantity, and the sub components required to make the item, as well as the player's related crafting skill level (with a bit of randomness thrown in for good measure). Complexity is not factored into the price, as its value was not a reliable indication of the quality of an object.

The max sale price is somewhere around 35,000 credits for items that require a lot of resources. On the other end of the spectrum, Novice Artisan items can sell for less than 10 credits. 

####Setting The Price
Given how convoluted this proved to be when I went to program it (in 2015 initially), I thought I should spell out how it works in no uncertain terms.

1. CraftingSessionImplementation::initialAssembly()
- This is where the item gets created.
- It calls int junkPrice = craftingManager.get()->calculateFinalJunkValue(crafter, manufactureSchematic);
- Which is needed to access functionality in the Crafting Manager scope...

2. CraftingManagerImplementation::calculateFinalJunkValue()
- This is where the final price the item will have is calculated, but because we want it to based on the stuff used to craft the item it needs to call...

3. SharedLabratory::getJunkValue()
- And here is where I have access to enough of the programming to actually pull in the manufacturing schematic details needed to calculate the price.


####Files
These are the files that were added or updated in this feature.

C++ Files  
Lua Files  
TRE Files  
- What they were used for

src/server/zone/managers/crafting/CraftingManager.idl
src/server/zone/managers/crafting/CraftingManagerImplementation.cpp
- Returns the final price of the item

src/server/zone/managers/crafting/labratories/SharedLabratory.cpp
src/server/zone/managers/crafting/labratories/SharedLabratory.h
- Returns the initial price of the item, based on the stuff used to make it.

src/server/zone/objects/player/sessions/crafting/CraftingSessionImplementation.cpp
- Actually adds the junk vendor type and junk value to the object.

src/server/zone/objects/creature/junkdealer/JunkdealerCreatureImplementation.cpp
- Bypasses the check preventing crafting items from being sold

