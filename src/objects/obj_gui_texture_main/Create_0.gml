/// @description 

// Create fade
fade = fade_create_below();

button_layer = global.click_layer;

// Reload texture
with (obj_manager_texture) event_user(0);

var size = array_length(obj_manager_texture.textures);

// Create slots
for (var i = 0; i < size; i++)
{
	var _x = x+((i%3)*104);
	var _y = y+(floor(i/3)*52);
	var _slot = instance_create_depth(_x+10, _y+10, depth-5, obj_gui_texture_slot);
	with (_slot)
	{
		texture_index = i;
		event_user(0);
	}
}