/// @description Update Slot

var _path = obj_TextureManager.textures[texture_index];
var _name = filename_stem(_path);
var _dir = cache_directory + "packs/" + _name + "/";

if (!directory_exists(_dir))
	directory_create(_dir);

tl_zip_open_read(_path);
tl_zip_unzip_file(PACK_ENTRY, _dir + "pack.tl.json");
tl_zip_unzip_file(PACK_ICON, _dir + "icon.png");
tl_zip_unzip_file(PACK_BANNER, _dir + "banner.png");
tl_zip_unzip_file(PACK_PREVIEW, _dir + "preview.png");
tl_zip_close_read();

// Open data
var _buffer = buffer_load(_dir + "pack.tl.json");
var _str = buffer_read(_buffer, buffer_text);
buffer_delete(_buffer);

data = json_parse(_str);

// Validate data
if (data[$ "version"] == undefined) {
	corrupted = true;
	exit;
}

if (data[$ "pack"] == undefined) {
	corrupted = true;
	exit;
}

// Create sprites
icon = sprite_add(_dir + "icon.png", 1, false, false, 0, 0);
banner = sprite_add(_dir + "banner.png", 1, false, false, 0, 0);
preview = sprite_add(_dir + "preview.png", 1, false, false, 0, 0);
name = data[$ "pack"][$ "Name"];
description = data[$ "pack"][$ "Description"];
author = data[$ "pack"][$ "Author"];
version = "v" + string(data[$ "pack"][$ "Version"][$ "major"]) + "." + string(data[$ "pack"][$ "Version"][$ "minor"]);

var _credits = data[$ "pack"][$ "Credits"];

for (var i = 0, n = array_length(_credits); i < n; i++)
{
	credit_names[i] = _credits[i][$ "User"]
	credit_urls[i] = _credits[i][$ "SupportURL"]
}