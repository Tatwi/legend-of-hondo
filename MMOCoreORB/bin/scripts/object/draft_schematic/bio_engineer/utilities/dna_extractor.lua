-- Legend of Hondo

object_draft_schematic_bio_engineer_utilities_dna_extractor = object_draft_schematic_bio_engineer_utilities_shared_dna_extractor:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "DNA Extractor",

   craftingToolTab = 8192, -- (See DraftSchematicObjectTemplate.h)
   complexity = 18, 
   size = 1, 

   xpType = "crafting_bio_engineer_creature", 
   xp = 250, 

   assemblySkill = "bio_engineer_assembly", 
   experimentingSkill = "bio_engineer_experimentation", 
   customizationSkill = "bio_customization", 

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_chemical_ingredients_n", "craft_chemical_ingredients_n", "craft_food_ingredients_n", "craft_chemical_ingredients_n", "craft_chemical_ingredients_n", "craft_chemical_ingredients_n"},
   ingredientTitleNames = {"body_shell", "organic_element", "protein_source", "delivery_medium", "drug_duration_compound", "drug_strength_compound"},
   ingredientSlotType = {0, 0, 0, 0, 0, 0},
   resourceTypes = {"metal", "organic", "creature_food", "water", "radioactive", "chemical"},
   resourceQuantities = {250, 50, 50, 100, 25, 25},
   contribution = {100, 100, 100, 100, 100, 100},

   targetTemplate = "object/tangible/medicine/pet/dna_extractor.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_bio_engineer_utilities_dna_extractor, "object/draft_schematic/bio_engineer/utilities/dna_extractor.iff")
