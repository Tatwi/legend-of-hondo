-- Legend of Hondo

object_tangible_medicine_pet_dna_extractor = object_tangible_medicine_pet_shared_dna_extractor:new {
	--templateType = TRAP,
	objectMenuComponent = "DnaExtractorMenuComponent",

	useCount = 12,
	effectiveness = 112,
	attributes = {0, 3, 6},
	
	numberExperimentalProperties = {1, 1, 4, 1},
	experimentalProperties = {"XX", "XX", "OQ", "MA", "DR", "PE", "XX"},
	experimentalWeights = {1, 1, 1, 1, 1, 1, 1},
	experimentalGroupTitles = {"null", "null", "exp_charges", "null"},
	experimentalSubGroupTitles = {"null", "null", "charges", "hitpoints"},
	experimentalMin = {0, 0, 1, 1000},
	experimentalMax = {0, 0, 20, 1000},
	experimentalPrecision = {0, 0, 0, 0},
	experimentalCombineType = {0, 0, 1, 4},
}

ObjectTemplates:addTemplate(object_tangible_medicine_pet_dna_extractor, "object/tangible/medicine/pet/dna_extractor.iff")
