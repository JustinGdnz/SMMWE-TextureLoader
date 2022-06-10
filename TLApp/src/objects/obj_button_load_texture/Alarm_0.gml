/// @description Verify that the game is running

// If SMMWE is not running
if (!tl_is_process_running())
{
	// Reload TL main extension
	var _init = tl_init();
	block = !_init;
}
// Otherwise
else
{
	// Block if there's already loading a texture
	block = tl_has_module(SMMWE_LIB_DLL);
}

// Repeat
alarm[0] = 15;