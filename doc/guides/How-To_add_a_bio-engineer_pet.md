### How I Added Some Pets to Legend of Hondo
This is summary of the process I followed, which involves a lot of files, but is not really hard to do once you know what to put where.

#### Using an Existing Creature Handler Pet
New Server Files:  
- MMOCoreORB/bin/scripts/mobile/pet/purbole_be.lua
- MMOCoreORB/bin/scripts/object/draft_schematic/bio_engineer/creature/creature_purbole.lua
- MMOCoreORB/bin/scripts/object/tangible/deed/pet_deed/purbole_deed.lua
- MMOCoreORB/bin/scripts/object/tangible/loot/loot_schematic/be_purbole_schematic.lua
Edited Server Files:  
- MMOCoreORB/bin/scripts/managers/crafting/schematics.lua
- MMOCoreORB/bin/scripts/mobile/pet/serverobjects.lua
- MMOCoreORB/bin/scripts/object/draft_schematic/bio_engineer/creature/objects.lua
- MMOCoreORB/bin/scripts/object/draft_schematic/bio_engineer/creature/serverobjects.lua
- MMOCoreORB/bin/scripts/object/tangible/deed/pet_deed/objects.lua
- MMOCoreORB/bin/scripts/object/tangible/deed/pet_deed/serverobjects.lua
- MMOCoreORB/bin/scripts/object/tangible/loot/loot_schematic/objects.lua
- MMOCoreORB/bin/scripts/object/tangible/loot/loot_schematic/serverobjects.lua
New TRE Files:  
- tre_required/object/draft_schematic/bio_engineer/creature/shared_creature_purbole.iff
- tre_required/object/tangible/deed/pet_deed/shared_purbole_deed.iff
- tre_required/object/tangible/loot/loot_schematic/shared_be_purbole_schematic.iff
Edited TRE Files:  
- tre_required/misc/object_template_crc_string_table.iff
- tre_required/string/en/craft_item_ingredients_d.stf
- tre_required/string/en/pet_deed.stf

#### File Chains
- This is order in which the game uses the TRE files.
- Loot Schematic > Draft Schematic > Pet Deed > Mobile Template & Control Device Template
- Mobile Template > object/mobile/purbole_hue.iff > appearance/purbole_hue.sat > textures, etc.
- Control Device Template, used as thing you see in the Datapad, same chain as Mobile Template
- Each TRE file also calls string files for names and base class files for its object type. 

#### Notes
- Use Sytner's IFF Editor to edit TRE files.
- New TRE files are a copy/paste/edit of existing files of the same type.
- Edited server files are just to "register" the new files in the system.
- craft_item_ingredients_d.stf I added a generic description for Bio-Engineered pet deeds, because normal pet deed names only have the name of the creature as a description (which isn't particularly helpful). 
- The TRE files are required, else the items won't show up on the client.
- The 3D model appearance for the loot schematic is a book. I just changed the appearance line in the TRE file to make that happen.


#### Using an Existing Creature
- All the files above, plus the following files.
New TRE Files  
- tre_required/object/intangible/pet/purbole_hue.iff 
- This is for the controlDeviceObjectTemplate in pet_deed, which is used as the datapad object. It may already exist for some creatures even though they aren't pets.
New Server Files
- MMOCoreORB/bin/scripts/mobile/pet/purbole_be.lua
- MMOCoreORB/bin/scripts/object/intangible/pet/purbole_hue.lua
Edited Server Files:  
- MMOCoreORB/bin/scripts/mobile/pet/serverobjects.lua
- MMOCoreORB/bin/scripts/object/intangible/pet/objects.lua
- MMOCoreORB/bin/scripts/object/intangible/pet/serverobjects.lua

#### Notes
- Some creatures do not have an appearance/purbole_hue.sat file for their appearance. I have not tried using of these creatures as a Bio-Engineer pet, so I can't say off hand if they would work in the crafting process (without the color pallet selection info). 
