-- Legend of Hondo Merchant System
-- By R. Bassett Jr. (Tatwi) - www.tpot.ca
-- July 2017

local ObjectManager = require("managers.object.object_manager")

DolanSP = ScreenPlay:new {
	numberOfActs = 1, 	
	relations = { 
		{name="townsperson", npcStanding=-9000, priceAdjust=15}, -- Adjust price only
		{name="thug", npcStanding=-3000, priceAdjust=30}  -- Enemy
	},
	goods = {
		{optName="seeker", cost=15000, itemName="[50] Seeker Droid", crateSize=5, quality=1, altTemplate=0, items={"object/draft_schematic/droid/bounty_seeker_transmitter.iff"}}, 
		{optName="probe", cost=25000, itemName="[25] Arakyd Probe Droid", crateSize=5, quality=1, altTemplate=0, items={"object/draft_schematic/droid/bounty_probot_transmitter.iff"}},
		{optName="dz70", cost=17395, itemName="DZ-70 Companion Droid", crateSize=1, quality=150, altTemplate=0, items={"object/draft_schematic/droid/droid_dz70.iff"}}, 
		{optName="cus_kit", cost=250, itemName="Droid Customization Kit", crateSize=1, quality=1, altTemplate=0, items={"object/draft_schematic/droid/droid_customization_kit.iff"}},
		{optName="rep_kit", cost=1250, itemName="[60] Droid Repair Kit - Health", crateSize=5, quality=65, altTemplate=0, items={"object/draft_schematic/droid/droid_damage_repair_kit_a.iff"}},
	}
}


registerScreenPlay("DolanSP", true)

function DolanSP:start() 
	spawnMobile("tatooine", "dolan", 1, -13.6565, 1.13306, -9.60302, 66, 1256023) -- Mos Espa waypoint -3067 2048

end

dolan_convo_handler = Object:new {
	tstring = "myconversation"
 }

function dolan_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
	nextConversationScreen = MerchantSystem:nextConvoScreenInnards(conversationTemplate, conversingPlayer, selectedOption, DolanSP.relations, DolanSP.goods)
	
	return nextConversationScreen
end

function dolan_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
	conversationScreen = MerchantSystem:runScreenHandlerInnards(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen, DolanSP.relations, DolanSP.goods)
	
	return conversationScreen
end
