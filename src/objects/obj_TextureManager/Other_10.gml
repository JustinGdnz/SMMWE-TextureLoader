/// @description Reload textures

textures = [];

// Get the zip files from the textures folder
var zip_files = gumshoe(textures_directory, "zip", false);

// Validate 'em
for (var i = 0, n=array_length(zip_files); i < n; i++)
{
	tl_zip_open_read(zip_files[i]);
	
	if (tl_zip_has_file("pack.tl.json"))
		array_push(textures, zip_files[i]);
	
	tl_zip_close_read();
}