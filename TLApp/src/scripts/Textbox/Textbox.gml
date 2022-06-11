function Textbox(_x, _y, _min_w, _min_h, _max_w, _max_h) constructor {
	box_x = _x;
	box_y = _y;
	surface_w = _min_w;
	surface_h = _min_h;
	box_w = _max_w;
	box_h = _max_h;
	
	surf = surface_create(surface_w, surface_h);
	
	// Scroll
	scroll_y = 0;
	scroll_size = surface_h / box_h;
	scroll_speed = 1;

	// Change scroll speed if needed
	if (scroll_size < 0.1)
		scroll_speed = 0.1 / scroll_size;

	// Clamp scroll size
	scroll_size = clamp(scroll_size, 0.1, 1);
	
	// Mouse interaction
	select = false;
	scroll_offset = 0;
	wheel_speed = 6;
	
	static setSize = function(_min_w, _min_h, _max_w, _max_h)
	{
		surface_w = _min_w;
		surface_h = _min_h;
		box_w = _max_w;
		box_h = _max_h;
		
		if (surface_exists(surf))
			surface_free(surf)

		surf = surface_create(surface_w, surface_h);
		
		// Scroll
		scroll_y = 0;
		scroll_size = surface_h / box_h;
		scroll_speed = 1;

		// Change scroll speed if needed
		if (scroll_size < 0.1)
			scroll_speed = 0.1 / scroll_size;

		// Clamp scroll size
		scroll_size = clamp(scroll_size, 0.1, 1);
		
		return self;
	}
	
	static setPos = function(_x, _y)
	{
		box_x = _x;
		box_y = _y;
		
		return self;
	}
	
	static step = function()
	{
		var _scroll_y = (scroll_y * scroll_size) / scroll_speed;
		var _scroll_h = (surface_h * scroll_size) - 1

		if (!select)
		{
			if (point_in_rectangle(mouse_x, mouse_y, box_x+surface_w, box_y-_scroll_y-6, box_x+surface_w+2, box_y-_scroll_y+_scroll_h+6))
			{
	
				if (mouse_check_button_pressed(mb_left))
				{
					scroll_offset = box_y-_scroll_y-mouse_y;
					select = true;
				}
			}
		}

		if (select)
		{
			scroll_y = ((box_y-mouse_y-scroll_offset) / scroll_size) * scroll_speed;
	
			if (mouse_check_button_released(mb_left))
			{
				select = false;
				scroll_offset = 0;
			}
		}	
		scroll_y = clamp(scroll_y, -box_h + surface_h, 0);
	}
	
	static predraw = function()
	{
		if (!surface_exists(surf))
			surf = surface_create(surface_w, surface_h);
	}
	
	static draw = function()
	{
		// Draw surface
		draw_surface(surf, box_x, box_y);
		
		var _scroll_y = (scroll_y * scroll_size) / scroll_speed;
		var _scroll_h = (surface_h * scroll_size) - 1

		draw_rectangle(box_x+surface_w, box_y-_scroll_y, box_x+surface_w+2, box_y-_scroll_y+_scroll_h, false);
	}
	
	static cleanup = function() {}
	
	static setTarget = function()
	{
		surface_set_target(surf);
		draw_clear_alpha(c_white, 0);
	}
	
	static resetTarget = function()
	{
		surface_reset_target();
	}
}