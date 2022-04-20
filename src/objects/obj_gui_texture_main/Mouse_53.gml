/// @description Close button

// Exit if can't be clicked
if (!is_clickable(button_layer)) exit;

// Close event
if (point_in_rectangle(mouse_x, mouse_y, 360, 7, 360+17, 7+17))
{
	// Restore clickable layer
	global.click_layer--
	
	// Destroy the screen fade
	fade_destroy(fade);
	
	// Self destruction
	instance_destroy();
}