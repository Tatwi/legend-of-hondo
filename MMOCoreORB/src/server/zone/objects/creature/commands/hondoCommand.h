/*
				Copyright R. Bassett Jr.
		See file COPYING for copying conditions.*/

#ifndef HONDOCOMMAND_H_
#define HONDOCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class HondoCommand : public QueueCommand {
public:

	HondoCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature())
			return GENERALERROR;
				
		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (ghost == NULL)
			return GENERALERROR;
		
		int adminLevelCheck = ghost->getAdminLevel();

		ResourceManager* resMan = creature->getZoneServer()->getResourceManager();

		Locker locker(resMan);

		StringTokenizer args(arguments.toString());

		try {
			String command;

			if(args.hasMoreTokens()){
				args.getStringToken(command);

				if(command == "admin") {
					if (adminLevelCheck != 15){
						creature->sendSystemMessage("Sorry, /hondo admin commands require administrator privileges.");
						return GENERALERROR;
					}

					String adminCommand;
					
					if(args.hasMoreTokens()){
						args.getStringToken(adminCommand);
						adminCommand = adminCommand.toLowerCase();

						if (target == 0 && (adminCommand == "spoutmobile" || adminCommand == "spoutobject" || adminCommand == "spoutstatic")){
							creature->sendSystemMessage("Target required for /hondo admin spoutMobile, spoutObject, spoutStatic");
							return GENERALERROR;
						}

						ManagedReference<SceneObject*> object = server->getZoneServer()->getObject(target, false);

						if(adminCommand == "spoutmobile") {
							if(!object->isCreatureObject()){
							   creature->sendSystemMessage("Target must be a creature for: /hondo admin spoutMobile [file_name]");
							   return GENERALERROR;
							}
							
							String templateFile = object->getObjectTemplate()->getFullTemplateString();

							if (templateFile.contains("junk") || templateFile.contains("vehicle") || templateFile.contains("vendor")){ 
							   creature->sendSystemMessage("Sorry, /hondo admin spoutMobile: " + templateFile);
							   return GENERALERROR; // Beause they crash the server if we try to use them as an AI agent when getting the mob name.
							}
							spout(creature, &args, formatSpoutText(creature, target, 1));
						} else if(adminCommand == "spoutobject") {
							if(object->isCreatureObject()){
							   creature->sendSystemMessage("Target must be a tangible or static object for: /hondo admin spoutObject [file_name]");
							   return GENERALERROR;
							}				
							spout(creature, &args, formatSpoutText(creature, target, 2));
						} else if(adminCommand == "spoutstatic") {
							if(object->isCreatureObject()){
							   creature->sendSystemMessage("Target must be a tangible or static object for: /hondo admin spoutObject [file_name]");
							   return GENERALERROR;
							}
							spout(creature, &args, formatSpoutText(creature, target, 3));
						} else if(adminCommand == "spoutonme") {
							spout(creature, &args, formatSpoutText(creature, target, 4));
						} else if(adminCommand == "spoutroom") {
							spout(creature, &args, formatSpoutTextMulti(creature, 1));
						} else if(adminCommand == "spoutbuilding") {
							spout(creature, &args, formatSpoutTextMulti(creature, 0));
						} else if(adminCommand == "decor") {
							decor(creature);
						} else if(adminCommand == "placestructure") {
							hondoPlaceStructure(creature);
						} else if(adminCommand == "showruler") {
							showRuler(creature);
						}else if(adminCommand == "getbuildinginfo") {
							getBuildingInfo(creature, &args);
						}  else {
							throw Exception(); // Used: /hondo admin <wrong>
						}	
					} else {
						throw Exception(); // Used: /hondo admin <blank>
					}
				} else if(command == "aboutme") {
					aboutMe(creature);
				} else if(command == "rotate") {
					rotate(creature, target, adminLevelCheck, &args);
				} else if(command == "move") {
					move(creature, target, adminLevelCheck, &args);
				} else if(command == "help") {
					StringBuffer text;

					text << endl;
					text << "- - - - - - - - - - - - - - - - - - -" << endl;
					text << "Legend of Hondo: The Command" << endl;
					text << "- - - - - - - - - - - - - - - - - - -" << endl;
					text << "/hondo aboutMe"  << endl;
					text << "- Displays helpful information about your buildings, vendors, and account." << endl;
					text << "/hondo rotate <left right yaw pitch roll reset> [number]" << endl;
					text << "- Rotate an object. If the above directions fail, try yxx pxx rxx instead." << endl;
					text << "/hondo move <forward back up down> [number]" << endl;
					text << "- Move a decorative object that is outside in Mos Espa." << endl;

					if (adminLevelCheck == 15){
						text << endl;
						text << "- - - - - - - - - - - - - - - - - - -" << endl;
						text << "Admin syntax: /hondo admin <option> [params]" << endl;
						text << "- - - - - - - - - - - - - - - - - - -" << endl;
						text << "/hondo admin decor" << endl;
						text << "- Opens a list of decorative items that may be used anywhere." << endl;
						text << "/hondo admin placeStructure" << endl;
						text << "- Opens a window that alows you to place a listed structure as a player structure." << endl;
						text << "/hondo admin showRuler" << endl;
						text << "- Displays a green line to help visualize structure alignment." << endl;
						text << "/hondo admin getBuildingInfo [optional: log]" << endl;
						text << "- Emails you content creation related info about the building you are standing in. Use log at the end to add the output to bin/custom_scripts/spout/building_info_log.lua." << endl;
						text << endl;
						text << "- - - - - - - - - - - - - - - - - - -" << endl;
						text << "Screenplay Builder Commands:" << endl;
						text << "Writes screenplay calls in bin/custom_scripts/spout/file_name.lua on the server." << endl;
						text << "- - - - - - - - - - - - - - - - - - -" << endl;
						text << "/hondo admin spoutMobile [file_name]" << endl;
						text << "- spawnMobile for the targeted creature."  << endl;
						text << "/hondo admin spoutOnme [file_name]"  << endl;
						text << "- spawnMobile based on where you are standing and facing. Default mobile type: commoner."  << endl;
						text << "/hondo admin spoutObject [file_name]"  << endl;
						text << "- spawnSceneObject for the targeted object."  << endl;
						text << "/hondo admin spoutStatic [file_name]"  << endl;
						text << "- spawnSceneObject for the static version of a LoH specific outdoor decor items."  << endl;
						text << "/hondo admin spoutRoom [file_name]"  << endl;
						text << "- spawnSceneObject for all decorations in the room (cell) you are standing in. Layout iff loaded items excluded."  << endl;
						text << "/hondo admin spoutBuilding [file_name]"  << endl;
						text << "- spawnSceneObject for all decorations in the whole building you are standing in. Layout iff loaded items excluded."  << endl;
					}
					creature->sendSystemMessage(text.toString());
				} else {
					throw Exception(); // Used: /hondo <wrong>
				}
			} else {
				throw Exception();
			}	
		} catch (Exception& e){
			creature->sendSystemMessage("Invalid arguments for hondo command. Help: /hondo help");
		}

		return SUCCESS;
	}
	
	/* Legend of Hondo
	 * Helpful Admin Commands
	 */

	String formatSpoutText(CreatureObject* creature, const uint64& target, int textType) const {
		ManagedReference<SceneObject*> object = server->getZoneServer()->getObject(target, false);

		String planetName = "";
		String templateFile = "";
		
		if (object == NULL){
			planetName = creature->getZone()->getZoneName();
		} else {
			planetName = object->getZone()->getZoneName();
			templateFile = object->getObjectTemplate()->getFullTemplateString();
		}

		StringBuffer text;
		
		if (textType == 1){
			int angle = object->getDirectionAngle();

			AiAgent* mob = object.castTo<AiAgent*> ();
			CreatureTemplate* creatureTemplate = mob->getCreatureTemplate();
			String mobileName = creatureTemplate->getTemplateName();

			text << "spawnMobile(\"" << planetName << "\", " <<  "\"" << mobileName << "\", 1, ";
		
			if (object->getParent() != NULL && object->getParent().get()->isCellObject()) {
				// Inside
				ManagedReference<CellObject*> cell = cast<CellObject*>( object->getParent().get().get());
				Vector3 cellPosition = object->getPosition();

				text << cellPosition.getX() << ", " << cellPosition.getZ() << ", " << cellPosition.getY() << ", " << angle << ", " << cell->getObjectID() << ")";
			}else {
				// Outside
				Vector3 worldPosition = object->getWorldPosition();
				
				text << worldPosition.getX() << ", " << worldPosition.getZ() << ", " << worldPosition.getY() << ", " << angle << ", " << "0" << ")";
			}
			// Returning: spawnMobile("planet", "mobileTemplate", 1, x, z, y, heading, cellid)
		} else if (textType == 2){
			text << "spawnSceneObject(\"" << planetName << "\", \"" << templateFile << "\", ";
		
			if (object->getParent() != NULL && object->getParent().get()->isCellObject()) {
				// Inside
				ManagedReference<CellObject*> cell = cast<CellObject*>( object->getParent().get().get());
				Vector3 cellPosition = object->getPosition();

				text << cellPosition.getX() << ", " << cellPosition.getZ() << ", " << cellPosition.getY() << ", " << cell->getObjectID() << ", ";
			}else {
				// Outside
				Vector3 worldPosition = object->getWorldPosition();
				text << worldPosition.getX() << ", " << worldPosition.getZ() << ", " << worldPosition.getY() << ", " << "0" << ", ";
			}
			
			Quaternion* dir = object->getDirection();
			text << dir->getW() << ", " << dir->getX() << ", " << dir->getY() << ", " << dir->getZ() << ")";
			// Returning: spawnSceneObject("planet", "objectTemplateFilePathAndName", x, z, y, cellNumber, dw, dx, dy, dz> 
		} else if (textType == 3){
			if (!templateFile.contains("hondo/decoration")){
				creature->sendSystemMessage("Error: Target object must be a decendant of object/tangible/hondo/decoration/");
				throw Exception();
			}
			
			// Examples:
			// object/tangible/hondo/decoration/building/tatooine/filler_building_tatt_style01_01.lua
			// object/tangible/hondo/decoration/structure/tatooine/antenna_tatt_style_2.lua
			// get changed to
			// object/building/tatooine/filler_building_tatt_style01_01.lua
			// object/static/structure/tatooine/antenna_tatt_style_2.iff
			
			if (templateFile.contains("decoration/building")){
				templateFile = templateFile.replaceAll("tangible/hondo/decoration/", ""); // Fix path for filler type buildings
			} else {
				templateFile = templateFile.replaceAll("tangible/hondo/decoration", "static"); // Fix path for static objects
			}
			
			text << "spawnSceneObject(\"" << planetName << "\", \"" << templateFile << "\", ";
			
			if (object->getParent() != NULL && object->getParent().get()->isCellObject()) {
				// Inside
				ManagedReference<CellObject*> cell = cast<CellObject*>( object->getParent().get().get());
				Vector3 cellPosition = object->getPosition();

				text << cellPosition.getX() << ", " << cellPosition.getZ() << ", " << cellPosition.getY() << ", " << cell->getObjectID() << ", ";
			}else {
				// Outside
				Vector3 worldPosition = object->getWorldPosition();
				text << worldPosition.getX() << ", " << worldPosition.getZ() << ", " << worldPosition.getY() << ", " << "0" << ", ";
			}
			
			Quaternion* dir = object->getDirection();
			
			text << dir->getW() << ", " << dir->getX() << ", " << dir->getY() << ", " << dir->getZ() << ")";
			
			// Returning: spawnSceneObject("planet", "staticObjectTemplateFilePathAndName", x, z, y, cellNumber, dw, dx, dy, dz> 
		} else if (textType == 4){
			int angle = creature->getDirectionAngle();
			
			text << "spawnMobile(\"" << planetName << "\", " <<  "\"commoner" << "\", 1, ";
                
			if (creature->getParent() != NULL && creature->getParent().get()->isCellObject()) {
				// Inside
				ManagedReference<CellObject*> cell = cast<CellObject*>( creature->getParent().get().get());
				Vector3 cellPosition = creature->getPosition();

				text << cellPosition.getX() << ", " << cellPosition.getZ() << ", " << cellPosition.getY() << ", " << angle << ", " << cell->getObjectID() << ")";
			}else {
				// Outside
				Vector3 worldPosition = creature->getWorldPosition();
				
				text << worldPosition.getX() << ", " << worldPosition.getZ() << ", " << worldPosition.getY() << ", " << angle << ", " << "0" << ")";
			}
			// Returning: spawnMobile("planet", "commoner", 1, x, z, y, heading, cellid)
		}

		return text.toString();
	}

	// Format screenplay text for all items in a room or the whole building
	String formatSpoutTextMulti(CreatureObject* creature, int roomOnly) const {
		if (creature->getParent() == NULL){
			creature->sendSystemMessage("You need to be inside a building to output info about the decorations in it.");
			throw Exception(); 
		}

		ManagedReference<SceneObject*> parent = creature->getParent();
		
		if (parent == NULL)
			throw Exception();

		String planetName = creature->getZone()->getZoneName();
		String templateFile = "";

		ManagedReference<SceneObject*> building;
		building = parent->getParent();
		BuildingObject* buildingObject = building.castTo<BuildingObject*>();
		
		StringBuffer text;

		text << "-- " << building->getObjectNameStringIdName() << " world position: " << building->getPositionX() << " " << building->getPositionY() << endl;

		uint32 numOfCells = buildingObject->getTotalCellNumber();

		if (roomOnly == 1)
			numOfCells = 1;

		CellObject* cell = NULL;

		for (uint32 i = 1; i <= numOfCells; ++i) {
			if (roomOnly == 1){
				cell = parent.castTo<CellObject*>();
			} else {
				cell = buildingObject->getCell(i);
			}

			uint32 items = cell->getContainerObjectsSize();

			if (items > 0)
				text << "-- Room " << cell->getCellNumber() << ": " << endl;

			for (int j = 0; j < items; ++j) {
				ReadLocker rlocker(cell->getContainerLock());
				
				ManagedReference<SceneObject*> childObject = cell->getContainerObject(j);

				rlocker.release();

				templateFile = childObject->getObjectTemplate()->getFullTemplateString();
				
				if (!childObject->isCreatureObject() && !childObject->isVendor() && !templateFile.contains("terminal_player_structure")) {
					if (creature->getParent().get()->getParent().get() == childObject->getParent().get()->getParent().get()) {
						Vector3 cellPosition = childObject->getPosition();
						Quaternion* dir = childObject->getDirection();

						text << "spawnSceneObject(\"" << planetName << "\", \"" << templateFile << "\", ";
						text << cellPosition.getX() << ", " << cellPosition.getZ() << ", " << cellPosition.getY() << ", " << cell->getObjectID() << ", ";
						text << dir->getW() << ", " << dir->getX() << ", " << dir->getY() << ", " << dir->getZ() << ")" << endl;
					}
				}
			}
		}
		return text.toString();
	}
	

	// Ouput screenplay formated code to a file on the server
	void spout(CreatureObject* creature, StringTokenizer* args, String outputText) const {
		if(creature->getZoneServer() == NULL)
			return;

		String fileName = "";
		if(args->hasMoreTokens())
			args->getStringToken(fileName);

		if(fileName.isEmpty())
			throw Exception();

		File* file = new File("custom_scripts/spout/" + fileName + ".lua");
		FileWriter* writer = new FileWriter(file, true); // true for appending new lines

		writer->writeLine(outputText);

		writer->close();
		delete file;
		delete writer;
		
		creature->sendSystemMessage("Data written to bin/custom_scripts/spout/" + fileName + ".lua!");
	}

	/* Legend of Hondo
	 * Helpful Player Commands
	 */

	// Opens a window with some helpful information for the player.
	void aboutMe(CreatureObject* creature) const {
		if(creature->getZoneServer() == NULL)
			return;
			
		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
		ManagedReference<AuctionManager*> auctionManager = server->getZoneServer()->getAuctionManager();

		if (ghost == NULL || auctionManager == NULL)
			return;

		ManagedReference<AuctionsMap*> auctionsMap = auctionManager->getAuctionMap();
		if(auctionsMap == NULL)
			return;

		PlayerManager* playerManager = server->getZoneServer()->getPlayerManager();

		if(playerManager == NULL)
			return;
			
		int lotsRemaining = ghost->getLotsRemaining();


		StringBuffer body;

		body << "Player Name: " << creature->getFirstName() << endl;
		body << "Unused Lots: " << String::valueOf(lotsRemaining) << endl << endl;
		body << "Structures:";

		for (int i = 0; i < ghost->getTotalOwnedStructureCount(); i++) {
			ManagedReference<StructureObject*> structure = creature->getZoneServer()->getObject(ghost->getOwnedStructure(i)).castTo<StructureObject*>();

			int num = i + 1;
			body << endl << String::valueOf(num) << ". ";

			if (structure == NULL) {
				body << "NULL Structure" << endl;
				continue;
			}

			body << "Name: " << structure->getCustomObjectName().toString() << endl;
			body << "    Type: " << structure->getObjectNameStringIdName() << endl;
			body << "    Lots: " << String::valueOf(structure->getLotSize()) << endl;
			body << "    Maintenance Pool: " << String::valueOf(structure->getSurplusMaintenance()) << " credits" << endl;
			body << "    Maintenance Rate: " << String::valueOf(structure->getMaintenanceRate()) << " credits/hr" << endl;
			
			if (structure->getBasePowerRate() > 0) {
				body << "    Power Reserves: " << String::valueOf(structure->getSurplusPower()) << " units" << endl;
				body << "    Power Consumption: " << String::valueOf(structure->getBasePowerRate()) << " units/hr" << endl;	
			}

			body << "    Planet: ";
			Zone* zone = structure->getZone();
			if (zone == NULL) {
				body << "NULL" << endl;
			} else {
				body << zone->getZoneName() << endl;
				body << "    World Position: " << structure->getWorldPositionX() << ", " << structure->getWorldPositionY() << endl;
			}
			body << endl;
		}
		body << " - - - - - - - " << endl;
		body << endl;
		body << "Vendors:" << endl;
		body << "Max # of vendors: " << creature->getSkillMod("manage_vendor") << endl;
		body << "Max # of items: " << creature->getSkillMod("vendor_item_limit") << endl;
		body << "Total # of items: " << auctionsMap->getPlayerItemCount(creature) << endl;
		body << endl;
		
		SortedVector<unsigned long long>* ownedVendors = ghost->getOwnedVendors();
		for (int i = 0; i < ownedVendors->size(); i++) {
			ManagedReference<SceneObject*> vendor = creature->getZoneServer()->getObject(ownedVendors->elementAt(i));

			int num = i + 1;
			body << String::valueOf(num) << ". ";

			if (vendor == NULL) {
				body << "NULL Vendor" << endl << endl;
				continue;
			}

			body << vendor->getDisplayedName() << endl;

			DataObjectComponentReference* data = vendor->getDataObjectComponent();
			if(data == NULL || data->get() == NULL || !data->get()->isVendorData()) {
				body << "    NULL Data Component" << endl << endl;
				continue;
			}

			VendorDataComponent* vendorData = cast<VendorDataComponent*>(data->get());
			if(vendorData == NULL) {
				body << "    NULL Vendor Data Component" << endl << endl;
				continue;
			}

			bool init = false;
			if (vendorData->isInitialized())
				init = true;

			body << "    Initialized? " << (init ? "Yes" : "No");
			body << endl << "    # of items: " << auctionsMap->getVendorItemCount(vendor) << endl;
			
			float secsRemaining = 0.f;
			if( vendorData->getMaint() > 0 ){
				secsRemaining = (vendorData->getMaint() / vendorData->getMaintenanceRate())*3600;
			}

			body << "    Maintenance Pool: " << String::valueOf(vendorData->getMaint()) << " credits " << endl;
			body << "    Maintenance Rate: " << String::valueOf((int)vendorData->getMaintenanceRate()) << " credits/hr" << endl;

			body << "    Planet: ";
			Zone* zone = vendor->getZone();
			if (zone == NULL){ 
				body << "NULL" << endl;
			} else if (!vendor->getParent().get()->isCellObject()) {
				body << zone->getZoneName() << endl;
				body << "    World Position: My Inventory" << endl;
			} else {
				body << zone->getZoneName() << endl;
				body << "    World Position: " << vendor->getWorldPositionX() << ", " << vendor->getWorldPositionY() << endl;
			}
			body << endl;
		}

		body << " - - - - - - - " << endl;
		body << endl;
		body << "Vetern Rewards Available:" << endl;

		for( int i = 0; i < playerManager->getNumVeteranRewardMilestones(); i++ ){
			int milestone = playerManager->getVeteranRewardMilestone(i);
			String claimedReward = ghost->getChosenVeteranReward(milestone);
			if( claimedReward.isEmpty() )
				body << String::valueOf(milestone) << " days";

			if (i+1 != playerManager->getNumVeteranRewardMilestones()){
				body << ", ";
			} else {
				body << ".";
			}
		}

		ManagedReference<Account*> account = ghost->getAccount();
			
		body << " I have " << account->getAgeInDays() << " days logged for veteran rewards.";

		// Wrap it up and send it off
		ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, 0);
		box->setPromptTitle("About Me");
		box->setPromptText(body.toString());
		box->setUsingObject(ghost);
		box->setForceCloseDisabled();

		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
		
	}

	// Opens a window that despenses special LoH decorations
	void decor(CreatureObject* creature) const {
		Lua* lua = DirectorManager::instance()->getLuaInstance();

		Reference<LuaFunction*> adminDecor = lua->createFunction("AdminDecor", "openWindow", 0);
		*adminDecor << creature;

		adminDecor->callFunction();
	}

	// Rules for player use of rotate and move
	// Allow Inside: rotate any non-creature object, if on admin list.
	// Allow Outside: rotate only LoH specific decor and only when it's in Mos Espa.
	void playerMoveRotateRules(CreatureObject* creature, SceneObject* object) const {
		ManagedReference<SceneObject*> objParent = object->getParent().get(); // Should be a CellObject or NULL if outside
			
		if (objParent) { // Inside
			ManagedReference<SceneObject*> objParentParent = objParent->getParent().get();

			if (objParentParent->isBuildingObject()){
				ManagedReference<BuildingObject*> building = cast<BuildingObject*>( objParentParent.get());

				//Is this player on the permission list?
				if (!building->isOnAdminList(creature)){
					creature->sendSystemMessage("@player_structure:must_be_admin"); //You must be a building admin to do that.
					throw Exception();
				}
			} else if (!objParentParent->isBuildingObject()){
				creature->sendSystemMessage("Error: Invalid location."); // Player is in a cell that is not inside a building - should not happen
				throw Exception();
			}
		} else { // Outside
			String templateFile = object->getObjectTemplate()->getFullTemplateString();
			
			if (!templateFile.contains("hondo/decoration")){
				creature->sendSystemMessage("Error: Invalid Target. Must be a Legend of Hondo exterior decoration.");
				throw Exception();
			}
			
			Zone* zone = object->getZone();
			PlanetManager* planetManager = zone->getPlanetManager();
			CityRegion* cityRegion = planetManager->getRegionAt(object->getWorldPositionX(), object->getWorldPositionY());
			String regionName = "";

			if (cityRegion != NULL)
				regionName = cityRegion->getRegionName();
			
			if (regionName != "@tatooine_region_names:mos_espa"){ 
				creature->sendSystemMessage("Error: Must be in Mos Espa to move/rotate exterior objects.");
				throw Exception();
			}
		}
	}

	// Rotate objects with Yaw, Pitch, Roll. Also allows admin to rotate most objects and players to rotate LoH decor outside in Mos Espa.
	void rotate(CreatureObject* creature, const uint64& target, int adminLevelCheck, StringTokenizer* args) const {
		ManagedReference<SceneObject*> object = server->getZoneServer()->getObject(target, false);
		
		if (object == NULL){
			creature->sendSystemMessage("Target required for /hondo rotate");
			throw Exception();
		}

		if (object->isCreatureObject()){
			creature->sendSystemMessage("Error: Invalid Target. Must not be a creature.");
			throw Exception();
		}

		if (adminLevelCheck < 15){
			playerMoveRotateRules(creature, object);
		}
		
		String possibleDirections = "left right yaw pitch roll reset yxx pxx rxx";
		String dir = "";
		String deg = "";
		int degrees = 0;
		
		if(args->hasMoreTokens()){
			args->getStringToken(dir);
			args->getStringToken(deg);
		}

		dir = dir.toLowerCase();

		if(!possibleDirections.contains(dir))
			throw Exception();

		if(deg.isEmpty())
			throw Exception();

		try {
			degrees = Integer::valueOf(deg);
		} catch (const Exception& e) {
			creature->sendSystemMessage("Error: /hondo rotate <direction> [number] was not provided a numerical value.");
		}
		
		// Setup rotation
        if (dir == "right"){
            object->rotate(-degrees);
        }
        else if (dir == "left"){
            object->rotate(degrees);
        }
        else if (dir == "yaw" || dir == "yxx"){
            object->rotate(degrees);
        }
        else if (dir == "pitch" || dir == "pxx"){
            object->rotateYaxis(degrees);
        }
        else if (dir == "roll" || dir == "rxx"){
            object->rotateXaxis(degrees);
        }
        else if (dir == "reset" || dir == "xresetx"){
            object->setDirection(1, 0, 0, 0);
        } else {
			creature->sendSystemMessage("Error: /hondo rotate command requires using the whole direction word.");
			throw Exception();
		}
    
        // Apply rotation
        object->incrementMovementCounter();
        if (object->getParent() != NULL)
			object->teleport(object->getPositionX(), object->getPositionZ(), object->getPositionY(), object->getParent().get()->getObjectID());
		else
			object->teleport(object->getPositionX(), object->getPositionZ(), object->getPositionY());
	}
	
	// Allows admin to move most objects and players to move LoH decor outside in Mos Espa.
	void move(CreatureObject* creature, const uint64& target, int adminLevelCheck, StringTokenizer* args) const {
		ManagedReference<SceneObject*> object = server->getZoneServer()->getObject(target, false);
		
		if (object == NULL){
			creature->sendSystemMessage("Target required for /hondo rotate");
			throw Exception();
		}

		if (object->isCreatureObject()){
			creature->sendSystemMessage("Error: Invalid Target. Must not be a creature.");
			throw Exception();
		}

		if (adminLevelCheck < 15){
			playerMoveRotateRules(creature, object);
		}
		
		String possibleDirections = "forward back up down";
		String dir = "";
		String dist = "";
		float distance = 0.0;
		
		if(args->hasMoreTokens()){
			args->getStringToken(dir);
			args->getStringToken(dist);
		}

		dir = dir.toLowerCase();

		if(!possibleDirections.contains(dir))
			throw Exception();

		if(dist.isEmpty())
			throw Exception();

		try {
			distance = Float::valueOf(dist);
		} catch (const Exception& e) {
			creature->sendSystemMessage("Error: /hondo move <direction> [number] was not provided a numerical value.");
		}

		if (distance < 1.f || distance > 500.f){
			creature->sendSystemMessage("@player_structure:movefurniture_params"); //The amount to move must be between 1 and 500.
			throw Exception(); 
		}
		
		float degrees = creature->getDirectionAngle();
		float radians = Math::deg2rad(degrees);

		distance /= 100.0f;

		float offsetX = distance * sin(radians);
		float offsetY = distance * cos(radians);

		float x = object->getPositionX();
		float y = object->getPositionY();
		float z = object->getPositionZ();

		if (dir == "forward") {
			x += (offsetX);
			y += (offsetY);
		} else if (dir == "back") {
			x -= (offsetX);
			y -= (offsetY);
		} else if (dir == "up") {
			z += distance;
		} else if (dir == "down") {
			z -= distance;
		} else {
			creature->sendSystemMessage("Error: /hondo move command requires using the whole direction word.");
			throw Exception();
		}

		object->incrementMovementCounter();

		if (object->getParent() != NULL)
			object->teleport(x, z, y, object->getParent().get()->getObjectID());
		else
			object->teleport(x, z, y);		
	}

	// Opens a window that allows an admin to place a structure from the list
	void hondoPlaceStructure(CreatureObject* creature) const {
		if (creature->getParent() != NULL){
			creature->sendSystemMessage("You must be outside to place a structure.");
			throw Exception(); 
		}
		
		Lua* lua = DirectorManager::instance()->getLuaInstance();

		Reference<LuaFunction*> adminPlaceStructure = lua->createFunction("AdminPlaceStructure", "openWindow", 0);
		*adminPlaceStructure << creature;

		adminPlaceStructure->callFunction();
	}

	// Shows a green line coming from the player
	void showRuler(CreatureObject* creature) const {
		String emoteEffectPath = "clienteffect/house_plop_ruler.cef";
		creature->playEffect(emoteEffectPath, "" );
	}

	// Get helpful info about the building you're standing in
	void getBuildingInfo(CreatureObject* creature, StringTokenizer* args) const {
		if (creature->getParent() == NULL){
			creature->sendSystemMessage("You need to be inside a building to get info about it.");
			throw Exception(); 
		}

		Zone* zone = creature->getZone();

		if (zone == NULL)
			throw Exception();
		
		PlanetManager* planetManager = zone->getPlanetManager();
		String planetName = creature->getZone()->getZoneName();

		ManagedReference<SceneObject*> cell = creature->getParent();

		if (cell == NULL || !cell->isCellObject())
			throw Exception();

		int cellID = (cast<CellObject*>(cell.get()))->getCellNumber();
		uint64 cellIDBuilding = cell->getObjectID();

		uint32 buildingTemplate = 0;
		SharedStructureObjectTemplate* buildingTemplateObject = NULL;

		ManagedReference<SceneObject*> building;
		building = cell->getParent();
		
		uint64 buildingID = building->getObjectID();
		buildingTemplate = building->getServerObjectCRC();
		buildingTemplateObject = dynamic_cast<SharedStructureObjectTemplate*>(building->getObjectTemplate());


		if (buildingTemplate == 0)
			throw Exception();

		float posX = creature->getPositionX(), posZ = creature->getPositionZ(), posY = creature->getPositionY();
		Quaternion* direction = creature->getDirection();
		int angle = creature->getDirectionAngle();

		int tmp = 0;

		if (angle > 180){ // Convert to +-180 notation 
			tmp = angle - 180; // get difference
			angle = tmp - 180; // make negative angle
		}	

		float buildingX = building->getPositionX();
		float buildingZ = building->getPositionZ();
		float buildingY = building->getPositionY();
		Quaternion* buildingHeading = building->getDirection();
		int buildingAngle = building->getDirectionAngle();

		if (buildingAngle > 180){ // Convert to +-180 notation 
			tmp = buildingAngle - 180; // get difference
			buildingAngle = tmp - 180; // make negative angle
		}	
		
		StringBuffer text;

		text << "Building Information: " << endl;
		text << "Name: " << building->getObjectNameStringIdName() << endl;
		text << "Template: " << TemplateManager::instance()->getTemplateFile(buildingTemplate) << endl;
		text << "Planet: " << planetName << endl;
		text << "x = " << buildingX << ", z = " << buildingZ << ", y = " << buildingY << ", angle = " << buildingAngle << endl;
		text << "ow = " << buildingHeading->getW() << ", ox = " << buildingHeading->getX() << ", oz = " << buildingHeading->getZ() << ", oy = " << buildingHeading->getY() << endl;
		text << endl;
		text << "Your Position Inside:" << endl;
		text << "Cell Number: " << cellID << endl;
		text << "CellID: " << cellIDBuilding << endl;
		text << "BuildingID: " << buildingID << endl;
		text << "x = " << posX << ", z = " << posZ << ", y = " << posY << ", angle = " << angle << endl;
		text << "ow = " << direction->getW() << ", ox = " << direction->getX() << ", oz = " << direction->getZ() << ", oy = " << direction->getY() << endl;
		
		ChatManager* chatManager = server->getZoneServer()->getChatManager();
		chatManager->sendMail("System", "Building Information", text.toString(), creature->getFirstName());

		String makeLog = "";
		if(args->hasMoreTokens())
			args->getStringToken(makeLog);

		if (makeLog == "log"){
			text << endl << endl;

			File* file = new File("custom_scripts/spout/building_info_log.lua");
			FileWriter* writer = new FileWriter(file, true); // true for appending new lines

			writer->writeLine(text.toString());

			writer->close();
			delete file;
			delete writer;

			creature->sendSystemMessage("Information logged in bin/custom_scripts/spout/building_info_log.lua");
		}
	}
};

#endif //HONDOCOMMAND_H_
