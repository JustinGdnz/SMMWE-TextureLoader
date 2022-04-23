/// @description Texture info

// Exit whenever it can't be clicked
if (!is_clickable(button_layer) || !ready || invalid) exit;

if (!instance_exists(obj_gui_texture_info))
{
	global.click_layer++;
	global.texture_dir = texture_dir;
	global.texture_zip = texture_zip;
	var _id = instance_create_depth(0, 0, depth-100, obj_gui_texture_info);
	with (_id) owner = other.id;
}