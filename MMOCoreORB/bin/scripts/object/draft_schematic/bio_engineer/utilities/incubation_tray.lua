-- Legend of Hondo

object_draft_schematic_bio_engineer_utilities_incubation_tray = object_draft_schematic_bio_engineer_utilities_shared_incubation_tray:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Incubation Tray",

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

   ingredientTemplateNames = {"craft_chemical_ingredients_n", "craft_creature_ingredients_n", "craft_food_ingredients_n", "craft_chemical_ingredients_n", "craft_chemical_ingredients_n", "craft_chemical_ingredients_n"},
   ingredientTitleNames = {"body_shell", "organic_nutrition_materials", "protein_source", "delivery_medium", "drug_duration_compound", "drug_strength_compound"},
   ingredientSlotType = {0, 0, 0, 0, 0, 0},
   resourceTypes = {"metal", "organic", "creature_structural", "water", "petrochem_inert_polymer", "gas_reactive"},
   resourceQuantities = {20, 12, 12, 40, 8, 8},
   contribution = {100, 100, 100, 100, 100, 100},

   targetTemplate = "object/tangible/hondo/incubation_tray.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_bio_engineer_utilities_incubation_tray, "object/draft_schematic/bio_engineer/utilities/incubation_tray.iff")
