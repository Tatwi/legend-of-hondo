BBFoodConfig = {
	path = "object/draft_schematic/food/",
	qualityMin = 35,
	qualityAvg = 45, -- 10% chance to use this as the min value and qualityMax as the max value
	qualityMax = 50, -- 1% Chance to get up to +5 to the max value, with qualityMax as the min value
	freq = 14100, -- Every x seconds
	eventName = "BazaarBotAddFood",
	functionName = "addMoreFood",
}

-- {price, quantity, crateQuantity, "altTemplate", "templates"...},
-- price: Price * (random(QualityRoll/4, QualityRoll/2) / 100 + 1) * crateQuantity
-- quantity: How many of each item in the group will be listed every freq seconds
-- crateQuantity: Set higher than 1 to make factory crates rather than individual items
-- altTemplate: Items such as statues that have a drop down to choose alternate final objects
-- Items that don't have altTemplates and should be the same price can be grouped together
BBMFoodItems = {
	-- Expensive
	{1250, 1, 5, 0, 
	"dessert_almond_kwevvu_crisp_munchies", 
	"dessert_air_cake", 
	"dessert_blap_biscuit", 
	"dessert_citros_snow_cake", 
	"dessert_sweesonberry_rolls",
	"dessert_vagnerian_canape",
	"dish_synthsteak",
	"dish_thakitillo",
	"dish_vercupti_of_agazza_boleruuee",
	"drink_blue_milk",
	"drink_flameout",
	"drink_vasarian_brandy",
	},
	-- Modest
	{900, 1, 5, 0, 
	"dessert_felbar", 
	"dessert_pastebread",
	"dessert_pyollian_cake",
	"dish_ahrisa",
	"drink_bespin_port",
	"drink_ithorian_mist",
	},
	-- Cheap
	{450, 1, 5, 0,
	"dish_veghash", 
	"dessert_dweezel",
	"drink_accarragm",
	"drink_garrmorl",
	},
}

-- These are here to make it easier to add them in later. Just cut/paste into the above table and set the prices. 
BBFood_UNUSED = {
	{25, 1, 1, 0, "dessert_bantha_butter"},	
	{25, 1, 1, 0, "dessert_blob_candy"},
	{25, 1, 1, 0, "dessert_bofa_treat"},
	{25, 1, 1, 0, "dessert_cavaellin_creams"},
	{25, 1, 1, 0, "dessert_chandad"},	
	{25, 1, 1, 0, "dessert_corellian_fried_icecream"},
	{25, 1, 1, 0, "dessert_deneelian_fizz_pudding"},	
	{25, 1, 1, 0, "dessert_glazed_glucose_pate"},
	{25, 1, 1, 0, "dessert_gorrnar"},
	{25, 1, 1, 0, "dessert_kiwik_clusjo_swirl"},
	{25, 1, 1, 0, "dessert_nanana_twist"},
	{25, 1, 1, 0, "dessert_para_roll"},
	{25, 1, 1, 0, "dessert_parwan_nutricake"},	
	{25, 1, 1, 0, "dessert_pikatta_pie"},
	{25, 1, 1, 0, "dessert_pkneb"},
	{25, 1, 1, 0, "dessert_puffcake"},	
	{25, 1, 1, 0, "dessert_ryshcate"},
	{25, 1, 1, 0, "dessert_smugglers_delight"},	
	{25, 1, 1, 0, "dessert_sweet_cake_mix"},
	{25, 1, 1, 0, "dessert_tranna_nougat_cream"},	
	{25, 1, 1, 0, "dessert_wedding_cake"},
	{25, 1, 1, 0, "dessert_won_won"},	
	{25, 1, 1, 0, "dish_bivoli_tempari"},
	{25, 1, 1, 0, "dish_blood_chowder"},
	{25, 1, 1, 0, "dish_braised_canron"},
	{25, 1, 1, 0, "dish_cho_nor_hoola"},
	{25, 1, 1, 0, "dish_crispic"},
	{25, 1, 1, 0, "dish_dustcrepe"},
	{25, 1, 1, 0, "dish_exo_protein_wafers"},
	{25, 1, 1, 0, "dish_fire_stew"},
	{25, 1, 1, 0, "dish_fried_endwa"},
	{25, 1, 1, 0, "dish_gruuvan_shaal"},
	{25, 1, 1, 0, "dish_havla"},
	{25, 1, 1, 0, "dish_kanali_wafers"},
	{25, 1, 1, 0, "dish_karkan_ribenes"},
	{25, 1, 1, 0, "dish_meatlump"},
	{25, 1, 1, 0, "dish_ormachek"},
	{25, 1, 1, 0, "dish_patot_panak"},
	{25, 1, 1, 0, "dish_protato"},
	{25, 1, 1, 0, "dish_puk"},
	{25, 1, 1, 0, "dish_rakririan_burnout_sauce"},
	{25, 1, 1, 0, "dish_ramorrean_capanata"},
	{25, 1, 1, 0, "dish_rations"},
	{25, 1, 1, 0, "dish_scrimpi"},
	{25, 1, 1, 0, "dish_soypro"},
	{25, 1, 1, 0, "dish_stewed_gwouch"},	
	{25, 1, 1, 0, "dish_teltier_noodles"},
	{25, 1, 1, 0, "dish_terratta"},	
	{25, 1, 1, 0, "dish_travel_biscuits"},
	{25, 1, 1, 0, "dish_trimpian"},
	{25, 1, 1, 0, "dish_vegeparsine"},		
	{25, 1, 1, 0, "dish_wastril_bread"},
	{25, 1, 1, 0, "dish_xermaauc"},	
	{25, 1, 1, 0, "drink_aitha"},
	{25, 1, 1, 0, "drink_alcohol"},
	{25, 1, 1, 0, "drink_aludium_pu36"},
	{25, 1, 1, 0, "drink_angerian_fishak_surprise"},
	{25, 1, 1, 0, "drink_antakarian_fire_dancer"},
	{25, 1, 1, 0, "drink_bantha_blaster"},		
	{25, 1, 1, 0, "drink_breath_of_heaven"},
	{25, 1, 1, 0, "drink_caf"},
	{25, 1, 1, 0, "drink_charde"},
	{25, 1, 1, 0, "drink_corellian_ale"},
	{25, 1, 1, 0, "drink_corellian_brandy"},
	{25, 1, 1, 0, "drink_cortyg"},
	{25, 1, 1, 0, "drink_deuterium_pyro"},
	{25, 1, 1, 0, "drink_double_dip_outer_rim_rumdrop"},
	{25, 1, 1, 0, "drink_durindfire"},
	{25, 1, 1, 0, "drink_elshandruu_pica_thundercloud"},	
	{25, 1, 1, 0, "drink_gralinyn_juice"},
	{25, 1, 1, 0, "drink_ice_blaster"},	
	{25, 1, 1, 0, "drink_jaar"},
	{25, 1, 1, 0, "drink_jawa_beer"},
	{25, 1, 1, 0, "drink_kylessian_fruit_distillate"},
	{25, 1, 1, 0, "drink_mandalorian_wine"},
	{25, 1, 1, 0, "drink_ruby_bliel"},
	{25, 1, 1, 0, "drink_skannbult_likker"},
	{25, 1, 1, 0, "drink_spiced_tea"},
	{25, 1, 1, 0, "drink_starshine_surprise"},
	{25, 1, 1, 0, "drink_sullustan_gin"},
	{25, 1, 1, 0, "drink_tatooine_sunburn"},
	{25, 1, 1, 0, "drink_tilla_tiil"},
	{25, 1, 1, 0, "drink_tssolok"},	
	{25, 1, 1, 0, "drink_vayerbok"},
	{25, 1, 1, 0, "drink_veronian_berry_wine"},	
}














