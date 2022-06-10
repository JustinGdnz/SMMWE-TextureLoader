/*
	Big thanks to JujuAdams, this was made
	thanks to Gumshoe! :D
*/

#macro FILESYSTEM_PATH_SEPARATOR "\\"
#macro FILESYSTEM_INVERSE_PATH_SEPARATOR "/"
#macro FILESYSTEM_MATCH_ALL_MASK "*.*"
#macro FILESYSTEM_MATCH_ALL_EXTENSION_MASK ".*"

/// @param fname
function filename_stem(_fname)
{
	var _name = filename_name(_fname);
	
	var _pos = string_last_pos(".", _name);
	if (_pos > 0) _name = string_delete(_name, _pos, string_length(_name) - _pos + 1);
	
	return _name;
}

/// @param path
function filesystem_fix_path(_path)
{
	var _new_path = string_replace_all(_path, FILESYSTEM_INVERSE_PATH_SEPARATOR, FILESYSTEM_PATH_SEPARATOR);
    if ((_new_path != "") && (string_char_at(_new_path, string_length(_new_path)) != FILESYSTEM_PATH_SEPARATOR))
    {
        _new_path += FILESYSTEM_PATH_SEPARATOR;
    }
	
	return _new_path
}

/// @param directory
/// @param fileExtension
/// @param [recursive]
function filesystem_get_files(_directory, _extension = FILESYSTEM_MATCH_ALL_EXTENSION_MASK, _recursive = false)
{
	// Fix directory path
	_directory = filesystem_fix_path(_directory);
	
	// Fix extension
	var _pos = string_pos(".", _extension);
    if (_pos > 0) _extension = string_delete(_extension, 1, _pos);
    _extension = "." + _extension;
	
	return __filesystem_get_files_internal(_directory, _extension, [], _recursive)
}

/// @param directory
/// @param [recursive]
function filesystem_get_directories(_directory, _recursive = false)
{
	// Fix directory path
	_directory = filesystem_fix_path(_directory);
	
	return __filesystem_get_directories_internal(_directory, [], _recursive)
}

/// @param directory
/// @param fileExtension
/// @param resultArray
/// @param [recursive]
function __filesystem_get_files_internal(_directory, _extension, _result, _recursive)
{
	var _directories = [];
	var _file = undefined;
	while (true)
	{
		_file = (_file == undefined)? file_find_first(_directory + FILESYSTEM_MATCH_ALL_MASK, fa_directory) : file_find_next();
		if (_file == "") break;
		
		if (directory_exists(_directory + _file))
			array_push(_directories, _directory + _file + FILESYSTEM_PATH_SEPARATOR);
			
		else if ((_extension == FILESYSTEM_MATCH_ALL_EXTENSION_MASK) || (filename_ext(_file) == _extension))
			array_push(_result, _directory + _file);
	}

	file_find_close();
	
	if (_recursive)
	{
		for (var i = 0, n = array_length(_directories); i < n; i++)
		{
			__filesystem_get_files_internal(_directories[i], _extension, _result, true);
		}
	}
	
	return _result;
}

/// @param directory
/// @param resultArray
/// @param [recursive]
function __filesystem_get_directories_internal(_directory, _result, _recursive)
{
	var _directories = [];
	var _file = undefined;
	while (true)
	{
		_file = (_file == undefined)? file_find_first(_directory + FILESYSTEM_MATCH_ALL_MASK, fa_directory) : file_find_next();
		if (_file == "") break;
		
		if (directory_exists(_directory + _file))
		{
			array_push(_directories, _directory + _file + FILESYSTEM_PATH_SEPARATOR);
			array_push(_result, _directory + _file + FILESYSTEM_PATH_SEPARATOR);
		}
	}

	file_find_close();
	
	if (_recursive)
	{
		for (var i = 0, n = array_length(_directories); i < n; i++)
		{
			__filesystem_get_directories_internal(_directories[i], _result, true);
		}
	}
	
	return _result;
}