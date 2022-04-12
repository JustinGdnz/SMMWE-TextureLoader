/// @description Set view stuff manually

// Manually enable the view 0
view_enabled[0] = true;

// Manually make visibly the view 0
view_visible[0] = true;

// Set the window scale
window_set_size(global.w_width*scale, global.w_height*scale);

// Set the camera scale
camera_set_view_size(view_camera[0], global.w_width, global.w_height);

// Resize the application surface
surface_resize(application_surface, global.w_width*scale, global.w_height*scale);