function recursive_delete_files(_directory)
{
	var _files = gumshoe(_directory, ".*", false);
	
	for (var i = 0; i < array_length(_files); i++)
	{
		if (file_exists(_files[i]))
		{
			file_delete(_files[i]);
		}
	}
}