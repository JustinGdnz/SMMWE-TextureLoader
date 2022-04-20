/// @description

// Only debug
image_alpha = 0.4;

// Variable definitions
text = text;
color = color;
font = font;
halign = halign;
valign = valign;
text_args = text_args;
x_offset = x_offset;
y_offset = y_offset;
debug = debug;

// Text element
element = scribble(string(text_args) + string(text)).starting_format(font, color).align(halign, valign);