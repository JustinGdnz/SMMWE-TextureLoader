/// @description 

if (!is_clickable(button_layer)) exit;

if (point_in_rectangle(mouse_x, mouse_y, 360, 7, 360+17, 7+17))
{
	global.click_layer--
	focus_destroy(focus);
	instance_destroy();
}