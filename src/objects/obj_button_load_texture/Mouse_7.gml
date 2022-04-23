/// @description 
if (!is_clickable(button_layer) || block) exit;

var _is_zip = global.texture_zip != "";
var _dir = _is_zip ? cache_directory + "texture\\" : global.texture_dir;

if (_is_zip)
{
	#region Clear Cache
	
		if (directory_exists(_dir))
		{
			recursive_delete_files(_dir);
			directory_destroy(_dir);
		}
	
	#endregion
	
	#region Extract zip
	
		if (!directory_exists(_dir))
			directory_create(_dir);

		zip_unzip(global.texture_zip, _dir);
	
	#endregion
}

#region Write dir to temp file

	var _buffer = buffer_create(256, buffer_grow, 1);
	buffer_write(_buffer, buffer_text, _dir + "content\\");
	buffer_save(_buffer, cache_directory + "temp");
	buffer_delete(_buffer);

#endregion

#region Load texture

	if (tl_injectdll(SMMWE_LIB_DLL))
		block = true;

#endregion