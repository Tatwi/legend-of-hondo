/*
 * Legend of Hondo
 * Bio-Engineer Pet Incubation
 */
 
#ifndef INCUBATEPETNOTIFYAVAILABLEEVENT_H_
#define INCUBATEPETNOTIFYAVAILABLEEVENT_H_

#include "server/zone/objects/creature/CreatureObject.h"

class IncubatePetNotifyAvailableEvent : public Task {
	ManagedWeakReference<CreatureObject*> creo;
	ManagedWeakReference<SceneObject*> inc;

public:
	IncubatePetNotifyAvailableEvent(CreatureObject* cr, SceneObject* obj) : Task() {
		creo = cr;
		inc = obj;
	}

	void run() {
		ManagedReference<SceneObject*> incubator = inc.get();

		if (incubator == NULL)
			return;

		Locker locker(incubator);

		incubator->removePendingTask("incubating");

		ManagedReference<CreatureObject*> player = creo.get();

		if (player != NULL)
			player->sendSystemMessage("Incubation complete!");
	}

};

#endif /*INCUBATEPETNOTIFYAVAILABLEEVENT_H_*/
