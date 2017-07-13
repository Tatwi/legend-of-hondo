/*
 * CraftingMissionObjectiveImplementation.cpp
 *
 *  Created on: 20/08/2010
 *      Author: dannuic
 */

#include "server/zone/objects/mission/CraftingMissionObjective.h"
#include "server/zone/managers/crafting/schematicmap/SchematicMap.h"
#include "server/zone/objects/mission/MissionObject.h"
#include "server/zone/managers/player/PlayerManager.h"

void CraftingMissionObjectiveImplementation::updateMissionStatus(CreatureObject* player) {
	ManagedReference<MissionObject* > mission = this->mission.get();

	if(mission == NULL)
		return;
	ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
	if (inventory == NULL) {
		return;
	}

	ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

	if (ghost == NULL) {
		return;
	}

	DraftSchematic* schematic = SchematicMap::instance()->get(mission->getTemplateString1().hashCode());
	if (schematic == NULL) {
		return;
	}

	Locker playerLock(player);

	switch (objectiveStatus) {
	case 0:
		//Award schematic and resources needed for it.
		ghost->addRewardedSchematic(schematic, SchematicList::MISSION, 1, true);

		//Create components for schematic and give them to the player.
		for (int i = 0; i < schematic->getDraftSlotCount(); i++) {
			ManagedReference<TangibleObject*> item = ( player->getZoneServer()->createObject(schematic->getDraftSlot(i)->getResourceType().replaceFirst("/shared_", "/").hashCode(), 2)).castTo<TangibleObject*>();
			if (item != NULL) {
				Locker locker(item);

				if (inventory->transferObject(item, -1, true)) {
					item->sendTo(player, true);
				} else {
					item->destroyObjectFromDatabase(true);
					abort();
					return;
				}
			}
		}

		updateMissionTarget(player);

		objectiveStatus = PICKEDUPSTATUS;
		break;
	case 1:
		//Check if player has the item.
		for (int i = 0; i < inventory->getContainerObjectsSize(); i++) {
			Reference<SceneObject*> item = inventory->getContainerObject(i);

			Locker locker(item);

			if (item != NULL && item->getObjectTemplate()->getFullTemplateString() == mission->getTemplateString2()) {
				//Delete the item.
				item->destroyObjectFromWorld(true);
				item->destroyObjectFromDatabase(true);

				complete();

				objectiveStatus = DELIVEREDSTATUS;
				
				// Award XP 
				int xp = mission->getRewardCredits() * 2 * float(player->getSkillMod("general_assembly") / 100.0f + 0.02f); // The 0.02f ensures you get XP even if you have dropped Novice Scout for some crazy reason...
				xp = MIN(834, xp); // Cap at 2,502XP (10 high paying missions to earn a novice box of an advanced profession)
				player->getZoneServer()->getPlayerManager()->awardExperience(player, "crafting_general", xp, true, 1); // The system multiplies the XP value by 3
			}
		}
		break;
	default:
		break;
	}
}

void CraftingMissionObjectiveImplementation::abort() {
	//Remove the schematic.
	ManagedReference<MissionObject* > mission = this->mission.get();
	ManagedReference<CreatureObject*> player = getPlayerOwner();

	if (player != NULL && mission != NULL) {
		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

		if (ghost != NULL) {
			DraftSchematic* schematic = SchematicMap::instance()->get(mission->getTemplateString1().hashCode());

			if (schematic != NULL) {
				ghost->removeRewardedSchematic(schematic, true);
			}
		}
	}

	//Run normal abort for deliver missions.
	DeliverMissionObjectiveImplementation::abort();
}
