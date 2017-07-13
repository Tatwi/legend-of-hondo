-- Legend of Hondo Merchant System
-- By R. Bassett Jr. (Tatwi) - www.tpot.ca
-- July 2015

local ObjectManager = require("managers.object.object_manager")

CrazyLarry = ScreenPlay:new {
	numberOfActs = 1, 	
	relations = { 
		{name="nym", npcStanding=-9000, priceAdjust=15}, -- Adjust price only
		{name="lok_mercenaries", npcStanding=-9000, priceAdjust=5}, -- Adjust price only
		{name="bloodrazor", npcStanding=-1000, priceAdjust=20},  -- Enemy
		{name="canyon_corsair", npcStanding=-1000, priceAdjust=20}  -- Enemy
	},
	goods = {
		{optName="kit", cost=1500, itemName="Customization Kit", items={"object/tangible/item/vehicle_customization.iff"}}, 
		{optName="x31", cost=12000, itemName="x31 Landspeeder", items={"object/tangible/deed/vehicle_deed/landspeeder_x31_deed.iff"}},
		{optName="x34", cost=24000, itemName="x34 Landspeeder", items={"object/tangible/deed/vehicle_deed/landspeeder_x34_deed.iff"}}, 
		{optName="speederbike", cost=28000, itemName="Speederbike", items={"object/tangible/deed/vehicle_deed/speederbike_deed.iff"}},
		{optName="swoop", cost=45000, itemName="Swoop Bike", items={"object/tangible/deed/vehicle_deed/speederbike_swoop_deed.iff"}},
		{optName="flash", cost=125000, itemName="Flash Landspeeder", items={"object/tangible/deed/vehicle_deed/speederbike_flash_deed.iff"}},
		{optName="av21", cost=355000, itemName="AV21 Landspeeder", items={"object/tangible/deed/vehicle_deed/landspeeder_av21_deed.iff"}},
	},
}


registerScreenPlay("CrazyLarry", true)

function CrazyLarry:start() 
	spawnMobile("tatooine", "crazylarry", 1, -2811.26, 5, 2161.16, 316, 0)
end

crazylarry_convo_handler = Object:new {
	tstring = "myconversation"
 }

function crazylarry_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
	nextConversationScreen = MerchantSystem:nextConvoScreenInnards(conversationTemplate, conversingPlayer, selectedOption, CrazyLarry.relations, CrazyLarry.goods)
	
	return nextConversationScreen
end

function crazylarry_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
	conversationScreen = MerchantSystem:runScreenHandlerInnards(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen, CrazyLarry.relations, CrazyLarry.goods)
	
	return conversationScreen
end
