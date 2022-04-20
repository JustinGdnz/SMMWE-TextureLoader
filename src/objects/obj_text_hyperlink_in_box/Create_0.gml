// Variable definitions
hypertext_name = hypertext_name;
hypertext_action = hypertext_action;
hypertext_color = hypertext_color;
hypertext_blend = hypertext_blend;

// Setup text
text = string("[region,") + string(hypertext_name) + string("]") + string(text);

// Inherit the parent event
event_inherited();

button_layer = global.click_layer;