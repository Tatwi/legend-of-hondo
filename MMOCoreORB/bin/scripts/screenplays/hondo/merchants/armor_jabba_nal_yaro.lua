-- Legend of Hondo Merchant System
-- By R. Bassett Jr. (Tatwi) - www.tpot.ca
-- July 2015

local ObjectManager = require("managers.object.object_manager")

NalYaroSP = ScreenPlay:new {
	numberOfActs = 1, 	
	relations = { 
		{name="jabba", npcStanding=3500, priceAdjust=5}, -- Friend
		{name="borvo", npcStanding=-4000, priceAdjust=5}, -- Enemy
		{name="valarian", npcStanding=-200, priceAdjust=10}, -- Enemy
		{name="hutt", npcStanding=-200, priceAdjust=10}, -- Enemy
	},
	goods = {
		{optName="armor_human", cost=45000, itemName="Humanoids - Composite Armor Suit", items={
			"object/tangible/wearables/armor/composite/armor_composite_bicep_l.iff",
			"object/tangible/wearables/armor/composite/armor_composite_bicep_r.iff",
			"object/tangible/wearables/armor/composite/armor_composite_boots.iff",
			"object/tangible/wearables/armor/composite/armor_composite_bracer_l.iff",
			"object/tangible/wearables/armor/composite/armor_composite_bracer_r.iff",
			"object/tangible/wearables/armor/composite/armor_composite_chest_plate.iff",
			"object/tangible/wearables/armor/composite/armor_composite_gloves.iff",
			"object/tangible/wearables/armor/composite/armor_composite_helmet.iff",
			"object/tangible/wearables/armor/composite/armor_composite_leggings.iff"
			}
		}, 
		{optName="armor_wookiee", cost=45000, itemName="Wookiees - Black Mountain Suit", items={
			"object/tangible/wearables/armor/kashyyykian_ceremonial/armor_kashyyykian_ceremonial_bracer_l.iff",
			"object/tangible/wearables/armor/kashyyykian_ceremonial/armor_kashyyykian_ceremonial_bracer_r.iff",
			"object/tangible/wearables/armor/kashyyykian_ceremonial/armor_kashyyykian_ceremonial_chest_plate.iff",
			"object/tangible/wearables/armor/kashyyykian_ceremonial/armor_kashyyykian_ceremonial_leggings.iff"
			}
		},
		{optName="armor_ithorian", cost=45000, itemName="Ithorians - Defender Suit", items={
			"object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_bicep_l.iff",
			"object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_bicep_r.iff",
			"object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_boots.iff",
			"object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_bracer_l.iff",
			"object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_bracer_r.iff",
			"object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_chest_plate.iff",
			"object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_gloves.iff",
			"object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_helmet.iff",
			"object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_leggings.iff"
			}
		}, 
	},
}


registerScreenPlay("NalYaroSP", true)

function NalYaroSP:start() 
	spawnMobile("tatooine", "nal_yaro", 1, -27.21, -0.89, 1.99, 101, 1134568) -- Wayfar waypoint -5199 -6571
end

nalyaro_convo_handler = Object:new {
	tstring = "myconversation"
 }

function nalyaro_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
	nextConversationScreen = MerchantSystem:nextConvoScreenInnards(conversationTemplate, conversingPlayer, selectedOption, NalYaroSP.relations, NalYaroSP.goods)
	
	return nextConversationScreen
end

function nalyaro_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
	conversationScreen = MerchantSystem:runScreenHandlerInnards(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen, NalYaroSP.relations, NalYaroSP.goods)
	
	return conversationScreen
end