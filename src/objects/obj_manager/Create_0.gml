/// @description General app control

// Init dll
tl_init();

// Set default font
draw_set_font(fnt_aseprite);
scribble_font_set_default("fnt_aseprite");

global.texture_dir = "";
global.texture_zip = "";

#region Create Directories

	// Local directory
	global.local_dir = game_save_id;
	#macro local_directory global.local_dir
	
	// Textures directory
	global.textures_dir = local_directory + "Textures\\";
	#macro textures_directory global.textures_dir
	
	// Cache directory
	global.cache_dir = local_directory + "Cache\\";
	#macro cache_directory global.cache_dir
	
	// Workspace directory
	global.workspace_dir = local_directory + "Workspaces\\";
	#macro workspace_directory global.workspace_dir
	
	// Create "Textures" directory
	if (!directory_exists("Textures"))
		directory_create("Textures");

	// Create "Cache" directory
	if (!directory_exists("Cache"))
		directory_create("Cache");

	// Create "Workspaces" directory
	if (!directory_exists("Workspaces"))
		directory_create("Workspaces");

#endregion

// Exit the init room
alarm[0] = 5