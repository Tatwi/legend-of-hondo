-- Legend of Hondo Merchant System
-- By R. Bassett Jr. (Tatwi) - www.tpot.ca
-- July 2015

local ObjectManager = require("managers.object.object_manager")

CyanYaroSP = ScreenPlay:new {
	numberOfActs = 1, 	
	relations = { 
		{name="jabba", npcStanding=5000, priceAdjust=15}, -- Friend
		{name="mtn_clan", npcStanding=-9000, priceAdjust=5}, -- Price Adjust Only
		{name="borvo", npcStanding=-4000, priceAdjust=5}, -- Enemy
		{name="valarian", npcStanding=-200, priceAdjust=10}, -- Enemy
		{name="hutt", npcStanding=-200, priceAdjust=10}, -- Enemy
	},
	goods = {
		{optName="mabari", cost=10000, itemName="Mabari Armor Suit", items={
			"object/tangible/wearables/armor/zam/armor_zam_wesell_helmet.iff",
			"object/tangible/wearables/armor/zam/armor_zam_wesell_chest_plate.iff",
			"object/tangible/wearables/armor/zam/armor_zam_wesell_gloves.iff",
			"object/tangible/wearables/armor/zam/armor_zam_wesell_pants.iff",
			"object/tangible/wearables/armor/zam/armor_zam_wesell_boots.iff"
			}
		}, 
		{optName="bounty_hunter", cost=175000, itemName="Bounty Hunter Armor", items={
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_bicep_l.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_bicep_r.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_boots.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_bracer_l.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_bracer_r.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_chest_plate.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_gloves.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_helmet.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_leggings.iff"
			}
		}, 
	},
}


registerScreenPlay("CyanYaroSP", true)

function CyanYaroSP:start() 
	spawnMobile("tatooine", "cyan_yaro", 1, -26.29, -0.89, -1.46, 40, 1134568) -- Wayfar waypoint -5198 -6575
end

cyanyaro_convo_handler = Object:new {
	tstring = "myconversation"
 }

function cyanyaro_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
	nextConversationScreen = MerchantSystem:nextConvoScreenInnards(conversationTemplate, conversingPlayer, selectedOption, CyanYaroSP.relations, CyanYaroSP.goods)
	
	return nextConversationScreen
end

function cyanyaro_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
	conversationScreen = MerchantSystem:runScreenHandlerInnards(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen, CyanYaroSP.relations, CyanYaroSP.goods)
	
	return conversationScreen
end