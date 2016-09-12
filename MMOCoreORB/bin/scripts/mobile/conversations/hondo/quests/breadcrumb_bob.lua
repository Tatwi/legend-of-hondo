breadcrumbBob_template = ConvoTemplate:new {
	initialScreen = "start",
	templateType = "Lua",
	luaClassHandler = "breadcrumbBob_convo_handler",
	screens = {}
}


breadcrumbBob_start = ConvoScreen:new {
  id = "start",
  leftDialog = "",
  customDialogText = "Blast! This stupid thing... always needing new batteries! What? Yes, what do you want?",
  stopConversation = "false",
  options = {
    {"You look like you could use a hand", "intro"},
    {"Me? Ah, nothing...", "bye"}
  }
}
breadcrumbBob_template:addScreen(breadcrumbBob_start);

breadcrumbBob_bye = ConvoScreen:new {
  id = "bye",
  leftDialog = "",
  customDialogText = "Bye.",
  stopConversation = "true",
  options = { 
  }
}
breadcrumbBob_template:addScreen(breadcrumbBob_bye);


-- Quest

breadcrumbBob_intro = ConvoScreen:new {
  id = "intro",
  leftDialog = "",
  customDialogText = "That obvious, eh? There's just not enough time in the day to inspect all the public equipment, let alone toy with this infernal inspector... gadget! And ever since the earthquake, I am expected to take seismic readings of the build zones at least twice a day... Who's got time for that! I sure don't!",
  stopConversation = "false",
  options = {
    {"I'm pretty good with a survey tool", "quest_start"}
  }
}
breadcrumbBob_template:addScreen(breadcrumbBob_intro);


breadcrumbBob_quest_start = ConvoScreen:new {
  id = "quest_start",
  leftDialog = "",
  customDialogText = "You are? Well, this one isn't complicated really. Just press these few buttons, touch that knob, reset, and you're done... Done... finished! My work is never finished! Look, I can allocate some petty cash and probably pull something out of the city lost and found for you, if you're willing to do my survey route today. Whadda'ya say?",
  stopConversation = "false",
  options = {
    {"Yeah, I can do that", "quest_accept"}
  }
}
breadcrumbBob_template:addScreen(breadcrumbBob_quest_start);



breadcrumbBob_quest_accept = ConvoScreen:new {
  id = "quest_accept",
  leftDialog = "",
  customDialogText = "Great! Here's the map. Head to each point however you'd like, just do it quickily and return to me when you're finished. Thanks.",
  stopConversation = "true",
  options = { 
  }
}
breadcrumbBob_template:addScreen(breadcrumbBob_quest_accept);



breadcrumbBob_quest_active = ConvoScreen:new {
  id = "quest_active",
  leftDialog = "",
  customDialogText = "Didn't I give you a job to do?.",
  stopConversation = "false",
  options = { 
    {"You sure did, I will get right on it!", "bye"},
    {"I don't want to do this job anymore.", "confirm_reset"}
  }
}
breadcrumbBob_template:addScreen(breadcrumbBob_quest_active);

breadcrumbBob_confirm_reset = ConvoScreen:new {
  id = "confirm_reset",
  leftDialog = "",
  customDialogText = "Are you sure you want to abandon this mission?",
  stopConversation = "false",
  options = { 
    {"Yes, I am sure I want to abandon this mission.", "quest_reset"},
    {"No, I want to keep trying.", "bye"}
  }
}
breadcrumbBob_template:addScreen(breadcrumbBob_confirm_reset);


breadcrumbBob_quest_reset = ConvoScreen:new {
  id = "quest_reset",
  leftDialog = "",
  customDialogText = "Come back and see me if you would like to try again later.",
  stopConversation = "true",
  options = { 
  }
}
breadcrumbBob_template:addScreen(breadcrumbBob_quest_reset);


breadcrumbBob_quest_complete = ConvoScreen:new {
  id = "quest_complete",
  leftDialog = "",
  customDialogText = "You made it back! Not that I thought a sinkhole would swallow you alive or anything, beacause I totally didn't think that at all, but the council... Hey, so here's the reward I spoke of. I know it's not much, but the city won't miss it. Thanks again for helping me out.",
  stopConversation = "false",
  options = { 
    {"No problem, man!", "give_rewards"}
  }
}
breadcrumbBob_template:addScreen(breadcrumbBob_quest_complete);

breadcrumbBob_give_rewards = ConvoScreen:new {
  id = "give_rewards",
  leftDialog = "",
  customDialogText = "I may need your help again later if you're interested. Until then, take care of yourself.",
  stopConversation = "true",
  options = { 
  }
}
breadcrumbBob_template:addScreen(breadcrumbBob_give_rewards);

breadcrumbBob_quest_cooldown = ConvoScreen:new {
  id = "quest_cooldown",
  leftDialog = "",
  customDialogText = "Hey, nice seeing you. I don't need any more help right now, but check with me again later. Take care.",
  stopConversation = "true",
  options = { 
  }
}
breadcrumbBob_template:addScreen(breadcrumbBob_quest_cooldown);

breadcrumbBob_no_space = ConvoScreen:new {
  id = "no_space",
  leftDialog = "",
  customDialogText = "Looks like you need to make some room in your inventory before I can give you a reward!",
  stopConversation = "true",
  options = { 
  }
}
breadcrumbBob_template:addScreen(breadcrumbBob_no_space);


-- Template Footer
addConversationTemplate("breadcrumbBob_template", breadcrumbBob_template);
