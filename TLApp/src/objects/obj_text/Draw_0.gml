/// @description 

// Don't draw if it will be manually drawed
if (manually) exit;

// Debug guide
if (debug)
	draw_circle(x, y, 3, true);

// Draw text
element.draw(x + x_offset, y + y_offset);
