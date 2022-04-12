/// @description 

// Create focus
focus = focus_create_below();

button_layer = global.click_layer;

// Reload texture
with (obj_TextureManager) event_user(0);

var size = array_length(obj_TextureManager.textures);

// Create slots
for (var i = 0; i < size; i++)
{
	var _x = x+((i%3)*104);
	var _y = y+(floor(i/3)*52);
	var _slot = instance_create_depth(_x+10, _y+10, -1, obj_texture_slot);
	with (_slot)
	{
		texture_index = i;
		event_user(0);
	}
}