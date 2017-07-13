volrik_lonugs = Creature:new {
	objectName = "@mob/creature_names:commoner",
	customName = "Volrik Lonugs (Armor Merchant)",
	socialGroup = "townsperson",
	pvpFaction = "townsperson",
	faction = "townsperson",
	level = 1,
	chanceHit = 0.25,
	damageMin = 50,
	damageMax = 55,
	baseXp = 113,
	baseHAM = 180,
	baseHAMmax = 220,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = NONE,
	optionsBitmask = AIENABLED + CONVERSABLE + INTERESTING,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_commoner_tatooine_rodian_male_03.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "volriklonugs_template",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(volrik_lonugs, "volrik_lonugs")
