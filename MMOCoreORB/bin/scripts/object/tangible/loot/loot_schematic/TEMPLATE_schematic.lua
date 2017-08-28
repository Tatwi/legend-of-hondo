-- Legend of Hondo
-- Copy/paste/rename this file.
-- Use "Replace All" in text editor, replacing TEMPLATE with correct file name (such as hammer_of_awesomeness).
-- Set requiredSkill, targetDraftSchematic, and targetUseCount as desired.

object_tangible_loot_loot_schematic_TEMPLATE_schematic = object_tangible_loot_loot_schematic_shared_TEMPLATE_schematic:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = "LootSchematicMenuComponent",
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "outdoors_bio_engineer_master",
	targetDraftSchematic = "object/draft_schematic/bio_engineer/creature/.iff",
	targetUseCount = 1,
}

ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_TEMPLATE_schematic, "object/tangible/loot/loot_schematic/TEMPLATE_schematic.iff")

-- Copy/Paste below data into objects.lua then delete it from this file.

object_tangible_loot_loot_schematic_shared_TEMPLATE_schematic = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/loot/loot_schematic/shared_TEMPLATE_schematic.iff"
}

ObjectTemplates:addClientTemplate(object_tangible_loot_loot_schematic_shared_TEMPLATE_schematic, "object/tangible/loot/loot_schematic/shared_TEMPLATE_schematic.iff")
