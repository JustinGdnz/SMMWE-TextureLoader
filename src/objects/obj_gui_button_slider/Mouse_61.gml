/// @description Scroll "up"

// Move the "slider" up by a fix speed
value += scroll_speed;

// Set the slider position
pos = value * (max_pos / max_value)

// Make sure is not a NaN value
if (is_nan(pos)) pos = 0;