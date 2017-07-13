cyan_yaro = Creature:new {
	objectName = "@mob/creature_names:commoner",
	customName = "Cyan Yaro (Bounty Hunter Armor Merchant)",
	socialGroup = "jabba",
	pvpFaction = "townsperson",
	faction = "jabba",
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

	templates = {"object/mobile/dressed_bounty_hunter_zabrak_female_01.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "cyanyaro_template",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(cyan_yaro, "cyan_yaro")
