/// @description 

// Inherit the parent event
event_inherited();

var _region;
if (is_clickable(button_layer))
	_region = element.region_detect(x + x_offset, y + y_offset, mouse_x, mouse_y);
else _region = undefined;

element.region_set_active(_region, hypertext_color, hypertext_blend);