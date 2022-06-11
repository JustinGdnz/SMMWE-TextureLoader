/// @description Close button

// Exit if can't be clicked
if (!is_clickable(button_layer)) exit;

// Close event
if (point_in_rectangle(mouse_x, mouse_y, 357, 22, 357+19, 22+19))
{
	// Restore clickable layer
	global.click_layer--
	
	// Destroy the screen fade
	fade_destroy(fade);
	
	// Self destruction
	instance_destroy();
}

// Reload event
else if (point_in_rectangle(mouse_x, mouse_y, 8, 169, 8+19, 169+19))
{
	with (obj_gui_texture_slot) instance_destroy();
	event_user(0);
}

// Open folder
else if (point_in_rectangle(mouse_x, mouse_y, 8, 146, 8+19, 146+19))
{
	tl_open_folder(local_directory);
}