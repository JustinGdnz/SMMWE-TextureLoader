/// @description 
texture_index = undefined;
manager = obj_manager_texture;

button_layer = global.click_layer;

#region Definitions

	// Sprites
	icon = -1;
	banner = -1;
	preview = -1;
	
	// Texture data
	data = undefined;
	texture = undefined;
	
#endregion

invalid = false;

// Create a loading spinner
spinner = loadspinner_create(x+sprite_width/2, y+sprite_height/2, 0.25, 0.25, depth-5)

// Setup everything
alarm[0] = 2;
ready = false;