ImperialDetachmentHQScreenPlay = ScreenPlay:new {
	numberOfActs = 1,

}

registerScreenPlay("ImperialDetachmentHQScreenPlay", true)

function ImperialDetachmentHQScreenPlay:start()
	if (isZoneEnabled("tatooine")) then
		self:spawnMobiles()
	end
end

function ImperialDetachmentHQScreenPlay:spawnMobiles()

	-- Station House
	spawnSceneObject("tatooine", "object/tangible/terminal/terminal_mission_imperial.iff", 10.0495, 1.01, 5.5, 9995385, 1, 0, 0, 0)
	spawnSceneObject("tatooine", "object/tangible/terminal/terminal_mission_imperial.iff", -9.82202, 1.01, 5.5, 9995385, 1, 0, 0, 0)
	spawnMobile("tatooine", "stormtrooper", 1, -2637.84, 5, 2120.28, 275, 0)
	spawnMobile("tatooine", "stormtrooper", 1, -2638.19, 5, 2114.93, 278, 0)
	spawnMobile("tatooine", "stormtrooper", 1, 7.09795, 1.01, 14.7267, 296, 9995384)
	spawnMobile("tatooine", "stormtrooper", 1, -7.37347, 1.01, 14.6983, 39, 9995384)
	spawnMobile("tatooine", "imperial_recruiter", 1, -19.7183, 1.01, 17.796, 143, 9995387)
	spawnMobile("tatooine", "civilian_patrolman", 1, -17.9551, 1.01, 15.7527, 315, 9995387)
	spawnMobile("tatooine", "stormtrooper_major", 1, 16.5685, 1.01, 15.5818, 48, 9995386)
	spawnMobile("tatooine", "special_missions_engineer", 1, 17.9223, 1.01, 19.3028, 171, 9995386)
	spawnMobile("tatooine", "r4", 1, -1.87423, 2.01, 3.88884, 133, 9995385)
	spawnMobile("tatooine", "imperial_second_lieutenant", 1, 0.268727, 2.01, 4.4969, 352, 9995385)
	local pNpc = spawnMobile("tatooine", "no_agro_signalman", 1, 2.32403, 2.01, 3.63889, 39, 9995385)
		self:setMoodString(pNpc, "npc_use_terminal_high")
	pNpc = spawnMobile("tatooine", "no_agro_imperial_cadet", 1, 11.7324, 1.01, -0.904133, 93, 9995388)
		self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "no_agro_imperial_cadet", 1, 11.7364, 1.01, -2.06428, 85, 9995388)
		self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "no_agro_imperial_cadet", 1, 14.3398, 1.01, 0.0952984, 72, 9995388)
		self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "no_agro_imperial_cadet", 1, 14.2657, 1.01, -3.14262, 86, 9995388)
		self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "no_agro_imperial_cadet", 1, 16.6155, 1.01, -0.953036, 86, 9995388)
		self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "no_agro_imperial_cadet", 1, 16.5403, 1.01, -2.02028, 100, 9995388)
		self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "no_agro_imperial_cadet", 1, 16.4342, 1.01, -3.103, 81, 9995388)
		self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "no_agro_imperial_cadet", 1, 16.5756, 1.01, -4.16532, 81, 9995388)
		self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "no_agro_imperial_cadet", 1, 16.5076, 1.01, -5.35661, 75, 9995388)
		self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "no_agro_imperial_army_captain", 1, 20.0737, 1.01, -2.0068, 266, 9995388)
		self:setMoodString(pNpc, "conversation")
	spawnMobile("tatooine", "darknovatrooper", 1, 15.5417, 1.01, -15.0869, 354, 9995385)
	spawnMobile("tatooine", "dark_trooper", 1, 13.311, 1.01, -14.9178, 356, 9995385)
	pNpc = spawnMobile("tatooine", "patron", 1, 15.3345, 1.01, -20.7434, 267, 9995389)
		self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "patron", 1, 13.5979, 1.01, -20.8328, 79, 9995389)
		self:setMoodString(pNpc, "npc_sitting_chair")
	spawnMobile("tatooine", "stormtrooper", 1, -2.29045, 1.01, -21.1069, 88, 9995390)
	spawnMobile("tatooine", "scout_trooper", 1, -2.53205, 1.01, -19.3439, 73, 9995390)
	spawnMobile("tatooine", "stormtrooper", 1, -12.3834, 1.01, -13.4503, 356, 9995385)
	spawnMobile("tatooine", "imperial_inquisitor", 1, -9.21619, 1.01, -19.2027, 163, 9995391)
	spawnMobile("tatooine", "scientist", 1, -8.73101, 1.01, -21.2332, 344, 9995391)
	spawnMobile("tatooine", "stormtrooper", 1, -12.8363, 7.00958, -9.5, 142, 9995393)
	spawnMobile("tatooine", "stormtrooper", 1, -8.60277, 7.00958, -9.57417, 178, 9995393)
	pNpc = spawnMobile("tatooine", "no_agro_imperial_cadet", 1, -10.7557, 7.00975, -16.5813, 175, 9995393)
		self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "medic", 1, 7.1264, 7.00976, -11.1141, 38, 9995393)
		self:setMoodString(pNpc, "conversation")
	pNpc = spawnMobile("tatooine", "no_agro_imperial_cadet", 1, 8.34055, 7.00978, -10.3514, 259, 9995393)
		self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "no_agro_imperial_cadet", 1, 0.189262, 7.00975, -16.4112, 347, 9995393)
		self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "scientist", 1, 12.4835, 7.00978, -9.361, 90, 9995393)
		self:setMoodString(pNpc, "npc_sitting_chair")
	spawnMobile("tatooine", "medic", 1, -2.40741, 7.00967, 9.50963, 114, 9995394)
	pNpc = spawnMobile("tatooine", "commoner_old", 1, 0.238659, 7.00957, 7.74606, 265, 9995394)
		self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "commoner_old", 1, 0.157768, 7.0096, 11.3475, 261, 9995394)
		self:setMoodString(pNpc, "npc_sitting_chair")
	spawnMobile("tatooine", "r3", 1, -0.206482, 7.00963, 12.1066, 125, 9995394)
	pNpc = spawnMobile("tatooine", "no_agro_droid_corps_junior_technician", 1, 7.65813, 7.01, 10.0645, 246, 9995395)
		self:setMoodString(pNpc, "npc_use_terminal_high")
	spawnMobile("tatooine", "imperial_probe_drone", 1, 6.01403, 7.01, 9.73612, 21, 9995395)
	spawnMobile("tatooine", "r5", 1, 5.95443, 7.01, 12.4164, 142, 9995395)
	spawnMobile("tatooine", "stormtrooper", 1, -2629.85, 12.001, 2123.75, 269, 0)
	spawnMobile("tatooine", "stormtrooper", 1, -2628.72, 11.9941, 2129.03, 279, 0)
	spawnMobile("tatooine", "stormtrooper", 1, -2637.12, 12, 2097.45, 233, 0)
	spawnMobile("tatooine", "stormtrooper", 1, -2592.07, 12.001, 2089.79, 145, 0)
	spawnMobile("tatooine", "stormtrooper", 1, -2587.36, 12.002, 2129.54, 88, 0)

	-- Shuttle
	spawnMobile("tatooine", "imperial_pilot", 300, -2574.77, 5.42, 2087.59, -120, 0)
	spawnMobile("tatooine", "imperial_trooper", 300, -2579.42, 5.28, 2085.23, 55, 0)
	
	-- Equipment
	spawnMobile("tatooine", "imperial_trooper", 300, -2590.8, 5, 2069.73, 180, 0)
	
	-- Pallet
	spawnMobile("tatooine", "imperial_private", 300, -2558.17, 5.97, 2106.84, 180, 0)
	
	-- Generator
	spawnMobile("tatooine", "imperial_private", 300, -2555.57, 5.77, 2132.51, -45, 0)
		
	-- Office Exterior
	spawnMobile("tatooine", "stormtrooper", 300, -2573.94, 5.5, 2131.27, 180, 0)
	
	-- Barracks Exterior
	spawnMobile("tatooine", "stormtrooper", 300, -2568.7, 5.69, 2118.6, -90, 0)
	
	-- Bunker Exterior
	spawnMobile("tatooine", "stormtrooper", 300, -2576.48, 5.36, 2098.1, -90, 0)
	
	-- Office Interior
	spawnMobile("tatooine", "imperial_second_lieutenant", 300, 5.36, 0.1, 1.85, -90, 1250091)
	spawnMobile("tatooine", "imperial_private", 300, 2.57, 0.1, 1.74, 90, 1250091)
	spawnMobile("tatooine", "imperial_officer", 300, 4.23, 0.1, -2.13, 180, 1250092)
	spawnMobile("tatooine", "imperial_first_lieutenant", 300, 5.43, 0.1, -4.93, -16, 1250092)
	spawnMobile("tatooine", "imperial_private", 300, -4.21, 0.1, -5.33, 0, 1250093)

	-- Barracks Interior
	spawnMobile("tatooine", "imperial_private", 300, 4.00, 0.1, 2.95, 180, 1250084)
	spawnMobile("tatooine", "imperial_officer", 300, 3.97, 0.1, 1.12, -90, 1250084)
	spawnMobile("tatooine", "imperial_medic", 300, 5.02, 0.1, -4.24, -90, 1250085)
	spawnMobile("tatooine", "imperial_private", 300, -3.06, 0.1, -2.13, -177, 1250086)
	
	-- Bunker Interior
	
		-- Corridor
		spawnMobile("tatooine", "stormtrooper", 300, 3.81, 0.25, -3.84, 0, 1250068)
		
		-- Foyer
		spawnMobile("tatooine", "stormtrooper", 300, 5.98, -6.75, -9.32, 0, 1250071)
		spawnMobile("tatooine", "stormtrooper", 300, 3.07, 6.75, -9.71, 0, 1250071)
		spawnMobile("tatooine", "imperial_noncom", 300, 6.81, -6.75, -3.09, 180, 1250071)
		
		-- Mess hall
		spawnMobile("tatooine", "stormtrooper", 300, -5.05, -13.75, 6.70, -176, 1250073)
		spawnMobile("tatooine", "stormtrooper", 300, -2.16, -13.75, 6.70, -176, 1250073)
		spawnMobile("tatooine", "imperial_officer", 300, -6.39, -13.75, -4.39, 32, 1250073)
		spawnMobile("tatooine", "imperial_staff_sergeant", 300, -4.66, -13.75, -3.3, -126, 1250073)
	
		-- Medical Bay
		spawnMobile("tatooine", "imperial_medic", 300, 6.95, -13.75, 10.05, -90, 1250074)
		
		-- Waiting Room
		spawnMobile("tatooine", "imperial_trooper", 300, 14.12, -13.75, -1.94, 0, 1250075)
		spawnMobile("tatooine", "imperial_trooper", 300, 16.82, -13.75, -1.82, 0, 1250075)
		spawnMobile("tatooine", "imperial_first_lieutenant", 300, 18.12, -13.75, 8.64, -109, 1250075)
		spawnMobile("tatooine", "imperial_major", 300, 16.45, -13.75, 11.56, 180, 1250075)
				
		-- Command Center
		spawnMobile("tatooine", "imperial_trooper", 300, 13.70, -13.75, -4.07, 180, 1250076)
		spawnMobile("tatooine", "imperial_trooper", 300, 17.21, -13.75, -4.09, 180, 1250076)
		spawnMobile("tatooine", "imperial_second_lieutenant", 300, 16.44, -11.5, -20.790, -114, 1250076)
		spawnMobile("tatooine", "imperial_army_captain", 300, 13.72, -11.5, -21.06, -41, 1250076)
		spawnSceneObject("tatooine", "object/tangible/furniture/all/frn_all_technical_console_s02.iff", 14.06, -13.75, -13.93, 1250076, 0, 0, 0, 0 )
		spawnMobile("tatooine", "imperial_major", 300, 14.0, -13.75, -16.2, 0, 1250076)
		spawnMobile("tatooine", "imperial_major_general", 300, 16.0, -13.75, -13.8, 180, 1250076)
		spawnMobile("tatooine", "r5", 300, 14.0, -13.75, -12.1, 180, 1250076)
				
	-- End Bunker Interior
	
end

