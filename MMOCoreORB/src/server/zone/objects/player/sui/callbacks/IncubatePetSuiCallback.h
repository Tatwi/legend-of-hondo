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
#include "server/zone/objects/tangible/tool/CraftingStation.h"
#include "server/zone/objects/tangible/deed/pet/PetDeed.h"


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
		
		// Get input values Example: ROY41-BBV13-GRO53
		UnicodeString input = args->get(0);
		String fullSequence = input.toString();
		fullSequence = fullSequence.toUpperCase();
		
		// Validate input, if invalid, request again 
		String validLetters = "ROYGBV";
		String validNumbers = "12345";
		String let = "";
		String num = "";
		bool numBad = false;
		
		if (fullSequence.length() < 16){
			creature->sendSystemMessage("Invalid incubation sequence: Too short (" + fullSequence + ")");
			return;
		}
		
		int start = 0;
		int end = 3;
		
		for (int z = 0; z < 3; z++) {
			for (int i = start; i < end; i++) {
				let = fullSequence.subString(i, i+1);
				
				// Check numbers
				if (i < 2){ 
					num = fullSequence.subString(i+3, i+4);
					
					if (!validNumbers.contains(num))
						numBad = true;
				}
				
				if (!validLetters.contains(let) || numBad){
					String wrong = let;
					
					if (numBad)
						wrong = num;
						
					creature->sendSystemMessage("Invalid incubation sequence: Problem in stage " + String::valueOf(z+1) + ": " + wrong + " (" + fullSequence + ")");
					return;
				}
			}
			
			start += 6;
			end += 6;
		}

		// Asign variables
		
		// Stage 1
		String s1i = fullSequence.subString(0,1); // Isomerase Enzyme
		String s1l = fullSequence.subString(1,2); // Lyase Enzyme
		String s1h = fullSequence.subString(2,3); // Hydrolase Enzyme
		int s1t = Integer::valueOf(fullSequence.subString(3,4)); // Tempurature
		int s1d = Integer::valueOf(fullSequence.subString(4,5)); // Duration
		
		// Stage 2 subString(5,6) ignored
		String s2i = fullSequence.subString(6,7); // Isomerase Enzyme
		String s2l = fullSequence.subString(7,8); // Lyase Enzyme
		String s2h = fullSequence.subString(8,9); // Hydrolase Enzyme
		int s2t = Integer::valueOf(fullSequence.subString(9,10)); // Tempurature
		int s2d = Integer::valueOf(fullSequence.subString(10,11)); // Duration
		
		// Stage 3 subString(11,12) ignored
		String s3i = fullSequence.subString(12,13); // Isomerase Enzyme
		String s3l = fullSequence.subString(13,14); // Lyase Enzyme
		String s3h = fullSequence.subString(14,15); // Hydrolase Enzyme
		int s3t = Integer::valueOf(fullSequence.subString(15,16)); // Tempurature
		int s3d = Integer::valueOf(fullSequence.subString(16)); // Duration
		
		/* debug /
		creature->sendSystemMessage("s1i = " + s1i);
		creature->sendSystemMessage("s1l = " + s1l);
		creature->sendSystemMessage("s1h = " + s1h);
		creature->sendSystemMessage("s1t = " + String::valueOf(s1t));
		creature->sendSystemMessage("s1d = " + String::valueOf(s1d));
		
		creature->sendSystemMessage("s2i = " + s2i);
		creature->sendSystemMessage("s2l = " + s2l);
		creature->sendSystemMessage("s2h = " + s2h);
		creature->sendSystemMessage("s2t = " + String::valueOf(s2t));
		creature->sendSystemMessage("s2d = " + String::valueOf(s2d));
		
		creature->sendSystemMessage("s3i = " + s3i);
		creature->sendSystemMessage("s3l = " + s3l);
		creature->sendSystemMessage("s3h = " + s3h);
		creature->sendSystemMessage("s3t = " + String::valueOf(s3t));
		creature->sendSystemMessage("s3d = " + String::valueOf(s3d));
		//*/ 
		
		// Get the station, tray, and deed
		ManagedReference<CraftingStation*> incubator = obj.castTo<CraftingStation*>();
		
		if(incubator == NULL) {
			creature->sendSystemMessage("Debug: Incubator SceneObject not found");
			return;
		}
		
		ManagedReference<SceneObject*> inputHopper = incubator->getSlottedObject("ingredient_hopper");

		if(inputHopper == NULL) {
			creature->sendSystemMessage("Debug: Hopper SceneObject not found");
			return;
		}
		
		ManagedReference<Component*> tray = NULL;
		ManagedReference<PetDeed*> deed = NULL;
		int trays = 0;
		int petDeeds = 0;
		int hopperSize = inputHopper->getContainerObjectsSize();
		
		if (hopperSize > 2){
			creature->sendSystemMessage("Error: Too many items in the hopper.");
			return;
		}
		
		for (int i = 0; i < hopperSize; i++) {
			ManagedReference<SceneObject*> invItem = inputHopper->getContainerObject(i).get();
			
			if (obj != NULL){
				if (invItem->getObjectTemplate()->getFullTemplateString().contains("incubation_tray")) {
					tray = invItem.castTo<Component*>();
					trays++;
					
					if (trays > 1){
						creature->sendSystemMessage("Error: Too many Incubation Trays in the hopper.");
						return;
					}
				} else if (invItem->getObjectTemplate()->getFullTemplateString().contains("pet_deed")) {
					deed = invItem.castTo<PetDeed*>();
					petDeeds++;
						
					if (petDeeds > 1){
						creature->sendSystemMessage("Error: Too many Pets Deeds in the hopper.");
						return;
					}
				}
			}
		}
		
		if (tray == NULL){
			creature->sendSystemMessage("Error: Missing Incubation Tray.");
			return;
		}
		
		if (deed == NULL){
			creature->sendSystemMessage("Error: Missing Pet Deed.");
			return;
		}
		
		// Get incubator effectiveness
		float toolQuality = incubator->getEffectiveness();
		
		// Get tray stats
		float mutagen = tray->getAttributeValue("mutagen");
		float purity = tray->getAttributeValue("purity");
		
		// Get pet deed data
		float level = deed->getLevel();
		float speed = deed->getAttackSpeed();
		float hit = deed->getHitChance();
		float health = deed->getHealth();
		float action = deed->getAction();
		float mind = deed->getMind();
		float dmgMin = deed->getMinDamage();
		float dmgMax = deed->getMaxDamage();
		float kinetic = deed->getKinetic();
		float energy = deed->getEnergy();
		float blast = deed->getBlast();
		float cold = deed->getCold();
		float heat = deed->getHeat();
		float elec = deed->getElectric();
		float acid = deed->getAcid();
		float stun = deed->getStun();
		float saber = deed->getSaber();
		int armorRating = deed->getArmor();
		String special1 = deed->getSpecial1();
		String special2 = deed->getSpecial2();
		bool ranged = deed->getRanged();
		
		// Crunch numbers	
		float delay = s1d*12 + s2d*15 + s3d*11 + System::random(60) - toolQuality; // Max < 5 minutes
		
		// Schedule callback to turn off incubator. Prevents removing pet.
		Reference<IncubatePetNotifyAvailableEvent*> task = new IncubatePetNotifyAvailableEvent(creature, obj);
		obj->addPendingTask("incubating", task, delay * 1000);
		
		// Delete tray
		Locker tlocker(tray);
		tray->destroyObjectFromWorld(true);
		tray->destroyObjectFromDatabase(true);
		
		// Apply new stats to pet deed
		Locker dlocker(deed);
		deed->setLevel(level);
		deed->setAttackSpeed(speed);
		deed->setHitChance(hit);
		deed->setHealth(health);
		deed->setAction(action);
		deed->setMind(mind);
		deed->setMinDamage(dmgMin);
		deed->setMaxDamage(dmgMax);
		deed->setKinetic(kinetic);
		deed->setEnergy(energy);
		deed->setBlast(blast);
		deed->setCold(cold);
		deed->setHeat(heat);
		deed->setElectric(elec);
		deed->setAcid(acid);
		deed->setStun(stun);
		deed->setSaber(saber);
		deed->setArmor(armorRating);
		deed->setSpecial1(special1);
		deed->setSpecial2(special2);
		deed->setRanged(ranged);
				
		// Set deed as sliced
		deed->setSliced(true);
		String deedName = deed->getCustomObjectName().toString() + " (Incubated)";
		deed->setCustomObjectName(deedName, true);

		// Notify player
		creature->sendSystemMessage("The incubation process has begun. It will require " + String::valueOf(delay) + " seconds to complete.");
	}
};

#endif /* INCUBATEPETSUICALLBACK_H_ */
