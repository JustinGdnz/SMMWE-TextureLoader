/// @description 

#region Surface

	// Verify surface
	if (!surface_exists(surf))
		surf = surface_create(box_width, box_height);
	
	// Draw to surface
	surface_set_target(surf)
	
		// Clear surface
		draw_clear_alpha(c_white, 0);
		
		// Draw text
		element.draw(0, text_y);
	
	surface_reset_target();

	// Draw surface
	draw_surface(surf, x, y);

#endregion

#region Scroll

	var _scroll_y = (text_y * scroll_size) / scroll_speed;
	var _scroll_h = (box_height * scroll_size) - 1

	draw_rectangle(x+box_width, y-_scroll_y, x+box_width+2, y-_scroll_y+_scroll_h, false);

#endregion

#region Debug

	//exit;

	var box = element.get_bbox(x, y+text_y);

	draw_rectangle_color(box.left, box.top, box.right, box.bottom, c_lime, c_lime, c_lime, c_lime, true);
	draw_rectangle_color(x, y, x+box_width, y+box_height, c_red, c_red, c_red, c_red, true);

#endregion