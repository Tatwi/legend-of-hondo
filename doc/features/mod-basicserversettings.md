###Basic Server Settings

This is the application of my preferences to a handful of minor things. I rolled them all together, because they're each very small changes.

bin/scripts/managers/player_creation_manager.lua
- Starting Credits: 25,000 Cash, 25,000 Bank

bin/scripts/managers/player_manager.lua
- Global XP rate 3x
- Group XP bonus removed
- Datapad Increases: 10 Pets, 5 Droids, 5 Vehicles, 5 Faction Pets
- Disabled Vet Rewards: Self Powered Harvester, Anti-Decay Kit, Crate of Free Resources

bin/scripts/managers/skill_mod_manager.lua
- Enable Stored Pets and Taming Bonus SEAs

bin/scripts/managers/planet_manager.lua
- Removed the "Blue Frog" Character Builder terminals

bin/scripts/managers/weather_manager.lua
- Reduced storm frequency on Tatooine and Lok
- Enabled sand storm damage on Tatooine and Lok

src/server/zone/objects/creature/commands/RequestSetStatMigrationDataCommand.h
- Allowed self stat migration from anywhere while not in combat

src/server/zone/objects/player/sessions/EntertainingSessionImplementation.cpp
- Removed the application of Entertainer buffs and Mind/BF healing (Replaced by the Medical Services terminal). 

src/server/zone/objects/player/sessions/survey/SurveySessionImplementation.cpp
- Increased the time between sampling from 25 seconds to 90 seconds.
src/server/zone/managers/resource/resourcespawner/ResourceSpawner.cpp
- Capped hand sampling of resources at 1 unit per success, except for in the "rich sample" mini game. 
- The idea being to play the mini game, use harvesters, survey missions, pirate missions, and the bazaar, rather than AFK sampling.
- XP is still calculated normally.


