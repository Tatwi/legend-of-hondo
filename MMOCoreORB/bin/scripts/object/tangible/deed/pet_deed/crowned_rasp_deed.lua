-- Legend of Hondo

object_tangible_deed_pet_deed_crowned_rasp_deed = object_tangible_deed_pet_deed_shared_crowned_rasp_deed:new {

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
	generatedObjectTemplate = "mobile/pet/crowned_rasp_be.iff",
	controlDeviceObjectTemplate = "object/intangible/pet/crowned_rasp_hue.iff",
	mobileTemplate = "crowned_rasp_be",	
}

ObjectTemplates:addTemplate(object_tangible_deed_pet_deed_crowned_rasp_deed, "object/tangible/deed/pet_deed/crowned_rasp_deed.iff")
