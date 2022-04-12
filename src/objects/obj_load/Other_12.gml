/// @description Load texture

if (!tl_has_module())
{
	if (tl_injectdll())
	{
		image_index = 1;
		block = true;
	}
}