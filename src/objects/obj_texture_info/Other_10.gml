/// @description Generate credits

var _size = array_length(credit_names);
var _text = "";

for (var i = 0; i < _size; i++)
{
	_text += "[region," + string(i) + "]" + string(credit_names[i]) + "[/region]\n";
}

credits_element = scribble(_text).starting_format("fntAseprite", c_black);