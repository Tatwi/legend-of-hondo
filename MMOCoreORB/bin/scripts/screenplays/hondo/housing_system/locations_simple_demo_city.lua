-- Legend of Hondo
-- Static structures and decor for the Housing System demonstration city
-- Location: 1000x, 1000y on the "simple" planet
--[[
HondoHousingSystemDemoCity = ScreenPlay:new {
	numberOfActs = 1,
}

registerScreenPlay("HondoHousingSystemDemoCity", true)

function HondoHousingSystemDemoCity:start()
	if (not isZoneEnabled("simple")) then
		return
	end

	-- Buildings
	spawnSceneObject("simple", "object/building/tatooine/starport_tatooine.iff", 990.0, 0, 1000.0, 0, 1, 0, 0, 0)

	-- Walls and filler buildings
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_junkshop_watto.iff", 814.217, 0, 1067.57, 0, -0.999962, 0, 0.00872664, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/pillar_pristine_large_style_01.iff", 804.416, -1, 1066.8, 0, 0.707107, 0, 0.707107, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_junkshop_watto.iff", 803.87, 0, 1077.16, 0, 0.71325, 0, 0.700909, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_gate_tatooine_style_01.iff", 800.657, 0, 1089.65, 0, -0.887011, 0, 0.461749, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_pristine_tatooine_large_style_01.iff", 795.578, -1, 1095.49, 0, 0.190809, 0, 0.981627, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_gate_tatooine_wide_style_01.iff", 794.274, 0, 1107.29, 0, -0.999962, 0, 0.00872645, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_pristine_tatooine_large_style_01.iff", 796.205, -1, 1118.54, 0, -0.300706, 0, 0.953717, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_gate_tatooine_style_03.iff", 800.619, 0, 1124.84, 0, -0.317305, 0, 0.948324, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_junkshop_watto.iff", 802.802, 0, 1137.62, 0, 0.71325, 0, 0.700909, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/pillar_pristine_large_style_01.iff", 803.062, -1, 1147.08, 0, 0.707107, 0, 0.707107, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_junkshop_watto.iff", 812.37, 0, 1147.74, 0, 0.00872656, 0, 0.999962, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_pristine_tatooine_large_style_01.iff", 849.153, 0, 1156.23, 0, 0.00872654, 0, 0.999962, 0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_tatt_style01_06.iff", 851.548, 0, 1167.77, 0, 0.891007, 0, 0.453991, 0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_block_64x16_style_01.iff", 845.903, 0, 1213.3, 0, 0.731354, 0, 0.681998, 0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_tatt_style01_11.iff", 853.609, 0, 1262.99, 0, 0.725374, 0, 0.688355, 0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_block_64x32_style_01.iff", 905.927, 0, 1273.33, 0, 0.861629, 0, 0.507538, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_pristine_tatooine_large_style_02.iff", 837.34, -0.5, 1283.54, 0, 0.00872657, 0, 0.999962, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/pillar_pristine_large_style_01.iff", 837.853, 0, 1290.49, 0, 0.688355, 0, 0.725374, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_gate_tatooine_wide_style_01.iff", 839.357, 0, 1298.61, 0, -0.130526, 0, 0.991445, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/pillar_pristine_large_style_01.iff", 841.583, 0, 1305.26, 0, 0.5373, 0, 0.843391, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_pristine_tatooine_large_style_02.iff", 845.01, -0.5, 1312.64, 0, -0.275637, 0, 0.961262, 0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_tatt_style01_08.iff", 856.839, 0, 1322.25, 0, 0.529919, 0, 0.848048, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/stone_hovel_tatooine_style_01.iff", 864.112, 0, 1335.31, 0, -0.878817, 0, 0.477159, 0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_block_64x32_style_02.iff", 909.254, 0, 1353.57, 0, 0.317305, 0, 0.948324, 0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_tatt_style01_02.iff", 1120.06, 0, 1253.65, 0, -0.515038, 0, 0.857167, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_junkshop_watto.iff", 1160.57, 0, 1183.33, 0, -0.507538, 0, 0.861629, 0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_tatt_style01_10.iff", 1169.32, 0, 1162.74, 0, -0.573576, 0, 0.819152, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_pristine_tatooine_large_style_01.iff", 1160.57, -1, 1149.29, 0, -0.199368, 0, 0.979925, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_archway_tatooine_wide_style_01.iff", 1154.63, 0, 1139.42, 0, -0.317305, 0, 0.948324, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_pristine_tatooine_large_style_01.iff", 1147.37, -1, 1131.2, 0, -0.398749, 0, 0.91706, 0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_tatt_style01_09.iff", 1137.18, 0, 1124.47, 0, -0.906308, 0, 0.422618, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_junkshop_watto.iff", 1122.41, 0, 1113.91, 0, -0.97437, 0, 0.224951, 0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_tatt_style01_01.iff", 1082.53, 0, 865.055, 0, 0.173648, 0, -0.984808, 0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_block_64x16_style_01.iff", 1027.89, 0, 852.751, 0, 0.999848, 0, -0.0174524, -0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_block_64x16_style_02.iff", 959.021, 0, 847.685, 0, -1, 0, 6.51926e-08, 0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_tatt_style01_07.iff", 908.544, 0, 849.049, 0, 0.930418, 0, 0.366501, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_pristine_tatooine_tall_style_01.iff", 899.668, 0, 863.932, 0, 0.0174524, 0, 0.999848, 0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_slave_quarters_style_01.iff", 898.14, 0, 884.909, 0, -0.731354, 0, 0.681998, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_pristine_tatooine_large_style_01.iff", 900.275, 0, 901.509, 0, -0.156435, 0, 0.987688, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_archway_tatooine_large_style_01.iff", 902.238, 0, 907.281, 0, -0.165048, 0, 0.986286, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_pristine_tatooine_large_style_01.iff", 904.666, 0, 913.833, 0, -0.207912, 0, 0.978148, 0)
	spawnSceneObject("simple", "object/building/tatooine/filler_building_slave_quarters_style_01.iff", 913.897, 0, 926.449, 0, -0.93358, 0, 0.358368, 0)
	spawnSceneObject("simple", "object/static/structure/tatooine/wall_pristine_tatooine_tall_style_01.iff", 930.576, 0, 940.832, 0, -0.622515, 0, 0.782608, 0)
end
--]]
