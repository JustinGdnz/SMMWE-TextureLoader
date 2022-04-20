/// @description Button event

// Exit if can't be clicked
if (!is_clickable(button_layer))
	exit;

#region Texture interface

	// Set the new click layer
	global.click_layer++;
	
	// Create interface
	if (!instance_exists(obj_gui_texture_main))
		instance_create_depth(28, 22, depth-100, obj_gui_texture_main);

#endregion