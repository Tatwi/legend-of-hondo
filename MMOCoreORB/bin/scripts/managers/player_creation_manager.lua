--Should all created players start with God Mode? 1 = yes, 0 = no
freeGodMode = 0;
--How many cash credits new characters start with after creating a character (changed during test phase, normal value is 100)
startingCash = 25000
--startingCash = 100000
--How many bank credits new characters start with after creating a character (changed during test phase, normal value is 1000)
startingBank = 25000
--startingBank = 100000
--How many skill points a new characters start with
skillPoints = 250

professions = {
	"outdoors_scout",
}

professionSpecificItems = {
	outdoors_scout = {
		"object/weapon/ranged/pistol/pistol_cdef.iff",
		"object/weapon/melee/knife/knife_survival.iff",
		"object/tangible/crafting/station/generic_tool.iff",
		"object/tangible/survey_tool/survey_tool_mineral.iff",
		"object/tangible/survey_tool/survey_tool_liquid.iff",
		"object/tangible/deed/vehicle_deed/landspeeder_x31_deed.iff",
		"object/tangible/container/medical/medbag_base.iff",
		"object/tangible/medicine/stimpack_sm_s1.iff",
		"object/tangible/medicine/crafted/medpack_wound_health_a.iff",
	 },
}

commonStartingItems = {"object/tangible/food/foraged/foraged_fruit_s1.iff"}
