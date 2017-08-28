-- Legend of Hondo
-- Copy/paste/rename this file.
-- Use "Replace All" in text editor, replacing TEMPLATE with correct file name (such as purbole).
-- Set generatedObjectTemplate, controlDeviceObjectTemplate, and mobileTemplate as desired.
-- controlDeviceObjectTemplate already exists for all Creature Handler type pets

object_tangible_deed_pet_deed_TEMPLATE_deed = object_tangible_deed_pet_deed_shared_TEMPLATE_deed:new {

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
	generatedObjectTemplate = "mobile/pet/TEMPLATE_be.iff",
	controlDeviceObjectTemplate = "object/intangible/pet/TEMPLATE_hue.iff",
	mobileTemplate = "TEMPLATE_be",	
}

ObjectTemplates:addTemplate(object_tangible_deed_pet_deed_TEMPLATE_deed, "object/tangible/deed/pet_deed/TEMPLATE_deed.iff")

-- Copy/Paste below data into objects.lua then delete it from this file.

object_tangible_deed_pet_deed_shared_TEMPLATE_deed = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/deed/pet_deed/shared_TEMPLATE_deed.iff"
}

ObjectTemplates:addClientTemplate(object_tangible_deed_pet_deed_shared_TEMPLATE_deed, "object/tangible/deed/pet_deed/shared_TEMPLATE_deed.iff")
