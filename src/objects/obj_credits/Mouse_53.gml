/// @description 

if (!position_meeting(mouse_x, mouse_y, obj_credits))
{
	global.click_layer--
	focus_destroy(focus);
	instance_destroy();
}