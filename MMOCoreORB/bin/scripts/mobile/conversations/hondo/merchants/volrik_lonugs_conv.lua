-- Legend of Hondo Merchant System
-- By Tatwi www.tpot.ca 2015


volriklonugs_template = ConvoTemplate:new {
	initialScreen = "start",
	templateType = "Lua",
	luaClassHandler = "volriklonugs_convo_handler",
	screens = {}
}


volriklonugs_start = ConvoScreen:new {
  id = "start",
  leftDialog = "",
  customDialogText = "In the market for a suit of armor are ya?",
  stopConversation = "false",
  options = {
  	{"That's right.", "shop"},
  	{"Is this the only place I can get armor?", "help1"},
    {"Nope", "nope"}
  }
}
volriklonugs_template:addScreen(volriklonugs_start);


volriklonugs_shop = ConvoScreen:new {
  id = "shop",
  leftDialog = "",
  customDialogText = "I've got some basic designs that will fit anyone and generally be better than nothing. Pretty cheap too. The boss has been too busy training new crafters to make anything else. Stats are 24/24/12/4 Kinetic, Energy, Electricity, Acid on each suit.",
  stopConversation = "false",
  options = { 
  }
}
volriklonugs_template:addScreen(volriklonugs_shop);


volriklonugs_confirm_purchase = ConvoScreen:new {
  id = "confirm_purchase",
  leftDialog = "",
  customDialogText = "Are you sure you would like to make this purchase?",
  stopConversation = "false",
  options = { 
  }
}
volriklonugs_template:addScreen(volriklonugs_confirm_purchase);


volriklonugs_bye = ConvoScreen:new {
  id = "bye",
  leftDialog = "",
  customDialogText = "Careful out there.",
  stopConversation = "true",
  options = {
  }
}
volriklonugs_template:addScreen(volriklonugs_bye);


volriklonugs_nope = ConvoScreen:new {
  id = "nope",
  leftDialog = "",
  customDialogText = "Good luck to ya!",
  stopConversation = "true",
  options = { 
  }
}
volriklonugs_template:addScreen(volriklonugs_nope);


volriklonugs_get_lost = ConvoScreen:new {
  id = "get_lost",
  leftDialog = "",
  customDialogText = "You've got a lot of nerve showing your face around here!",
  stopConversation = "false",
  options = {
	{"Really? Is it worth anything? If so, can I interest you in buying some?", "get_lost_reply"}
  }
}
volriklonugs_template:addScreen(volriklonugs_get_lost);

volriklonugs_get_lost_reply = ConvoScreen:new {
  id = "get_lost_reply",
  leftDialog = "",
  customDialogText = "Out!",
  stopConversation = "true",
  options = {
  }
}
volriklonugs_template:addScreen(volriklonugs_get_lost_reply);


volriklonugs_faction_too_low = ConvoScreen:new {
  id = "faction_too_low",
  leftDialog = "",
  customDialogText = "Sorry, but I don't trust you enough to do business with you.",
  stopConversation = "false",
  options = {
	{"I get that. I really do... Bye", "bye"}
  }
}
volriklonugs_template:addScreen(volriklonugs_faction_too_low);


volriklonugs_insufficient_funds = ConvoScreen:new {
  id = "insufficient_funds",
  leftDialog = "",
  customDialogText = "Sorry, but you do not have enough credits on hand to make this purchase.",
  stopConversation = "true",
  options = { 
  }
}
volriklonugs_template:addScreen(volriklonugs_insufficient_funds);


volriklonugs_help1 = ConvoScreen:new {
  id = "help1",
  leftDialog = "",
  customDialogText = "The Empire will happily suit you up if you join them. Bet them Rebels would too. Otherwise, ya might need to get some second hand stuff, if you catch my meaning, or get someone on your crew to craft some for ya. There are some merchants on other planets of course, but that's dangerous stuff I don't know much about...",
  stopConversation = "false",
  options = {
	{"Really? No one else sells armor on Tatooine?", "help1a"},
	{"OK, show me what you've got.", "shop"},
	{"I see. Well, thanks for the tips.", "bye"}
  }
}
volriklonugs_template:addScreen(volriklonugs_help1);


volriklonugs_help1a = ConvoScreen:new {
  id = "help1a",
  leftDialog = "",
  customDialogText = "*cough* There is no finer establishment for armor than our own! You certainly cannot gain access to more advanced armor sets by befriending the likes of Jabba the Hutt or other galactic factions. *wink*",
  stopConversation = "false",
  options = {
	{"OK, show me what you've got.", "shop"},
	{"Riiiight, cetainly not! Thanks for your time.", "bye"}
  }
}
volriklonugs_template:addScreen(volriklonugs_help1a);




-- Template Footer
addConversationTemplate("volriklonugs_template", volriklonugs_template);
