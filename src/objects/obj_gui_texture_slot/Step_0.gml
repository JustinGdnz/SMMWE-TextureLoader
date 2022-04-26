/// @description Update slot position and state

// Get value from owner object's slider
var _pos = owner.slider.value;

// Interpolate value
y = lerp(y, ystart - _pos, 0.2);

// Update slot state
if (y < 188 && y > -20)
	hidden = false;
else
	hidden = true;