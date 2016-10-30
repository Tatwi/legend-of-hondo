BBStructuresConfig = {
	path = "object/draft_schematic/structure/",
	qualityMin = 30,
	qualityAvg = 35, -- 10% chance to use this as the min value and qualityMax as the max value
	qualityMax = 45, -- 1% Chance to get up to +5 to the max value, with qualityMax as the min value
	freq = 28800, -- Every x seconds
	eventName = "BazaarBotAddStructures",
	functionName = "addMoreStructures",
}

-- {price", "quantity", "crateQuantity", "altTemplate", "templates"...},
-- price: Price * (random(QualityRoll/4, QualityRoll/2) / 100 + 1) * crateQuantity
-- quantity: How many of each item in the group will be listed every freq seconds
-- crateQuantity: Set higher than 1 to make factory crates rather than individual items
-- altTemplate: Items such as statues that have a drop down to choose alternate final objects
-- Items that don't have altTemplates and should be the same price can be grouped together
BBStructuresItems = {
	{7000, 1, 1, 0, 
	"installation_generator_wind",
	"installation_mining_gas",
	"installation_mining_liquid",
	"installation_mining_ore",
	"installation_mining_organic_flora",
	}
}


-- Unused for Reference
BBStructuresUNUSED = {
	"corellia_house_guild_hall",
	"corellia_house_player_large",
	"corellia_house_player_large_style_02",
	"corellia_house_player_medium",
	"corellia_house_player_small_floorplan_02",
	"corellia_house_player_small",
	"corellia_house_player_small_style_02_floorplan_02",
	"corellia_house_player_small_style_02",
	"generic_house_guild_hall",
	"generic_house_player_large",
	"generic_house_player_large_style_02",
	"generic_house_player_medium",
	"generic_house_player_medium_style_02",
	"generic_house_player_small_floorplan_02",
	"generic_house_player_small",
	"generic_house_player_small_style_02_floorplan_02",
	"generic_house_player_small_style_02",
	"house_guild_hall",
	"house_player_large",
	"house_player_medium",
	"house_player_small",
	"house_player_small_style_02",
	"installation_factory_clothing",
	"installation_factory_food",
	"installation_factory_structure",
	"installation_factory_weapon",
	"installation_generator_fusion",
	"installation_generator_solar",
	"installation_mining_gas_heavy",
	"installation_mining_gas_light",
	"installation_mining_liquid_heavy",
	"installation_mining_liquid_light",
	"installation_mining_liquid_vapor_heavy",
	"installation_mining_liquid_vapor_light",
	"installation_mining_liquid_vapor",
	"installation_mining_ore_heavy",
	"installation_mining_ore_light",
	"installation_mining_organic_flora_heavy",
	"installation_mining_organic_flora_light",
	"merchant_tent",
	"naboo_house_guild_hall",
	"naboo_house_player_large",
	"naboo_house_player_medium",
	"naboo_house_player_small",
	"naboo_house_player_small_style_02",
}











