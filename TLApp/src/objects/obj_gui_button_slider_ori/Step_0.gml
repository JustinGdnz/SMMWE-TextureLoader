/// @description 

if (!select)
{
	if (point_in_rectangle(mouse_x, mouse_y, x, y+pos, x+4, y+pos+size))
	{
		if (mouse_check_button_pressed(mb_left))
		{
			select = true;
			offset = mouse_y - y - pos
		}
	}
}
else
{
	pos = mouse_y - y - offset;
	if (mouse_check_button_released(mb_left))
	{
		select = false;
	}
}


pos = clamp(pos, 0, pos_max);

value = ((pos / pos_max) * (max_value - def))