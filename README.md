#Legend of Hondo

Legend of Hondo is a personal project I am working on to create a pirate themed, single player, Star Wars experience using the SWGEmu server and the Star Wars Galaxies game client. I am creating this entirely *for something to do, because I want to*, for my own enjoyment and, that's it. I am sharing it on GitHub as a modification reference for other folks who are hosting SWGEmu servers.

Unlike my previous version of this project, which I have renamed *Legend of Hondo Classic*, my goal this time around isn't to slam together a game that plays the way I want, as quickly as possible. Rather, I have decided to build Legend of Hondo in such a way that it *should* always work with the latest SWGEmu code base, with an emphasis on *adding things* as apposed to modifying things, as much as possible. This makes more sense for me, because it will be easier to take advantage of improvements to SWGEmu, as well as making it easier to understand how the system works as a whole. Also, in the process of making Legend of Hondo Classic, I discovered that I am quite content to spend my time "building the system" rather than *actually playing the game*, but I'm sure I'll get around to playing it eventually. :)

So with that in mind, here some details about Legend of Hondo as development project.

##Development Status
**Version:** *Pretty much still SWG*
**Currently:** *Creating tools and fundamental game play systems*

Given that I have already accomplished a lot of the mod type stuff in Legend of Hondo Classic, at this point I am going to focus on creating tools and content that will be in addition to normal Star Wars Galaxies. All of the additional stuff will be compatible with default SWG, so it makes sense for me to work on that stuff first. That way when I get around to putting in the content that requires heavy modifications to the server code, hopefully there won't be any major changes to code base between then and SWGEmu's 1.0 release - the less for me to fix later, the better!

Some of the things I will be working in 2016 are the Pirate Mission System (which includes Smuggler, Bounty Hunter, Commando, and resource related content), the Pirate Renown/Infamy System, an improved Merchant System, a "Living World" system that makes cities seem alive (by adding characters who actually *do stuff* rather than just stand around 24/7/365...), a self contained system that allows players to decorate outside within city limits, and other systems that add new game play elements to the game. Much of the content that I will add later can already be found in the LoH_Features_Log of my Legend of Hondo Classic project, because I have already created it in that project. Some of those mods are, Loot While Crafting, Wilderness Survival XP for doing scout and ranger stuff, selling crafted items to junk dealers, building any house in Mos Espa, and so on - quite a lot of "so on"!

I'm in no hurry to finish this project. A big part of the fun for me is making the stuff, from quirky quest dialog to the geeky system stuff. However, eventually the day will come where Legend of Hondo will go from being "SWG on Crack" to being a its own unique, complete, single player RPG.

##Project Management
Unlike a normal game or project, such as my Loop Dipole and the Chaoties game, a SWGEmu server requires a whole whack of other stuff to be installed and configured for it to work (along with a valid retail copy of Star Wars Galaxies itself). Sure, most projects have dependencies, but SWGEmu takes it to a whole other level of complexity, to the point where no "normal person" would be bothered to jump through all the hoops required to set one up. With that in mind, the likelihood of anyone else ever playing Legend of Hondo is, well, probably *no likelihood at all* lol...

So, I decided that the best to share Legend of Hondo would be as a mod repository and guide resource for folks who are programming their own SWGEmu servers. Therefore, what you'll find here is not a fork of the whole SWGEmu server project, but a copy of the source files and additional files required to make the mods.

My mods are tested against the "unstable" branch (on a reasonably regular basis) to ensure that they work with the current SWGEmu project. If you encounter incompatibility issues (*not merge conflicts*, but syntax errors or outdated dependencies that are causing problems), you're welcome to email me about them or note them using the Github tools.

####doc/
My documentation, including feature logs, "How-Tos", other guides, and so on. Each major update to the repo is called a "feature" and has a verbose log in doc/features/feature-name.md, complete with a list of all files that were changed. This documentation, along with a reasonably clean commit history, should help you find the droids you're looking for.

####MMOCoreORB/bin/conf/
This is a full copy of my server configuration files. They're helpful to share as a reference.

####MMOCoreORB/bin/scripts/
Here you'll find a full copy of the SWGEmu lua scripts, including ones that I have added or modified.

####MMOCoreORB/src/
This is the full set of "Core3" server C++ files that make up the majority of the "user experience creation system", for lack of a better explanation. Some mods can be done in the Lua scripts, others must be done here in the C++.

####tre_required/
An uncompressed, easy to browse version of my "tre file" mods that are required for the system to work properly.

####tre_optional/
An uncompressed, easy to browse version of my "client side mods", which are important for delivering the "feeling" of Legend of Hondo, but they are ultimately optional content.


##How-To Use This Stuff
In the simplest of terms, Legend of Hondo is just a bunch of server code and client file mods. As such, you can just poke around the documentation and commit logs to see if there is something in here that you like. If so, go ahead and use it in your own projects, by creating a patch file of a commit or by manually using a merge tool such as Meld, etc.

If you'd really like to directly play the version of SWG that I am creating, then my suggestion is to setup up a new virtual machine environment for a SWGEmu server, and simply replace my MMOCoreORB/bin/conf/ , MMOCoreORB/bin/scripts/ , and MMOCoreORB/src/ with those created by your VM setup process. That way you can get all the other shazbot that a SWGEmu server requires installed and tested as normal. After the server is setup, you'll need to pack my tre_required/ and tre_optional/ directories into tre files, then add tre_required.tre to both your client and your server and add tre_optional.tre to just your client. Compile the server with the LoH mods, start the server, load the client, enjoy!

Here are some guides / tools for setting up a SWGEmu server,

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


##Summary
Legend of Hondo is a personal, open source, free (as in beer!), development project. When I am finished, the sum of its parts will be a single player pirate adventure, based on SWGEmu and Star Wars Galaxies.

You are welcome to use any code, concepts, and documentation within this repository, however you do so entirely at your own risk, in accordance with the following guidelines:

R. Bassett Jr. (Tatwi) and SWGEmu disclaim all warranties of any kind, either express or implied, as to the software provided in this repository, including, but not limited to, implied warranties of fitness for a particular purpose, or non‐infringement of proprietary rights. Neither this agreement nor any documentation furnished under it is intended to express or imply any warranty that the operation of the software will be uninterrupted, timely, or error‐free.

Under no circumstances shall R. Bassett Jr. (Tatwi) or SWGEmu be liable to any user for direct, indirect, incidental, consequential, special, or exemplary damages, arising from or relating to this agreement, the software, or userʹs use or misuse of the software. Such limitation of liability shall apply whether the damages arise from the use or misuse of the software (including such damages incurred by third parties).

Information provided in this repository is done so "As-Is" and is not promised or guaranteed to be correct, current, or complete, and may be out of date and may contain technical inaccuracies or typographical errors. Any reliance on the material in this repository is at your own risk. R. Bassett Jr. (Tatwi) and SWGEmu assume no responsibility (and expressly disclaim responsibility) for keeping information current or to ensure the accuracy or completeness of any information provided. Accordingly, you should confirm the accuracy and completeness of all information provided in this repository before making any decision related to using any part of it.

By using any software, files, or concepts provided in this repository, you waive the right to SWGEmu game client support from SWGEmu and you acknowledge and accept that you will not receive support from R. Bassett Jr (Tatwi) of any kind.

####Legend of Hondo is not supported or endorsed by SWGEmu.

GNU AFFERO GENERAL PUBLIC LICENSE
Version 3, 19 November 2007
See the LICENSE file for copying / copyright details.
