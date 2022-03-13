/// @description Game controller

// Debug overlay
show_debug_overlay(false);

// Set game width
global.gw = room_width;

// Set game height
global.gh = room_height;

// Set the game size
size = 2;

// Manually draw the application surface
application_surface_draw_enable(false);

// Apply camera settings
alarm[0] = 1;

// Goto the next room
alarm[2] = 5;

// Init Texture Loader
tl_init();
tl_create_directories();