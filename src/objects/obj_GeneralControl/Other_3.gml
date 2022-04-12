/// @description Clear cache
recursive_delete_files(cache_directory);

if (directory_exists(cache_directory + "packs"))
	directory_destroy(cache_directory + "packs")

if (directory_exists(cache_directory + "texture"))
	directory_destroy(cache_directory + "texture")