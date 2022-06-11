/// @description Destroy the loading screen

// If the game is still loading the texture repeat until its finished
if (tl_has_module(SMMWE_LIB_DLL))
	alarm[4] = 1;
else
{
	instance_destroy(obj_gui_loading_screen);
	image_index = 0;
}