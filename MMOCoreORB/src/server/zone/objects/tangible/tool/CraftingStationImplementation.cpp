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
	}
	
	if (selectedID == 69) { // Upgrade armor procedure
		upgradeArmorPiece(player);
	}
	
	if (selectedID == 70) { // Armor upgrade instructions
		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

		if (ghost == NULL)
			return TangibleObjectImplementation::handleObjectMenuSelect(player, selectedID);
		
		ManagedReference<SuiMessageBox*> box = new SuiMessageBox(player, SuiWindowType::NONE);
		box->setPromptTitle("About Upgrading Armor");
		
		StringBuffer msg;
		
		msg << "The armor upgrade process allows you to improve armor pieces that you have looted from enemies or purchased from Merchants." << endl << endl;
		msg << "Requirements:" << endl;
		msg << "- - - - - - - - -" << endl;
		msg << "1 Armor Piece (non-player crafted)" << endl;
		msg << "1 Armor Upgrade Kit" << endl;
		msg << "1 Universal Armor Segment or 1 Advanced Universal Armor Segment" << endl << endl;
		msg << "Steps:" << endl;
		msg << "- - - - - - - - -" << endl;
		msg << "1. Open the crafting station Input Hopper and place the required items inside, ensuring they are the only items in the hopper." << endl << endl;
		msg << "2. Select the Upgrade Armor option on the crafting station." << endl << endl;
		msg << "Tips:" << endl;
		msg << "- - - - - - - - -" << endl;
		msg << "- Armor Resist values shown on the segment are added to those on the armor piece. Any Resist types that the armor does not already have will be added as Special Resists." << endl << endl;
		msg << "- Armor Encumberance values shown on the segment are added to those on the armor piece." << endl << endl;
		msg << "- Armor Integrity value shown on the segment is added to the condition on the armor piece." << endl << endl;
		msg << "- The final quality of the armor piece is effected by the Armor Effectiveness value shown on the segment, the Functionality Rating of the Clothing Crafting Station, and the Tool Effectiveness of the Armor Upgrade Kit." << endl << endl;
		msg << "- Max resist value is 80%, while Encumberance and Condition do not have a max values." << endl << endl;
		msg << "- Looted and Merchant armor do not have sockets for Skill Enhancing Attachments. The upgrade process might add up to 3 sockets." << endl << endl;
		msg << "- An armor piece can only be upgraded once." << endl << endl;
		
		box->setPromptText(msg.toString());

		ghost->addSuiBox(box);
		player->sendMessage(box->generateMessage());
	}

	return TangibleObjectImplementation::handleObjectMenuSelect(player, selectedID);
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
