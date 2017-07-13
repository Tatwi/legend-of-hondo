-- Legend of Hondo Merchant System
-- By Tatwi www.tpot.ca 2015


nalyaro_template = ConvoTemplate:new {
	initialScreen = "start",
	templateType = "Lua",
	luaClassHandler = "nalyaro_convo_handler",
	screens = {}
}


nalyaro_start = ConvoScreen:new {
  id = "start",
  leftDialog = "",
  customDialogText = "I ain't got time for chatter. Do you wanna buy some armor or not?",
  stopConversation = "false",
  options = {
  	{"Sure thing, boss.", "shop"},
    {"Nope", "nope"}
  }
}
nalyaro_template:addScreen(nalyaro_start);


nalyaro_shop = ConvoScreen:new {
  id = "shop",
  leftDialog = "",
  customDialogText = "This stuff is almost top of the line. 50% resists to everything except them laser swords, which ya never see nomore nohow. Can slice'm real good too.", 
  stopConversation = "false",
  options = { 
  }
}
nalyaro_template:addScreen(nalyaro_shop);


nalyaro_confirm_purchase = ConvoScreen:new {
  id = "confirm_purchase",
  leftDialog = "",
  customDialogText = "Are you sure you would like to make this purchase?",
  stopConversation = "false",
  options = { 
  }
}
nalyaro_template:addScreen(nalyaro_confirm_purchase);


nalyaro_bye = ConvoScreen:new {
  id = "bye",
  leftDialog = "",
  customDialogText = "Get outa here, ya bum!",
  stopConversation = "true",
  options = {
  }
}
nalyaro_template:addScreen(nalyaro_bye);


nalyaro_nope = ConvoScreen:new {
  id = "nope",
  leftDialog = "",
  customDialogText = "Ooo, I oughta feed ya to the Sarlaac fer wastin' my time!",
  stopConversation = "true",
  options = { 
  }
}
nalyaro_template:addScreen(nalyaro_nope);


nalyaro_get_lost = ConvoScreen:new {
  id = "get_lost",
  leftDialog = "",
  customDialogText = "You've got some nerve showing your face around here!",
  stopConversation = "false",
  options = {
	{"I'm leaving...", "get_lost_reply"}
  }
}
nalyaro_template:addScreen(nalyaro_get_lost);

nalyaro_get_lost_reply = ConvoScreen:new {
  id = "get_lost_reply",
  leftDialog = "",
  customDialogText = "You're luck we're lettin' ya.",
  stopConversation = "true",
  options = {
  }
}
nalyaro_template:addScreen(nalyaro_get_lost_reply);


nalyaro_faction_too_low = ConvoScreen:new {
  id = "faction_too_low",
  leftDialog = "",
  customDialogText = "Sorry, but I don't trust you enough to do business with you.",
  stopConversation = "false",
  options = {
	{"I get that. I really do... Bye", "bye"}
  }
}
nalyaro_template:addScreen(nalyaro_faction_too_low);


nalyaro_insufficient_funds = ConvoScreen:new {
  id = "insufficient_funds",
  leftDialog = "",
  customDialogText = "Sorry, but you do not have enough credits on hand to make this purchase.",
  stopConversation = "true",
  options = { 
  }
}
nalyaro_template:addScreen(nalyaro_insufficient_funds);


-- Template Footer
addConversationTemplate("nalyaro_template", nalyaro_template);
