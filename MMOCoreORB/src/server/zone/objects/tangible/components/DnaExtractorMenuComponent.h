/* Legend of Hondo
 * R. Bassett Jr. 2017 
 */

#ifndef DNAEXTRACTORMENUCOMPONENT_H_
#define DNAEXTRACTORMENUCOMPONENT_H_

#include "TangibleObjectMenuComponent.h"
#include "server/zone/packets/scene/AttributeListMessage.h"

class DnaExtractorMenuComponent : public TangibleObjectMenuComponent {
protected:
public:
	virtual void fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const;
	virtual int handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const;
};

#endif /* DNAEXTRACTORMENUCOMPONENT_H_ */
