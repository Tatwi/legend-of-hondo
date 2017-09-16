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
		
		// Magic starts here!
		String purFocus = "";
		String purCombo = "";
		String mutFocus = "";
		String mutCombo = "";
		
		// Stage 1 Focus: level, speed, hit, dmgMin, dmgMax
		// Stage 2 Focus: level, armorRating, special1, special2, ranged
		// Stage 3 Focus: health, action, mind, kinetic, energy	
		for (int s = 0; s < 3; s++) {
			float mutBonus = 5.f; // Unused colour combos
			float purBonus = 5.f; // get a 5% bonus
			float chance = 0.f;
			float dur = 0.f;
			float temp = 0.f;
			String modStat = "";
			
			// Set stage specific data
			if (s == 0){
				purFocus = "OY-RG-YG-OV-YB";
				purCombo = s1i + s1l;
				mutFocus = "VY-GV-RB-GY-BV";
				mutCombo = s1h + s1l;
				dur = s1d;
				temp = s1t;
			} else if (s == 1){
				purFocus = "OY-BO-VY-VG-YO";
				purCombo = s2i + s2l;
				mutFocus = "VY-GO-BG-RV-YO";
				mutCombo = s2h + s2l;
				dur = s2d;
				temp = s1t;
			} if (s == 2){
				purFocus = "GR-GG-GB-OG-VR";
				purCombo = s3i + s3l;
				mutFocus = "VR-VG-VB-BO-VO";
				mutCombo = s3h + s3l;
				dur = s3d;
				temp = s1t;
			}
			
			// Does input contain purity focus?
			if (purFocus.contains(purCombo))
				purBonus = 25.f;
			
			// Does input contain mutation focus?
			if (mutFocus.contains(mutCombo))
				mutBonus = 15.5f;
				
			// Purity success (100 + 45 + 25 + 50 / 2 = 110% Max)
			float durmod = dur * 10.f;
			chance = (purity + toolQuality + purBonus + durmod) / 2;
			
			if (chance > System::random(100)){
				creature->sendSystemMessage("Stage " + String::valueOf(s+1) + " Purity based stat change!");

				if (purBonus > 5){
					// Mod stat player specified
					modStat = purComboToStat(purCombo);
				} else {
					// Mod random stat
					modStat = pickStat(temp);
				}
				
				// debug testing
				creature->sendSystemMessage("Purity stat chosen: " + modStat);
			}
			
			// Mutation success (100 + 22.5 + 15.5 + 10 / 3 = 49.33% Max)
			if (dur < 4){
				durmod = 10.f * 1/dur;
			} else {
				durmod = 0.f;
			}
				
			chance = (mutagen + toolQuality/2 + mutBonus + durmod) / 3;
			
			if (chance > System::random(100)){
				creature->sendSystemMessage("Stage " + String::valueOf(s+1) + " Mutation!");
				
				if (mutBonus > 5){
					// Mod stat player specified
					modStat = mutComboToStat(mutCombo);
				} else {
					// Mod random stat
					modStat = pickStat(temp);
				}
				
				// debug testing
				creature->sendSystemMessage("Mutation stat chosen: " + modStat);
			}
		}
		
		// debug testing
		creature->sendSystemMessage("Tested with: " + fullSequence);
		return; 
		// */
	
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
	
	String pickStat(int temp){
		String ret = "NULL";
		int roll = System::random(19) + 1;
		
		// Lower temp skews toward defenses
		if (temp == 1)
			roll -= 3;
		if (temp == 2)
			roll -= 1;
		// Neutral more likely to get level/HAM/kinetic
		if (temp == 3)
			roll = System::random(4) + 1;
		// Higher temps skews toward offenses
		if (temp == 4)
			roll += 1;
		if (temp == 5)
			roll += 3;
			
		roll = MIN(20, roll);
		roll = MAX(1, roll);
			
		if (roll == 1){ret = "level";}
		else if (roll == 2){ret = "health";}
		else if (roll == 3){ret = "action";}
		else if (roll == 4){ret = "mind";}
		else if (roll == 5){ret = "kinetic";}
		else if (roll == 6){ret = "stun";}
		else if (roll == 7){ret = "blast";}
		else if (roll == 8){ret = "cold";}
		else if (roll == 9){ret = "heat";}
		else if (roll == 10){ret = "elec";}
		else if (roll == 11){ret = "acid";}
		else if (roll == 12){ret = "energy";}
		else if (roll == 13){ret = "saber";}
		else if (roll == 14){ret = "armorRating";}
		else if (roll == 15){ret = "special1";}
		else if (roll == 16){ret = "speed";}
		else if (roll == 17){ret = "hit";}
		else if (roll == 18){ret = "dmgMax";}
		else if (roll == 19){ret = "dmgMin";}
		else if (roll == 20){ret = "special2";}
		
		return ret;
	}
	
	String purComboToStat(String combo){
		String ret = "NULL";
		
		if (combo.contains("OY")){ret = "level";}
		else if (combo.contains("RG")){ret = "speed";}
		else if (combo.contains("YG")){ret = "hit";}
		else if (combo.contains("GR")){ret = "health";}
		else if (combo.contains("GG")){ret = "action";}
		else if (combo.contains("GB")){ret = "mind";}
		else if (combo.contains("OV")){ret = "dmgMin";}
		else if (combo.contains("YB")){ret = "dmgMax";}
		else if (combo.contains("OG")){ret = "kinetic";}
		else if (combo.contains("VR")){ret = "energy";}
		else if (combo.contains("OR")){ret = "blast";}
		else if (combo.contains("GV")){ret = "cold";}
		else if (combo.contains("BG")){ret = "heat";}
		else if (combo.contains("VB")){ret = "elec";}
		else if (combo.contains("RB")){ret = "acid";}	
		else if (combo.contains("YY")){ret = "stun";}
		else if (combo.contains("RR")){ret = "saber";}
		else if (combo.contains("BO")){ret = "armorRating";}
		else if (combo.contains("VY")){ret = "special1";}
		else if (combo.contains("VG")){ret = "special2";}
		
		return ret;
	}

	String mutComboToStat(String combo){
		String ret = "NULL";
		
		if (combo.contains("VY")){ret = "level";}
		else if (combo.contains("GV")){ret = "speed";}
		else if (combo.contains("RB")){ret = "hit";}
		else if (combo.contains("VR")){ret = "health";}
		else if (combo.contains("VG")){ret = "action";}
		else if (combo.contains("VB")){ret = "mind";}
		else if (combo.contains("GY")){ret = "dmgMin";}
		else if (combo.contains("BV")){ret = "dmgMax";}
		else if (combo.contains("BO")){ret = "kinetic";}
		else if (combo.contains("VO")){ret = "energy";}
		else if (combo.contains("YY")){ret = "blast";}
		else if (combo.contains("RY")){ret = "cold";}
		else if (combo.contains("OO")){ret = "heat";}
		else if (combo.contains("GG")){ret = "elec";}
		else if (combo.contains("OB")){ret = "acid";}	
		else if (combo.contains("YB")){ret = "stun";}
		else if (combo.contains("BB")){ret = "saber";}
		else if (combo.contains("GO")){ret = "armorRating";}
		else if (combo.contains("BG")){ret = "special1";}
		else if (combo.contains("RV")){ret = "special2";}
		
		return ret;
	}
};

#endif /* INCUBATEPETSUICALLBACK_H_ */
