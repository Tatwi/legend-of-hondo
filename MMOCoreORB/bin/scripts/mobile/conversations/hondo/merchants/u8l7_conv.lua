-- Legend of Hondo Merchant System
-- By Tatwi www.tpot.ca 2015


u8l7_template = ConvoTemplate:new {
	initialScreen = "start",
	templateType = "Lua",
	luaClassHandler = "u8l7_convo_handler",
	screens = {}
}


u8l7_start = ConvoScreen:new {
  id = "start",
  leftDialog = "",
  customDialogText = "Hello, I am U8L7, Human - Cyborg relations. How may I be of assistance today?",
  stopConversation = "false",
  options = {
  	{"I need some basic crafting equipment.", "shop"},
  	{"Know where I can find a starter weapon?", "shop"},
  	{"What can you tell me about this place?", "help1"},
    {"Hey! You dropped your pocket!", "nope"}
  }
}
u8l7_template:addScreen(u8l7_start);


u8l7_shop = ConvoScreen:new {
  id = "shop",
  leftDialog = "",
  customDialogText = "Indeed! The city supplies me with an endless amount of items people like yourself might find useful. Here is what I have available.",
  stopConversation = "false",
  options = { 
  }
}
u8l7_template:addScreen(u8l7_shop);


u8l7_confirm_purchase = ConvoScreen:new {
  id = "confirm_purchase",
  leftDialog = "",
  customDialogText = "Are you sure you would like to make this purchase?",
  stopConversation = "false",
  options = { 
  }
}
u8l7_template:addScreen(u8l7_confirm_purchase);


u8l7_bye = ConvoScreen:new {
  id = "bye",
  leftDialog = "",
  customDialogText = "Do take care of yourself.",
  stopConversation = "true",
  options = {
  }
}
u8l7_template:addScreen(u8l7_bye);


u8l7_nope = ConvoScreen:new {
  id = "nope",
  leftDialog = "",
  customDialogText = "Hmmm.... Head lamp fluid I can understand, but in this dusty environment it's a travesty that they're out of elbow grease! ***BZZZZRRRRP ERR...OR*** Sorry, were you talking?",
  stopConversation = "true",
  options = { 
  }
}
u8l7_template:addScreen(u8l7_nope);


u8l7_get_lost = ConvoScreen:new {
  id = "get_lost",
  leftDialog = "",
  customDialogText = "You've got some nerve showing your face around here!",
  stopConversation = "false",
  options = {
	{"Says the tin man.", "get_lost_reply"}
  }
}
u8l7_template:addScreen(u8l7_get_lost);

u8l7_get_lost_reply = ConvoScreen:new {
  id = "get_lost_reply",
  leftDialog = "",
  customDialogText = "Please don't make me contact the authorities.",
  stopConversation = "true",
  options = {
  }
}
u8l7_template:addScreen(u8l7_get_lost_reply);


u8l7_faction_too_low = ConvoScreen:new {
  id = "faction_too_low",
  leftDialog = "",
  customDialogText = "Sorry, but I don't trust you enough to do business with you.",
  stopConversation = "false",
  options = {
	{"I get that. I really do... Bye", "bye"}
  }
}
u8l7_template:addScreen(u8l7_faction_too_low);


u8l7_insufficient_funds = ConvoScreen:new {
  id = "insufficient_funds",
  leftDialog = "",
  customDialogText = "Sorry, but you do not have enough credits on hand to make this purchase.",
  stopConversation = "true",
  options = { 
  }
}
u8l7_template:addScreen(u8l7_insufficient_funds);


u8l7_help1 = ConvoScreen:new {
  id = "help1",
  leftDialog = "",
  customDialogText = "It looks to me, Sir, that you are a member of that... group of adventuring entrepreneurs who recently relocated here from Lok. The generousity and hard work of your group has really made a positive impact here in Mos Espa. In fact, the crime rate has declined so much that the Imperial presence has dimimished significantly beyond their garrison on the ourskirts of town. You'll find many comforts and facilities are available to you here in Mos Espa.",
  stopConversation = "false",
  options = {
	{"Are there other helpers like you?", "help1a"},
	{"Anything new I should know about?", "help1b"},
	{"How do I earn credits?", "help1c"},
	{"Interesting. See you later.", "bye"},
  }
}
u8l7_template:addScreen(u8l7_help1);


u8l7_help1a = ConvoScreen:new {
  id = "help1a",
  leftDialog = "",
  customDialogText = "Yes, there are many merchants, guides, and other characters throughout the galaxy who offer services such as item sales and item purchasing, while others may have tasks they need accomplished. Here in Mos Espa you will find Junk Dealers who will purchase general goods, including any items you happen to craft. You will also find terminals around the city for the housing system, which will allow you to purchase a home, a business, or a factory.",
  stopConversation = "false",
  options = {
	{"Anything new I should know about?", "help1b"},
	{"How do I earn credits?", "help1c"},
	{"May I see what you have for sale?", "shop"},
	{"Sounds like I need to go exploring!", "bye"}
  }
}
u8l7_template:addScreen(u8l7_help1a);


u8l7_help1b = ConvoScreen:new {
  id = "help1b",
  leftDialog = "",
  customDialogText = "Let me put it this way, you're in a whole new world, starting on an adventure unlike any you have had before. Forget your previous experiences and enjoy this galaxy for what it is! Personally, Sir, I highly suggest that you take some time to read your email, because I believe you have one that explains some fundimental things you will need to understand about the galaxy. Suffice to say that you are a member of a pirate gang and no matter the role you choose to play, your loyalties and experiences lie with your gang, in the spirit of the legendary priate, Hondo Onaka.",
  stopConversation = "false",
  options = {
	{"Are there other helpers like you?", "help1a"},
	{"How do I earn credits?", "help1c"},
	{"May I see what you have for sale?", "shop"},
	{"Read the manual? Buhahahaha!", "bye"}
  }
}
u8l7_template:addScreen(u8l7_help1b);


u8l7_help1c = ConvoScreen:new {
  id = "help1c",
  leftDialog = "",
  customDialogText = "Your two main sources of income will be missions, from Mission Terminals like the ones nearby, and selling virtually everything you find or craft to a Junk Dealer. Some Junk Dealers specialize in certain items, such as clothing and armor or weapons. You will eventually learn who specializes in what, but as a general reference all Junk Dealers are listed on your planetary map. Throughout the galaxy you will also find many people who are willing to pay for your assistance if you speak to them directly. Also, and it pains me to consider the horror, should you kill any creature or person there's the possibility you may discover they were hiding credits or items. Yes, even animals like to hoard junk it would seem...",
  stopConversation = "false",
  options = {
	{"Are there other helpers like you?", "help1a"},
	{"Anything new I should know about?", "help1b"},
	{"May I see what you have for sale?", "shop"},
	{"OK... great, thanks!", "bye"}
  }
}
u8l7_template:addScreen(u8l7_help1c);


-- Template Footer
addConversationTemplate("u8l7_template", u8l7_template);
