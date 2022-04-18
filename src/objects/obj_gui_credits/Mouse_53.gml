/// @description 

if (!position_meeting(mouse_x, mouse_y, obj_gui_credits))
{
	global.click_layer--
	fade_destroy(fade);
	instance_destroy();
}