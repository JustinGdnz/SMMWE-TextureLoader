/// @description 

if (!is_clickable(button_layer))
	exit;


global.click_layer++;
if (instance_number(obj_gui_texture_main) == 0)
	instance_create_depth(28, 22, depth-100, obj_gui_texture_main);