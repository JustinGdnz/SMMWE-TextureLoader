/// @description Reload textures

// Result array
textures = [];

// Get the zip files and directories from their respective folder
var zip_files = filesystem_get_files(textures_directory, "zip", false);
var folders = filesystem_get_directories(workspace_directory, false);

// Validate directories
for (var i = 0, n=array_length(folders); i < n; i++)
{
	// Push if pack file exists inside the directory
	if (file_exists(folders[i] + "pack.tl.json"))
		array_push(textures, folders[i])
}

// Validate zip files
for (var i = 0, n=array_length(zip_files); i < n; i++)
{
	// Open zip
	tl_zip_open_read(zip_files[i]);
	
	// Push if is a valid texture
	if (tl_zip_has_file("pack.tl.json"))
		array_push(textures, zip_files[i]);
	
	// Close zip
	tl_zip_close_read();
}