/// @description Who am i?
// Owner
owner = undefined;

// Force coordinates
x = 34;
y = 28;

// Clickable layer
button_layer = global.click_layer;

// Fade screen
fade = fade_create_below();

#region Definitions

	icon = -1;
	preview = -1;
	texture = undefined;
	
	// Text elements
	text_name = noone;
	text_author = noone;
	text_version = noone;
	text_credits = noone
	text_desc = noone;
	
	// Credits
	credit_names = "[/region]";
	credit_urls = [];

#endregion

// Setup
alarm[0] = 2;
ready = false;

// Define object methods
event_user(0);