###BazaarBot
*Created by Tatwi (www.tpot.ca) 2016*


####Purpose:
Servers that are designed for small populations or a single player inevitably run into the issue of character advancement being gated by the absence of other player activity. For instance, it's impossible to level a Commando without a heavy weapon and if you don't happen to loot one from somewhere or roll a weaponsmith character to make one, you're never going to get a heavy weapon. To help mitigate that sort of issue, I created a system that automatically list items for sale on the Bazaar terminals located in Mos Espa. 


####Scope:
The BazaarBot system was designed to supplement player activity, not supplant it. As such, the items listed are limited compared to what the player can craft and obtain through normal game play. Crafted and looted items are substantially lower quality and the available resources are only chosen from those that are available at the time they are listed. Loot and crafted item quality is randomly varied and the sale prices are generally a good indication of the quality of the item. 

As with all Bazaar listings, the items are removed after 7 days of not being purchased. This allows for a continuous "churn" of loot items and resources to keep it interesting, however items that the player *needs* for basic gameplay will always be available. A wider variety of items will be available through a new character/faction/location driven Merchant System, which will take into account the player's actions in the game.

Finally, BazaarBot is a "dumb" system, in that it does not query the market to make decisions as to what it should sell, nor will it purchase anything that the player puts up for sale. However, in Legend of Hondo the Junk Dealers will purchase both loot and crafted items from the player.

####System Design
I made the system as a screenplay, because it's a standardized format that is easy to work with and maintain. For example, as a server admin, you're able to modify the item tables or the screenplay itself and have your changes take effect without needing to reload the server (by using the reloadscreenplays server command). The system required several new C++ functions and a few C++ modifications, but you won't need to modify any of the C++ to configure the system to your liking, as that is all handled in Lua.

The system is comprised of:
- A normal character named BazaarBot, created on an admin account.
- A logic system, BazaarBot.lua
- A set of item tables and configuration, table_NAME.lua
- Two log files in bin/log/ to track listings and sales.
- A modification to the max Bazaar listing price: 500,000 credits.

The system uses:
- The draft schematic templates for creating crafted items.
- The loot item templates in bin/scripts/loot/items/ for creating loot items.
- The main C++ accessible resource map for creating currently spawning resources.

####How it Works
Rather than re-invent the wheel to achieve the goals of the system, I decided to basically automate a character using the Bazaar terminal. As a result, process is pretty much the same as what a real person would do...

1. Create a character named BazaarBot and configure BazzaBot.lua.
2. Obtain an item to sell.
- Create a crafted, looted, or resource object.
3. Sell the object on the Bazaar.
4. Repeat steps 2 and 3!

Unlike a person though, BazaarBot doesn't care about how many items he has sitting in his Available Items tab (Bazaar's version of the Stockroom). He just lets them get deleted after they sit there for 7 days. He also isn't limited by how many items he can sell at a time, while players may only sell up to 20 items by default. 

The various types of items BazaarBot can sell are set to be listed at intervals throughout the day, either in minutes or hours. Given that Bazaar listings are active for 7 days, the admin can throttle the quantity of items listed at any given time by changing the frequency of the item's update cycle as well as the quantity of items listed per update cycle. When the system is installed on a server, it does a one time loop to populate the Bazaar with roughly a weeks worth of listings.

There will be times where a player will go to the Bazaar and discover that the item they need isn't listed. If it's one of the crafted items, then all the player needs to do is wait a few minutes or hours for more to be listed. If it's a resource or piece of loot they're after, then it may or may not end up being listed so they can either use a substitute resource that is available or they can... go play the game to get what they want! :)

And, that's it.

Obviously there are ways to program a more intelligent bot, one that can read the state of the market and list items that are needed, etc., but any time such a reactionary system is created, so too are potentials for exploitation by players. With the way I created the BazaarBot, there is no way for player activity to influence what it lists for sale, therefore, player's simply can't coerce it into selling the items that they want to buy. The upsides here are that it makes the system very easy for the admin to maintain and modify, because they have 100% control over it, and that it doesn't require a much computing power to deliver a heck of a lot of functionality. Of course the downside is that there will probably be times when a player won't find what they WANT, but there likely won't very many times when a player can't find what they NEED.


####About Resources
In the previous version of the Tarkin server, 30K resource deeds were dropped as loot and given away on the "blue frog" when the server launched. This helped make up the reality that no one had any resources, but it also meant that there was a nearly unlimited supply of "server best" resources. To solve the problem of not having a variety of resource to buy, without once again introducing the problem of unlimited "server best" resources, we decided to limit the resources listed by BazaarBot to what it currently spawning at the time the resource is listed. This way the there is always a variety of resources to buy, but what's available may not always be what is best. 

Players could go just go out and harvest the same resources themselves, provided that it hasn't shifted out since it was listed by BazaarBot, however, not every player has the time or desire to manage harvesters. Often times a player only needs a couple thousand units of some general family of resource, such as copper, and it's nice to be able to buy some. 

The quantity of a particular resource that is listed for sale each time one is selected is quite low, 32,000 units in total by default. The total is divided into smaller stacks to help people who only need a little and perhaps can't afford a lot anyway, but the smaller stacks are also to encourage players to buy just what they need. Along those lines, having the BazaarBot sell the resources is also a way to discourage wasting server bandwidth by having many characters hand sampling while AFK.


####About Loot
The looted items that are available in this system are there to supplement the loot that players will find and sell. On a low population server, the division of labour is quite poor, meaning that each player needs to loot more items to increase the likelihood that any particular item will be found. The loot is chosen from groups that are weighted based on how rare we would like them to be. The quality of the loot is low compared to what players can get themselves, depending on the content from which it comes. And, not all the loot in the game is available to BazaarBot, so there's quite a bit of content players will need to take part in to add all the available loot the economy. 


####About Crafted Items
Crafting has always been a major part of the Star Wars Galaxies experience and while it is a little different on the Tarkin server, it's still fundamentally the same. With that in mind, the original Tarkin server community wanted to strike a balance between what the system makes available and what the players make available, such that the system doesn't never removes the need for player crafted items. BazaarBot strikes that balance by never producing a crafted item that is beyond 65% of what a player can craft. This is a value that varies based on what items are being made, but that's the general rule. In fact, the average item produced is between 40-55% as good as the player crafted version, with anything higher being a rare "exceptional" craft (though still no where as good as what a player could make). 

By having BazaarBot continuously sell an array of crafted items, we can ensure that players aren't gated from doing content simply because they can't find what they need. Sure, a BazaarBot item won't be the best thing ever, but it sure beats nothing!  


####C++ Modifications
Here is a list of the files that have been modified and a description of what the modifications accomplish. The approach taken by most of these mods is to, as much as possible, use the C++ as a toolbox for the Lua to use; C++ is the hammer, where Lua is the hitting of the nails and the building of the walls.

src/server/zone/objects/tangible/LuaTangibleObject.cpp
src/server/zone/objects/tangible/LuaTangibleObject.h
- New Lua call to get the price a Junk Dealer will pay for an item. 
- Used to prevent BazaarBot from selling items for cheaper than the junk value.

src/server/zone/managers/auction/AuctionManagerImplementation.cpp
src/server/zone/managers/auction/AuctionManager.idl
- New function to log sales (item name, purchasing player name, price).
- New function that sells items for BazaarBot. This function bypasses most of the limitations placed on players and it outputs error messages related to BazaarBot to make it easier for an admin to solve problems.

src/server/zone/managers/director/DirectorManager.cpp
src/server/zone/managers/director/DirectorManager.h
- Several new Lua calls were added, so I will describe each below.

bazaarBotListItem(pBazaarBot, pObject, pBazzarTerminal, string description, int price)
- Passes information through to the C++ Auction Manager to sell an item.
- This is used in a loop within the BazaarBot Lua logic to list items for sale.

bazaarBotMakeCraftedItem(pPlayer, ItemServerScriptPath, Quantity, Quality, AlternateTemplateNumber)
- Generates a crafted object, places it into BazaarBot's inventory, and returns a pointer to that object.
- This is used in a loop within the BazaarBot Lua logic to create all items in the specified table.

bazaarBotMakeLootItem(pBazaarBot, string lootGroup, int level, bool maxCondition)
- Calls on the Loot Manager to generate a piece of loot and place it into BazaarBot's inventory. It then returns a pointer to the object.
- This is used in a loop within the BazaarBot Lua logic to create a new item from the loot table.

bazaarBotMakeResourceStack(pBazaarBot, string resourceName, quantity)
- Creates a stack of resources, places the stack into BazaarBot's inventory, and returns a pointer to the stack of resources.
- Note that pointer is to the whole "resourceContainer", not the resource IN the container.
- This is used in a loop within the BazaarBot Lua logic to create X number of resource stacks.

getRandomInSpawnResource(string resourceTypeName)
- Checks if the provided resource type is currently spawning and if so, it returns the name of a specific resource.
- If multiple resources of the provided type are in spawn, it will pick one of them at random.
- If no resources of that type are currently in spawn, it returns nil.
- This is used in a loop within the BazaarBot Lua logic which does the following steps:
1. Picks a random resource family from the family table.
2. Picks a random resource type from the chosen family.
3. See if the resource is in spawn.
4. If the resource is in spawn, make some, else start over from step 1. 
- In testing I have seen this take up to 19 tries before it finds something random that is actually in spawn, but it is very effective and often only requires a couple of retries.

logToFile(string message)
- This is a function that allows Lua to pass a message into C++ so the C++ can append the message to a file.
- Adds a time stamp to each line like so Thu Oct 27 02:01:02 2016:
- I made this, because using Lua's io functions conflicted with the Jedi system's use of it and it's just generally nice for an admin to have the ability to easily make topic specific log files.
- BazaarBot uses this function to log the loot items and resources it lists for sale, as well as noting the success or failure of running the crafted item listing functions.  

src/server/zone/managers/loot/LootManagerImplementation.cpp
src/server/zone/managers/loot/LootManager.idl
- New function that creates a piece of loot and returns a pointer to its object.
- It's pretty much exactly the same as the default createLoot function, except it returns the object pointer so that the Lua logic can work with it and its error message indicates that it's a BazaarBot function.


####About the Tables
Generally speaking, the BazaarBot item and configuration tables are like any other Lua tables in the SWGEmu project. They use the concept "nesting", where you have tables that contain tables. Every entry in a table is called an index, so the first item in a table is index 1, the second index in the table is index 2, and so on. Each index is separated by a comma. Here is an example of how to use a Lua table:

```
exampleTable = {
	{"Bob", 51, "crackers", kids = {}},
	{"Sue", 27, "pizza", kids = {"Joan", "Sam"}},
	
}
```
The table above has some information about two people, Bob and Sue. We have their name, their age, their favorite food, and the names of their kids. Let's say we want to use this information for various purposes. 

How old is bob?
- local age = exampleTable[1][2]
- Bob's information is in the first index of the exampleTable and his age is the second index within that.

What's Sue's favourite food?
- local food = exampleTable[2][3]

How many kids do Bob and Sue have?
- To answer this question, we need to check entries in multiple indexes. To achieve that, we use a loop.
- We also need to know how many indexes there are, so we need to use the # shortcut.
```
local numberOfKids = 0

for i = 1, #exampleTable do
	numberOfKids = numberOfKids + #exampleTable[i][4]
end
```
- There are two indexes in exampleTable, so i will equal 1 the first time and 2 the second time.
- The first time it looks at the size of the 4th index in Bob's index, which is 0, because there aren't any entries in kids = {}
- The second time it looks at the size of the 4th index in Sue's index, which is 2, because there are two kids names.
- Therefore numberOfKids will equal 2

That's pretty much the entirety of how the Lua tables are used by Bazaarbot. The data within the tables within each table file have comments indicating their purpose and function. You can add and remove entries and change the values of the configuration tables to tweak the system to meet your needs. You should note that these tables are global in scope and as such, they need to have unique names to prevent them from colliding with other variables.

####Files
These are the files that were added or updated in this feature.

C++ Files  
Lua Files  
TRE Files  
- What they were used for

C++ files changes are listed above

bin/scripts/screenplays/hondo/bazaarbot/BazaarBot.lua
- Core logic for the system

bin/scripts/screenplays/hondo/bazaarbot/table_armor.lua
bin/scripts/screenplays/hondo/bazaarbot/table_clothing.lua
bin/scripts/screenplays/hondo/bazaarbot/table_food.lua
bin/scripts/screenplays/hondo/bazaarbot/table_furniture.lua
bin/scripts/screenplays/hondo/bazaarbot/table_item_artisan.lua
bin/scripts/screenplays/hondo/bazaarbot/table_medicine.lua
bin/scripts/screenplays/hondo/bazaarbot/table_structures.lua
bin/scripts/screenplays/hondo/bazaarbot/table_weapons.lua
- Crafted item configuration files

bin/scripts/screenplays/hondo/bazaarbot/table_loot.lua
- Loot configuration

bin/scripts/screenplays/hondo/bazaarbot/table_resources.lua
- Resource configuration
