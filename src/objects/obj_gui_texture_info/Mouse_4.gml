/// @description 

if (!is_clickable(button_layer)) exit;

if (point_in_rectangle(mouse_x, mouse_y, x+296, y+4, x+296+17, y+7+17))
{
	global.click_layer--
	fade_destroy(fade);
	text_destroy(desc_box);
	text_destroy(credits_box);
	instance_destroy(button);
	instance_destroy();
}