/// @description Extract files

var _dir = cache_directory + "texture\\"

if (!directory_exists(_dir))
	directory_create(_dir);
	
zip_unzip(texture, _dir);

var _buffer = buffer_create(256, buffer_grow, 1);
buffer_write(_buffer, buffer_text, _dir + "content\\");
buffer_save(_buffer, cache_directory + "temp");
buffer_delete(_buffer);