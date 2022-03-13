/// @description Configure the view parameters

// Manually enable the view 0
view_enabled[0] = true;

// Manually make visibly the view 0
view_visible[0] = true;

// Set the window size
window_set_size(global.gw*size, global.gh*size);

// Set the camera size
camera_set_view_size(view_camera[0], global.gw, global.gh);

// Resize the application surface
surface_resize(application_surface, global.gw*size, global.gh*size);