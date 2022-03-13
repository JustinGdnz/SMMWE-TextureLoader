/// @description 
if (selected)
{
	if (!tl_has_module())
	{
		if (tl_injectdll())
		{
			image_index = 1;
			block = true;
			with(instance_create_layer(192, 134, "Instances_1", objSpinner))
			{
				image_xscale = 0.5;
				image_yscale = 0.5;
			}
			//selected = false;
		}
	}
}