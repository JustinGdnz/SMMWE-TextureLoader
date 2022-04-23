/// @description Slot object!

// Owner data
texture_index = undefined;
manager = obj_manager_texture;

// Clickable layer
button_layer = global.click_layer;

// Error catch
invalid = false;
err = undefined;

// Create a loading spinner
spinner = loadspinner_create(x+sprite_width/2, y+sprite_height/2, 0.25, 0.25, depth-5)

#region Definitions

	// Sprites
	icon = -1;
	banner = -1;
	preview = -1;
	
	// Texture data
	data = undefined;
	texture = undefined;
	path = "";
	isZip = false;
	
	// Text elements
	text_name = noone;
	
#endregion

// Setup everything
alarm[0] = 2;
ready = false;