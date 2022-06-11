/// @description Apply windows size

// Reset display
display_reset(0, 0);

// Set the window size
window_set_size(global.w_width*scale, global.w_height*scale);

// Set the GUI size
display_set_gui_size(global.w_width*scale, global.w_height*scale);

// Center the app window
alarm[1] = 1;