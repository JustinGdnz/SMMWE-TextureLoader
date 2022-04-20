/// @description 

// Inherit the parent event
event_inherited();

var _region;
if (is_clickable(button_layer) && (mouse_y > y && mouse_y < y+box_height))
	_region = element.region_detect(x + x_offset + element_pos.x, y + y_offset + element_pos.y, mouse_x, mouse_y);
else _region = undefined;

element.region_set_active(_region, hypertext_color, hypertext_blend);