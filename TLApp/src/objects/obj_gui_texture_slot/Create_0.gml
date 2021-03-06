/// @description Slot object!
/* THIS INSTANCE INHERIT VARIABLES FROM IT'S OWNER */

// Owner data
owner = obj_gui_texture_main;
texture_index = undefined;
manager = obj_manager_texture;

// Clickable layer
button_layer = global.click_layer;

// Error catch
invalid = false;
err = undefined;

// Create a loading spinner
spinner = loadspinner_create(x+sprite_width/2, y+sprite_height/2, 0.25, 0.25, depth-5, true);

hidden = false;

#region Definitions

	// Sprites
	icon = -1;
	banner = -1;
	preview = -1;
	
	// Texture data
	data = undefined;
	texture = undefined;
	texture_dir = "";
	texture_zip = "";
	
	// Text elements
	text_name = noone;
	text_surf = surface_create(90, 12);
	
#endregion

// Setup everything
alarm[0] = 2;
ready = false;