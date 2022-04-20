function text_create(_x, _y, _depth, _text) {
	var _id = instance_create_depth(_x, _y, _depth, obj_text)
	
	with (_id)
	{
		text = _text;
		
		event_user(0);
	}
	
	return _id
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

function text_create_box(_x, _y, _width, _height, _depth, _text) {
	var _id = instance_create_depth(_x, _y, _depth, obj_text_in_box);
	
	with (_id) 
	{
		image_xscale = _width / sprite_get_width(sprite_index)
		image_yscale = _height / sprite_get_height(sprite_index)
		
		text = _text;
		
		event_user(0);
	}
	
	return _id;
}

function text_create_hyperlink_box(_x, _y, _width, _height, _depth, _text, _name = "event", _color = #FF0000, _blend = 0.5, _action = hypertext_action_example) {
	var _id = instance_create_depth(_x, _y, _depth, obj_text_hyperlink_in_box);
	
	with (_id)
	{
		image_xscale = _width / sprite_get_width(sprite_index)
		image_yscale = _height / sprite_get_height(sprite_index)
		
		text = _text;
		hypertext_name = _name;
		hypertext_color = _color;
		hypertext_blend = _blend;
		hypertext_action = _action;
		
		event_user(0);
	}
	
	return _id;
}

function text_destroy(_id) {
	with(_id) instance_destroy();
}