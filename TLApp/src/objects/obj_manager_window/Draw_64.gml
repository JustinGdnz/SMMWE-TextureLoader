/// @description Draw application surface manually

// Disable alpha blending
gpu_set_blendenable(false);

// Draw the background
draw_rectangle_colour(0, 0, global.w_width*scale, global.w_height*scale, c_black, c_black, c_black, c_black, 0);

// Draw the application surface
draw_surface_stretched(application_surface, 0, 0, global.w_width*scale, global.w_height*scale);

// Enable alpha blending
gpu_set_blendenable(true);