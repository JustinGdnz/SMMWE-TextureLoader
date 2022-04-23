/// @description 

if (!tl_is_process_running())
{
	var _init = tl_init();
	block = !_init;
}
else
{
	block = tl_has_module(SMMWE_LIB_DLL);
}

alarm[0] = 15;