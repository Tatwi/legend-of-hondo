BBArmorConfig = {
	path = "object/draft_schematic/clothing/clothing_armor_",
	qualityMin = 45,
	qualityAvg = 50, -- 10% chance to use this as the min value and qualityMax as the max value
	qualityMax = 65, -- 1% Chance to get up to +5 to the max value, with qualityMax as the min value
	freq = 144100, -- Every x seconds
	eventName = "BazaarBotAddArmor",
	functionName = "addMoreArmor",
}

-- {price, quantity, crateQuantity, "altTemplate", "templates"...},
-- price: Price * (random(QualityRoll/4, QualityRoll/2) / 100 + 1) * crateQuantity
-- quantity: How many of each item in the group will be listed every freq seconds
-- crateQuantity: Set higher than 1 to make factory crates rather than individual items
-- altTemplate: Items such as statues that have a drop down to choose alternate final objects
-- Items that don't have altTemplates and should be the same price can be grouped together
BBArmorItems = {
	{650, 1, 1, 0, "bone_bicep_l", "bone_bicep_r", "bone_boots", "bone_bracer_l", "bone_bracer_r", "bone_chest", "bone_gloves", "bone_helmet", "bone_leggings"},
	--{8000, 1, 1, 0, "bounty_hunter_belt", "bounty_hunter_bicep_l", "bounty_hunter_bicep_r", "bounty_hunter_boots", "bounty_hunter_bracer_l", "bounty_hunter_bracer_r", "bounty_hunter_chest_plate", "bounty_hunter_gloves", "bounty_hunter_helmet", "bounty_hunter_leggings"},
	{1200, 1, 1, 0, "chitin_bicep_l", "chitin_bicep_r", "chitin_boots", "chitin_bracer_l", "chitin_bracer_r", "chitin_chest", "chitin_gloves", "chitin_helmet", "chitin_leggings"},
	--{5000, 3, 1, 0, "composite_bicep_l", "composite_bicep_r", "composite_boots", "composite_bracer_l", "composite_bracer_r", "composite_chest", "composite_gloves", "composite_helmet", "composite_leggings"},
	{650, 1, 1, 0, "ithorian_defender_bicep_l", "ithorian_defender_bicep_r", "ithorian_defender_boots", "ithorian_defender_bracer_l", "ithorian_defender_bracer_r", "ithorian_defender_chest", "ithorian_defender_gloves", "ithorian_defender_helmet", "ithorian_defender_leggings"},
	--{2000, 1, 1, 0, "ithorian_guardian_bicep_l", "ithorian_guardian_bicep_r", "ithorian_guardian_boots", "ithorian_guardian_bracer_l", "ithorian_guardian_bracer_r", "ithorian_guardian_chest", "ithorian_guardian_gloves", "ithorian_guardian_helmet", "ithorian_guardian_leggings"},
	--{5000, 1, 1, 0, "ithorian_sentinel_bicep_l", "ithorian_sentinel_bicep_r", "ithorian_sentinel_boots", "ithorian_sentinel_bracer_l", "ithorian_sentinel_bracer_r", "ithorian_sentinel_chest", "ithorian_sentinel_gloves", "ithorian_sentinel_helmet", "ithorian_sentinel_leggings"},
	{750, 1, 1, 0, "kashyyykian_black_mtn_bracer_l", "kashyyykian_black_mtn_bracer_r", "kashyyykian_black_mtn_chest", "kashyyykian_black_mtn_leggings"},
	--{2000, 1, 1, 0, "kashyyykian_ceremonial_bracer_l", "kashyyykian_ceremonial_bracer_r", "kashyyykian_ceremonial_chest", "kashyyykian_ceremonial_leggings"},
	--{5000, 1, 1, 0, "kashyyykian_hunting_bracer_l", "kashyyykian_hunting_bracer_r", "kashyyykian_hunting_chest", "kashyyykian_hunting_leggings"},
	--{20000, 1, 1, 0, "mandalorian_belt", "mandalorian_bicep_l", "mandalorian_bicep_r", "mandalorian_boots", "mandalorian_bracer_l", "mandalorian_bracer_r", "mandalorian_chest_plate", "mandalorian_gloves", "mandalorian_helmet", "mandalorian_leggings"},
	--{1500, 1, 1, 0, "padded_belt", "padded_bicep_l", "padded_bicep_r", "padded_boots", "padded_bracer_l", "padded_bracer_r", "padded_chest", "padded_gloves", "padded_helmet", "padded_leggings"},
	--{17000, 1, 1, 0, "ris_bicep_l", "ris_bicep_r", "ris_boots", "ris_bracer_l", "ris_bracer_r", "ris_chest_plate", "ris_gloves", "ris_helmet", "ris_leggings"},
	{925, 1, 1, 0, "tantel_boots", "tantel_chest", "tantel_helmet"},
	--{1100, 2, 1, 0, "ubese_boots", "ubese_bracer_l", "ubese_bracer_r", "ubese_gloves", "ubese_helmet", "ubese_jacket", "ubese_pants"},
	{725, 1, 1, 0, "zam_belt", "zam_boots", "zam_chest", "zam_gloves", "zam_helmet", "zam_pants"},
}

















