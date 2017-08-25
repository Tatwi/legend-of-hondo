/* Legend of Hondo
 * R. Bassett Jr. 2017 
 */

#include "DnaExtractorMenuComponent.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/tangible/TangibleObject.h"
#include "server/zone/objects/scene/components/ObjectMenuComponent.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/managers/creature/DnaManager.h"

void DnaExtractorMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {
		if (sceneObject == NULL || !sceneObject->isTangibleObject() || player == NULL)
		return;

	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);
}

int DnaExtractorMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {
	if (!sceneObject->isTangibleObject() || !player->isPlayerCreature())
		return 0;

	if (!sceneObject->isASubChildOf(player)) {
		return 0;
	}

	if(selectedID == 20) {
		SceneObject* inventory = player->getSlottedObject("inventory");

		if (inventory == NULL)
			return 0;
			
		if (inventory->isContainerFullRecursive()){
			player->sendSystemMessage("Not enough room in your inventory to collect a DNA sample.");
			return 0;
		}
		
		if(!sceneObject->isTangibleObject())
		return 0;

		ManagedReference<TangibleObject*> tool = cast<TangibleObject*>(sceneObject);
		
		if(tool == NULL)
			return 0;
			
		uint64 targetID = player->getTargetID();
		ZoneServer* server = player->getZoneServer();
		
		if (server == NULL)
			return 0;

		ManagedReference<TangibleObject*> target = server->getObject(targetID, true).castTo<TangibleObject*>();
			
		if (target == NULL){
			player->sendSystemMessage("No target selected.");
			return 0;
		}
		
		String templateFile = target->getObjectTemplate()->getFullTemplateString();

		if (!templateFile.contains("mobile/")){
		   player->sendSystemMessage("@bio_engineer:harvest_dna_invalid_target"); // You cannot sample DNA from that target.
		   return 0;
		}
		
		if (!target->isCreatureObject()){
			player->sendSystemMessage("@bio_engineer:harvest_dna_invalid_target"); // You cannot sample DNA from that target.
			return 0;
		}
		
		if (target->isMount()){
			player->sendSystemMessage("You can't sample DNA from a mount.");
			return 0;
		}
		
		CreatureObject* creo = cast<CreatureObject*>( target.get());
		
		if (creo->isPlayerCreature()){
			player->sendSystemMessage("You can't harvest DNA from a player.");
			return 0;
		}
		
		if (creo->isPet() || creo->isDroidObject()) {
			player->sendSystemMessage("@bio_engineer:harvest_dna_target_pet"); // You cannot sample DNA from that pet.
			return 0;
		}
		
		if (creo->isVehicleObject()){
			player->sendSystemMessage("@bio_engineer:harvest_dna_invalid_target"); // You cannot sample DNA from that target.
			return 0;
		}
		
		Creature* critter = cast<Creature*>( creo);
		
		if (critter == NULL){
			player->sendSystemMessage("@bio_engineer:harvest_dna_invalid_target"); // You cannot sample DNA from that target.
			return 0;
		}
		
		if (!critter->hasDNA()){
			player->sendSystemMessage("@bio_engineer:harvest_dna_invalid_target"); // You cannot sample DNA from that target.
			return 0;
		}
		
		if (!creo->isDead()){
			player->sendSystemMessage("The creature must be dead to sample its DNA using this tool.");
			return 0;
		}
		
		int dnaQuality = System::random(6) + 1;
		int skillMod = player->getSkillMod("dna_harvesting");

		if (skillMod > 90){
			dnaQuality = 1;
		} else if (skillMod > 39){
			dnaQuality = MIN(3, dnaQuality);
		} else if (skillMod > 14){
			dnaQuality = MIN(4, dnaQuality);
		} else if (skillMod > 0){
			dnaQuality = MIN(5, dnaQuality);
		}
		
		DnaManager::instance()->generateSample(critter, player, dnaQuality);
		critter->setDnaState(CreatureManager::DNASAMPLED);
		
		Locker locker(tool);
		tool->decreaseUseCount();

		String sayQuality = "Very Low"; // 7
		
		if (dnaQuality == 1){
			sayQuality = "Very High";
		} else if (dnaQuality == 2){
			sayQuality = "High";
		} else if (dnaQuality == 3){
			sayQuality = "Above Average";
		} else if (dnaQuality == 4){
			sayQuality = "Average";
		} else if (dnaQuality == 5){
			sayQuality = "Below Average";
		} else if (dnaQuality == 6){
			sayQuality = "Low";
		}
		
		player->sendSystemMessage(sayQuality + " quality DNA sample collected!");
		
		return 1;
	}
	
	return TangibleObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
}
