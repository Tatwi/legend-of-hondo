-- GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007

object_building_player_player_npc_hospital_naboo = object_building_player_shared_player_npc_hospital_naboo:new {
	lotSize = 10,
	baseMaintenanceRate = 94,
	allowedZones = {"corellia", "dantooine", "lok", "naboo", "rori", "talus", "tatooine"},
	publicStructure = 0,
	skillMods = {
		{"private_medical_rating", 100},
		{"private_buff_mind", 100},
		{"private_med_battle_fatigue", 5},
		{"private_safe_logout", 1}
	},
	planetMapCategory = "medicalcenter",
	childObjects = {
		{templateFile = "object/tangible/sign/all_sign_street_s01.iff", x = 0, z = 0, y = 27.1, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = 33.65, z = 0.26, y = -1.57, ox = 0, oy = 0.707107, oz = 0, ow = -0.707107, cellid = 2, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator_up.iff", x = 0.122, z = 0.25, y = -2.16, ow = 0.906308, ox = 0, oy = 0.422618, oz = 0, cellid = 13, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator_up.iff", x = 0.14, z = 7.25, y = -2.19, ow = 0.915698, ox = 0, oy = 0.401868, oz = 0, cellid = 13, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator_down.iff", x = 0.29, z = 7.25, y = -2.34, ow = 0.944977, ox = 0, oy = 0.327135, oz = 0, cellid = 13, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator_down.iff", x = 0.29, z = 13.5, y = -2.34, ow = 0.906308, ox = 0, oy = 0.422618, oz = 0, cellid = 13, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator_up.iff", x = -0.14, z = 0.25, y = 2.24, ow = -0.390731, ox = 0, oy = 0.920505, oz = 0, cellid = 14, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator_up.iff", x = -0.13, z = 7.25, y = 2.18, ow = -0.423804, ox = 0, oy = 0.905754, oz = 0, cellid = 14, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator_down.iff", x = -0.29, z = 7.25, y = 2.34, ow = -0.303035, ox = 0, oy = 0.952979, oz = 0, cellid = 14, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator_down.iff", x = -0.29, z = 13.5, y = 2.34, ow = -0.390731, ox = 0, oy = 0.920505, oz = 0, cellid = 14, containmentType = -1}
	},
	shopSigns = {
		{templateFile = "object/tangible/sign/all_sign_street_s01.iff", x = 0, z = 0, y = 27.1, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_address"},
		{templateFile = "object/tangible/sign/player/shop_sign_s01.iff", x = 0, z = 0, y = 27.1, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_01", suiItem = "@player_structure:shop_sign1"},
		{templateFile = "object/tangible/sign/player/shop_sign_s02.iff", x = 0, z = 0, y = 27.1, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_02", suiItem = "@player_structure:shop_sign2"},
		{templateFile = "object/tangible/sign/player/shop_sign_s03.iff", x = 0, z = 0, y = 27.1, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_03", suiItem = "@player_structure:shop_sign3"},
		{templateFile = "object/tangible/sign/player/shop_sign_s04.iff", x = 0, z = 0, y = 27.1, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_04", suiItem = "@player_structure:shop_sign4"},
	},
	constructionMarker = "object/building/player/construction/construction_player_house_corellia_medium_style_01.iff",
	structureFootprintFileName = "footprint/building/player/shared_player_house_generic_medium_style_01.sfp",
	length = 3,
	width = 4
}

ObjectTemplates:addTemplate(object_building_player_player_npc_hospital_naboo, "object/building/player/player_npc_hospital_naboo.iff")


