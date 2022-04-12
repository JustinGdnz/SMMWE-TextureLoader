/// @description 

if (!is_clickable(button_layer))
	exit;


global.click_layer++;
if (instance_number(obj_texture_screen) == 0)
	instance_create_layer(28, 22, "Top", obj_texture_screen)