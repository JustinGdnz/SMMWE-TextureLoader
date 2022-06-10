/// @description 

// Variable definition
text = text;

// Box size
box_width = sprite_width;
box_height = sprite_height;

// Box surface
surf = surface_create(box_width, box_height);

// Text
element = scribble(text);

// Wrap text to box
element.wrap(box_width);

// Text box
text_width = element.get_width();
text_height = element.get_height();

// Text position
text_y = 0;

// Scroll
scroll_size = box_height / text_height;
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