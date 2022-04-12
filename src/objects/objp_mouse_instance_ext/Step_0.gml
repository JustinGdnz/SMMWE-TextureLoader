/// @description 

var inside_box = mouse_x > box_left && mouse_x < box_right && mouse_y > box_top && mouse_y < box_bottom

if (!temp_enter)
{
	if (inside_box)
	{
		if (block) exit;
		hover = true;
		
		temp_enter = true;
	}
} else {
	if (!inside_box)
	{
		hover = false;
		temp_enter = false;
	}
}

// Inherit the parent event
event_inherited();

