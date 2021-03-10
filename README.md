# This Project is Dead
I haven't worked on this project in years for a number of reasons, such as:  

1. I've lost all interest in SWG.
2. Working with this code base and these tools is a plodding nightmare that demands far more of my time and attention than I care to give it.
3. It's really boring to play. I'm not entirely sure why this is case, because I can play other single player games without being bored, but playing this just bores me to tears. It's probably because, having made them, I already know all the stories, secrets, etc.

# Legend of Hondo

Legend of Hondo is a personal project I am working on to create a pirate themed, single player, Star Wars experience using the SWGEmu server and the Star Wars Galaxies game client. I am creating this entirely *for something to do, because I want to*, for my own enjoyment and, that's it. I am sharing it on GitHub as a modification reference for other folks who are hosting SWGEmu servers. I don't really expect anyone else to download and play Legend of Hondo, but anything is possible! :)

I started working on the project in 2014 and I have restarted a couple of times since, for various reasons. I have renamed the previous version (2015-2016) *Legend of Hondo Classic* and have retired it. The current version you are looking at is now the last version of Legend of Hondo there will ever be and with that in mind... 

Due to the manner in which the SWGEmu project is managed, I have decided it's a better use of my time to lock the version of SWGEmu and their Public Engine that Legend of Hondo is based on; It's just not worth my time to constantly revisit content that I have already completed to make it compatible with newer versions of SWGEmu and/or Public Engine. Here are the final commits I have taken from their repos that everything I make from here on in will be compatible with:

**SWGEmu:**  
Commit e46141674fc7d0f987dc4c58be19daaebb1a8d34  
Date: Thu Oct 6 04:01:28 2016  


**Public Engine**  
Commit 6ce011c3b0075f6918a0fd8f46b992568e1ae471  
Date: Fri Sep 30 19:11:00 2016 -0400  


If you encounter issues using Legend of Hondo mods on your own server, it's up to you to uncover the root cause and solve the compatibility issues. May the Force be with you!


## Development Status
**Current Stage:** Playable as a solo RPG  
**Next Stage:** New game play systems, such as NPC Merchants, out door decorations, and other general game play systems.  
**Beyond:** Pirate quests and missions to level up to Aspiring Pirate. Then smuggling missions, the 8 underworld "themeparks", the business systems, and so on...

I'm in no hurry to finish this project. A big part of the fun for me is making the stuff, from quirky quest dialog to the geeky system stuff. However, eventually the day will come where Legend of Hondo will go from being "SWG on Crack" to being a its own unique, complete, single player RPG.

Checkout my doc/ToDoList.md for an a list of things I'll most likely put into the game. 

## Project Management
Unlike a normal game or project, such as my web browser based game, RocketTux, Legend of Hondo needs requires a SWGEmu server and that server itself requires a whole whack of other stuff to be installed and configured for it to work (along with a valid retail copy of Star Wars Galaxies itself). Sure, most projects have dependencies, but SWGEmu takes it to a whole other level of complexity, to the point where no "normal person" would be bothered to jump through all the hoops required to set one up. With that in mind, the likelihood of anyone else ever playing Legend of Hondo is, well, probably *no likelihood at all* lol... However, if you'd like to take a crack at it, here is some helpful information for you...

## How-To Use This Stuff
In the simplest of terms, Legend of Hondo is just a bunch of server code and client file mods. As such, you can just poke around the documentation and commit logs to see if there is something in here that you like. If so, go ahead and use it in your own projects, by creating a patch file of a commit or by manually using a merge tool such as Meld, etc.

If you'd really like to directly play the version of SWG that I am creating, then my suggestion is to setup up a new virtual machine environment for a SWGEmu server, and simply replace your MMOCoreORB/bin/conf/ , MMOCoreORB/bin/scripts/ , MMOCoreORB/src/, and PublicEngine directories with the ones from this project. That way you can get all the other shazbot that a SWGEmu server requires installed and tested as normal. After the server is setup, you'll need to pack my tre_required/ and tre_optional/ directories into tre files, then add tre_required.tre to both your client and your server and add tre_optional.tre to just your client. Compile the server with the LoH mods, start the server, load the client, enjoy!

Here are some guides / tools for setting up a SWGEmu server,

My Debian 8 server step by step walk-through:  
- This is what I use for LoH development, so I *know* it works.
https://tatwi.wordpress.com/2016/10/01/swgemu-a-verbose-server-setup-guide-for-debian-linux/

ZonamaDev by Lord Kator (Curent):  
https://github.com/lordkator/ZonamaDev

Generic Linux by Aso, Scurby, Lord Kator:  
https://github.com/Scurby/Testing

Debian 7 by Scurby (Outdated):  
https://github.com/Scurby/deb7

Cent OS 7 By Aso:  
http://www.swgemu.com/forums/showthread.php?t=184585

Cent OS 6 by Aso (very good guide):  
http://www.swgemu.com/forums/showthread.php?t=161787


#### doc/
My documentation, including feature logs, "How-Tos", other guides, and so on. Each major update to the repo is called a "feature" and has a verbose log in doc/features/feature-name.md, complete with a list of all files that were changed. This documentation, along with a reasonably clean commit history, should help you find the droids you're looking for.

#### MMOCoreORB/bin/conf/
This is a full copy of my server configuration files. They're helpful to share as a reference.

#### MMOCoreORB/bin/scripts/
Here you'll find a full copy of the SWGEmu lua scripts, including ones that I have added or modified.

#### MMOCoreORB/src/
This is the full set of "Core3" server C++ files that make up the majority of the "user experience creation system", for lack of a better explanation. Some mods can be done in the Lua scripts, others must be done here in the C++.

#### tre_required/
An uncompressed, easy to browse version of my "tre file" mods that are required for the system to work properly.

#### tre_optional/
An uncompressed, easy to browse version of my "client side mods", which are important for delivering the "feeling" of Legend of Hondo. These files aren't really optional. 

## Summary
Legend of Hondo is a personal, open source, free (as in beer!), development project. When I am finished, the sum of its parts will be a single player pirate adventure, based on SWGEmu and Star Wars Galaxies.

You are welcome to use any code, concepts, and documentation within this repository, however you do so entirely at your own risk, in accordance with the following guidelines:

R. Bassett Jr. (Tatwi) and SWGEmu disclaim all warranties of any kind, either express or implied, as to the software provided in this repository, including, but not limited to, implied warranties of fitness for a particular purpose, or non‐infringement of proprietary rights. Neither this agreement nor any documentation furnished under it is intended to express or imply any warranty that the operation of the software will be uninterrupted, timely, or error‐free.

Under no circumstances shall R. Bassett Jr. (Tatwi) or SWGEmu be liable to any user for direct, indirect, incidental, consequential, special, or exemplary damages, arising from or relating to this agreement, the software, or userʹs use or misuse of the software. Such limitation of liability shall apply whether the damages arise from the use or misuse of the software (including such damages incurred by third parties).

Information provided in this repository is done so "As-Is" and is not promised or guaranteed to be correct, current, or complete, and may be out of date and may contain technical inaccuracies or typographical errors. Any reliance on the material in this repository is at your own risk. R. Bassett Jr. (Tatwi) and SWGEmu assume no responsibility (and expressly disclaim responsibility) for keeping information current or to ensure the accuracy or completeness of any information provided. Accordingly, you should confirm the accuracy and completeness of all information provided in this repository before making any decision related to using any part of it.

By using any software, files, or concepts provided in this repository, you waive the right to SWGEmu game client support from SWGEmu and you acknowledge and accept that you will not receive support from R. Bassett Jr (Tatwi) of any kind.

#### Legend of Hondo is not supported or endorsed by SWGEmu.

GNU AFFERO GENERAL PUBLIC LICENSE
Version 3, 19 November 2007
See the LICENSE file for copying / copyright details.
