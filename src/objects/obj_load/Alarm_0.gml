/// @description 
if (!tl_is_process_running())
{
	if (!tl_init())
	{
		block = true
		image_index = 1;
	}
}
else
{
	if (!tl_has_module())
	{
		block = false;
		image_index = 0;
	}
	else
	{
		block = true
		image_index = 1;
	}
}

if (loading)
{
	block = true
	image_index = 1;
}

alarm[0] = 15;