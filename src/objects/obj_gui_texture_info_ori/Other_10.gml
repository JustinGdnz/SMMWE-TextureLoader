/// @description Generate credits

var _size = array_length(credit_names);
var _text = "";

for (var i = 0; i < _size; i++)
{
	_text += "[region," + string(i) + "]" + string(credit_names[i]) + "[/region]\n";
}

//credits_element = scribble(_text).starting_format("fnt_aseprite", c_black);

desc_box = text_create_box(x+153, y+40, 83, 80, depth-5, "[c_black]"+description)
credits_box = text_create_hyperlink_box(x+244, y+40, 64, 80, depth-5, "[c_black]"+_text, "dummy", c_red, 0.8, open_supporturl)