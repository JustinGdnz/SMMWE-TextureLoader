/// @description 

var _scroll_y = (element_pos.y * scroll_size) / scroll_speed;
var _scroll_h = (box_height * scroll_size) - 1

if (!select)
{
	if (point_in_rectangle(mouse_x, mouse_y, x+box_width, y-_scroll_y-6, x+box_width+2, y-_scroll_y+_scroll_h+6))
	{
	
		if (mouse_check_button_pressed(mb_left))
		{
			click_offset = y-_scroll_y-mouse_y;
			select = true;
		}
	}
}

if (select)
{
	element_pos.y = ((y-mouse_y-click_offset) / scroll_size) * scroll_speed;
	
	if (mouse_check_button_released(mb_left))
	{
		select = false;
		click_offset = 0;
	}
}

element_pos.y = clamp(element_pos.y, -element_height + box_height, 0);