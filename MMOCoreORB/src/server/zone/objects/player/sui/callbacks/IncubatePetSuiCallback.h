/*
 * Legend of Hondo
 * Bio-Engineer Pet Incubation
 */

#ifndef INCUBATEPETSUICALLBACK_H_
#define INCUBATEPETSUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/tangible/tool/CraftingStation.h"
#include "server/zone/objects/tangible/tool/events/IncubatePetNotifyAvailableEvent.h"



class IncubatePetSuiCallback : public SuiCallback {
public:
	IncubatePetSuiCallback(ZoneServer* serv) : SuiCallback(serv) {
	}

	void run(CreatureObject* creature, SuiBox* sui, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		if (!sui->isInputBox() || cancelPressed || args->size() < 1)
			return;

		ManagedReference<SceneObject*> obj = sui->getUsingObject();

		if (obj == NULL)
			return;

		UnicodeString name = args->get(0);
		
		// Validate input, if invalid, request again
		// Get tray stats
		// Get pet deed data
		// Get incubator effectiveness
		
		int delay = 10;
		
		// Crunch numbers 
		
		// Schedule callback to turn off incubator. Prevents removing pet.
		Reference<IncubatePetNotifyAvailableEvent*> task = new IncubatePetNotifyAvailableEvent(creature, obj);
		obj->addPendingTask("incubating", task, delay * 1000);
		
		// Delete tray
		// Apply new stats to pet deed
		// Set deed as sliced
		
		// Notify player
		creature->sendSystemMessage("The incubation process has begun.");
	}
};

#endif /* INCUBATEPETSUICALLBACK_H_ */
