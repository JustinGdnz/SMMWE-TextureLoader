/// @description Start the load process

// Exit if can't be clicked
if (!is_clickable(button_layer) || block) exit;

// Create the loading screen
if (!instance_exists(obj_gui_loading_screen))
{
	// Set the new click layer
	global.click_layer++
	
	// Choose what process will be executed
	if (global.texture_zip != "")
	{
		// Clear cache & Unzip texture process
		global.texture_process = 0;
		alarm[1] = 15;
	}
	else
	{
		// Just load the texture
		global.texture_process = 2;
		alarm[3] = 5;
	}
	
	// Create the loading screen
	instance_create_depth(0, 0, depth-100, obj_gui_loading_screen);
}