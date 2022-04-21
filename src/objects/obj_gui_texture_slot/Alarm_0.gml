/// @description 

// Exit whenever there's a delay or it was handled incorrectly
if (global.thread_delay) {alarm[0] = 5; exit;}
if (texture_index == undefined) { instance_destroy(); exit; }

#region Get texture data

	var _path = manager.textures[texture_index];
	var _fname = filename_stem(_path);
	
	var _is_directory = directory_exists(_path);
	var _dir = _is_directory ? _path : cache_directory + "packs\\" + _fname + "\\";
	
	// Extract the data from the zip
	if (!_is_directory)
	{
		// Create directory if it doesn't exists
		if (!directory_exists(_dir))
			directory_create(_dir);

		// Extract pack.tl, icon, banner and preview
		tl_zip_open_read(_path);
		tl_zip_unzip_file(PACK_ENTRY, _dir + CACHE_PACK_ENTRY);
		tl_zip_unzip_file(PACK_ICON, _dir + CACHE_PACK_ICON);
		tl_zip_unzip_file(PACK_BANNER, _dir + CACHE_PACK_BANNER);
		tl_zip_unzip_file(PACK_PREVIEW, _dir + CACHE_PACK_PREVIEW);
		tl_zip_close_read();
	}
	
	if (file_exists(_dir + PACK_ENTRY))
	{
		// Read pack file as string
		var _buff = buffer_load(_dir + PACK_ENTRY);
		var _str = buffer_read(_buff, buffer_text);
		buffer_delete(_buff);
	
		// Parse the data
		texture = json_parse(_str);
	} else invalid = true;
	
	// Set sprites
	if (!invalid)
	{
		icon = sprite_add(_dir + PACK_ICON, 1, false, false, 0, 0);
		banner = sprite_add(_dir + PACK_BANNER, 1, false, false, 0, 0);
		preview = sprite_add(_dir + PACK_PREVIEW, 1, false, false, 0, 0);
	}
	
#endregion

// Everything is ready to go!
ready = true;
loadspinner_destroy(spinner);

// Make a frame delay so every texture can load in different frames
global.thread_delay = true;
alarm[1] = 5;