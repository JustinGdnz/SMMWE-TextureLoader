/// @description Start the load process

// Exit if can't be clicked
if (!is_clickable(button_layer) || block) exit;

// Create the loading screen
if (!instance_exists(obj_gui_loading_screen))
{
	global.click_layer++
	global.texture_process = 0;
	alarm[1] = 30;
	instance_create_depth(0, 0, depth-100, obj_gui_loading_screen);
}