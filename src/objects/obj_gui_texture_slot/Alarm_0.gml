/// @description Handle most of the stuff

// Exit whenever there's a delay or it wasn't handled correctly
if (global.frame_delay) {alarm[0] = 5; exit;}
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
	
	// Catch any error loading stuff
	try
	{
		// Read pack file as string
		var _buff = buffer_load(_dir + PACK_ENTRY);
		var _str = buffer_read(_buff, buffer_text);
		buffer_delete(_buff);
	
		// Parse the data
		data = json_parse(_str);
		
		// Validate the data
		event_user(0)
		
		// Shortcut
		texture = data.pack
		texture_dir = _dir;
		texture_zip = _is_directory ? "" : _path;
		
		// Load sprites
		icon = sprite_add(_dir + PACK_ICON, 1, false, true, 0, 0);
		banner = sprite_add(_dir + PACK_BANNER, 1, false, true, 0, 0);
		preview = sprite_add(_dir + PACK_PREVIEW, 1, false, true, 0, 0);
		
		// Create text
		text_name = text_create_wrap(x+6, y+33, depth-5, "[c_black]" + texture.Name, 90, 12, true);
	}
	catch(_)
	{
		show_debug_message(_);
		invalid = true;
		err = _;
	}
	
#endregion

// Everything is ready to go!
ready = true;
loadspinner_destroy(spinner);

// Make a frame delay so every texture can load in different frames
global.frame_delay = true;
alarm[1] = 5;