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
		{optName="bounty_hunter", cost=5000, itemName="Bounty Hunter Rifle", items={"object/weapon/ranged/rifle/rifle_lightning.iff"}}, 
		{optName="rifleman", cost=5000, itemName="Rifleman Laser Rifle", items={"object/weapon/ranged/rifle/rifle_laser_noob.iff"}},
		{optName="tka", cost=5000, itemName="Teras Kasi Artist Vibroknuckler", items={"object/weapon/melee/special/vibroknuckler.iff"}}, 
		{optName="carbineer", cost=5000, itemName="Carbineer Laser Carbine", items={"object/weapon/ranged/carbine/carbine_laser.iff"}},
		{optName="commando", cost=5000, itemName="Commando Launcher Pistol", items={"object/weapon/ranged/pistol/pistol_launcher.iff"}},
		{optName="fencer", cost=5000, itemName="Fencer Ryyk Blade", items={"object/weapon/melee/sword/sword_blade_ryyk.iff"}},
		{optName="pikeman", cost=5000, itemName="Pikeman Polearm", items={"object/weapon/melee/polearm/polearm_vibro_axe.iff"}},
		{optName="pistoleer", cost=5000, itemName="Pistoleer Republic Blaster", items={"object/weapon/ranged/pistol/pistol_republic_blaster.iff"}},
		{optName="swordsman", cost=5000, itemName="Swordsman Vibroaxe", items={"object/weapon/melee/axe/axe_vibroaxe.iff"}}
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