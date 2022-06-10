/// @description 

var _scroll_y = (text_y * scroll_size) / scroll_speed;
var _scroll_h = (box_height * scroll_size) - 1

if (!select)
{
	if (point_in_rectangle(mouse_x, mouse_y, x+box_width, y-_scroll_y-6, x+box_width+2, y-_scroll_y+_scroll_h+6))
	{
	
		if (mouse_check_button_pressed(mb_left))
		{
			scroll_offset = y-_scroll_y-mouse_y;
			select = true;
		}
	}
}

if (select)
{
	text_y = ((y-mouse_y-scroll_offset) / scroll_size) * scroll_speed;
	
	if (mouse_check_button_released(mb_left))
	{
		select = false;
		scroll_offset = 0;
	}
}	
text_y = clamp(text_y, -text_height + box_height, 0);