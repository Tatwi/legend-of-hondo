###How-To Add a New Slash Command
Introducing new commands to SWGEmu, either for admin use or for players, can be a handy way to improve the end-user experience. Thankfully, it's not too difficult to do, though doing so does require a minor client side update. I'll take you through the process step by step. For the example, I'll add the /helloWorld command.

**Requires:** IFF data table editor (TRE Explorer, Jawa ToolBox, Sytner's IFF Editor)

1. Extract a copy of the following command data table to your working folder:
datatables/command/command_table.iff

2. Open the data table in the editor and add your new command(s), one per row. Have a look at the other admin commands, then add the following entries to your new one:
- commandName: helloWorld
- cppHook: helloWorld
- targetType: optional
- displayGroup: EDA57E75

3. Save the data table, pack it into your TRE structure, and make sure it is loaded by both the client and the server. That's it for the client side modding! If you need help with this part, see the following post on Mod The Galaxy, 
http://www.modthegalaxy.com/forums/thread-tool-sytner-s-iff-editor-3

4. Register the new command in the server software:

MMOCoreORB/src/server/zone/managers/objectcontroller/command/CommandConfigManager.cpp
- Scroll to the bottom and add a new call under the last one listed, like so:

commandFactory.registerCommand<HondoCommand>(String("helloWorld").toLowerCase());

MMOCoreORB/src/server/zone/objects/creature/commands/commands.h
- Scroll to the bottom and add the include line for header file of your new command:
#include "helloWorldCommand.h"

5. Create the header file that will perform the actions:
MMOCoreORB/src/server/zone/objects/creature/commands/helloWorld.h

6. Program the actions. In this case, we will simply send the player a system message that says "Hello World!", however you can program a command to do pretty much anything you'd like. You can even run a lua function.
```
#ifndef HELLOWORLDCOMMAND_H_
#define HELLOWORLDCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class HelloWorldCommand : public QueueCommand {
public:

	HelloWorldCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!creature->isPlayerCreature()) // If not player, bail
			return GENERALERROR;

		creature->sendSystemMessage("Hello World!");

		return SUCCESS;
	}

};

#endif //HELLOWORLDCOMMAND_H_
```

6a. If you'd like to run a lua function, make the function as part of a class (like a screenplay) and include its file in the screenplays.lua list, then add the following to your helloWorld.h after the "if not player" check.

```
		Lua* lua = DirectorManager::instance()->getLuaInstance();

		Reference<LuaFunction*> myLuaFunction = lua->createFunction("MyLuaClass", "myLuaFunctionName", 0);
		*myLuaFunction << creature;

		myLuaFunction->callFunction();
```
For the Lua side of things, your command would be like so:
MMOCoreORB/bin/scripts/screenplays/tools/myLuaFunction.lua

```
local ObjectManager = require("managers.object.object_manager")
MyLuaClass = {}

function MyLuaClass:myLuaFunctionName(pPlayer)
	CreatureObject(pPlayer):sendSystemMessage("Hello World!")
end
```

6b. To make the command for administrator's only, the easiest way is to simply add the following after the "if not player" check. Note that a standard player's admin level = 0 and a full server admin = 15. There are various levels in between that are described in MMOCoreORB/bin/scripts/staff/levels/*.lua

```
		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (ghost == NULL)
			return GENERALERROR;
		
		int adminLevelCheck = ghost->getAdminLevel();

		if (adminLevelCheck != 15){
			creature->sendSystemMessage("Sorry, the /helloWorld command requires administrator privileges.");
			return GENERALERROR;
		}
```

7. Compile the server code, boot the server, load the client, and enjoy your new slash command!

That's all there is to it, at the basic level. Depending on the functionality of your new command, you will need to add more C++ or lua code to various existing or new files. Just keep in mind that everything starts with the doQueueCommand() function in your helloWorld.h header file.

If you'd like, you can also research how the lua admin levels framework operates and then add your new command into that framework as well. This turned out to be more trouble than it was worth for me, so I didn't bother using it.
