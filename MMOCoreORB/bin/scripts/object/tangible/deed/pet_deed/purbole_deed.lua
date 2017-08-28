-- Legend of Hondo

object_tangible_deed_pet_deed_purbole_deed = object_tangible_deed_pet_deed_shared_purbole_deed:new {

	templateType = PETDEED,
	numberExperimentalProperties = {1, 1},
	experimentalProperties = {"XX", "XX"},
	experimentalWeights = {1, 1},
	experimentalGroupTitles = {"null", "null"},
	experimentalSubGroupTitles = {"null", "null"},
	experimentalMin = {0, 0},
	experimentalMax = {0, 0},
	experimentalPrecision = {0, 0},
	experimentalCombineType = {0, 0},
	generatedObjectTemplate = "mobile/pet/rancor_be.iff",
	controlDeviceObjectTemplate = "object/intangible/pet/purbole_hue.iff",
	mobileTemplate = "purbole_be",	
}

ObjectTemplates:addTemplate(object_tangible_deed_pet_deed_purbole_deed, "object/tangible/deed/pet_deed/purbole_deed.iff")
