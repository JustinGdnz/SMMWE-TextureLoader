/// @description Scroll "down"

// Exit if can't be clicked
if (!is_clickable(button_layer)) exit;

// Move the "slider" down by a fix speed
value -= scroll_speed;

// Set the slider position
pos = value * (max_pos / max_value)

// Make sure is not a NaN value
if (is_nan(pos)) pos = 0;