function text_create() {
	
}

function text_create_wrap() {
	
}

function text_create_hyperlink(_x, _y, _depth, _text, _name = "event", _color = #FF0000, _blend = 0.5, _action = hypertext_action_example) {
	var _id = instance_create_depth(_x, _y, _depth, obj_text_hyperlink);
	
	with (_id)
	{
		text = _text;
		hypertext_name = _name;
		hypertext_color = _color;
		hypertext_blend = _blend;
		hypertext_action = _action;
		
		event_user(0);
	}
	
	return _id;
}

function text_create_hyperlink_wrap() {
	
}

function text_destroy(_id) {
	with(_id) instance_destroy();
}