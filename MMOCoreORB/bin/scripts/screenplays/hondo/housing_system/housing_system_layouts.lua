-- Site Layouts
-- These are the available templates for a site.
-- All values in this file are x,y offsets from the center point of a site.
--
-- I suggest using the "simple" zone at 0,0 to make your own layouts, as it's really easy to detemrine the x,y co-ordinates. FYI: Seems that waypoints don't work in this zone.
-- The final product will not be 100% in the same x,y position as you put in here, due to the inaccuracy of the angle value, but it's so close you most likely will not notice the difference.
-- If want a layout that's the same as an existing one, but with different buildings or prices, just copy/paste/rename/modify to make a new layout for it. More layouts = more options!
--
-- nameOut = Building doors face away from each other, with minimal back yards between them.
-- nameIn = Buildings doors face each other, with a courtyard or ally between them, backs toward the outside.
-- localRotation = orientation of the building relative to the site center.
-- rotationFudge = some buildings have a default rotation that is 90 or 180 different than most, so use this to fix such inconsistencies.
-- zoning = 0 for residential, 1 business - This is something I will be using in Legend of Hondo later on.
--
-- singleType = These aren't as efficient, because they have 1 terminal per building, but they are great for replacing buildings in NPC cities. (Delete snapshot building, put one of these sites in its place)

layouts = {
	singleSmall = {
		terminal = {name = "Small City Lot", x = 0, y = 12.8, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Single Small Structure", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1", template = "object/building/player/player_house_corellia_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2", template = "object/building/player/player_house_corellia_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1", template = "object/building/player/player_house_generic_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1 Floorplan 2", template = "object/building/player/player_house_generic_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2", template = "object/building/player/player_house_generic_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2 Floorplan 2", template = "object/building/player/player_house_generic_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Naboo: Small Style 1 (Round)", template = "object/building/player/player_house_naboo_small_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 15000, buildingName = "Naboo: Small Style 2", template = "object/building/player/player_house_naboo_small_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Gray", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Clothing and Armor", template = "object/installation/manufacture/clothing_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Food and Chemical", template = "object/installation/manufacture/food_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Equipment and Weapons", template = "object/installation/manufacture/weapon_factory.iff", zoning = 0},
					{price = 25000, buildingName = "Bank: Corellia (Small)", template = "object/building/player/city/bank_corellia.iff", zoning = 0},
					{price = 25000, buildingName = "Bank: Naboo (Small)", template = "object/building/player/city/bank_naboo.iff", zoning = 0},
					{price = 25000, buildingName = "Bank: Tatooine (Small)", template = "object/building/player/city/bank_tatooine.iff", zoning = 0},
					{price = 25000, buildingName = "Garage: Corellia (Small)", template = "object/building/player/player_garage_corellia_style_01.iff", zoning = 0},
					{price = 25000, buildingName = "Garage: Naboo (Small)", template = "object/building/player/player_garage_naboo_style_01.iff", zoning = 0},
					{price = 25000, buildingName = "Garage: Tatooine (Small)", template = "object/building/player/player_garage_tatooine_style_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 1", template = "object/building/player/city/garden_corellia_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 2", template = "object/building/player/city/garden_corellia_sml_02.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 3", template = "object/building/player/city/garden_corellia_sml_03.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 4", template = "object/building/player/city/garden_corellia_sml_04.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 5", template = "object/building/player/city/garden_corellia_sml_05.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Dantooine Small 1", template = "object/building/player/city/garden_dantooine_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Dathomir Small 1", template = "object/building/player/city/garden_dathomir_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Endor Small 1", template = "object/building/player/city/garden_endor_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Naboo Small 2", template = "object/building/player/city/garden_naboo_sml_02.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Naboo Small 3", template = "object/building/player/city/garden_naboo_sml_03.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Naboo Small 4", template = "object/building/player/city/garden_naboo_sml_04.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Naboo Small 5", template = "object/building/player/city/garden_naboo_sml_05.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Tatooine Small 1", template = "object/building/player/city/garden_tatooine_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Tatooine Small 2", template = "object/building/player/city/garden_tatooine_sml_02.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Tatooine Small 3", template = "object/building/player/city/garden_tatooine_sml_03.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Tatooine Small 4", template = "object/building/player/city/garden_tatooine_sml_04.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Tatooine Small 5", template = "object/building/player/city/garden_tatooine_sml_05.iff", zoning = 0},
				},
			},
		},
	},

	singleMedium = {
		terminal = {name = "Medium City Lot", x = 0, y = 16.4, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Single Medium Structure", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 125000, buildingName = "Factory: Structure and Starship", template = "object/installation/manufacture/structure_factory.iff", zoning = 0, rotationFudge = 90},
					{price = 18000, buildingName = "Garden: Corellia Medium 1", template = "object/building/player/city/garden_corellia_med_01.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Corellia Medium 2", template = "object/building/player/city/garden_corellia_med_02.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Corellia Medium 3", template = "object/building/player/city/garden_corellia_med_03.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Corellia Medium 4", template = "object/building/player/city/garden_corellia_med_04.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Corellia Medium 5", template = "object/building/player/city/garden_corellia_med_05.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Dantooine Medium 1", template = "object/building/player/city/garden_dantooine_med_01.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Dathomir Medium 1", template = "object/building/player/city/garden_dathomir_med_01.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Endor Medium 1", template = "object/building/player/city/garden_endor_med_01.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Naboo Medium 2", template = "object/building/player/city/garden_naboo_med_02.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Naboo Medium 3", template = "object/building/player/city/garden_naboo_med_03.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Naboo Medium 4", template = "object/building/player/city/garden_naboo_med_04.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Naboo Medium 5", template = "object/building/player/city/garden_naboo_med_05.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Tatooine Medium 1", template = "object/building/player/city/garden_tatooine_med_01.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Tatooine Medium 2", template = "object/building/player/city/garden_tatooine_med_02.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Tatooine Medium 3", template = "object/building/player/city/garden_tatooine_med_03.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Tatooine Medium 4", template = "object/building/player/city/garden_tatooine_med_04.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Tatooine Medium 5", template = "object/building/player/city/garden_tatooine_med_05.iff", zoning = 0},
				},
			},
		},
	},

	singleLarge = {
		terminal = {name = "Large City Lot", x = 0, y = 20, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Single Large Structure", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 175000, buildingName = "Tatooine: Large Style 1", template = "object/building/player/player_house_tatooine_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Tatooine: Large Style 2", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 175000, buildingName = "Corellia: Large Style 1", template = "object/building/player/player_house_corellia_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Corellia: Large Style 2", template = "object/building/player/player_house_corellia_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 1", template = "object/building/player/player_house_generic_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 2", template = "object/building/player/player_house_generic_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Naboo: Large Style 1", template = "object/building/player/player_house_naboo_large_style_01.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Corellia Player Style", template = "object/building/player/city/cantina_corellia.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Naboo Player Style", template = "object/building/player/city/cantina_naboo.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Tatooine Player Style", template = "object/building/player/city/cantina_tatooine.iff", zoning = 0},
					{price = 65000, buildingName = "Cloning Facility: Corellia (Small)", template = "object/building/player/city/cloning_corellia.iff", zoning = 0, rotationFudge = -90},
					{price = 65000, buildingName = "Cloning Facility: Naboo (Small)", template = "object/building/player/city/cloning_naboo.iff", zoning = 0, rotationFudge = -90},
					{price = 65000, buildingName = "Cloning Facility: Tatooine (Small)", template = "object/building/player/city/cloning_tatooine.iff", zoning = 0, rotationFudge = -90},
					{price = 35000, buildingName = "Garden: Corellia Large 1", template = "object/building/player/city/garden_corellia_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 2", template = "object/building/player/city/garden_corellia_lrg_02.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 3", template = "object/building/player/city/garden_corellia_lrg_03.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 4", template = "object/building/player/city/garden_corellia_lrg_04.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 5", template = "object/building/player/city/garden_corellia_lrg_05.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Dantooine Large 1", template = "object/building/player/city/garden_dantooine_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Dathomir Large 1", template = "object/building/player/city/garden_dathomir_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Endor Large 1", template = "object/building/player/city/garden_endor_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 1", template = "object/building/player/city/garden_naboo_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 2", template = "object/building/player/city/garden_naboo_lrg_02.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 3", template = "object/building/player/city/garden_naboo_lrg_03.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 4", template = "object/building/player/city/garden_naboo_lrg_04.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 5", template = "object/building/player/city/garden_naboo_lrg_05.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 1", template = "object/building/player/city/garden_tatooine_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 2", template = "object/building/player/city/garden_tatooine_lrg_02.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 3", template = "object/building/player/city/garden_tatooine_lrg_03.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 4", template = "object/building/player/city/garden_tatooine_lrg_04.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 5", template = "object/building/player/city/garden_tatooine_lrg_05.iff", zoning = 0},
					{price = 798000, buildingName = "Bunker: Large", template = "object/building/player/player_npc_bunker_large.iff", zoning = 0},
					{price = 565000, buildingName = "Bunker: Medium", template = "object/building/player/player_npc_bunker_medium.iff", zoning = 0},
					{price = 225000, buildingName = "Bunker: Small", template = "object/building/player/player_npc_bunker_small.iff", zoning = 0},
				},
			},
		},
	},
	
	tatooineTavern = {
		terminal = {name = "Large City Lot", x = 0, y = 13, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Single Large Structure", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 175000, buildingName = "Tatooine: Tavern", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
		},
	},
	
	pirateBunker = {
		terminal = {name = "Base of Operations", x = 3.5, y = 12.4, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Your Personal Pirate Bunker", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 675899, buildingName = "Bunker: Small", template = "object/building/player/player_npc_bunker_small.iff", zoning = 0},
					{price = 1250389, buildingName = "Bunker: Medium", template = "object/building/player/player_npc_bunker_medium.iff", zoning = 0},
					{price = 4997895, buildingName = "Bunker: Large", template = "object/building/player/player_npc_bunker_large.iff", zoning = 0},
				},
			},
		},
	},

	singleLargeLong = {
		terminal = {name = "Mos Epsa Collegiate", x = -14, y = 34.7, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Single Large Long Structure", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 199000, buildingName = "University: Tatooine", template = "object/building/tatooine/guild_university_tatooine_style_01.iff", zoning = 0},
					{price = 199000, buildingName = "University: Corellia", template = "object/building/player/player_npc_university_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "University: Naboo", template = "object/building/player/player_npc_university_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Corellia", template = "object/building/player/player_npc_combat_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Naboo", template = "object/building/player/player_npc_combat_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Tatooine", template = "object/building/player/player_npc_combat_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Corellia", template = "object/building/player/player_npc_commerce_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Naboo", template = "object/building/player/player_npc_commerce_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Tatooine", template = "object/building/player/player_npc_commerce_guildhall_tatooine.iff", zoning = 0},
				},
			},
		},
	},

	singleLargeWide = {
		terminal = {name = "Single Wide City Lot", x = 0, y = 22.5, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Single Large Wide Structure", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 650000, buildingName = "Cloning Facility: Tatooine Large", template = "object/building/tatooine/cloning_facility_tatooine.iff", zoning = 0},
					{price = 650000, buildingName = "Cloning Facility: Corellia Large", template = "object/building/corellia/cloning_corellia.iff", zoning = 0},
					{price = 650000, buildingName = "Cloning Facility: Naboo Large", template = "object/building/player/city/cloning_naboo.iff", zoning = 0},
				},
			},
		},
	},

	singleHuge = {
		terminal = {name = "Single Huge City Lot", x = 0, y = 49.5, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Single Huge Structure", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 265000, buildingName = "Cantina - Tatooine NPC Style", template = "object/building/player/player_npc_cantina_tatooine.iff", zoning = 0, rotationFudge = 90},
					{price = 265000, buildingName = "Cantina - Corellia NPC Style", template = "object/building/player/player_npc_cantina_corellia.iff", zoning = 0, rotationFudge = 90},
					{price = 265000, buildingName = "Cantina - Naboo NPC Style", template = "object/building/player/player_npc_cantina_naboo.iff", zoning = 0, rotationFudge = 90},
					{price = 195000, buildingName = "City Hall: Corellia Player Style", template = "object/building/player/city/cityhall_corellia.iff", zoning = 0},
					{price = 195000, buildingName = "City Hall: Naboo Player Style", template = "object/building/player/city/cityhall_naboo.iff", zoning = 0},
					{price = 195000, buildingName = "City Hall: Tatooine Player Style", template = "object/building/player/city/cityhall_tatooine.iff", zoning = 0},
					{price = 265000, buildingName = "Theatre - Corellia NPC Style", template = "object/building/player/player_npc_theater_corellia.iff", zoning = 0, rotationFudge = 180},
					{price = 265000, buildingName = "Theatre - Naboo NPC Style", template = "object/building/player/player_npc_theater_naboo.iff", zoning = 0, rotationFudge = 180},
					{price = 265000, buildingName = "Theatre - Tatooine NPC Style", template = "object/building/player/player_npc_theater_tatooine.iff", zoning = 0, rotationFudge = 180},
					{price = 265000, buildingName = "Hotel - Corellia Large NPC Style", template = "object/building/player/player_npc_hotel_corellia.iff", zoning = 0},
					{price = 265000, buildingName = "Hotel - Naboo Large NPC Style", template = "object/building/player/player_npc_hotel_naboo.iff", zoning = 0},
					{price = 265000, buildingName = "Hotel - Tatooine Large NPC Style", template = "object/building/player/player_npc_hotel_tatooine.iff", zoning = 0},
				},
			},
		},
	},

	singleHugest = {
		terminal = {name = "Single Huge City Lot", x = 0, y = 63.25, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Single Huge Structure", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 435000, buildingName = "Capitol: Tatooine", template = "object/building/player/player_npc_capitol_tatooine.iff", zoning = 0},
					{price = 435000, buildingName = "Capitol: Corellia", template = "object/building/player/player_npc_capitol_corellia.iff", zoning = 0},
					{price = 435000, buildingName = "Capitol: Naboo", template = "object/building/player/player_npc_capitol_naboo.iff", zoning = 0},
					{price = 395000, buildingName = "Hospital - Corellia Large NPC Style", template = "object/building/player/player_npc_hospital_corellia.iff", zoning = 0, rotationFudge = 90},
					{price = 395000, buildingName = "Hospital - Naboo Large NPC Style", template = "object/building/player/player_npc_hospital_naboo.iff", zoning = 0, rotationFudge = 90},
					{price = 395000, buildingName = "Hospital - Tatooine Large NPC Style", template = "object/building/player/player_npc_hospital_tatooine.iff", zoning = 0, rotationFudge = 90},
				},
			},
		},
	},

	smallFourOut = {
		terminal = {name = "Small Housing Block", x = 0, y = 23.2, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Small House (Your Left)", x = 9, y = 9, localRotation = 0,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1", template = "object/building/player/player_house_corellia_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2", template = "object/building/player/player_house_corellia_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1", template = "object/building/player/player_house_generic_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1 Floorplan 2", template = "object/building/player/player_house_generic_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2", template = "object/building/player/player_house_generic_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2 Floorplan 2", template = "object/building/player/player_house_generic_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Naboo: Small Style 1 (Round)", template = "object/building/player/player_house_naboo_small_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 15000, buildingName = "Naboo: Small Style 2", template = "object/building/player/player_house_naboo_small_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Gray", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Small House (Your Right)", x = -9, y = 9, localRotation = 0,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1", template = "object/building/player/player_house_corellia_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2", template = "object/building/player/player_house_corellia_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1", template = "object/building/player/player_house_generic_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1 Floorplan 2", template = "object/building/player/player_house_generic_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2", template = "object/building/player/player_house_generic_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2 Floorplan 2", template = "object/building/player/player_house_generic_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Naboo: Small Style 1 (Round)", template = "object/building/player/player_house_naboo_small_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 15000, buildingName = "Naboo: Small Style 2", template = "object/building/player/player_house_naboo_small_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Gray", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Small House (Your Left)", x = 9, y = -9, localRotation = 180,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1", template = "object/building/player/player_house_corellia_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2", template = "object/building/player/player_house_corellia_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1", template = "object/building/player/player_house_generic_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1 Floorplan 2", template = "object/building/player/player_house_generic_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2", template = "object/building/player/player_house_generic_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2 Floorplan 2", template = "object/building/player/player_house_generic_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Naboo: Small Style 1 (Round)", template = "object/building/player/player_house_naboo_small_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 15000, buildingName = "Naboo: Small Style 2", template = "object/building/player/player_house_naboo_small_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Gray", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Small House (Your Right)", x = -9, y = -9, localRotation = 180,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1", template = "object/building/player/player_house_corellia_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2", template = "object/building/player/player_house_corellia_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1", template = "object/building/player/player_house_generic_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1 Floorplan 2", template = "object/building/player/player_house_generic_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2", template = "object/building/player/player_house_generic_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2 Floorplan 2", template = "object/building/player/player_house_generic_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Naboo: Small Style 1 (Round)", template = "object/building/player/player_house_naboo_small_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 15000, buildingName = "Naboo: Small Style 2", template = "object/building/player/player_house_naboo_small_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Gray", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
				},
			},
		},
	},

	smallFourIn = {
			terminal = {name = "Small Housing Community", x = 0, y = 24, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Small House (Your Left)", x = 11, y = 14, localRotation = 180,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1", template = "object/building/player/player_house_corellia_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2", template = "object/building/player/player_house_corellia_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1", template = "object/building/player/player_house_generic_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1 Floorplan 2", template = "object/building/player/player_house_generic_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2", template = "object/building/player/player_house_generic_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2 Floorplan 2", template = "object/building/player/player_house_generic_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Naboo: Small Style 1 (Round)", template = "object/building/player/player_house_naboo_small_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 15000, buildingName = "Naboo: Small Style 2", template = "object/building/player/player_house_naboo_small_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Gray", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Small House (Your Right)", x = -11, y = 14, localRotation = 180,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1", template = "object/building/player/player_house_corellia_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2", template = "object/building/player/player_house_corellia_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1", template = "object/building/player/player_house_generic_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1 Floorplan 2", template = "object/building/player/player_house_generic_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2", template = "object/building/player/player_house_generic_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2 Floorplan 2", template = "object/building/player/player_house_generic_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Naboo: Small Style 1 (Round)", template = "object/building/player/player_house_naboo_small_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 15000, buildingName = "Naboo: Small Style 2", template = "object/building/player/player_house_naboo_small_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Gray", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Small House (Your Left)", x = 11, y = -14, localRotation = 0,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1", template = "object/building/player/player_house_corellia_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2", template = "object/building/player/player_house_corellia_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1", template = "object/building/player/player_house_generic_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1 Floorplan 2", template = "object/building/player/player_house_generic_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2", template = "object/building/player/player_house_generic_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2 Floorplan 2", template = "object/building/player/player_house_generic_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Naboo: Small Style 1 (Round)", template = "object/building/player/player_house_naboo_small_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 15000, buildingName = "Naboo: Small Style 2", template = "object/building/player/player_house_naboo_small_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Gray", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Small House (Your Right)", x = -11, y = -14, localRotation = 0,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1", template = "object/building/player/player_house_corellia_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2", template = "object/building/player/player_house_corellia_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1", template = "object/building/player/player_house_generic_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1 Floorplan 2", template = "object/building/player/player_house_generic_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2", template = "object/building/player/player_house_generic_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2 Floorplan 2", template = "object/building/player/player_house_generic_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Naboo: Small Style 1 (Round)", template = "object/building/player/player_house_naboo_small_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 15000, buildingName = "Naboo: Small Style 2", template = "object/building/player/player_house_naboo_small_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Gray", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
				},
			},
		},
	},

	mediumTwo = {
		terminal = {name = "Medium Duplex", x = 0, y = 15.8, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Medium House (Your Left)", x = 14.5, y = 0, localRotation = 0,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
			{ -- Plot 2
				plotName = "Medium House (Your Right)", x = -14.5, y = 0, localRotation = 0,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
		},
	},

	mediumFourOut = {
		terminal = {name = "Medium Housing Block", x = 0, y = 31.2, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Medium House (Your Left)", x = 14.7, y = 14, localRotation = 0,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
			{ -- Plot 2
				plotName = "Medium House (Your Right)", x = -14.7, y = 14, localRotation = 0,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
			{ -- Plot 3
				plotName = "Medium House (Your Left)", x = 14.7, y = -14, localRotation = 180,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
			{ -- Plot 4
				plotName = "Medium House (Your Right)", x = -14.7, y = -14, localRotation = 180,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
		},
	},

	mediumFourOutClose = {
		terminal = {name = "Medium Housing Block", x = 0, y = 24, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Medium House (Your Left)", x = 13.3, y = 11, localRotation = 0,
				buildings = {
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Medium House (Your Right)", x = -13.3, y = 11, localRotation = 0,
				buildings = {
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Medium House (Your Left)", x = 13.3, y = -11, localRotation = 180,
				buildings = {
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Medium House (Your Right)", x = -13.3, y = -11, localRotation = 180,
				buildings = {
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
				},
			},
		},
	},

	mediumFourIn = {
		terminal = {name = "Medium Housing Complex", x = 0, y = 28.4, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Medium House (Your Left)", x = 15.5, y = 17.5, localRotation = 180,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
			{ -- Plot 2
				plotName = "Medium House (Your Right)", x = -15.5, y = 17.5, localRotation = 180,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
			{ -- Plot 3
				plotName = "Medium House (Your Left)", x = 15.5, y = -17.5, localRotation = 0,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
			{ -- Plot 4
				plotName = "Medium House (Your Right)", x = -15.5, y = -17.5, localRotation = 0,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
		},
	},

	largeFourOut = {
		terminal = {name = "Large Housing Block", x = 0, y = 37.2, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Large House (Your Left)", x = 18, y = 17.5, localRotation = 0,
				buildings = {
					{price = 175000, buildingName = "Tatooine: Large Style 1", template = "object/building/player/player_house_tatooine_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Tatooine: Large Style 2", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 175000, buildingName = "Corellia: Large Style 1", template = "object/building/player/player_house_corellia_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Corellia: Large Style 2", template = "object/building/player/player_house_corellia_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 1", template = "object/building/player/player_house_generic_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 2", template = "object/building/player/player_house_generic_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Naboo: Large Style 1", template = "object/building/player/player_house_naboo_large_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 50000, buildingName = "Medium: Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 50000, buildingName = "Medium: Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Large House (Your Right)", x = -18, y = 17.5, localRotation = 0,
				buildings = {
					{price = 175000, buildingName = "Tatooine: Large Style 1", template = "object/building/player/player_house_tatooine_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Tatooine: Large Style 2", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 175000, buildingName = "Corellia: Large Style 1", template = "object/building/player/player_house_corellia_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Corellia: Large Style 2", template = "object/building/player/player_house_corellia_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 1", template = "object/building/player/player_house_generic_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 2", template = "object/building/player/player_house_generic_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Naboo: Large Style 1", template = "object/building/player/player_house_naboo_large_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 50000, buildingName = "Medium: Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 50000, buildingName = "Medium: Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Large House (Your Left)", x = 18, y = -17.5, localRotation = 180,
				buildings = {
					{price = 175000, buildingName = "Tatooine: Large Style 1", template = "object/building/player/player_house_tatooine_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Tatooine: Large Style 2", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 175000, buildingName = "Corellia: Large Style 1", template = "object/building/player/player_house_corellia_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Corellia: Large Style 2", template = "object/building/player/player_house_corellia_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 1", template = "object/building/player/player_house_generic_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 2", template = "object/building/player/player_house_generic_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Naboo: Large Style 1", template = "object/building/player/player_house_naboo_large_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 50000, buildingName = "Medium: Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 50000, buildingName = "Medium: Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Large House (Your Right)", x = -18, y = -17.5, localRotation = 180,
				buildings = {
					{price = 175000, buildingName = "Tatooine: Large Style 1", template = "object/building/player/player_house_tatooine_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Tatooine: Large Style 2", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 175000, buildingName = "Corellia: Large Style 1", template = "object/building/player/player_house_corellia_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Corellia: Large Style 2", template = "object/building/player/player_house_corellia_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 1", template = "object/building/player/player_house_generic_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 2", template = "object/building/player/player_house_generic_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Naboo: Large Style 1", template = "object/building/player/player_house_naboo_large_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 50000, buildingName = "Medium: Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 50000, buildingName = "Medium: Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
				},
			},
		},
	},

	largeFourIn = {
		terminal = {name = "Large Housing Block", x = 0, y = 45.5, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Large House (Your Left)", x = 18, y = 27, localRotation = 180,
				buildings = {
					{price = 175000, buildingName = "Tatooine: Large Style 1", template = "object/building/player/player_house_tatooine_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Tatooine: Large Style 2", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 175000, buildingName = "Corellia: Large Style 1", template = "object/building/player/player_house_corellia_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Corellia: Large Style 2", template = "object/building/player/player_house_corellia_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 1", template = "object/building/player/player_house_generic_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 2", template = "object/building/player/player_house_generic_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Naboo: Large Style 1", template = "object/building/player/player_house_naboo_large_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
			{ -- Plot 2
				plotName = "Large House (Your Right)", x = -18, y = 27, localRotation = 180,
				buildings = {
					{price = 175000, buildingName = "Tatooine: Large Style 1", template = "object/building/player/player_house_tatooine_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Tatooine: Large Style 2", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 175000, buildingName = "Corellia: Large Style 1", template = "object/building/player/player_house_corellia_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Corellia: Large Style 2", template = "object/building/player/player_house_corellia_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 1", template = "object/building/player/player_house_generic_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 2", template = "object/building/player/player_house_generic_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Naboo: Large Style 1", template = "object/building/player/player_house_naboo_large_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
			{ -- Plot 3
				plotName = "Large House (Your Left)", x = 18, y = -27, localRotation = 0,
				buildings = {
					{price = 175000, buildingName = "Tatooine: Large Style 1", template = "object/building/player/player_house_tatooine_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Tatooine: Large Style 2", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 175000, buildingName = "Corellia: Large Style 1", template = "object/building/player/player_house_corellia_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Corellia: Large Style 2", template = "object/building/player/player_house_corellia_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 1", template = "object/building/player/player_house_generic_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 2", template = "object/building/player/player_house_generic_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Naboo: Large Style 1", template = "object/building/player/player_house_naboo_large_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
			{ -- Plot 4
				plotName = "Large House (Your Right)", x = -18, y = -27, localRotation = 0,
				buildings = {
					{price = 175000, buildingName = "Tatooine: Large Style 1", template = "object/building/player/player_house_tatooine_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Tatooine: Large Style 2", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 175000, buildingName = "Corellia: Large Style 1", template = "object/building/player/player_house_corellia_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Corellia: Large Style 2", template = "object/building/player/player_house_corellia_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 1", template = "object/building/player/player_house_generic_large_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Generic: Large Style 2", template = "object/building/player/player_house_generic_large_style_02.iff", zoning = 0},
					{price = 175000, buildingName = "Naboo: Large Style 1", template = "object/building/player/player_house_naboo_large_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
		},
	},

	largeLongFourIn = {
		terminal = {name = "Guild Street", x = 0, y = 62, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Guild Hall (Your Left)", x = 27, y = 42, localRotation = 180,
				buildings = {
					{price = 250000, buildingName = "Guild Hall: Tatooine", template = "object/building/player/player_guildhall_tatooine_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Corellia", template = "object/building/player/player_guildhall_corellia_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Generic", template = "object/building/player/player_guildhall_generic_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Naboo", template = "object/building/player/player_guildhall_naboo_style_01.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Corellia Player Style", template = "object/building/player/city/cantina_corellia.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Naboo Player Style", template = "object/building/player/city/cantina_naboo.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Tatooine Player Style", template = "object/building/player/city/cantina_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Corellia", template = "object/building/player/player_npc_combat_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Naboo", template = "object/building/player/player_npc_combat_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Tatooine", template = "object/building/player/player_npc_combat_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Corellia", template = "object/building/player/player_npc_commerce_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Naboo", template = "object/building/player/player_npc_commerce_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Tatooine", template = "object/building/player/player_npc_commerce_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "University: Corellia", template = "object/building/player/player_npc_university_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "University: Naboo", template = "object/building/player/player_npc_university_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "University: Tatooine", template = "object/building/tatooine/guild_university_tatooine_style_01.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Imperial Style", template = "object/building/player/player_npc_police_station_imperial.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Rebel Style", template = "object/building/player/player_npc_police_station_rebel.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Guild Hall (Your Right)", x = -27, y = 42, localRotation = 180,
				buildings = {
					{price = 250000, buildingName = "Guild Hall: Tatooine", template = "object/building/player/player_guildhall_tatooine_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Corellia", template = "object/building/player/player_guildhall_corellia_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Generic", template = "object/building/player/player_guildhall_generic_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Naboo", template = "object/building/player/player_guildhall_naboo_style_01.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Corellia Player Style", template = "object/building/player/city/cantina_corellia.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Naboo Player Style", template = "object/building/player/city/cantina_naboo.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Tatooine Player Style", template = "object/building/player/city/cantina_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Corellia", template = "object/building/player/player_npc_combat_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Naboo", template = "object/building/player/player_npc_combat_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Tatooine", template = "object/building/player/player_npc_combat_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Corellia", template = "object/building/player/player_npc_commerce_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Naboo", template = "object/building/player/player_npc_commerce_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Tatooine", template = "object/building/player/player_npc_commerce_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "University: Corellia", template = "object/building/player/player_npc_university_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "University: Naboo", template = "object/building/player/player_npc_university_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "University: Tatooine", template = "object/building/tatooine/guild_university_tatooine_style_01.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Imperial Style", template = "object/building/player/player_npc_police_station_imperial.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Rebel Style", template = "object/building/player/player_npc_police_station_rebel.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Guild Hall (Your Left)", x = 27, y = -42, localRotation = 0,
				buildings = {
					{price = 250000, buildingName = "Guild Hall: Tatooine", template = "object/building/player/player_guildhall_tatooine_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Corellia", template = "object/building/player/player_guildhall_corellia_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Generic", template = "object/building/player/player_guildhall_generic_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Naboo", template = "object/building/player/player_guildhall_naboo_style_01.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Corellia Player Style", template = "object/building/player/city/cantina_corellia.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Naboo Player Style", template = "object/building/player/city/cantina_naboo.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Tatooine Player Style", template = "object/building/player/city/cantina_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Corellia", template = "object/building/player/player_npc_combat_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Naboo", template = "object/building/player/player_npc_combat_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Tatooine", template = "object/building/player/player_npc_combat_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Corellia", template = "object/building/player/player_npc_commerce_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Naboo", template = "object/building/player/player_npc_commerce_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Tatooine", template = "object/building/player/player_npc_commerce_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "University: Corellia", template = "object/building/player/player_npc_university_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "University: Naboo", template = "object/building/player/player_npc_university_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "University: Tatooine", template = "object/building/tatooine/guild_university_tatooine_style_01.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Imperial Style", template = "object/building/player/player_npc_police_station_imperial.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Rebel Style", template = "object/building/player/player_npc_police_station_rebel.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Guild Hall (Your Right)", x = -27, y = -42, localRotation = 0,
				buildings = {
					{price = 250000, buildingName = "Guild Hall: Tatooine", template = "object/building/player/player_guildhall_tatooine_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Corellia", template = "object/building/player/player_guildhall_corellia_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Generic", template = "object/building/player/player_guildhall_generic_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Naboo", template = "object/building/player/player_guildhall_naboo_style_01.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Corellia Player Style", template = "object/building/player/city/cantina_corellia.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Naboo Player Style", template = "object/building/player/city/cantina_naboo.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Tatooine Player Style", template = "object/building/player/city/cantina_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Corellia", template = "object/building/player/player_npc_combat_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Naboo", template = "object/building/player/player_npc_combat_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Tatooine", template = "object/building/player/player_npc_combat_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Corellia", template = "object/building/player/player_npc_commerce_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Naboo", template = "object/building/player/player_npc_commerce_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Tatooine", template = "object/building/player/player_npc_commerce_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "University: Corellia", template = "object/building/player/player_npc_university_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "University: Naboo", template = "object/building/player/player_npc_university_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "University: Tatooine", template = "object/building/tatooine/guild_university_tatooine_style_01.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Imperial Style", template = "object/building/player/player_npc_police_station_imperial.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Rebel Style", template = "object/building/player/player_npc_police_station_rebel.iff", zoning = 0},
				},
			},
		},
	},

	largeLongThreeIn = {
		terminal = {name = "Guild Street End", x = 0, y = 50, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Guild Hall (Your Left)", x = 44, y = 30, localRotation = -90,
				buildings = {
					{price = 250000, buildingName = "Guild Hall: Tatooine", template = "object/building/player/player_guildhall_tatooine_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Corellia", template = "object/building/player/player_guildhall_corellia_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Generic", template = "object/building/player/player_guildhall_generic_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Naboo", template = "object/building/player/player_guildhall_naboo_style_01.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Corellia Player Style", template = "object/building/player/city/cantina_corellia.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Naboo Player Style", template = "object/building/player/city/cantina_naboo.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Tatooine Player Style", template = "object/building/player/city/cantina_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Corellia", template = "object/building/player/player_npc_combat_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Naboo", template = "object/building/player/player_npc_combat_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Tatooine", template = "object/building/player/player_npc_combat_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Corellia", template = "object/building/player/player_npc_commerce_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Naboo", template = "object/building/player/player_npc_commerce_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Tatooine", template = "object/building/player/player_npc_commerce_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "University: Corellia", template = "object/building/player/player_npc_university_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "University: Naboo", template = "object/building/player/player_npc_university_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "University: Tatooine", template = "object/building/tatooine/guild_university_tatooine_style_01.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Imperial Style", template = "object/building/player/player_npc_police_station_imperial.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Rebel Style", template = "object/building/player/player_npc_police_station_rebel.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Guild Hall (Your Right)", x = -44, y = 30, localRotation = 90,
				buildings = {
					{price = 250000, buildingName = "Guild Hall: Tatooine", template = "object/building/player/player_guildhall_tatooine_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Corellia", template = "object/building/player/player_guildhall_corellia_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Generic", template = "object/building/player/player_guildhall_generic_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Naboo", template = "object/building/player/player_guildhall_naboo_style_01.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Corellia Player Style", template = "object/building/player/city/cantina_corellia.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Naboo Player Style", template = "object/building/player/city/cantina_naboo.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Tatooine Player Style", template = "object/building/player/city/cantina_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Corellia", template = "object/building/player/player_npc_combat_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Naboo", template = "object/building/player/player_npc_combat_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Tatooine", template = "object/building/player/player_npc_combat_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Corellia", template = "object/building/player/player_npc_commerce_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Naboo", template = "object/building/player/player_npc_commerce_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Tatooine", template = "object/building/player/player_npc_commerce_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "University: Corellia", template = "object/building/player/player_npc_university_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "University: Naboo", template = "object/building/player/player_npc_university_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "University: Tatooine", template = "object/building/player/player_npc_university_tatooine.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Imperial Style", template = "object/building/player/player_npc_police_station_imperial.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Rebel Style", template = "object/building/player/player_npc_police_station_rebel.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Guild Hall (Center End)", x = 0, y = -36, localRotation = 0,
				buildings = {
					{price = 250000, buildingName = "Guild Hall: Tatooine", template = "object/building/player/player_guildhall_tatooine_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Corellia", template = "object/building/player/player_guildhall_corellia_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Generic", template = "object/building/player/player_guildhall_generic_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Naboo", template = "object/building/player/player_guildhall_naboo_style_01.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Corellia Player Style", template = "object/building/player/city/cantina_corellia.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Naboo Player Style", template = "object/building/player/city/cantina_naboo.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Tatooine Player Style", template = "object/building/player/city/cantina_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Corellia", template = "object/building/player/player_npc_combat_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Naboo", template = "object/building/player/player_npc_combat_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Tatooine", template = "object/building/player/player_npc_combat_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Corellia", template = "object/building/player/player_npc_commerce_guildhall_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Naboo", template = "object/building/player/player_npc_commerce_guildhall_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Tatooine", template = "object/building/player/player_npc_commerce_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "University: Corellia", template = "object/building/player/player_npc_university_corellia.iff", zoning = 0},
					{price = 199000, buildingName = "University: Naboo", template = "object/building/player/player_npc_university_naboo.iff", zoning = 0},
					{price = 199000, buildingName = "University: Tatooine", template = "object/building/tatooine/guild_university_tatooine_style_01.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Imperial Style", template = "object/building/player/player_npc_police_station_imperial.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Rebel Style", template = "object/building/player/player_npc_police_station_rebel.iff", zoning = 0},
				},
			},
		},
	},

	tatooineEstateSmall = {
		terminal = {name = "Small Tatooine Estate", x = 0, y = 25, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Guild Hall", x = 0, y = -14, localRotation = 0,
				buildings = {
					{price = 250000, buildingName = "Tatooine Guild Hall Style 2", template = "object/building/player/player_guildhall_tatooine_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Small House (Your Left)", x = 18.4, y = 15.2, localRotation = -90,
				buildings = {
					{price = 15000, buildingName = "Small Tatooine Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Small Tatooine: Large Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Small House (Your Right)", x = -18.4, y = 15.2, localRotation = 90,
				buildings = {
					{price = 15000, buildingName = "Small Tatooine Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Small Tatooine: Large Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
		},
	},

	tatooineEstateMedium = {
		terminal = {name = "Medium Tatooine Estate", x = 0, y = 36, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Guild Hall", x = 0, y = -14, localRotation = 0,
				buildings = {
					{price = 250000, buildingName = "Tatooine Guild Hall Style 2", template = "object/building/player/player_guildhall_tatooine_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Medium House (Your Left)", x = 17.6, y = 22, localRotation = -90,
				buildings = {
					{price = 50000, buildingName = "Medium Tatooine", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Tatooine: Large Style 2", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 3
				plotName = "Medium House (Your Right)", x = -17.6, y = 22, localRotation = 90,
				buildings = {
					{price = 50000, buildingName = "Medium Tatooine", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Tatooine: Large Style 2", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
		},
	},

	factories = {
		terminal = {name = "Industrial Site", x = 0, y = 25.3, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Large or Small Factory", x = 15, y = 11, localRotation = -90,
				buildings = {
					{price = 125000, buildingName = "Factory: Structure and Starship", template = "object/installation/manufacture/structure_factory.iff", zoning = 0, rotationFudge = 90},
					{price = 125000, buildingName = "Factory: Clothing and Armor", template = "object/installation/manufacture/clothing_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Food and Chemical", template = "object/installation/manufacture/food_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Equipment and Weapons", template = "object/installation/manufacture/weapon_factory.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Large or Small Factory", x = -15, y = 11, localRotation = 90,
				buildings = {
					{price = 125000, buildingName = "Factory: Structure and Starship", template = "object/installation/manufacture/structure_factory.iff", zoning = 0, rotationFudge = 90},
					{price = 125000, buildingName = "Factory: Clothing and Armor", template = "object/installation/manufacture/clothing_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Food and Chemical", template = "object/installation/manufacture/food_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Equipment and Weapons", template = "object/installation/manufacture/weapon_factory.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Small Factory (Your Left)", x = 20, y = -12, localRotation = 0,
				buildings = {
					{price = 125000, buildingName = "Factory: Clothing and Armor", template = "object/installation/manufacture/clothing_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Food and Chemical", template = "object/installation/manufacture/food_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Equipment and Weapons", template = "object/installation/manufacture/weapon_factory.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Small Factory (Center Left)", x = 6.5, y = -12, localRotation = 0,
				buildings = {
					{price = 125000, buildingName = "Factory: Clothing and Armor", template = "object/installation/manufacture/clothing_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Food and Chemical", template = "object/installation/manufacture/food_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Equipment and Weapons", template = "object/installation/manufacture/weapon_factory.iff", zoning = 0},
				},
			},
			{ -- Plot 5
				plotName = "Small Factory (Center Right)", x = -6.5, y = -12, localRotation = 0,
				buildings = {
					{price = 125000, buildingName = "Factory: Clothing and Armor", template = "object/installation/manufacture/clothing_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Food and Chemical", template = "object/installation/manufacture/food_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Equipment and Weapons", template = "object/installation/manufacture/weapon_factory.iff", zoning = 0},
				},
			},
			{ -- Plot 6
				plotName = "Small Factory (Your Right)", x = -20, y = -12, localRotation = 0,
				buildings = {
					{price = 125000, buildingName = "Factory: Clothing and Armor", template = "object/installation/manufacture/clothing_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Food and Chemical", template = "object/installation/manufacture/food_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Equipment and Weapons", template = "object/installation/manufacture/weapon_factory.iff", zoning = 0},
				},
			},
		},
	},

	factoriesSmall = {
		terminal = {name = "Industrial Site", x = 0, y = 25.3, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Large or Small Factory", x = 0, y = 11, localRotation = 0,
				buildings = {
					{price = 125000, buildingName = "Factory: Structure and Starship", template = "object/installation/manufacture/structure_factory.iff", zoning = 0, rotationFudge = 90},
					{price = 125000, buildingName = "Factory: Clothing and Armor", template = "object/installation/manufacture/clothing_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Food and Chemical", template = "object/installation/manufacture/food_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Equipment and Weapons", template = "object/installation/manufacture/weapon_factory.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Small Factory (Your Right)", x = -8, y = -10, localRotation = 0,
				buildings = {
					{price = 125000, buildingName = "Factory: Clothing and Armor", template = "object/installation/manufacture/clothing_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Food and Chemical", template = "object/installation/manufacture/food_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Equipment and Weapons", template = "object/installation/manufacture/weapon_factory.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Small Factory (Your Left)", x = 8, y = -10, localRotation = 0,
				buildings = {
					{price = 125000, buildingName = "Factory: Clothing and Armor", template = "object/installation/manufacture/clothing_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Food and Chemical", template = "object/installation/manufacture/food_factory.iff", zoning = 0},
					{price = 125000, buildingName = "Factory: Equipment and Weapons", template = "object/installation/manufacture/weapon_factory.iff", zoning = 0},
				},
			},
		},
	},

	smallCityBlock = {
		terminal = {name = "Small City Block", x = 0, y = 22, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Garden (Center)", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 18000, buildingName = "Garden: Tatooine Medium 1", template = "object/building/player/city/garden_tatooine_med_01.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Tatooine Medium 2", template = "object/building/player/city/garden_tatooine_med_02.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Tatooine Medium 3", template = "object/building/player/city/garden_tatooine_med_03.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Tatooine Medium 4", template = "object/building/player/city/garden_tatooine_med_04.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Tatooine Medium 5", template = "object/building/player/city/garden_tatooine_med_05.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Corellia Medium 1", template = "object/building/player/city/garden_corellia_med_01.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Corellia Medium 2", template = "object/building/player/city/garden_corellia_med_02.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Corellia Medium 3", template = "object/building/player/city/garden_corellia_med_03.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Corellia Medium 4", template = "object/building/player/city/garden_corellia_med_04.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Corellia Medium 5", template = "object/building/player/city/garden_corellia_med_05.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Dantooine Medium 1", template = "object/building/player/city/garden_dantooine_med_01.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Dathomir Medium 1", template = "object/building/player/city/garden_dathomir_med_01.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Endor Medium 1", template = "object/building/player/city/garden_endor_med_01.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Naboo Medium 2", template = "object/building/player/city/garden_naboo_med_02.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Naboo Medium 3", template = "object/building/player/city/garden_naboo_med_03.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Naboo Medium 4", template = "object/building/player/city/garden_naboo_med_04.iff", zoning = 0},
					{price = 18000, buildingName = "Garden: Naboo Medium 5", template = "object/building/player/city/garden_naboo_med_05.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 1", template = "object/building/player/city/garden_corellia_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 2", template = "object/building/player/city/garden_corellia_sml_02.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 3", template = "object/building/player/city/garden_corellia_sml_03.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 4", template = "object/building/player/city/garden_corellia_sml_04.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 5", template = "object/building/player/city/garden_corellia_sml_05.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Dantooine Small 1", template = "object/building/player/city/garden_dantooine_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Dathomir Small 1", template = "object/building/player/city/garden_dathomir_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Endor Small 1", template = "object/building/player/city/garden_endor_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Naboo Small 2", template = "object/building/player/city/garden_naboo_sml_02.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Naboo Small 3", template = "object/building/player/city/garden_naboo_sml_03.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Naboo Small 4", template = "object/building/player/city/garden_naboo_sml_04.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Naboo Small 5", template = "object/building/player/city/garden_naboo_sml_05.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Tatooine Small 1", template = "object/building/player/city/garden_tatooine_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Tatooine Small 2", template = "object/building/player/city/garden_tatooine_sml_02.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Tatooine Small 3", template = "object/building/player/city/garden_tatooine_sml_03.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Tatooine Small 4", template = "object/building/player/city/garden_tatooine_sml_04.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Tatooine Small 5", template = "object/building/player/city/garden_tatooine_sml_05.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Merchant Tent (Far Left)", x = 5.3, y = -18, localRotation = 90,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Merchant Tent (Far Right)", x = -5.3, y = -18, localRotation = -90,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Merchant Tent (Right)", x = 5.3, y = 18, localRotation = 90,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 5
				plotName = "Merchant Tent (Left)", x = -5.3, y = 18, localRotation = -90,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 6
				plotName = "Small House (Far Left)", x = 30, y = -12, localRotation = -90,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1", template = "object/building/player/player_house_corellia_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2", template = "object/building/player/player_house_corellia_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1", template = "object/building/player/player_house_generic_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1 Floorplan 2", template = "object/building/player/player_house_generic_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2", template = "object/building/player/player_house_generic_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2 Floorplan 2", template = "object/building/player/player_house_generic_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Naboo: Small Style 1 (Round)", template = "object/building/player/player_house_naboo_small_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 15000, buildingName = "Naboo: Small Style 2", template = "object/building/player/player_house_naboo_small_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 7
				plotName = "Small House (Far Right)", x = -30, y = -12, localRotation = 90,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1", template = "object/building/player/player_house_corellia_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2", template = "object/building/player/player_house_corellia_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1", template = "object/building/player/player_house_generic_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1 Floorplan 2", template = "object/building/player/player_house_generic_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2", template = "object/building/player/player_house_generic_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2 Floorplan 2", template = "object/building/player/player_house_generic_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Naboo: Small Style 1 (Round)", template = "object/building/player/player_house_naboo_small_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 15000, buildingName = "Naboo: Small Style 2", template = "object/building/player/player_house_naboo_small_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 8
				plotName = "Small House (Left)", x = 30, y = 12, localRotation = -90,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1", template = "object/building/player/player_house_corellia_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2", template = "object/building/player/player_house_corellia_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1", template = "object/building/player/player_house_generic_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1 Floorplan 2", template = "object/building/player/player_house_generic_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2", template = "object/building/player/player_house_generic_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2 Floorplan 2", template = "object/building/player/player_house_generic_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Naboo: Small Style 1 (Round)", template = "object/building/player/player_house_naboo_small_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 15000, buildingName = "Naboo: Small Style 2", template = "object/building/player/player_house_naboo_small_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 9
				plotName = "Small House (Right)", x = -30, y = 12, localRotation = 90,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1", template = "object/building/player/player_house_corellia_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 1 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2", template = "object/building/player/player_house_corellia_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Corellia: Small Style 2 Floorplan 2", template = "object/building/player/player_house_corellia_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1", template = "object/building/player/player_house_generic_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 1 Floorplan 2", template = "object/building/player/player_house_generic_small_style_01_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2", template = "object/building/player/player_house_generic_small_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Generic: Small Style 2 Floorplan 2", template = "object/building/player/player_house_generic_small_style_02_floorplan_02.iff", zoning = 0},
					{price = 15000, buildingName = "Naboo: Small Style 1 (Round)", template = "object/building/player/player_house_naboo_small_style_01.iff", zoning = 0, rotationFudge = 180},
					{price = 15000, buildingName = "Naboo: Small Style 2", template = "object/building/player/player_house_naboo_small_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
		},
	},

	mediumCityBlock = {
		terminal = {name = "Medium City Block", x = 0, y = 27, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Large Garden (Center)", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 35000, buildingName = "Garden: Tatooine Large 1", template = "object/building/player/city/garden_tatooine_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 2", template = "object/building/player/city/garden_tatooine_lrg_02.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 3", template = "object/building/player/city/garden_tatooine_lrg_03.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 4", template = "object/building/player/city/garden_tatooine_lrg_04.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 5", template = "object/building/player/city/garden_tatooine_lrg_05.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 1", template = "object/building/player/city/garden_corellia_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 2", template = "object/building/player/city/garden_corellia_lrg_02.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 3", template = "object/building/player/city/garden_corellia_lrg_03.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 4", template = "object/building/player/city/garden_corellia_lrg_04.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 5", template = "object/building/player/city/garden_corellia_lrg_05.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Dantooine Large 1", template = "object/building/player/city/garden_dantooine_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Dathomir Large 1", template = "object/building/player/city/garden_dathomir_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Endor Large 1", template = "object/building/player/city/garden_endor_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 1", template = "object/building/player/city/garden_naboo_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 2", template = "object/building/player/city/garden_naboo_lrg_02.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 3", template = "object/building/player/city/garden_naboo_lrg_03.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 4", template = "object/building/player/city/garden_naboo_lrg_04.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 5", template = "object/building/player/city/garden_naboo_lrg_05.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Merchant Tent (Far Left)", x = 7, y = -23.5, localRotation = 0,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Merchant Tent (Far Right)", x = -7, y = -23.5, localRotation = 0,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Merchant Tent (Right)", x = 7, y = 23.5, localRotation = 180,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 5
				plotName = "Merchant Tent (Left)", x = -7, y = 23.5, localRotation = 180,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 6
				plotName = "Medium House (Far Left)", x = 36, y = -14, localRotation = -90,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
			{ -- Plot 7
				plotName = "Medium House (Far Right)", x = -36, y = -14, localRotation = 90,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
			{ -- Plot 8
				plotName = "Medium House (Left)", x = 36, y = 14, localRotation = -90,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
			{ -- Plot 9
				plotName = "Medium House (Right)", x = -36, y = 14, localRotation = 90,
				buildings = {
					{price = 50000, buildingName = "Tatooine Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 1", template = "object/building/player/player_house_corellia_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Corellian Style 2", template = "object/building/player/player_house_corellia_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 1", template = "object/building/player/player_house_generic_medium_style_01.iff", zoning = 0},
					{price = 50000, buildingName = "Generic Style 2", template = "object/building/player/player_house_generic_medium_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Naboo Style 1", template = "object/building/player/player_house_naboo_medium_style_01.iff", zoning = 0, rotationFudge = 180},
				},
			},
		},
	},
	
	espaJawaTown = {
		terminal = {name = "Jawa Town", x = -3, y = 15, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Small Tent", x = 10, y = 8, localRotation = -87,
				buildings = {
					{price = 8000, buildingName = "Small Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Small Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Small Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Large Tent", x = 19, y = 2, localRotation = 180,
				buildings = {
					{price = 14000, buildingName = "Large Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Large Tent: Grey", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Large Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Bunker House", x = 0, y = -12, localRotation = 0,
				buildings = {
					{price = 50000, buildingName = "Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
		},
	},
	
	espaNW = {
		terminal = {name = "North West District", x = -4, y = 55, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Cantina", x = 12, y = 35, localRotation = 180,
				buildings = {
					{price = 650000, buildingName = "Cantina: Tatooine Player Style", template = "object/building/player/city/cantina_tatooine.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Corellia Player Style", template = "object/building/player/city/cantina_corellia.iff", zoning = 0},
					{price = 650000, buildingName = "Cantina: Naboo Player Style", template = "object/building/player/city/cantina_naboo.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Large Garden", x = 12, y = -4, localRotation = 0,
				buildings = {
					{price = 35000, buildingName = "Garden: Tatooine Large 2", template = "object/building/player/city/garden_tatooine_lrg_02.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 1", template = "object/building/player/city/garden_tatooine_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 3", template = "object/building/player/city/garden_tatooine_lrg_03.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 4", template = "object/building/player/city/garden_tatooine_lrg_04.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 5", template = "object/building/player/city/garden_tatooine_lrg_05.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 1", template = "object/building/player/city/garden_corellia_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 2", template = "object/building/player/city/garden_corellia_lrg_02.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 3", template = "object/building/player/city/garden_corellia_lrg_03.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 4", template = "object/building/player/city/garden_corellia_lrg_04.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 5", template = "object/building/player/city/garden_corellia_lrg_05.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Dantooine Large 1", template = "object/building/player/city/garden_dantooine_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Dathomir Large 1", template = "object/building/player/city/garden_dathomir_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Endor Large 1", template = "object/building/player/city/garden_endor_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 1", template = "object/building/player/city/garden_naboo_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 2", template = "object/building/player/city/garden_naboo_lrg_02.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 3", template = "object/building/player/city/garden_naboo_lrg_03.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 4", template = "object/building/player/city/garden_naboo_lrg_04.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 5", template = "object/building/player/city/garden_naboo_lrg_05.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Theatre", x = 8, y = -36, localRotation = 0,
				buildings = {
					{price = 50000, buildingName = "Small Tatooine Theatre", template = "object/building/player/city/theater_tatooine.iff", zoning = 0},
					{price = 50000, buildingName = "Small Corellian Theatre", template = "object/building/player/city/theater_corellia.iff", zoning = 0},
					{price = 50000, buildingName = "Small Naboo Theatre", template = "object/building/player/city/theater_naboo.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Guild Hall", x = -38, y = -34, localRotation = 0,
				buildings = {
					{price = 250000, buildingName = "Guild Hall: Tatooine", template = "object/building/player/player_guildhall_tatooine_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Corellia", template = "object/building/player/player_guildhall_corellia_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Generic", template = "object/building/player/player_guildhall_generic_style_01.iff", zoning = 0},
					{price = 250000, buildingName = "Guild Hall: Naboo", template = "object/building/player/player_guildhall_naboo_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 5
				plotName = "Large Tent - Close", x = -28, y = 52, localRotation = -90,
				buildings = {
					{price = 14000, buildingName = "Large Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Large Tent: Grey", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Large Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 6
				plotName = "Small Tent", x = -34, y = 32, localRotation = 90,
				buildings = {
					{price = 8000, buildingName = "Small Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Small Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Small Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 7
				plotName = "Large Tent - Far", x = -22, y = 18, localRotation = 0,
				buildings = {
					{price = 14000, buildingName = "Large Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Large Tent: Grey", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Large Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 8
				plotName = "Small Tent - Far Right", x = -56, y = 14, localRotation = 120,
				buildings = {
					{price = 8000, buildingName = "Small Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Small Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Small Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
		},
	},
	
	espaDuneHeights = {
		terminal = {name = "Dune Heights", x = 0, y = 10, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Estate (Center)", x = 0, y = -16.31, localRotation = 0,
				buildings = {
					{price = 750000, buildingName = "Tatooine Guild Hall Style 2", template = "object/building/player/player_guildhall_tatooine_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Medium House (Your Left)", x = 48.6, y = 6.7, localRotation = -45,
				buildings = {
					{price = 375000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 3
				plotName = "Medium House (Your Right)", x = -46.4, y = 8, localRotation = 59,
				buildings = {
					{price = 375000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 5
				plotName = "Small Garden (Your Left)", x = -18, y = 18, localRotation = 0,
				buildings = {
					{price = 15600, buildingName = "Garden: Tatooine Small 1", template = "object/building/player/city/garden_tatooine_sml_01.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Tatooine Small 2", template = "object/building/player/city/garden_tatooine_sml_02.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Tatooine Small 3", template = "object/building/player/city/garden_tatooine_sml_03.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Tatooine Small 4", template = "object/building/player/city/garden_tatooine_sml_04.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Tatooine Small 5", template = "object/building/player/city/garden_tatooine_sml_05.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Corellia Small 1", template = "object/building/player/city/garden_corellia_sml_01.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Corellia Small 2", template = "object/building/player/city/garden_corellia_sml_02.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Corellia Small 3", template = "object/building/player/city/garden_corellia_sml_03.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Corellia Small 4", template = "object/building/player/city/garden_corellia_sml_04.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Corellia Small 5", template = "object/building/player/city/garden_corellia_sml_05.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Dantooine Small 1", template = "object/building/player/city/garden_dantooine_sml_01.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Dathomir Small 1", template = "object/building/player/city/garden_dathomir_sml_01.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Endor Small 1", template = "object/building/player/city/garden_endor_sml_01.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Naboo Small 2", template = "object/building/player/city/garden_naboo_sml_02.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Naboo Small 3", template = "object/building/player/city/garden_naboo_sml_03.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Naboo Small 4", template = "object/building/player/city/garden_naboo_sml_04.iff", zoning = 0},
					{price = 15600, buildingName = "Garden: Naboo Small 5", template = "object/building/player/city/garden_naboo_sml_05.iff", zoning = 0},
				},
			},
			{ -- Plot 6
				plotName = "Small Garden (Your Right)", x = 18, y = 18, localRotation = 0,
				buildings = {
					{price = 5600, buildingName = "Garden: Tatooine Small 2", template = "object/building/player/city/garden_tatooine_sml_02.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Tatooine Small 1", template = "object/building/player/city/garden_tatooine_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Tatooine Small 3", template = "object/building/player/city/garden_tatooine_sml_03.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Tatooine Small 4", template = "object/building/player/city/garden_tatooine_sml_04.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Tatooine Small 5", template = "object/building/player/city/garden_tatooine_sml_05.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 1", template = "object/building/player/city/garden_corellia_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 2", template = "object/building/player/city/garden_corellia_sml_02.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 3", template = "object/building/player/city/garden_corellia_sml_03.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 4", template = "object/building/player/city/garden_corellia_sml_04.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Corellia Small 5", template = "object/building/player/city/garden_corellia_sml_05.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Dantooine Small 1", template = "object/building/player/city/garden_dantooine_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Dathomir Small 1", template = "object/building/player/city/garden_dathomir_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Endor Small 1", template = "object/building/player/city/garden_endor_sml_01.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Naboo Small 2", template = "object/building/player/city/garden_naboo_sml_02.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Naboo Small 3", template = "object/building/player/city/garden_naboo_sml_03.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Naboo Small 4", template = "object/building/player/city/garden_naboo_sml_04.iff", zoning = 0},
					{price = 5600, buildingName = "Garden: Naboo Small 5", template = "object/building/player/city/garden_naboo_sml_05.iff", zoning = 0},
				},
			},
		},
	},
	
	
	-- Mos Entha Specific Layouts (that I made for the Tarkin 2 server and only put here for testing/reference)
	
	enthaGuildHalls = {
		terminal = {name = "Guild Hall", x = 0, y = 34.7, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Single Large Long Structure", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 199000, buildingName = "Combat Guild Hall: Tatooine", template = "object/building/player/player_npc_combat_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Commerce Guild Hall: Tatooine", template = "object/building/player/player_npc_commerce_guildhall_tatooine.iff", zoning = 0},
				},
			},
		},
	},
	
	enthaCloner = {
		terminal = {name = "Cloning Facility", x = 0, y = 28.5, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Single Large Wide Structure", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 655000, buildingName = "Cloning Facility: Tatooine Large", template = "object/building/tatooine/cloning_facility_tatooine.iff", zoning = 0},
				},
			},
		},
	},
	
	enthaHospital = {
		terminal = {name = "Hospital", x = 0, y = 54.25, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Single Huge Structure", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 795000, buildingName = "Hospital - Tatooine Large NPC Style", template = "object/building/player/player_npc_hospital_tatooine.iff", zoning = 0, rotationFudge = 90},
				},
			},
		},
	},

	enthaTheater = {
		terminal = {name = "Theater", x = 0, y = 20.5, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Single Huge Structure", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 765000, buildingName = "Theatre - Tatooine NPC Style", template = "object/building/player/player_npc_theater_tatooine.iff", zoning = 0, rotationFudge = 180},
				},
			},
		},
	},
	
	enthaHotel = {
		terminal = {name = "Hotel", x = 0, y = 40.5, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Single Huge Structure", x = 0, y = 0, localRotation = 0,
				buildings = {
					{price = 595000, buildingName = "Hotel - Tatooine Large NPC Style", template = "object/building/player/player_npc_hotel_tatooine.iff", zoning = 0},
				},
			},
		},
	},
	
	enthaCom1 = {
		terminal = {name = "Westridge Park", x = 7.02, y = 38.69, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Medium Structure (Left Front)", x = 27.85, y = 15.85, localRotation = -90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 2
				plotName = "Small Structure (Left Middle)", x = 26.01, y = -8.11, localRotation = -90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Small Structure (Left Back)", x = 26.82, y = -23.93, localRotation = -90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Small Structure (Center Left)", x = 9.43, y = -35.87, localRotation = 0,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 5
				plotName = "Small Structure (Center Right)", x = -6.38, y = -36.81, localRotation = 0,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 6
				plotName = "Medium Structure (Right Back)", x = -30.04, y = -21.59, localRotation = 90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 7
				plotName = "Small Structure (Right Middle)", x = -26.61, y = -1.21, localRotation = 90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 8
				plotName = "Small Structure (Right Front)", x = -27.43, y = 17.03, localRotation = 90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 798000, buildingName = "Bunker: Large", template = "object/building/player/player_npc_bunker_large.iff", zoning = 0},
					{price = 565000, buildingName = "Bunker: Medium", template = "object/building/player/player_npc_bunker_medium.iff", zoning = 0},
					{price = 225000, buildingName = "Bunker: Small", template = "object/building/player/player_npc_bunker_small.iff", zoning = 0},
				},
			},
		},
	},

	enthaCom2 = {
		terminal = {name = "Ka'ra Complex", x = 0, y = 53, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "House (Left Front)", x = 28.82, y = 28.85, localRotation = -90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "House (Left Middle)", x = 29.0, y = 1.15, localRotation = -90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "House (Left Back)", x = 29.72, y = -28.88, localRotation = -90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Estate (Center End)", x = -1.74, y = -64.08, localRotation = 0,
				buildings = {
					{price = 250000, buildingName = "Tatooine Guild Hall Style 2", template = "object/building/player/player_guildhall_tatooine_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 5
				plotName = "House (Right Back)", x = -32.29, y = -31.71, localRotation = 90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 6
				plotName = "House (Right Middle)", x = -32.98, y = -1.08, localRotation = 90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 7
				plotName = "House (Right Front)", x = -33.68, y = 27.94, localRotation = 90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
		},
	},
	
	enthaCom3 = {
		terminal = {name = "Wol Street", x = 0, y = 5, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Medium House (Left Front)", x = -15.5, y = 17.5, localRotation = 180,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Medium House (Middle Front)", x = 15.5, y = 17.5, localRotation = 180,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Small House (Right Front)", x = 39.4, y = 19.5, localRotation = 180,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Small House (Far Right End)", x = 55, y = 22.7, localRotation = 90,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 5
				plotName = "Medium House (Left Behind)", x = -15.5, y = -19.8, localRotation = 0,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 6
				plotName = "Medium House (Middle Behind)", x = 15.5, y = -22, localRotation = 0,
				buildings = {
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 7
				plotName = "Medium House (Right Behind)", x = 43, y = -23.3, localRotation = 180,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 8
				plotName = "Medium House (Right Behind End)", x = 69.9, y = -21.1, localRotation = 90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 9
				plotName = "Large Cantina (Far Left)", x = -95.4, y = -12.5, localRotation = -90,
				buildings = {
					{price = 675000, buildingName = "Cantina - Tatooine NPC Style", template = "object/building/player/player_npc_cantina_tatooine.iff", zoning = 0, rotationFudge = 90},
				},
			},
		},
	},
	
	enthaCom5 = {
		terminal = {name = "Jawa Town", x = 0, y = 17, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Small Tent (Far Left)", x = 19.3, y = 3.8, localRotation = -112,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Large Tent (Front Left)", x = 2, y = 5, localRotation = 180,
				buildings = {
					{price = 14000, buildingName = "Salon Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Gray", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Large Tent (Front Right)", x = -15, y = 9, localRotation = 180,
				buildings = {
					{price = 14000, buildingName = "Salon Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Gray", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Large Tent (Back Left)", x = 14, y = -7, localRotation = 0,
				buildings = {
					{price = 14000, buildingName = "Salon Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Gray", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 5
				plotName = "Small Tent (Back Center)", x = -6.1, y = -11, localRotation = 0,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 6
				plotName = "Large Tent (Back Right)", x = -16.6, y = -7, localRotation = 0,
				buildings = {
					{price = 14000, buildingName = "Salon Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Gray", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 7
				plotName = "Small Tent (Hill Left)", x = 19, y = -32.3, localRotation = 0,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 8
				plotName = "Small Tent (Hill Right)", x = 8.6, y = -33.7, localRotation = 0,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 9
				plotName = "Bunker House (Hill Front)", x = 32, y = -36.3, localRotation = 90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 798000, buildingName = "Bunker: Large", template = "object/building/player/player_npc_bunker_large.iff", zoning = 0},
					{price = 565000, buildingName = "Bunker: Medium", template = "object/building/player/player_npc_bunker_medium.iff", zoning = 0},
					{price = 225000, buildingName = "Bunker: Small", template = "object/building/player/player_npc_bunker_small.iff", zoning = 0},
				},
			},
			{ -- Plot 10
				plotName = "Bunker House (Hill Back)", x = 37, y = -59.7, localRotation = 65,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 11
				plotName = "Bunker House (Left)", x = 44, y = 18, localRotation = -165,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 12
				plotName = "Bunker House (Far Left)", x = 58, y = 11.5, localRotation = -160,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
		},
	},
	
	enthaCom6 = {
		terminal = {name = "Sandy Acres", x = 0, y = 36, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Bunker House (Center Front)", x = 0, y = 21.4, localRotation = 90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Small Tent (Center)", x = 1.4, y = 0, localRotation = 90,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Bunker House (Center Back)", x = 0, y = -21.4, localRotation = 90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Small Tent (Far Left)", x = 40.45, y = -14.2, localRotation = -90,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 5
				plotName = "Bunker House (Left Front)", x = 23, y = 33, localRotation = -90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 6
				plotName = "Bunker House (Left Second)", x = 23, y = 12, localRotation = -90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 7
				plotName = "Bunker House (Left Third)", x = 23, y = -8, localRotation = -90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 8
				plotName = "Bunker House (Left End)", x = 23, y = -29, localRotation = -90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 9
				plotName = "Bunker House (Right Front)", x = -21, y = 33, localRotation = -90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 10
				plotName = "Bunker House (Right Second)", x = -21, y = 12, localRotation = -90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
					{price = 798000, buildingName = "Bunker: Large", template = "object/building/player/player_npc_bunker_large.iff", zoning = 0},
					{price = 565000, buildingName = "Bunker: Medium", template = "object/building/player/player_npc_bunker_medium.iff", zoning = 0},
					{price = 225000, buildingName = "Bunker: Small", template = "object/building/player/player_npc_bunker_small.iff", zoning = 0},
				},
			},
			{ -- Plot 11
				plotName = "Bunker House (Right Third)", x = -21, y = -8, localRotation = -90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 12
				plotName = "Bunker House (Right End)", x = -21, y = -29, localRotation = -90,
				buildings = {
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
		},
	},
	
	enthaCom7 = {
		terminal = {name = "Liakhara Lane", x = 0, y = 74, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Large House (Left Front)", x = 35, y = 62, localRotation = -90,
				buildings = {
					{price = 175000, buildingName = "Tatooine: Large Style 1", template = "object/building/player/player_house_tatooine_large_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Medium House (Left Second)", x = 30.6, y = 31.8, localRotation = -90,
				buildings = {
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Medium House (Left Third)", x = 30.6, y = 6, localRotation = -90,
				buildings = {
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Medium House (Left Fourth)", x = 26.5, y = -18.7, localRotation = -90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 5
				plotName = "Medium House (Left Fifth)", x = 30.6, y = -45.4, localRotation = -90,
				buildings = {
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 7
				plotName = "Medium House (Right Farthest)", x = -20, y = -66, localRotation = 90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 8
				plotName = "Large House (Right Middle)", x = -20, y = 35, localRotation = 90,
				buildings = {
					{price = 175000, buildingName = "Tatooine: Large Style 1", template = "object/building/player/player_house_tatooine_large_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 8
				plotName = "Small Tent (Right Front)", x = -11.2, y = 58.4, localRotation = 90,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
		},
	},
	
	enthaCom8 = {
		terminal = {name = "Kinshi's Walk", x = -12.1, y = 45, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Guild Hall (Left Behind)", x = 30, y = 99, localRotation = -90,
				buildings = {
					{price = 199000, buildingName = "Commerce Guild Hall: Tatooine", template = "object/building/player/player_npc_commerce_guildhall_tatooine.iff", zoning = 0},
					{price = 199000, buildingName = "Combat Guild Hall: Tatooine", template = "object/building/player/player_npc_combat_guildhall_tatooine.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Police Station (Left)", x = 40, y = 55, localRotation = -90,
				buildings = {
					{price = 325000, buildingName = "Police Station: Imperial Style", template = "object/building/player/player_npc_police_station_imperial.iff", zoning = 0},
					{price = 325000, buildingName = "Police Station: Rebel Style", template = "object/building/player/player_npc_police_station_rebel.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Tavern (Left Second)", x = 21.7, y = 11.32, localRotation = 90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 4
				plotName = "Small House (Left Third)", x = 23, y = -12, localRotation = -90,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 35000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 5
				plotName = "Guild Hall (Far Center)", x = -15, y = -65, localRotation = 45,
				buildings = {
					{price = 250000, buildingName = "Guild Hall: Tatooine (Brown Generic)", template = "object/building/player/player_guildhall_tatooine_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 6
				plotName = "Small House (Right Far)", x = -21.7, y = -21.6, localRotation = 90,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 7
				plotName = "Small House (Right Far)", x = -21.7, y = -3.7, localRotation = 90,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 8
				plotName = "Guild Hall (Right Close)", x = -21.7, y = 16, localRotation = 90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
		},
	},
	
	enthaCom9 = {
		terminal = {name = "Fallen Star Court", x = 0, y = 0, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Large Tent (Behind)", x = -6, y = 24, localRotation = 180,
				buildings = {
					{price = 14000, buildingName = "Salon Tent: Brown", template = "object/building/player/player_salon_tent_style_01.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Gray", template = "object/building/player/player_salon_tent_style_02.iff", zoning = 0},
					{price = 14000, buildingName = "Salon Tent: Green", template = "object/building/player/player_salon_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Small Tent (Behind Left)", x = 12.4, y = 24.3, localRotation = -139,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Small Tent (Left)", x = 19, y = 4.5, localRotation = -139,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Small Tent (Far Left)", x = 27.3, y = -2.4, localRotation = 180,
				buildings = {
					{price = 8000, buildingName = "Mercant Tent: Brown", template = "object/building/player/player_merchant_tent_style_01.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Grey", template = "object/building/player/player_merchant_tent_style_02.iff", zoning = 0},
					{price = 8000, buildingName = "Mercant Tent: Green", template = "object/building/player/player_merchant_tent_style_03.iff", zoning = 0},
				},
			},
			{ -- Plot 5
				plotName = "Bunker Complex (Right Close)", x = -30, y = 2.5, localRotation = 0,
				buildings = {
					{price = 798000, buildingName = "Bunker: Large", template = "object/building/player/player_npc_bunker_large.iff", zoning = 0},
					{price = 565000, buildingName = "Bunker: Medium", template = "object/building/player/player_npc_bunker_medium.iff", zoning = 0},
					{price = 225000, buildingName = "Bunker: Small", template = "object/building/player/player_npc_bunker_small.iff", zoning = 0},
				},
			},
		},
	},
	
	enthaCom10 = {
		terminal = {name = "Garden Mound", x = 5, y = 12.6, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Garden (Center)", x = 0, y = -5, localRotation = 0,
				buildings = {
					{price = 35000, buildingName = "Garden: Tatooine Large 1", template = "object/building/player/city/garden_tatooine_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 2", template = "object/building/player/city/garden_tatooine_lrg_02.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 3", template = "object/building/player/city/garden_tatooine_lrg_03.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 4", template = "object/building/player/city/garden_tatooine_lrg_04.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Tatooine Large 5", template = "object/building/player/city/garden_tatooine_lrg_05.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 1", template = "object/building/player/city/garden_corellia_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 2", template = "object/building/player/city/garden_corellia_lrg_02.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 3", template = "object/building/player/city/garden_corellia_lrg_03.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 4", template = "object/building/player/city/garden_corellia_lrg_04.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Corellia Large 5", template = "object/building/player/city/garden_corellia_lrg_05.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Dantooine Large 1", template = "object/building/player/city/garden_dantooine_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Dathomir Large 1", template = "object/building/player/city/garden_dathomir_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Endor Large 1", template = "object/building/player/city/garden_endor_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 1", template = "object/building/player/city/garden_naboo_lrg_01.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 2", template = "object/building/player/city/garden_naboo_lrg_02.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 3", template = "object/building/player/city/garden_naboo_lrg_03.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 4", template = "object/building/player/city/garden_naboo_lrg_04.iff", zoning = 0},
					{price = 35000, buildingName = "Garden: Naboo Large 5", template = "object/building/player/city/garden_naboo_lrg_05.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Cantina (Left)", x = 37, y = 2.3, localRotation = -90,
				buildings = {
					{price = 650000, buildingName = "Cantina: Tatooine Player Style", template = "object/building/player/city/cantina_tatooine.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Guild Hall (Right)", x = -47, y = -4, localRotation = 90,
				buildings = {
					{price = 250000, buildingName = "Guild Hall: Tatooine (Brown Generic)", template = "object/building/player/player_guildhall_tatooine_style_01.iff", zoning = 0},
				},
			},
		},
	},
	
	enthaCom11 = {
		terminal = {name = "Spartan Drive", x = 2.2, y = 70, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Small House (Left Front)", x = 15, y = 30, localRotation = -90,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Small House (Left 2)", x = 15, y = 12, localRotation = -90,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Small House (Left 3)", x = 15, y = -6, localRotation = -90,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 5
				plotName = "Small House (Left 4)", x = 15, y = -24, localRotation = -90,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 6
				plotName = "Small House (Left Back)", x = 15, y = -51, localRotation = -90,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 7
				plotName = "Tavern (Right Front)", x = -20, y = 70, localRotation = 90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 8
				plotName = "Medium House (Right 2)", x = -20, y = 43, localRotation = 90,
				buildings = {
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
			{ -- Plot 9
				plotName = "Medium House (Right 3)", x = -20, y = 16, localRotation = 90,
				buildings = {
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 10
				plotName = "Medium House (Right 4)", x = -20, y = -19, localRotation = 90,
				buildings = {
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
				},
			},
			{ -- Plot 11
				plotName = "Medium House (Right End)", x = -20, y = -46, localRotation = 90,
				buildings = {
					{price = 150000, buildingName = "Tatooine: Medium Style 1", template = "object/building/player/player_house_tatooine_medium_style_01.iff", zoning = 0},
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
		},
	},
	
	enthaCom12 = {
		terminal = {name = "Sham Square", x = 0, y = 23.2, localRotation = 0},
		plots = {
			{ -- Plot 1
				plotName = "Small House (Your Left)", x = 11, y = 10.5, localRotation = 0,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 2
				plotName = "Small House (Your Right)", x = -11, y = 10.5, localRotation = 0,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 3
				plotName = "Small House (Your Left)", x = 11, y = -10.5, localRotation = 180,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Small House (Your Right)", x = -11, y = -10.5, localRotation = 180,
				buildings = {
					{price = 15000, buildingName = "Tatooine: Small Style 1", template = "object/building/player/player_house_tatooine_small_style_01.iff", zoning = 0},
					{price = 15000, buildingName = "Tatooine: Small Style 2", template = "object/building/player/player_house_tatooine_small_style_02.iff", zoning = 0},
					{price = 50000, buildingName = "Tatooine: Bunker House", template = "object/building/player/player_house_tatooine_medium_style_02.iff", zoning = 0},
				},
			},
			{ -- Plot 4
				plotName = "Tavern (Behind You)", x = 15, y = 58, localRotation = -90,
				buildings = {
					{price = 175000, buildingName = "Tavern Style Home", template = "object/building/player/player_house_tatooine_large_style_02.iff", zoning = 0, rotationFudge = -90},
				},
			},
		},
	},
}

