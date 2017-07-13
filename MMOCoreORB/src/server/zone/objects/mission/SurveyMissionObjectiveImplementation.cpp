/*
 * SurveyMissionObjectiveImplementation.cpp
 *
 *  Created on: 22/06/2010
 *      Author: victor
 */

#include "server/zone/objects/mission/SurveyMissionObjective.h"
#include "server/zone/objects/mission/MissionObserver.h"
#include "server/zone/objects/mission/MissionObject.h"
#include "templates/params/ObserverEventType.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/resource/ResourceSpawn.h"
#include "server/zone/managers/resource/ResourceManager.h"
#include "server/zone/managers/mission/MissionManager.h"
#include "server/zone/ZoneServer.h"

void SurveyMissionObjectiveImplementation::activate() {
	MissionObjectiveImplementation::activate();

	if (hasObservers()) {
		return;
	}

	ManagedReference<CreatureObject*> player = getPlayerOwner();
	if (player != NULL) {
		ManagedReference<MissionObserver*> observer = new MissionObserver(_this.getReferenceUnsafeStaticCast());
		addObserver(observer, true);

		player->registerObserver(ObserverEventType::SURVEY, observer);
	}
}

void SurveyMissionObjectiveImplementation::abort() {
	MissionObjectiveImplementation::abort();

	if (!hasObservers())
		return;

	ManagedReference<MissionObserver*> observer = getObserver(0);

	ManagedReference<CreatureObject*> player = getPlayerOwner();
	if (player != NULL) {
		player->dropObserver(ObserverEventType::SURVEY, observer);

		dropObserver(observer, true);
	}
}

void SurveyMissionObjectiveImplementation::complete(ManagedObject* spawn, int64 sampledDensity) {
	MissionObjectiveImplementation::complete();
	
	// Award some of the resources surveyed
	ManagedReference<MissionObject* > mission = this->mission.get();
	ManagedReference<CreatureObject*> owner = getPlayerOwner();
	
	int quantity = (mission->getRewardCredits() + 500) * float(sampledDensity / 100.0f);
	
	ResourceSpawn* sampledSpawn = cast<ResourceSpawn*>( spawn);
	
	if (sampledSpawn == NULL)
		return;
	
	ResourceManager* resourceManager = owner->getZoneServer()->getResourceManager();
	resourceManager->givePlayerResource(owner, sampledSpawn->getName(), quantity);
	
	owner->sendSystemMessage("You also recieved " + String::valueOf(quantity) + " units of " + sampledSpawn->getName() + " for completing this mission at a " + String::valueOf(sampledDensity) + "% density location.");
}

int SurveyMissionObjectiveImplementation::notifyObserverEvent(MissionObserver* observer, uint32 eventType, Observable* observable, ManagedObject* arg1, int64 arg2) {
	if (eventType == ObserverEventType::SURVEY) {
		ManagedReference<CreatureObject*> player = getPlayerOwner();
		ManagedReference<MissionObject*> mission = this->mission.get();

		if (player == NULL || mission == NULL) {
			return 0;
		}

		ResourceSpawn* sampledSpawn = cast<ResourceSpawn*>( arg1);

		if (sampledSpawn == NULL) {
			return 0;
		}

		int sampledDensity = (int)arg2;
		String familyName = sampledSpawn->getSurveyMissionSpawnFamilyName();
		
		if (familyName.isEmpty())
			familyName = "Water"; // Water is the only type that doesn't have a family name. The spawnFamily name returned when surveying water is "Water", so make familyName that as well.
		
		if (familyName.contains("Renewable Energy"))
			familyName = "Solar or Wind Energy"; // I renamed it because "Non Site-Restricted Renewable Energy" sucked
		
		if (familyName == spawnFamily && (sampledDensity >= efficiency)) {
			Vector3 startPosition;
			startPosition.setX(mission->getStartPositionX());
			startPosition.setY(mission->getStartPositionY());
			float distance = startPosition.distanceTo(player->getWorldPosition());
			if (distance > 1024.0f) {
				complete(arg1, sampledDensity); // Send the spawn and survey density so we can grant some resources as a reward

				return 1;
			} else {
				StringIdChatParameter stringId("mission/mission_generic", "survey_too_close");
				stringId.setDI(1024);
				stringId.setDF(distance);
				player->sendSystemMessage(stringId);

				return 0;
			}
		} else {
			return 0;
		}
	}

	dropObserver(observer, true);

	updateToDatabase();

	return 1;
}
