/// @description Texture interface

// Create a screen fade
fade = fade_create_below(0.8, 0, 0.15);

// Set clickable layer
button_layer = global.click_layer;

// Reload textures
with (obj_manager_texture) event_user(0);

// Create the slots
var size = array_length(obj_manager_texture.textures);
for (var i = 0; i < size; i++)
{
	// Position
	var _x = x+((i%3)*104);
	var _y = y+(floor(i/3)*52);

	// Slot
	var _slot = instance_create_depth(_x+10, _y+10, depth-5, obj_gui_texture_slot);
	with(_slot) { texture_index = i; hidden = i >= 9};

}

// Create the slider
slider = instance_create_depth(x+330, y+24, depth-5, obj_gui_button_slider);
with(slider) {

	// Set the slider height
	height = 148;
	
	// Set the slider max value
	if (size > 6)
		max_value = (floor(((size-1)/3))-1)*52
}