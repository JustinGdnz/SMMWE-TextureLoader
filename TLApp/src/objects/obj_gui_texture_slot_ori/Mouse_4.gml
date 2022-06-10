/// @description 

if (!is_clickable(button_layer))
	exit;


global.click_layer++;
if (instance_number(obj_gui_texture_info) == 0)
{
	var _ins = instance_create_depth(0, 0, depth-100, obj_gui_texture_info);
	with (_ins)
	{
		icon = other.icon;
		preview = other.preview;
		name = other.name
		description = other.description
		author = other.author
		version = other.version
		credit_names = other.credit_names
		credit_urls = other.credit_urls
		texture = obj_manager_texture.textures[other.texture_index];
		
		event_user(0);
		event_user(1);
	}
}