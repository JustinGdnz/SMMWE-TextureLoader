/// @description 

// Create focus
focus = focus_create_below();

button_layer = global.click_layer;

x = 28+6;
y = 22+6;

name = "<Name>";
author = "<Author>";
description = "<Description>";
version = "<Version>";

icon = -1;
preview = -1;

credit_names = [];
credit_urls = [];

credits_element = scribble("");

button = instance_create_depth(room_width / 2, 162, depth-1, obj_load);
texture = undefined;
//event_user(0);
/*pre_credits = ["Justin", "Limorbak", "Amogus", "Sus", "eye"]


credits = "";
for (var i = 0; i < array_length(pre_credits); i++)
{
	credits += "[region," + string(pre_credits[i]) + "]" + string(pre_credits[i]) + "[/region]\n";
}