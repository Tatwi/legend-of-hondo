-- Legend of Hondo Merchant System
-- By R. Bassett Jr. (Tatwi) - www.tpot.ca
-- July 2015

local ObjectManager = require("managers.object.object_manager")

VolrikLonugsSP = ScreenPlay:new {
	numberOfActs = 1, 	
	relations = { 
		{name="meatlump", npcStanding=-9000, priceAdjust=15}, -- Adjust price only
		{name="townsperson", npcStanding=-9000, priceAdjust=12}, -- Adjust price only
	},
	goods = {
		{optName="armor_human", cost=10000, itemName="Humanoids - Bone Armor Suit", items={
			"object/tangible/wearables/armor/bone/armor_bone_s01_bicep_l.iff",
			"object/tangible/wearables/armor/bone/armor_bone_s01_bicep_r.iff",
			"object/tangible/wearables/armor/bone/armor_bone_s01_boots.iff",
			"object/tangible/wearables/armor/bone/armor_bone_s01_bracer_l.iff",
			"object/tangible/wearables/armor/bone/armor_bone_s01_bracer_r.iff",
			"object/tangible/wearables/armor/bone/armor_bone_s01_chest_plate.iff",
			"object/tangible/wearables/armor/bone/armor_bone_s01_gloves.iff",
			"object/tangible/wearables/armor/bone/armor_bone_s01_helmet.iff",
			"object/tangible/wearables/armor/bone/armor_bone_s01_leggings.iff",
			}
		}, 
		{optName="armor_wookiee", cost=10000, itemName="Wookiees - Black Mountain Suit", items={
			"object/tangible/wearables/armor/kashyyykian_black_mtn/armor_kashyyykian_black_mtn_bracer_l.iff",
			"object/tangible/wearables/armor/kashyyykian_black_mtn/armor_kashyyykian_black_mtn_bracer_r.iff",
			"object/tangible/wearables/armor/kashyyykian_black_mtn/armor_kashyyykian_black_mtn_chest_plate.iff",
			"object/tangible/wearables/armor/kashyyykian_black_mtn/armor_kashyyykian_black_mtn_leggings.iff",
			}
		},
		{optName="armor_ithorian", cost=10000, itemName="Ithorians - Defender Suit", items={
			"object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_bicep_l.iff",
			"object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_bicep_r.iff",
			"object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_boots.iff",
			"object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_bracer_l.iff",
			"object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_bracer_r.iff",
			"object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_chest_plate.iff",
			"object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_gloves.iff",
			"object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_helmet.iff",
			"object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_leggings.iff",
			}
		}, 
	},
}


registerScreenPlay("VolrikLonugsSP", true)

function VolrikLonugsSP:start() 
	spawnMobile("tatooine", "volrik_lonugs", 1, -14.99, 1.13, -0.46, 83, 1256020 ) -- Mos Espa waypoint -3072 2056
end

volriklonugs_convo_handler = Object:new {
	tstring = "myconversation"
 }

function volriklonugs_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
	nextConversationScreen = MerchantSystem:nextConvoScreenInnards(conversationTemplate, conversingPlayer, selectedOption, VolrikLonugsSP.relations, VolrikLonugsSP.goods)
	
	return nextConversationScreen
end

function volriklonugs_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
	conversationScreen = MerchantSystem:runScreenHandlerInnards(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen, VolrikLonugsSP.relations, VolrikLonugsSP.goods)
	
	return conversationScreen
end