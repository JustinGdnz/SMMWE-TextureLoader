/// @description Load texture

if (!tl_has_module(SMMWE_LIB_DLL))
{
	if (tl_injectdll(SMMWE_LIB_DLL))
	{
		image_index = 1;
		block = true;
	}
}