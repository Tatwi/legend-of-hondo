-- Legend of Hondo
-- Copy/paste/rename this file.
-- Use "Replace All" in text editor, replacing TEMPLATE with correct file name (such as purbole).
-- Set customObjectName as desired.

object_draft_schematic_bio_engineer_creature_creature_TEMPLATE = object_draft_schematic_bio_engineer_creature_shared_creature_TEMPLATE:new {

   templateType = DRAFTSCHEMATIC,
   disableFactoryRun = true,	

   customObjectName = "NAME",

   craftingToolTab = 256, -- (See DraftSchematicObjectTemplate.h)
   complexity = 19, 
   size = 1, 

   xpType = "crafting_bio_engineer_creature", 
   xp = 140, 

   assemblySkill = "bio_engineer_assembly", 
   experimentingSkill = "bio_engineer_experimentation", 
   customizationSkill = "bio_engineer_experimentation", 

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_creature_ingredients_n", "craft_creature_ingredients_n", "craft_creature_ingredients_n"},
   ingredientTitleNames = {"dna_template", "protein_base", "organic_nutrition_materials"},
   ingredientSlotType = {1, 0, 0},
   resourceTypes = {"object/tangible/component/dna/shared_dna_template_generic.iff", "creature_food", "flora_food"},
   resourceQuantities = {1, 40, 35},
   contribution = {100, 100, 100},


   targetTemplate = "object/tangible/deed/pet_deed/TEMPLATE_deed.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_bio_engineer_creature_creature_TEMPLATE, "object/draft_schematic/bio_engineer/creature/creature_TEMPLATE.iff")


-- Copy/Paste below data into objects.lua then delete it from this file.

object_draft_schematic_bio_engineer_creature_shared_creature_TEMPLATE = SharedDraftSchematicObjectTemplate:new {
	clientTemplateFileName = "object/draft_schematic/bio_engineer/creature/shared_creature_TEMPLATE.iff"
}

ObjectTemplates:addClientTemplate(object_draft_schematic_bio_engineer_creature_shared_creature_TEMPLATE, "object/draft_schematic/bio_engineer/creature/shared_creature_TEMPLATE.iff")

