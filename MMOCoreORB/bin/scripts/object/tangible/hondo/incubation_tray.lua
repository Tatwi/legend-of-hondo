-- Legend of Hondo

object_tangible_hondo_incubation_tray = object_tangible_hondo_shared_incubation_tray:new {

	numberExperimentalProperties = {1, 1, 3, 3, 1},
	experimentalProperties = {"XX", "XX", "OQ","PE","DR", "OQ","PE","SR", "XX"},
	experimentalWeights = {1, 1, 2, 1, 1, 2, 1, 1, 1},
	experimentalGroupTitles = {"null", "null", "mutagen", "purity", "null"},
	experimentalSubGroupTitles = {"null", "null", "mutagen", "purity", "hitpoints"},
	experimentalMin = {0, 0, 1, 1, 1000},
	experimentalMax = {0, 0, 100, 100, 1000},
	experimentalPrecision = {0, 0, 0, 0, 0},
	experimentalCombineType = {0, 0, 1, 1, 4},
	
}

ObjectTemplates:addTemplate(object_tangible_hondo_incubation_tray, "object/tangible/hondo/incubation_tray.iff")
