-- GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007

object_building_player_player_npc_commerce_guildhall_tatooine = object_building_player_shared_player_npc_commerce_guildhall_tatooine:new {
	lotSize = 5,
	baseMaintenanceRate = 65,
	allowedZones = {"corellia", "dantooine", "lok", "naboo", "rori", "talus", "tatooine"},
	publicStructure = 0,
	skillMods = {
		{"private_medical_rating", 100},
		{"private_buff_mind", 100},
		{"private_med_battle_fatigue", 5},
		{"private_safe_logout", 1}
	},
	childObjects = {
		{templateFile = "object/tangible/sign/player/house_address.iff", x = 3.3, z = 6.25, y = 18.0, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = 7.5738, z = 1.133, y = -3.13489, ox = 0, oy = 1, oz = 0, ow = 0, cellid = 4, containmentType = -1},
	},
	shopSigns = {
		{templateFile = "object/tangible/sign/player/house_address.iff", x = 3.3, z = 6.25, y = 18.0, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_address"},
		{templateFile = "object/tangible/sign/player/shop_sign_s01.iff", x = 3.3, z = 2.5, y = 18.3, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_01", suiItem = "@player_structure:shop_sign1"},
		{templateFile = "object/tangible/sign/player/shop_sign_s02.iff", x = 3.3, z = 2.5, y = 18.3, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_02", suiItem = "@player_structure:shop_sign2"},
		{templateFile = "object/tangible/sign/player/shop_sign_s03.iff", x = 3.3, z = 2.5, y = 18.3, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_03", suiItem = "@player_structure:shop_sign3"},
		{templateFile = "object/tangible/sign/player/shop_sign_s04.iff", x = 3.3, z = 2.5, y = 18.3, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_04", suiItem = "@player_structure:shop_sign4"},
	},
	constructionMarker = "object/building/player/construction/construction_player_house_tatooine_medium_style_01.iff",
	structureFootprintFileName = "footprint/building/player/shared_player_house_generic_medium_style_01.sfp",
	length = 3,
	width = 4
}

ObjectTemplates:addTemplate(object_building_player_player_npc_commerce_guildhall_tatooine, "object/building/player/player_npc_commerce_guildhall_tatooine.iff")
