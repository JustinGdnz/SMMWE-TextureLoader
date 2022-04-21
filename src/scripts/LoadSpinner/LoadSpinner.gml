function loadspinner_create(_x, _y, _xscale, _yscale, _depth)
{
	var _id = instance_create_depth(_x, _y, _depth, obj_loading_spinner);
	
	with (_id)
	{
		image_xscale = _xscale;
		image_yscale = _yscale;
	}
	
	return _id;
}

function loadspinner_destroy(_id)
{
	with (_id) instance_destroy();
}