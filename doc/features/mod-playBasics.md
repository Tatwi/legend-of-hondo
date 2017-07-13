### Play Essentials
*July 2017*  
I decided to spend some time filling in the holes so that I can sit down and actually play when I feel like it. The *mod-playBasics* branch is a series modifications that allowed me to achieve that goal. Effectively, I have completed everything in Legend of Hondo other than the Pirate System, The Business System, and the NPC Merchant system. Perhaps in the future I will finish those systems too! :) 

#### Change Log
I don't happen to feel like writing a detailed document for this, largely because I doubt anyone will read it anyway, so here is a point form list of changes I kept as I was working on them.

*Hondo Housing System*  
- Added all of the Hondo Housing System sites in Mos Espa. There are loads of buildings and building options to play with!

*Hondo Merchant System*  
- Added the NPC merchant system that I created back in 2015. It's designed to sell a small amount of items per NPC, with each NPC having a charcter of their own that is portrayed through conversations and factional relationships.

*BazaarBot*  
- Configured BazaarBot for Legend of Hondo.
- Originally I created this system for a friend to use on his server, but I decided to use it here as well for volume sales.

*Mos Espa Layout*
- Added a trainer for all skills (except Pirate) to Mos Espa. Some of the trainers have been customized to give them a bit of personality.
- Removed all other trainers from the galaxy.
- Removed the second starport and rebuilt the area. When it's fully populated, this will be the player's base of operations and pirate story hub. The tavern placed in this area using the snapshot file will later be populated with pirate quest related characters.

*Housing*  
- Modified the building storage limitation calculation. Legend of Hondo doesn't use the normal SWG "lots", so the lot size value in the building templates can be any value (making it easier to set values that match the usable size of the building).
- Increased the storage on some player building types.
- Increased storage capacity of the bunkers (player can choose small, medium, or large) by a massive amount, as they are enormous and the player can only place one at his "Base of Operations".

*Crafting/Resources*  
- Survey missions are now available for all resource categories.
- Completing survey missions now rewards a good amount of resouces in addition to credits.
- The concentration surveyed is directly proportial to the resource reward, so it's always good idea to find the highest possible concentration rather than just the mission target value.
- Un-nerfed time between sampling from 90 seconds to 10 seconds, to waste less time due to sample failures. Still only 1 unit reward to discourage AFK sampling 24/7/365...
- Crafting terminal missions now grant General Crafting XP upon completing the mission.
- Adjusted creature harvesting calculation to compensate for the lack of division of labor in a single player environment.

*Leveling/XP*  
- Players always start in Mos Espa and they can create a new character every 5 minutes.
- The new player email now has detailed information that is specific to Legend of Hondo.
- Gave a small xp bonus for harvesting, based on the player's Creature Knowledge.
- Added survey and artisan mission terminals to the planets that didn't have any.
- Enabled all planets.
- Destroy Mission now grant Priate Experience after reaching Scout x2xx "Odd Jobs".
- Generic quests completed for criminals grant Pirate Experience after reaching Scout x1xx "Foot in the Door".
  - Required adding Lua calls for granting xp and getting stat mod values, adding XP as a reward type in the ThemePark Logic, and adding the XP reward to the criminal quests.
  - Also fixed a bug in these missions caused by a missing mobile template (criminal_target_black_sun)
- Added Pirate XP to slicing success and made slicing work again (converted references to the old Smuggler slicing skills into the correct Scout skills in the Legend of Hondo skill tree).


*Loot/Items/Rewards*  
- Added a loot group for all common loot that is weighted slightly toward dropping SEAs. This group will be used to help make up for the lack of the division of labor caused by LoH being a single player game.
- Added a chance for bonus loot to all mobs, with the chance being greater for higher level mobs.
- High level mobs will always drop hondo_common loot, 4 to 15 pieces depending on their level, plus a possible bonus loot item.
- Very high level mobs always drop an SEA.
- Any mob that didn't have a loot group will now use the hondo_common loot group.
- Essential items, modest quality, good variety of resources, items only listed in Mos Espa.
- Added a small credit reward to Businessman, Noble, and Scientist generic quests.


*Junk Dealers*  
- Junk Dealers will buy broken or sliced items as scrap.
- Junk Dealers will now buy around 250 more loot items.
- Fixed two instances of junk loot Lua variable names colliding with other Lua variable names (causing the junk loot to not have junk values).


*Admin Related*  
- Updated the skill granting section of the character builder terminal (blue frog) to match the Legend of Hondo skill tree (used in testing only).
- Added missing buildings to admin placeStructure command
- Disabled testing city on the simple planet.
