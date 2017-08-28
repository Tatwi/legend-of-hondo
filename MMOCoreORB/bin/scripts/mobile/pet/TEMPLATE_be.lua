-- Legend of Hondo
-- Use "Replace All" in text editor, replacing TEMPLATE with correct file name (such as purbole).
-- Change stats as desired.
-- templates must point to correct object

TEMPLATE_be = Creature:new {
	objectName = "@mob/creature_names:TEMPLATE",
	socialGroup = "TEMPLATE",
	faction = "",
	level = 5,
	chanceHit = 0.2,
	damageMin = 30,
	damageMax = 40,
	baseXp = 30,
	baseHAM = 45,
	baseHAMmax = 55,
	armor = 0,
	resists = {0,0,0,0,0,0,0,0,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/TEMPLATE_hue.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(TEMPLATE_be, "TEMPLATE_be")
