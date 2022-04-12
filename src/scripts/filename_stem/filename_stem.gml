function filename_stem(fname) {
	var _name = filename_name(fname);
	
	var _pos = string_last_pos(".", _name);
	if (_pos > 0) _name = string_delete(_name, _pos, string_length(_name) - _pos + 1);
	
	return _name;
}