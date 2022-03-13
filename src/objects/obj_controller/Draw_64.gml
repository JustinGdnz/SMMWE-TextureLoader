/// @description Draw application surface

// Disable alpha blending
gpu_set_blendenable(false);

// Draw a rectangle
draw_rectangle_colour(0, 0, global.gw*size, global.gh*size, c_black, c_black, c_black, c_black, 0);

// Draw the application surface
draw_surface_stretched(application_surface, 0, 0, global.gw*size, global.gh*size);

// Enable alpha blending
gpu_set_blendenable(true);