/// @description PostCreate initialization

// Update the size
size = height * (height / (max_value + height));
size = clamp(size, 4, height);

// Update the position
pos = 0;
max_pos = height - size;

// Done
ready = true;