/// @description Extract texture

// Texture data
var _is_zip = global.texture_zip != "";
var _dir = _is_zip ? cache_directory + "texture\\" : global.texture_dir;

// If texture directory doesn't exists create one
if (!directory_exists(_dir))
	directory_create(_dir);

// Unzip texture
zip_unzip(global.texture_zip, _dir);

// Set process to load texture
global.texture_process = 2;
alarm[3] = 5;