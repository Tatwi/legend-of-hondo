/*

 * HuntingMissionObjectiveImplementation.cpp
 *
 *  Created on: 20/08/2010
 *      Author: dannuic
 */

#include "server/zone/objects/mission/HuntingMissionObjective.h"

#include "server/zone/objects/waypoint/WaypointObject.h"
#include "server/zone/Zone.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/managers/mission/MissionManager.h"
#include "server/zone/managers/planet/PlanetManager.h"
#include "terrain/manager/TerrainManager.h"
#include "server/chat/StringIdChatParameter.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/creature/ai/AiAgent.h"
#include "server/zone/objects/mission/MissionObject.h"
#include "server/zone/objects/mission/MissionObserver.h"
#include "server/zone/objects/creature/ai/CreatureTemplate.h"
#include "server/zone/managers/player/PlayerManager.h"

#include "server/zone/packets/DeltaMessage.h"
#include "server/zone/packets/mission/MissionObjectMessage3.h"
#include "server/zone/packets/mission/MissionObjectDeltaMessage3.h"


void HuntingMissionObjectiveImplementation::activate() {
	MissionObjectiveImplementation::activate();

	if (hasObservers())
		return;

	targetsKilled = 15 * getMissionObject().get()->getDifficultyLevel();

	ManagedReference<CreatureObject*> player = getPlayerOwner();

	ManagedReference<MissionObserver*> observer = new MissionObserver(_this.getReferenceUnsafeStaticCast());
	addObserver(observer, true);

	Locker locker(player);
	player->registerObserver(ObserverEventType::KILLEDCREATURE, observer);
}

void HuntingMissionObjectiveImplementation::abort() {
	MissionObjectiveImplementation::abort();

	for (int i = 0; i < getObserverCount(); i++) {
		ManagedReference<MissionObserver*> observer = getObserver(i);

		ManagedReference<CreatureObject*> player = getPlayerOwner();

		if (player != NULL) {
			Locker locker(player);

			player->dropObserver(ObserverEventType::KILLEDCREATURE, observer);

			dropObserver(observer, true);
		}
	}
}

void HuntingMissionObjectiveImplementation::complete() {

	MissionObjectiveImplementation::complete();
	
	//Award Wilderness Survival XP.
	ManagedReference<MissionObject* > mission = this->mission.get();
	ManagedReference<CreatureObject*> owner = getPlayerOwner();
	
	float diversityBonus = 0.0f; // Bonus for having more Scout/Ranger branches/SEAs
	int trappingSkill = owner->getSkillMod("trapping");
	
	if (trappingSkill > 0)
		diversityBonus= 2000.0f * (float)(MIN(125, trappingSkill) / 100); 
	
	int xp = mission->getRewardCredits() / 3 + (float)diversityBonus;
	owner->getZoneServer()->getPlayerManager()->awardExperience(owner, "camp", xp, true, 1);
}

int HuntingMissionObjectiveImplementation::notifyObserverEvent(MissionObserver* observer, uint32 eventType, Observable* observable, ManagedObject* arg1, int64 arg2) {
	ManagedReference<MissionObject* > mission = this->mission.get();
	if (mission == NULL)
		return 1;

	if (eventType == ObserverEventType::KILLEDCREATURE) {
		if (cast<CreatureObject*>(observable) != getPlayerOwner().get())
			return 0;

		CreatureObject* creature = cast<CreatureObject*>(arg1);
		AiAgent* agent = cast<AiAgent*>(creature);

		if (agent == NULL)
			return 0;

		CreatureTemplate* creatureTemplate = agent->getCreatureTemplate();

		if (creatureTemplate == NULL)
			return 0;

		String temp1 = mission->getTemplateString1();
		String temp2 = mission->getTemplateString2();

		if (creatureTemplate->getTemplateName() == temp1 || creatureTemplate->getTemplateName() == temp2) {
			targetsKilled--;

			if (targetsKilled <= 0) {
				complete();
				return 1;
			}

			StringIdChatParameter message("mission/mission_generic", "hunting_kills_remaining");
			message.setDI(targetsKilled);
			message.setTO(mission->getTargetName());

			getPlayerOwner().get()->sendSystemMessage(message);
			
			// Change mission description in datapad for easy tracking of progress.
			mission->updateHuntingMissionDescription(" To complete this mission you must eliminate " + String::valueOf(targetsKilled) + " more creatures.");
		}
	}

	return 0;
}

Vector3 HuntingMissionObjectiveImplementation::getEndPosition() {
	ManagedReference<MissionObject* > mission = this->mission.get();

	Vector3 missionEndPoint;

	if(mission == NULL)
		return missionEndPoint;

	missionEndPoint.setX(mission->getStartPositionX());
	missionEndPoint.setY(mission->getStartPositionY());
	TerrainManager* terrain = getPlayerOwner().get()->getZone()->getPlanetManager()->getTerrainManager();
	missionEndPoint.setZ(terrain->getHeight(missionEndPoint.getX(), missionEndPoint.getY()));

	return missionEndPoint;
}
