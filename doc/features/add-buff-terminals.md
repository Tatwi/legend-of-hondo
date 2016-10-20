###Buff Terminals
October 2016

The Lua based buff terminal functionality is something that I created for Kinshi of the Tarkin server and customized for Legend of Hondo. I will admit that I made more easily customizable than what was needed for Tarkin, because *I* wanted to use those features. :)

####Purpose
To provide stat buffs and health services to the player that they would normally get through interacting with other players. 

####Features
- The system has unlimited customization of buffs for 9 main player stats.
- Also buffs any active pets. 
- LoH has 4 levels of buffs at various prices, with the lowest level being free.
- Wound and Battle Fatigue healing, for a fee.
- Buff removal and stomach emptying, for free.

####Files
These are the files that were added or updated in this feature.

C++ Files  
Lua Files  
TRE Files  
- What they were used for

MMOCoreORB/src/server/zone/managers/player/PlayerManager.idl
 - Made the doEnhanceCharacter function pubilic so it could be called from LuaCreatureObject

MMOCoreORB/src/server/zone/objects/creature/LuaCreatureObject.cpp
MMOCoreORB/src/server/zone/objects/creature/LuaCreatureObject.h
- New Lua functions: buffSingleStat, removeBuffs, emptyStomach, getActivePetsSize, getActivePet.

MMOCoreORB/bin/scripts/screenplays/screenplays.lua
MMOCoreORB/bin/scripts/screenplays/hondo/buff_terminals.lua
- Logic for the terminal and the radial menu functionality.

doc/features/add-buff-terminal.md
- The file you are reading right now.
