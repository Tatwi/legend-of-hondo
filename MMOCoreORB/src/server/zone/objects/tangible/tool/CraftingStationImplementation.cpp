/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#include "engine/engine.h"

#include "server/zone/objects/tangible/tool/CraftingStation.h"
#include "server/zone/Zone.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "templates/tangible/tool/CraftingStationTemplate.h"
#include "server/zone/objects/tangible/tool/CraftingTool.h"
#include "server/zone/objects/manufactureschematic/craftingvalues/CraftingValues.h"
#include "server/zone/objects/area/ActiveArea.h"
#include "server/zone/objects/building/BuildingObject.h"
#include "server/zone/packets/scene/AttributeListMessage.h"
#include "server/zone/objects/player/sui/messagebox/SuiMessageBox.h"
#include "server/zone/managers/crafting/labratories/SharedLabratory.h"
#include "server/zone/objects/player/sessions/SlicingSession.h"

void CraftingStationImplementation::loadTemplateData(SharedObjectTemplate* templateData) {
	TangibleObjectImplementation::loadTemplateData(templateData);

	CraftingStationTemplate* craftingStationData = dynamic_cast<CraftingStationTemplate*>(templateData);

	type = craftingStationData->getStationType();
	complexityLevel = craftingStationData->getComplexityLevel();
}

void CraftingStationImplementation::fillObjectMenuResponse(ObjectMenuResponse* menuResponse, CreatureObject* player) {
	TangibleObjectImplementation::fillObjectMenuResponse(menuResponse, player);

	ManagedReference<BuildingObject*> building = cast<BuildingObject*>(player->getParentRecursively(SceneObjectType::BUILDING).get().get());
	ManagedReference<CellObject*> cell = cast<CellObject*>(this->getParent().get().get());

	if(building != NULL && cell != NULL && !isASubChildOf(player)) {
		if(building->isOnAdminList(player) && getSlottedObject("ingredient_hopper") != NULL) {
			menuResponse->addRadialMenuItem(68, 3, "@ui_radial:craft_hopper_input"); //Open
			
			// LoH Loot/NPC Armor Upgrade
			if (getStationType() == CraftingTool::CLOTHING) {
				menuResponse->addRadialMenuItem(69, 3, "Upgrade Armor");
				menuResponse->addRadialMenuItemToRadialID(69, 70, 3, "Instructions"); // sub-menu
				menuResponse->addRadialMenuItemToRadialID(69, 71, 3, "Quality"); // sub-menu
				menuResponse->addRadialMenuItemToRadialID(69, 72, 3, "Rating Light to Medium"); // sub-menu
				menuResponse->addRadialMenuItemToRadialID(69, 73, 3, "Rating Medium to High"); // sub-menu
				menuResponse->addRadialMenuItemToRadialID(69, 74, 3, "Rating Any to High"); // sub-menu
			} else if (getStationType() == CraftingTool::FOOD) {
				if (getObjectName()->getFullPath().contains("pet_station"))
					menuResponse->addRadialMenuItem(75, 3, "Incubate Pet");
			}
		}
	}
}

int CraftingStationImplementation::handleObjectMenuSelect(CreatureObject* player, byte selectedID) {
	ManagedReference<BuildingObject*> building = cast<BuildingObject*>(player->getParentRecursively(SceneObjectType::BUILDING).get().get());
	
	if(building == NULL || !building->isOnAdminList(player) || isASubChildOf(player)) // Outside / player not allowed / in player inventory
		return TangibleObjectImplementation::handleObjectMenuSelect(player, selectedID);
	
	if (selectedID == 68 && getSlottedObject("ingredient_hopper") != NULL) { // Open input hopper
			sendInputHopper(player);
	} else if (selectedID == 69) { // Do nothing
		return TangibleObjectImplementation::handleObjectMenuSelect(player, selectedID);
	} else if (selectedID == 70) { // Armor upgrade instructions
		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

		if (ghost == NULL)
			return TangibleObjectImplementation::handleObjectMenuSelect(player, selectedID);
		
		ManagedReference<SuiMessageBox*> box = new SuiMessageBox(player, SuiWindowType::NONE);
		box->setPromptTitle("Instructions");
		box->setPromptText("@crafting:armor_upgrade"); // LoH new description
	
		ghost->addSuiBox(box);
		player->sendMessage(box->generateMessage());
	} else if (selectedID == 71) {
		upgradeArmorPiece(player); // Quality pgrade armor procedure
	} else if (selectedID == 72) { 
		upgradeArmorRating(player, 1); // Rating upgrade armor procedure
	} else if (selectedID == 73) { 
		upgradeArmorRating(player, 2); // Rating upgrade armor procedure
	} else if (selectedID == 74) {  
		upgradeArmorRating(player, 3); // Rating upgrade armor procedure
	} else if (selectedID == 75) {  
		incubatePet(player); // Upgrading pet deeds
	}
	
	return 0;//TangibleObjectImplementation::handleObjectMenuSelect(player, selectedID);
}

void CraftingStationImplementation::fillAttributeList(AttributeListMessage* alm, CreatureObject* object) {
	TangibleObjectImplementation::fillAttributeList(alm, object);

	alm->insertAttribute("stationmod", Math::getPrecision(effectiveness, 2));
}

void CraftingStationImplementation::sendInputHopper(CreatureObject* player) {

	ManagedReference<SceneObject*> inputHopper = getSlottedObject("ingredient_hopper");

	if(inputHopper == NULL) {
		return;
	}

	inputHopper->sendDestroyTo(player);
	inputHopper->closeContainerTo(player, true);

	inputHopper->sendWithoutContainerObjectsTo(player);
	inputHopper->openContainerTo(player);
}

SceneObject* CraftingStationImplementation::findCraftingTool(CreatureObject* player) {

	ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
	Locker inventoryLocker(inventory);
	SceneObject* craftingTool = NULL;

	for (int i = 0; i < inventory->getContainerObjectsSize(); ++i) {

		SceneObject* object = inventory->getContainerObject(i);

		if (object != NULL && object->isCraftingTool()) {

			CraftingTool* tool = cast<CraftingTool*>( object);

			if(!tool->isReady())
				continue;

			int toolType = tool->getToolType();

			if (toolType == type) {
				return object;
			}

			if (toolType == CraftingTool::JEDI && type
					== CraftingTool::WEAPON) {
				craftingTool = object;
			}
		}

	}
	return craftingTool;
}

void CraftingStationImplementation::createChildObjects() {

}

void CraftingStationImplementation::updateCraftingValues(CraftingValues* values, bool firstUpdate) {
	/// useModifer is the effectiveness

	effectiveness = values->getCurrentValue("usemodifier");

	if(firstUpdate && values->hasSlotFilled("storage_compartment")) {
		String ingredientHopperName = "object/tangible/hopper/crafting_station_hopper/crafting_station_ingredient_hopper_structure_small.iff";
		ManagedReference<SceneObject*> ingredientHopper = server->getZoneServer()->createObject(ingredientHopperName.hashCode(), 1);

		transferObject(ingredientHopper, 4, true);
	}

	values->toString();
}

// LoH Upgrade a single piece of non-player crafted armor.
void CraftingStationImplementation::upgradeArmorPiece(CreatureObject* player) {
	// Get crafting station hopper
	ManagedReference<SceneObject*> inputHopper = getSlottedObject("ingredient_hopper");

	if(inputHopper == NULL) {
		player->sendSystemMessage("Hmm... this crafting station's input hopper is busted!");
		return;
	}
	
	// Bail if more than 3 items are in the hopper
	if (inputHopper->getContainerObjectsSize() > 3) {
		player->sendSystemMessage("Error: There are too many ingredients in the input hopper. Requirements: 1 Armor Piece, 1 Armor Segment, 1 Armor Upgrade Kit.");
		return;
	}
	
	// Get ingredients
	ManagedReference<ArmorObject*> armor = NULL;
	ManagedReference<SceneObject*> kit = NULL;
	ManagedReference<SceneObject*> segment = NULL;
	
	for (int i = 0; i < inputHopper->getContainerObjectsSize(); i++) {
		ManagedReference<SceneObject*> obj = inputHopper->getContainerObject(i).get();
		
		if (obj != NULL){
			if (obj->isArmorObject()) {
				armor = obj.castTo<ArmorObject*>();
				
				if (armor->getCraftersName() != "") {
					player->sendSystemMessage("Error: Unable to upgrade crafted armor or armor that has already been upgraded.");
					return;
				}
			} else if (obj->getObjectTemplate()->getFullTemplateString().contains("slicing_armor_upgrade_kit")) {
				kit = obj;
			} else if (obj->getObjectTemplate()->getFullTemplateString().contains("armor_segment_composite")) {
				segment = obj;
			}
		}
	}
	
	// Bail if missing/wrong ingredient
	if (armor == NULL){
		player->sendSystemMessage("Error: Missing or invalid armor piece.");
		return;
	}
	
	if (kit == NULL){
		player->sendSystemMessage("Error: Missing or invalid Armor Upgrade Kit.");
		return;
	}
	
	if (segment == NULL){
		player->sendSystemMessage("Error: Missing or invalid Armor Segment.");
		return;
	}

	ManagedReference<TangibleObject*> segTano = segment.castTo<TangibleObject*>();
	ManagedReference<Component*> segComp = segTano.castTo<Component*>();
	
	SlicingTool* kitAsSlicingTool = cast<SlicingTool*>(kit.get());
	
	// Quality Bonus (Armor Effectiveness + Armor Upgrade Kit + Crafting Station)
	float qualityBonus = segComp->getAttributeValue("armor_effectiveness") + kitAsSlicingTool->getEffectiveness() + effectiveness;
	
	if (qualityBonus < 0.0f)
		qualityBonus = 0.0f;
	
	if (qualityBonus > 100.0f)
		qualityBonus = 100.0f;
		
	qualityBonus = 10.f * (qualityBonus / 100.0f);
	
	// Apply Resist changes
	Locker locker(armor);
	
	// KINETIC = 1, ENERGY = 2, BLAST = 4, STUN = 8, LIGHTSABER = 16, HEAT = 32, COLD = 64, ACID = 128, ELECTRICITY = 256
	
	if (segComp->getAttributeValue("kineticeffectiveness") > 0) 
		armor->setKinetic(segComp->getAttributeValue("kineticeffectiveness") + qualityBonus + armor->getResist(1));
		
	if (segComp->getAttributeValue("energyeffectiveness") > 0)
		armor->setEnergy(segComp->getAttributeValue("energyeffectiveness") + qualityBonus + armor->getResist(2));

	if (segComp->getAttributeValue("blasteffectiveness") > 0)
		armor->setBlast(segComp->getAttributeValue("blasteffectiveness") + qualityBonus + armor->getResist(4));

	if (segComp->getAttributeValue("stuneffectiveness") > 0)	
		armor->setStun(segComp->getAttributeValue("stuneffectiveness") + qualityBonus + armor->getResist(8));

	if (segComp->getAttributeValue("heateffectiveness") > 0)	
		armor->setHeat(segComp->getAttributeValue("heateffectiveness") + qualityBonus + armor->getResist(32));

	if (segComp->getAttributeValue("coldeffectiveness") > 0)	
		armor->setCold(segComp->getAttributeValue("coldeffectiveness") + qualityBonus + armor->getResist(64));

	if (segComp->getAttributeValue("acideffectiveness") > 0)
		armor->setAcid(segComp->getAttributeValue("acideffectiveness") + qualityBonus + armor->getResist(128));

	if (segComp->getAttributeValue("electricaleffectiveness") > 0)
		armor->setElectricity(segComp->getAttributeValue("electricaleffectiveness") + qualityBonus + armor->getResist(256));

	if (segComp->getAttributeValue("restraineffectiveness") > 0)
		armor->setLightSaber(segComp->getAttributeValue("restraineffectiveness") + qualityBonus + armor->getResist(16));

	// Apply Encumberance changes
	armor->setHealthEncumbrance(armor->getHealthEncumbrance() + (int)segComp->getAttributeValue("armor_health_encumbrance"));
	armor->setActionEncumbrance(armor->getActionEncumbrance() + (int)segComp->getAttributeValue("armor_action_encumbrance"));
	armor->setMindEncumbrance(armor->getMindEncumbrance() + (int)segComp->getAttributeValue("armor_mind_encumbrance"));
	
	// Apply Condition changes
	armor->setMaxCondition(armor->getMaxCondition() + (int)segComp->getAttributeValue("armor_integrity") + (int)(qualityBonus * 125), true);
	
	// Set crafter name as player name
	ManagedReference<TangibleObject*> object = armor.castTo<TangibleObject*>();
	String name = player->getFirstName() + " (Upgrade)";
	object->setCraftersName(name);
	
	// Add sockets based on crafting station quality
	ManagedReference<WearableObject*> wearObj = armor.castTo<WearableObject*>();
	
	if (effectiveness > 40 && System::random(100) > 50) {
		wearObj->setMaxSockets(3);
	} else if (effectiveness > 28 && System::random(100) > 50) {
		wearObj->setMaxSockets(2);
	} else if (effectiveness > 20) {
		wearObj->setMaxSockets(1);
	}
	
	// Delete segement and armor upgrade kit
	Locker slocker(segment);
	segment->destroyObjectFromWorld(true);
	segment->destroyObjectFromDatabase(true);
	
	Locker klocker(kit);
	kit->destroyObjectFromWorld(true);
	kit->destroyObjectFromDatabase(true);
			
	player->sendSystemMessage("Armor upgrade process complete!");
}

// LoH Upgrade the Armor Rating on a piece of armor.
// type: 1 = Light to Medium, 2 = Medium to Heavy, 3 = Any to Heavy
void CraftingStationImplementation::upgradeArmorRating(CreatureObject* player, int type) {
	// Get crafting station hopper
	ManagedReference<SceneObject*> inputHopper = getSlottedObject("ingredient_hopper");

	if(inputHopper == NULL) {
		player->sendSystemMessage("Hmm... this crafting station's input hopper is busted!");
		return;
	}
	
	// Get armor and upgrade kit
	ManagedReference<ArmorObject*> armor = NULL;
	ManagedReference<SceneObject*> kit = NULL;
	int armorPieces = 0;
	int armorKits = 0;
	
	for (int i = 0; i < inputHopper->getContainerObjectsSize(); i++) {
		ManagedReference<SceneObject*> obj = inputHopper->getContainerObject(i).get();
		
		if (obj != NULL){
			if (obj->isArmorObject()) {
				armor = obj.castTo<ArmorObject*>();
				armorPieces++;
				
				if (armorPieces > 1){
					player->sendSystemMessage("Error: Too many armor pieces in the hopper.");
					return;
				}
			} else if (obj->getObjectTemplate()->getFullTemplateString().contains("slicing_armor_upgrade_kit")) {
				kit = obj;
				armorKits++;
					
				if (armorKits > 1){
					player->sendSystemMessage("Error: Too many Armor Upgade Kits in the hopper.");
					return;
				}
			}
		}
	}
	
	// Bail if missing/wrong ingredient
	if (armor == NULL){
		player->sendSystemMessage("Error: Missing or invalid armor piece.");
		return;
	}
	
	if (kit == NULL){
		player->sendSystemMessage("Error: Missing or invalid Armor Upgrade Kit.");
		return;
	}
	
	int armorRating = armor->getRating();
	float kineticValue = (int)MAX(armor->getResist(1), armor->getKinetic()); // MAX(Normal Resist, Special Resist)
	
	// Check a bunch of rules
	
	if (type == 1){
		if (armorRating != 1){
			player->sendSystemMessage("Error: The armor piece must have a rating of Light to upgrade from Light to Medium.");
			return;
		}
		
		if (kineticValue < 65){
			player->sendSystemMessage("Error: The armor piece must have at least 65% Kinetic Resistance to upgrade from Light to Medium.");
			return;
		}
		
		if (inputHopper->getContainerObjectsSize() > 12){
			player->sendSystemMessage("Error: Too many items in the input hopper. Reqired: 1 Armor Piece, 1 Armor Upgrade Kit, 10 identical loot items.");
			return;
		}
	} else if (type == 2){
		if (armorRating != 2){
			player->sendSystemMessage("Error: The armor piece must have a rating of Medium to upgrade from Medium to Heavy.");
			return;
		}
		
		if (kineticValue < 70){
			player->sendSystemMessage("Error: The armor piece must have at least 70% Kinetic Resistance to upgrade from Light to Medium.");
			return;
		}
		
		if (inputHopper->getContainerObjectsSize() > 12){
			player->sendSystemMessage("Error: Too many items in the input hopper. Reqired: 1 Armor Piece, 1 Armor Upgrade Kit, 10 identical loot items.");
			return;
		}
	} else if (type == 3){
		if (armorRating == 3){
			player->sendSystemMessage("Error: The armor piece cannot be further upgraded.");
			return;
		}
		
		if (kineticValue < 75){
			player->sendSystemMessage("Error: The armor piece must have at least 75% Kinetic Resistance to upgrade directly to Heavy.");
			return;
		}
		
		if (inputHopper->getContainerObjectsSize() > 4){
			player->sendSystemMessage("Error: Too many items in the input hopper. Reqired: 1 Armor Piece, 1 Armor Upgrade Kit, 2 loot item.");
			return;
		}
	}
	
	// Get the looted armor segments
	int segments = 0;
	int segmentType = 0;
	String segmentName = "";
	
	Vector<uint64> segmentIDs;
	
	for (int i = 0; i < inputHopper->getContainerObjectsSize(); i++) {
		ManagedReference<SceneObject*> obj = inputHopper->getContainerObject(i).get();
		
		if (obj!= NULL) {
			String templateName = obj->getObjectTemplate()->getFullTemplateString();
			
			if (segments == 0) {
				if (type == 1) {
					if (templateName.contains("armor_segment_chitin_brackaset")){
						segmentName = "armor_segment_chitin_brackaset";
						segmentType = 1;
					} else if (templateName.contains("armor_segment_bone_donkuwah")){
						segmentName = "armor_segment_bone_donkuwah";
						segmentType = 1;
					} else if (templateName.contains("armor_segment_padded_fambaa")){
						segmentName = "armor_segment_padded_fambaa";
						segmentType = 1;
					} else if (templateName.contains("armor_segment_chitin_kliknick")){
						segmentName = "armor_segment_chitin_kliknick";
						segmentType = 1;
					} else if (templateName.contains("armor_segment_chitin_sharnaff")){
						segmentName = "armor_segment_chitin_sharnaff";
						segmentType = 1;
					} else if (templateName.contains("armor_segment_bone_voritor_lizard")){
						segmentName = "armor_segment_bone_voritor_lizard";
						segmentType = 1;
					}
				} else if (type == 2) {
					if (templateName.contains("armor_layer_nightsister")){
						segmentName = "armor_layer_nightsister";
						segmentType = 2;
					} else if (templateName.contains("armor_segment_padded_rancor")){
						segmentName = "armor_segment_padded_rancor";
						segmentType = 2;
					} else if (templateName.contains("bone_fragment_woolamander_harrower")){
						segmentName = "bone_fragment_woolamander_harrower";
						segmentType = 2;
					}
				} else if (type == 3) {
					if (templateName.contains("armor_segment_bone_kimogila")){
						segmentName = "armor_segment_bone_kimogila";
						segmentType = 3;
					} else if (templateName.contains("armor_segment_chitin_kliknick_adv")){
						segmentName = "armor_segment_chitin_kliknick_adv";
						segmentType = 3;
					} else if (templateName.contains("armor_segment_composite_krayt")){
						segmentName = "armor_segment_composite_krayt";
						segmentType = 3;
					} else if (templateName.contains("feather_peko_albatross")){
						segmentName = "feather_peko_albatross";
						segmentType = 3;
					} else if (templateName.contains("armor_segment_padded_acklay")){
						segmentName = "armor_segment_padded_acklay";
						segmentType = 3;
					}
				}
			}
			
			if (segmentName != "" && templateName.contains(segmentName)) {
				segmentIDs.add(obj->getObjectID());
				segments++;
			}
		}
	}
	
	// Check some more rules
	
	if (segmentType != type) {
		player->sendSystemMessage("Error: Incorrect looted armor segment type. See Instructions for details.");
		return;
	}
	
	if (type < 3 && segments > 10) {
		player->sendSystemMessage("Error: Too many looted armor segments in the hopper. 10 of the same type are required.");
		return;
	}
	
	if (type < 3 && segments < 10) {
		player->sendSystemMessage("Error: Not enough matching looted armor segments in the hopper. 10 of the same type are required.");
		return;
	}
	
	if (type == 3 && segments > 2) {
		player->sendSystemMessage("Error: Too many armor segments in the hopper for Any to Heavy. Only 2 are required.");
		return;
	}
	
	if (type == 3 && segments < 2) {
		player->sendSystemMessage("Error: Not enough matching segments in the hopper for Any to Heavy. 2 of the same type are required.");
		return;
	}
	
	// Criteria reached, check for failure
	SlicingTool* kitAsSlicingTool = cast<SlicingTool*>(kit.get());
	float kitQuality = kitAsSlicingTool->getEffectiveness();
	int chance = (int)(75.0f + effectiveness + kitQuality);
	bool sucess = true;
	
	if (System::random(100) > chance)
		sucess = false;
	
	// Delete the components
	for (int i = 0; i < segmentIDs.size(); i++) {
		ManagedReference<SceneObject*> component = server->getZoneServer()->getObject(segmentIDs.get(i));
		
		if (component != NULL) {
			Locker clocker(component);
			component->destroyObjectFromWorld(true);
			component->destroyObjectFromDatabase(true);
		}
	}

	Locker klocker(kit);
	kit->destroyObjectFromWorld(true);
	kit->destroyObjectFromDatabase(true);
	
	// Finish the job
	Locker locker(armor);
	
	if (sucess) {
		if (type == 1){
			armor->setRating(2);
			armor->inflictDamage(armor, 0, 500.0f, true, true);
		} else if (type == 2){
			armor->setRating(3);
			armor->inflictDamage(armor, 0, 750.0f, true, true);
		} else if (type == 3){
			armor->setRating(3);
			armor->inflictDamage(armor, 0, 1500.0f, true, true);
		}
		
		player->sendSystemMessage("Armor Rating upgrade process successful!");
	} else {
		armor->inflictDamage(armor, 0, 200.0f, true, true);
		player->sendSystemMessage("Armor Rating upgrade process failed! All components were consumed and the armor was damaged.");
	}
}

void CraftingStationImplementation::incubatePet(CreatureObject* player) {
	player->sendSystemMessage("Incubator functionality goes here!");
}
