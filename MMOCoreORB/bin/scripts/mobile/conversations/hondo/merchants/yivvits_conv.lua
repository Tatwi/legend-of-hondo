-- Legend of Hondo Merchant System
-- By Tatwi www.tpot.ca 2015


yivvits_template = ConvoTemplate:new {
	initialScreen = "start",
	templateType = "Lua",
	luaClassHandler = "yivvits_convo_handler",
	screens = {}
}


yivvits_start = ConvoScreen:new {
  id = "start",
  leftDialog = "",
  customDialogText = "Hello. Are you in need of a basic weapon to start practicing an adanced profession? If so, you've come to the right place.",
  stopConversation = "false",
  options = {
  	{"May I see what you have in stock?", "shop"},
    {"Nope", "nope"}
  }
}
yivvits_template:addScreen(yivvits_start);


yivvits_shop = ConvoScreen:new {
  id = "shop",
  leftDialog = "",
  customDialogText = "These are all refurbished weapons, not so great, but they'll give you the experience you need to advance in your chosen profession.", 
  stopConversation = "false",
  options = { 
  }
}
yivvits_template:addScreen(yivvits_shop);


yivvits_confirm_purchase = ConvoScreen:new {
  id = "confirm_purchase",
  leftDialog = "",
  customDialogText = "Are you sure you would like to make this purchase?",
  stopConversation = "false",
  options = { 
  }
}
yivvits_template:addScreen(yivvits_confirm_purchase);


yivvits_bye = ConvoScreen:new {
  id = "bye",
  leftDialog = "",
  customDialogText = "Thank you for your business.",
  stopConversation = "true",
  options = {
  }
}
yivvits_template:addScreen(yivvits_bye);


yivvits_nope = ConvoScreen:new {
  id = "nope",
  leftDialog = "",
  customDialogText = "Rude to a Wookiee who's selling weapons... Are you brave or stupid?",
  stopConversation = "true",
  options = { 
  }
}
yivvits_template:addScreen(yivvits_nope);


yivvits_get_lost = ConvoScreen:new {
  id = "get_lost",
  leftDialog = "",
  customDialogText = "You've got some nerve showing your face around here!",
  stopConversation = "false",
  options = {
	{"Ah man, now what am I going to do?", "get_lost_reply"}
  }
}
yivvits_template:addScreen(yivvits_get_lost);

yivvits_get_lost_reply = ConvoScreen:new {
  id = "get_lost_reply",
  leftDialog = "",
  customDialogText = "Make like a tree and leave?",
  stopConversation = "true",
  options = {
  }
}
yivvits_template:addScreen(yivvits_get_lost_reply);


yivvits_faction_too_low = ConvoScreen:new {
  id = "faction_too_low",
  leftDialog = "",
  customDialogText = "Sorry, but I don't trust you enough to do business with you.",
  stopConversation = "false",
  options = {
	{"I get that. I really do... Bye", "bye"}
  }
}
yivvits_template:addScreen(yivvits_faction_too_low);


yivvits_insufficient_funds = ConvoScreen:new {
  id = "insufficient_funds",
  leftDialog = "",
  customDialogText = "Sorry, but you do not have enough credits on hand to make this purchase.",
  stopConversation = "true",
  options = { 
  }
}
yivvits_template:addScreen(yivvits_insufficient_funds);


-- Template Footer
addConversationTemplate("yivvits_template", yivvits_template);
