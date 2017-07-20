-- Legend of Hondo Merchant System
-- By Tatwi www.tpot.ca 2015


dolan_template = ConvoTemplate:new {
	initialScreen = "start",
	templateType = "Lua",
	luaClassHandler = "dolan_convo_handler",
	screens = {}
}


dolan_start = ConvoScreen:new {
  id = "start",
  leftDialog = "",
  customDialogText = "Looking for a droid, are ya? Well, I have some... hhhmm... tracking doids... seekers... and... well, a few of these things.",
  stopConversation = "false",
  options = {
  	{"Cool. What are your prices?", "shop"},
    {"Not what I am looking for", "nope"}
  }
}
dolan_template:addScreen(dolan_start);


dolan_shop = ConvoScreen:new {
  id = "shop",
  leftDialog = "",
  customDialogText = "If you're into bounty hunting, I'm your new best friend - you won't find better droids anywhere else!", 
  stopConversation = "false",
  options = { 
  }
}
dolan_template:addScreen(dolan_shop);


dolan_confirm_purchase = ConvoScreen:new {
  id = "confirm_purchase",
  leftDialog = "",
  customDialogText = "Are you sure you would like to make this purchase?",
  stopConversation = "false",
  options = { 
  }
}
dolan_template:addScreen(dolan_confirm_purchase);


dolan_bye = ConvoScreen:new {
  id = "bye",
  leftDialog = "",
  customDialogText = "Thank you for your business.",
  stopConversation = "true",
  options = {
  }
}
dolan_template:addScreen(dolan_bye);


dolan_nope = ConvoScreen:new {
  id = "nope",
  leftDialog = "",
  customDialogText = "Alright, catch you later.",
  stopConversation = "true",
  options = { 
  }
}
dolan_template:addScreen(dolan_nope);


dolan_get_lost = ConvoScreen:new {
  id = "get_lost",
  leftDialog = "",
  customDialogText = "You've got some nerve showing your face around here!",
  stopConversation = "false",
  options = {
	{"Ah man, now what am I going to do?", "get_lost_reply"}
  }
}
dolan_template:addScreen(dolan_get_lost);

dolan_get_lost_reply = ConvoScreen:new {
  id = "get_lost_reply",
  leftDialog = "",
  customDialogText = "Stop being such a bully?",
  stopConversation = "true",
  options = {
  }
}
dolan_template:addScreen(dolan_get_lost_reply);


dolan_faction_too_low = ConvoScreen:new {
  id = "faction_too_low",
  leftDialog = "",
  customDialogText = "Sorry, but I don't trust you enough to do business with you.",
  stopConversation = "false",
  options = {
	{"I get that. I really do... Bye", "bye"}
  }
}
dolan_template:addScreen(dolan_faction_too_low);


dolan_insufficient_funds = ConvoScreen:new {
  id = "insufficient_funds",
  leftDialog = "",
  customDialogText = "Sorry, but you do not have enough credits on hand to make this purchase.",
  stopConversation = "true",
  options = { 
  }
}
dolan_template:addScreen(dolan_insufficient_funds);


-- Template Footer
addConversationTemplate("dolan_template", dolan_template);
