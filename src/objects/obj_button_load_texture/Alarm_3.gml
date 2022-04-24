/// @description Load texture

// Texture data
var _is_zip = global.texture_zip != "";
var _dir = _is_zip ? cache_directory + "texture\\" : global.texture_dir;

// Write texture directory to temp file
var _buffer = buffer_create(256, buffer_grow, 1);
buffer_write(_buffer, buffer_text, _dir + "content\\");
buffer_save(_buffer, cache_directory + "temp");
buffer_delete(_buffer);

// Load texture
if (tl_injectdll(SMMWE_LIB_DLL))
	block = true;

// Check whenever loading screen should be deleted
alarm[4] = 5;