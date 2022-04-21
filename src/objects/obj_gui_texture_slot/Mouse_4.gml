/// @description 

if (!is_clickable(button_layer) || !ready) exit;

if (!instance_exists(obj_gui_texture_info))
{
	global.click_layer++
	
	var _id = instance_create_depth(0, 0, depth-100, obj_gui_texture_info);
	with (_id) owner = other.id;
}