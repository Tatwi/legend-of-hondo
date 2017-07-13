u8l7 = Creature:new {
	objectName = "@mob/creature_names:commoner",
	customName = "U8L7 (New Player Greeter)",
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

	templates = {"object/mobile/3po_protocol_droid_silver.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "u8l7_template",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(u8l7, "u8l7")
