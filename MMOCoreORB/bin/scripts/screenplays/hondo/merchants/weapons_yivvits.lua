-- Legend of Hondo Merchant System
-- By R. Bassett Jr. (Tatwi) - www.tpot.ca
-- July 2015

local ObjectManager = require("managers.object.object_manager")

YivvitsSP = ScreenPlay:new {
	numberOfActs = 1, 	
	relations = { 
		{name="townsperson", npcStanding=-9000, priceAdjust=15}, -- Adjust price only
		{name="thug", npcStanding=-3000, priceAdjust=30}  -- Enemy
	},
	goods = {
		{optName="bounty_hunter", cost=59950, itemName="Rifleman Lightning Rifle", crateSize=1, quality=65, altTemplate=0, items={"object/draft_schematic/weapon/rifle_lightning.iff"}}, 
		{optName="rifleman", cost=29950, itemName="Rifleman Laser Rifle", crateSize=1, quality=80, altTemplate=0, items={"object/draft_schematic/weapon/rifle_blaster_laser_rifle.iff"}},
		{optName="tka", cost=29950, itemName="Teras Kasi Artist Vibroknuckler", crateSize=1, quality=75, altTemplate=0, items={"object/draft_schematic/weapon/knuckler_vibro.iff"}}, 
		{optName="carbineer", cost=29950, itemName="Carbineer Laser Carbine", crateSize=1, quality=67, altTemplate=0, items={"object/draft_schematic/weapon/rifle_light_blaster_laser_carbine.iff"}},
		{optName="commando", cost=29950, itemName="Commando Launcher Pistol", crateSize=1, quality=67, altTemplate=0, items={"object/draft_schematic/weapon/pistol_launcher.iff"}},
		{optName="fencer", cost=29950, itemName="Fencer Ryyk Blade", crateSize=1, quality=80, altTemplate=0, items={"object/draft_schematic/weapon/sword_ryyk_blade.iff"}},
		{optName="pikeman", cost=29950, itemName="Pikeman Polearm", crateSize=1, quality=65, altTemplate=0, items={"object/draft_schematic/weapon/poleaxe_vibro.iff"}},
		{optName="pistoleer", cost=29950, itemName="Pistoleer Republic Blaster", crateSize=1, quality=70, altTemplate=0, items={"object/draft_schematic/weapon/pistol_republic_blaster.iff"}},
		{optName="swordsman", cost=29950, itemName="Swordsman Vibroaxe", crateSize=1, quality=68, altTemplate=0, items={"object/draft_schematic/weapon/axe_vibro.iff"}}
	}
}


registerScreenPlay("YivvitsSP", true)

function YivvitsSP:start() 
	spawnMobile("tatooine", "yivvits", 1, -2.34, 1.13, -12.11, 43, 1256022 ) -- Mos Espa waypoint -3056 2049
end

yivvits_convo_handler = Object:new {
	tstring = "myconversation"
 }

function yivvits_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
	nextConversationScreen = MerchantSystem:nextConvoScreenInnards(conversationTemplate, conversingPlayer, selectedOption, YivvitsSP.relations, YivvitsSP.goods)
	
	return nextConversationScreen
end

function yivvits_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
	conversationScreen = MerchantSystem:runScreenHandlerInnards(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen, YivvitsSP.relations, YivvitsSP.goods)
	
	return conversationScreen
end
