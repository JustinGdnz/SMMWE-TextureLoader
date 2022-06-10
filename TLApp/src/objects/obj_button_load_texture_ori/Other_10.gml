/// @description Clear cache

var _dir = cache_directory + "texture\\"

if (directory_exists(_dir))
{
	recursive_delete_files(_dir);
	directory_destroy(_dir);
}
