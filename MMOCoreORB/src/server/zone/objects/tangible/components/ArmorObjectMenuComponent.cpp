/*
 * ArmorObjectMenuComponent.cpp
 *
 *  Created on: 2/4/2013
 *      Author: bluree
 *		Credits: TA & Valk & Kinshi (recolor)
 */

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/building/BuildingObject.h"
#include "server/zone/objects/player/sui/colorbox/SuiColorBox.h"
#include "ArmorObjectMenuComponent.h"
#include "server/zone/objects/scene/components/ObjectMenuComponent.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/player/sui/callbacks/ColorArmorSuiCallback.h"
#include "server/zone/Zone.h"
#include "server/zone/ZoneServer.h"
#include "templates/customization/AssetCustomizationManagerTemplate.h"

void ArmorObjectMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {

	if (!sceneObject->isWearableObject())
		return;

	ManagedReference<SceneObject*> parent = sceneObject->getParent().get();

	if (parent != NULL && parent->isCellObject()) {
		ManagedReference<SceneObject*> obj = parent->getParent().get();

		if (obj != NULL && obj->isBuildingObject()) {
			ManagedReference<BuildingObject*> buio = cast<BuildingObject*>(obj.get());

			if (!buio->isOnAdminList(player))
				return;
		}
	}
	else
	{
		if (!sceneObject->isASubChildOf(player))
			return;
	}
	
	String appearanceFilename = sceneObject->getObjectTemplate()->getAppearanceFilename();
	VectorMap<String, Reference<CustomizationVariable*> > variables;
	AssetCustomizationManagerTemplate::instance()->getCustomizationVariables(appearanceFilename.hashCode(), variables, false);
	
	int extraColors = 0;
	
	for(int i = 0; i< variables.size(); ++i){
		String varkey = variables.elementAt(i).getKey();
		//player->sendSystemMessage("Variable Key " + String::valueOf(i) + ": " + varkey); // debug
		
		if (varkey.contains("color"))
			extraColors++;
	}

	menuResponse->addRadialMenuItem(81, 3, "Change Color");
	if (extraColors > 1)
		menuResponse->addRadialMenuItemToRadialID(81, 82, 3, "Color 2"); // sub-menu
	if (extraColors == 3)
		menuResponse->addRadialMenuItemToRadialID(81, 83, 3, "Color 3"); // sub-menu
	
    WearableObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player); 	
}

int ArmorObjectMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {

	if (selectedID == 81 || selectedID == 82 || selectedID == 83) {
		
		ManagedReference<SceneObject*> parent = sceneObject->getParent().get();
	
		if (parent == NULL)
			return 0;
	
		if (parent->isPlayerCreature()) {
			player->sendSystemMessage("@armor_rehue:equipped");
			return 0;
		}	

		if (parent->isCellObject()) {
			ManagedReference<SceneObject*> obj = parent->getParent().get();

			if (obj != NULL && obj->isBuildingObject()) {
				ManagedReference<BuildingObject*> buio = cast<BuildingObject*>(obj.get());

				if (!buio->isOnAdminList(player))
					return 0;
			}
		}
		else
		{
			if (!sceneObject->isASubChildOf(player))
				return 0;
		}

		ZoneServer* server = player->getZoneServer();

		if (server != NULL) {		

		// The color index.
		String appearanceFilename = sceneObject->getObjectTemplate()->getAppearanceFilename();

		VectorMap<String, Reference<CustomizationVariable*> > variables;
		AssetCustomizationManagerTemplate::instance()->getCustomizationVariables(appearanceFilename.hashCode(), variables, false);

		// The Sui Box.
		ManagedReference<SuiColorBox*> cbox = new SuiColorBox(player, SuiWindowType::COLOR_ARMOR);
		cbox->setCallback(new ColorArmorSuiCallback(server));
		
		if (selectedID == 81)
			cbox->setColorPalette(variables.elementAt(0).getKey());

		if (selectedID == 82)
			cbox->setColorPalette(variables.elementAt(1).getKey());

		if (selectedID == 83)
			cbox->setColorPalette(variables.elementAt(2).getKey());

		cbox->setUsingObject(sceneObject);

		// Add to player.
		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
		ghost->addSuiBox(cbox);
		player->sendMessage(cbox->generateMessage());
		}

	}
	
	return WearableObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
}
