/// @description Texture info

// Exit whenever it can't be clicked
if (!is_clickable(button_layer) || !ready || invalid) exit;

// If the mouse is inside of the gui
if (point_in_rectangle(mouse_x, mouse_y, 34, 28, 349, 187))
{
	// Create the texture info object
	if (!instance_exists(obj_gui_texture_info))
	{
		global.click_layer++;
		global.texture_dir = texture_dir;
		global.texture_zip = texture_zip;
		var _id = instance_create_depth(0, 0, depth-100, obj_gui_texture_info);
		with (_id) owner = other.id;
	}
}