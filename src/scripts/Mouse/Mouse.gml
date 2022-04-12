function set_mouse_layer(_layer)
{
	with(obj_MouseControl) mouse_layer = _layer;
}

function get_mouse_layer()
{
	var _layer = undefined;
	with(obj_MouseControl) _layer = mouse_layer;
	
	return _layer;
}

function is_clickable(_button_layer)
{
	return global.click_layer == _button_layer;
}