/// @description 

// Inherit the parent event
event_inherited();

// Box size
box_width = sprite_width;
box_height = sprite_height;

// Box surface
surf = surface_create(box_width, box_height);

// Wrap text to box width
element.wrap(box_width);

// Text bbox size
element_width = element.get_width();
element_height = element.get_height();

// Text position
element_pos = {x: 0, y: 0}

// Scroll variables
scroll_size = box_height / element_height;
scroll_speed = 1;

// Change scroll speed if needed
if (scroll_size < 0.1)
	scroll_speed = 0.1 / scroll_size;

// Limit the scroll size
scroll_size = clamp(scroll_size, 0.1, 1);

// Mouse interaction
select = false;
click_offset = 0;
wheel_speed = 6;