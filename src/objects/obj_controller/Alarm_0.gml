/// @description Set up window size

// Reset display
display_reset(0, 0);

// Set the window size
window_set_size(global.gw*size, global.gh*size);

// Set the GUI size
display_set_gui_size(global.gw*size, global.gh*size);

// Center the window
alarm[1] = 1;