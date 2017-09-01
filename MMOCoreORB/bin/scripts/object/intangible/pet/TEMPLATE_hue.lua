-- Legend of Hondo

object_intangible_pet_TEMPLATE_hue = object_intangible_pet_shared_TEMPLATE_hue:new {

}

ObjectTemplates:addTemplate(object_intangible_pet_TEMPLATE_hue, "object/intangible/pet/TEMPLATE_hue.iff")

-- Copy / Paste the below data into objects.lua and then delete it

object_intangible_pet_shared_TEMPLATE_hue = SharedIntangibleObjectTemplate:new {
	clientTemplateFileName = "object/intangible/pet/shared_TEMPLATE_hue.iff"
}

ObjectTemplates:addClientTemplate(object_intangible_pet_shared_TEMPLATE_hue, "object/intangible/pet/shared_TEMPLATE_hue.iff")
