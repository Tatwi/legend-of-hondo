-- Legend of Hondo Merchant System
-- By Tatwi www.tpot.ca 2015


crazylarry_template = ConvoTemplate:new {
	initialScreen = "start",
	templateType = "Lua",
	luaClassHandler = "crazylarry_convo_handler",
	screens = {}
}


crazylarry_start = ConvoScreen:new {
  id = "start",
  leftDialog = "",
  customDialogText = "Welcome to Crazy Larry's Landspeeders! I'm Crazy Larry!",
  stopConversation = "false",
  options = {
  	{"Yeah, I know your name Larry...", "banter1"},
  }
}
crazylarry_template:addScreen(crazylarry_start);


crazylarry_shop = ConvoScreen:new {
  id = "shop",
  leftDialog = "",
  customDialogText = "Here's what I have in stock at the moment...",
  stopConversation = "false",
  options = { 
  }
}
crazylarry_template:addScreen(crazylarry_shop);


crazylarry_confirm_purchase = ConvoScreen:new {
  id = "confirm_purchase",
  leftDialog = "",
  customDialogText = "Are you sure you would like to make this purchase?",
  stopConversation = "false",
  options = { 
  }
}
crazylarry_template:addScreen(crazylarry_confirm_purchase);


crazylarry_bye = ConvoScreen:new {
  id = "bye",
  leftDialog = "",
  customDialogText = "Swoop... it even sounds fast!",
  stopConversation = "true",
  options = {
  }
}
crazylarry_template:addScreen(crazylarry_bye);


crazylarry_nope = ConvoScreen:new {
  id = "nope",
  leftDialog = "",
  customDialogText = "Well then...",
  stopConversation = "true",
  options = { 
  }
}
crazylarry_template:addScreen(crazylarry_nope);


crazylarry_get_lost = ConvoScreen:new {
  id = "get_lost",
  leftDialog = "",
  customDialogText = "You've got some nerve showing your face around here!",
  stopConversation = "false",
  options = {
	{"At least mine is a pretty face!", "get_lost_reply"}
  }
}
crazylarry_template:addScreen(crazylarry_get_lost);

crazylarry_get_lost_reply = ConvoScreen:new {
  id = "get_lost_reply",
  leftDialog = "",
  customDialogText = "Please don't make me contact the authorities.",
  stopConversation = "true",
  options = {
  }
}
crazylarry_template:addScreen(crazylarry_get_lost_reply);


crazylarry_faction_too_low = ConvoScreen:new {
  id = "faction_too_low",
  leftDialog = "",
  customDialogText = "Sorry, but I don't trust you enough to do business with you.",
  stopConversation = "false",
  options = {
	{"I get that. I really do... Bye", "bye"}
  }
}
crazylarry_template:addScreen(crazylarry_faction_too_low);


crazylarry_insufficient_funds = ConvoScreen:new {
  id = "insufficient_funds",
  leftDialog = "",
  customDialogText = "Sorry, but you do not have enough credits on hand to make this purchase.",
  stopConversation = "true",
  options = { 
  }
}
crazylarry_template:addScreen(crazylarry_insufficient_funds);


crazylarry_banter1 = ConvoScreen:new {
  id = "banter1",
  leftDialog = "",
  customDialogText = "Sorry. It's pretty busy around here lately... Nice to see another member of the Lokian gang for a change. What can I do for you?",
  stopConversation = "false",
  options = {
	{"You sell fish tanks, right?", "banter2"},
	{"I need a new vehicle", "shop"},
	{"Have any paint for a vehicle?", "shop"}
  }
}
crazylarry_template:addScreen(crazylarry_banter1);


crazylarry_banter2 = ConvoScreen:new {
  id = "banter2",
  leftDialog = "",
  customDialogText = "Oh yeah, lots of them! Boats and innertubes too! *gives you a dissapproving blank stare* I take it your here to buy a vehicle?",
  stopConversation = "false",
  options = {
	{"You're the man to see!", "banter3"}
  }
}
crazylarry_template:addScreen(crazylarry_banter2);


crazylarry_banter3 = ConvoScreen:new {
  id = "banter3",
  leftDialog = "",
  customDialogText = "I guess that is what I am these days... Ah well, I make more selling these things than I ever did racing them. ",
  stopConversation = "false",
  options = {
	{"Want to join us on our next job?", "banter4"},
	{"Care to show me your inventory?", "shop"}
  }
}
crazylarry_template:addScreen(crazylarry_banter3);


crazylarry_banter4 = ConvoScreen:new {
  id = "banter4",
  leftDialog = "",
  customDialogText = "I dunno... since we left Nym's and started our own thing here, you guys have done great with the pirating without me. I'm happy enough just fixing and selling vehicles.",
  stopConversation = "false",
  options = {
	{"Alright, old man. Let's see what you've got then.", "shop"}
  }
}
crazylarry_template:addScreen(crazylarry_banter4);


-- Template Footer
addConversationTemplate("crazylarry_template", crazylarry_template);
