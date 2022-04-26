/// @description Handle slider movement

// If the slider is not selected...
if (!select)
{
	// And mouse position is in the slider...
	if (point_in_rectangle(mouse_x, mouse_y, x, y+pos, x+4, y+pos+size))
	{
		// And the mouse has been pressed
		if (mouse_check_button_pressed(mb_left) && is_clickable(button_layer))
		{
			// Mark the slider as selected
			select = true;
			
			// Set the difference beetwen the mouse click position and the slider position
			offset = mouse_y - y - pos;
		}
	}
}
// Otherwise
else
{
	// Set slider position
	pos = mouse_y - y - offset;
	
	// If the click is released
	if (mouse_check_button_released(mb_left))
	{
		// Deselect and reset offset
		select = false;
		offset = 0;
	}
}

// Clamp slider position
pos = clamp(pos, 0, max_pos);

// Get the value
value = ((pos / max_pos) * max_value)

// Make sure is not a NaN value
if (is_nan(value)) value = 0;