/// @description Texture interface

// Create a screen fade
fade = fade_create_below(0.8, 0, 0.15);

// Set clickable layer
button_layer = global.click_layer;

// Create slider
slider = instance_create_depth(x+330, y+24, depth-5, obj_gui_button_slider);

// Load slots
event_user(0);