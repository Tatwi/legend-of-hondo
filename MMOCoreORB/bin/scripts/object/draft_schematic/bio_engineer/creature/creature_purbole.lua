-- Legend of Hondo

object_draft_schematic_bio_engineer_creature_creature_purbole = object_draft_schematic_bio_engineer_creature_shared_creature_purbole:new {

   templateType = DRAFTSCHEMATIC,
   disableFactoryRun = true,	

   customObjectName = "Purbole",

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


   targetTemplate = "object/tangible/deed/pet_deed/purbole_deed.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_bio_engineer_creature_creature_purbole, "object/draft_schematic/bio_engineer/creature/creature_purbole.iff")
