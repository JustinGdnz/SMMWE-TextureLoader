function screenshadow_create(_depth, _max_alpha = 0.5, _min_alpha = 0, _lerp_amount = 0.1)
{	
	var _exists = instance_number(obj_context_focus) > 0;
	var _shadow = _exists ? obj_context_focus : instance_create_depth(room_width/2, 0, _depth, obj_screen_shadow);
	
	with(_shadow)
	{
		max_alpha = _max_alpha;
		min_alpha = _min_alpha;
		lerp_amount = _lerp_amount;
		state = 0;
	}
}

function screenshadow_destroy()
{	
	with(obj_context_focus) state = -1;
}

function screenshadow_set_depth(_depth)
{
	with(obj_context_focus) depth = _depth;
}