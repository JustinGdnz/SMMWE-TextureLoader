function fade_create_depth(_depth, _max_alpha = 0.5, _min_alpha = 0, _lerp_amount = 0.1)
{
	var _id = instance_create_depth(room_width/2, 0, _depth, obj_screen_fade);
	
	with(_id)
	{
		max_alpha = _max_alpha;
		min_alpha = _min_alpha;
		lerp_amount = _lerp_amount;
		state = 0;
	}
	
	return _id;
}

function fade_create_below(_max_alpha = 0.5, _min_alpha = 0, _lerp_amount = 0.1)
{
	var _depth = depth + 40;
	return fade_create_depth(_depth, _max_alpha, _min_alpha, _lerp_amount);
}

function fade_destroy(_id)
{	
	with(_id) state = -1;
}