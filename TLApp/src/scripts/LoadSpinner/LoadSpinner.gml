function loadspinner_create(_x, _y, _xscale, _yscale, _depth, _manually = false)
{
	var _id = instance_create_depth(_x, _y, _depth, obj_loading_spinner);
	
	with (_id)
	{
		image_xscale = _xscale;
		image_yscale = _yscale;
		manually = _manually;
	}
	
	return _id;
}

function loadspinner_destroy(_id)
{
	with (_id) instance_destroy();
}