/// @description Clear cache

// Texture data
var _is_zip = global.texture_zip != "";
var _dir = _is_zip ? cache_directory + "texture\\" : global.texture_dir;

// If the texture is a zip file
if (_is_zip)
{
	// Clear cache
	if (directory_exists(_dir))
	{
		recursive_delete_files(_dir);
		directory_destroy(_dir);
	}
	
	// Set process to extract texture
	global.texture_process = 1;
	alarm[2] = 5;
}
// Otherwise
else
{
	// Set process to load texture
	global.texture_process = 2;
	alarm[3] = 5;
}