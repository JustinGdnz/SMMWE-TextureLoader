/// @description General app control

// Init dll
tl_init();

// Set default font
draw_set_font(fnt_aseprite);
scribble_font_set_default("fnt_aseprite");

surface_depth_disable(true);

// Texture data
global.texture_dir = "";
global.texture_zip = "";

// Texture process
//-1 = None
// 0 = Cleaning cache
// 1 = Extracting zip
// 2 = Loading texture
global.texture_process = -1;

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
	if (!directory_exists(textures_directory))
		directory_create(textures_directory);

	// Create "Cache" directory
	if (!directory_exists(cache_directory))
		directory_create(cache_directory);

	// Create "Workspaces" directory
	if (!directory_exists(workspace_directory))
		directory_create(workspace_directory);

#endregion

// Exit the init room
alarm[0] = 5