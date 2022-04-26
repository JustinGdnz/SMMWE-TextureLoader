/// @description Sliiiider

// Slider value
value = 0;
max_value = 0;

// Slider max height
height = 148;

// Slider button size
size = height * (height / (max_value + height));
size = clamp(size, 4, height);

// Slider button position
pos = 0;
max_pos = height - size;

// Mouse interaction
select = false;
offset = 0;
scroll_speed = 12;

// Clickable layer
button_layer = global.click_layer;

// PostCreate-initialization
alarm[0] = 1;
ready = false;