###Breadcrumb Quest
*July 2016*

####Purpose
This feature is a simple example that can be used as template to make additional "bread crumb quests". The main concept of the breadcrumb quest is to send the player to a series of waypoints, ending back at the quest giver who then issues a reward. The quest is self contained rather than part of a standard framework, therefore it allows the quest creator to add unlimited amounts of customized functionality without having to consider how such changes would effect other quests or systems. 

###Primary Components
A quest is comprised of the following components:

- The quest screenplay file, complete with logic, data, and waypoints.
- A custom NPC template file.
- A custom conversation template file.

####How-to Make a Quest
1. Copy the breadcrumb_example.lua file
2. Replace all instances of BreadcrumbBobScreenPlay and breadcrumbBob_convo_handler, and change the value of questName, className, with something unique.
3. Make a custom character and conversation for that character, using Breadcrumb Bob as an example. Keep in mind the important convo steps that trigger the quest actions.
4. Spawn your character in the spawnMobiles() function.
5. Customize the questConfig table to your liking.

That gets you a new quest with minimal effort, confident that your mods won't break something else. 

####Customization
Due to the breadcrumb quests being independent from each other, they will contain a significant amount of identical code, however that redundancy is an intended feature of this system. Additional characters, events, conversations, and so on can be added at any point along the player's journey and by using this simple basic design, you can make an unlimited amount of unique quests. You're really only limited by your imagination and programming skill, because you have the whole of the programming environment at your disposal, rather than being locked into one of the other frameworks that are already available.

I should also note that this quest method does not require a client side update, provided your conversation file is hand made with NPC customDialogText and reply options, rather than using a custom string file to display the text. The upside of using string files on the client is that it allows people to make a version of the quest in their own language. The downside to string files is that the work-flow of editing them is very poor compared to editing server side lua files, in part due to the fact they need to me included in a TRE file and distributed to the client. 

Though the example I have provided uses a custom NPC mobile template, it's also possible to forgo making a custom NPC by spawning any NPC existing and then adding a unique name and conversation template, like so:

local pQuestGiver = spawnMobile(self.questConfig.planetName, "commoner", 1, 1304.62, 7, 3101.93, 187, 0) 
CreatureObject(pQuestGiver):setCustomObjectName("Breadcrumb Bob")
AiAgent(pQuestGiver):setConvoTemplate("breadcrumbBob_template")

You can also use those above commands to your advantage by generating characters along the journey that are random or based on sets of criteria, either having randomly selected conversations or specific ones. Lots of possibilities there to play around with that can really bring your world to life, with a bit of imagination and elbow grease!

####Files
These are the files that were added or updated in this feature.

C++ Files  
Lua Files  
TRE Files  
- What they were used for

bin/scripts/mobile/conversations.lua
bin/scripts/mobile/serverobjects.lua
bin/scripts/mobile/hondo/serverobjects.lua
bin/scripts/screenplays/screenplays.lua
bin/scripts/screenplays/hondo/quests/quests.lua
- Registered new files.

bin/scripts/screenplays/hondo/quests/breadcrumb_example.lua
- The screenplay logic and configuration the make up the quest.

bin/scripts/mobile/hondo/quests/breadcrumb_bob.lua
- Bob's custom NPC template.

bin/scripts/mobile/conversations/hondo/quests/breadcrumb_bob.lua
- Bob's custom conversation template.
