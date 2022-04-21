/// @description Draw slot

// Exit if its not initialized yet
//if (!ready) exit;

// Choose sprites
var _icon = sprite_exists(icon) ? icon : spr_gui_texture_slot_icon;
var _banner = sprite_exists(banner) ? banner : spr_gui_texture_slot_banner;

var _numb = invalid ? 1 : 0

// Draw banner first
draw_sprite_stretched(_banner, _numb, x+3, y+3, 94, 28);

// Then draw self
draw_self();

// And last draw the icon
draw_sprite_stretched(_icon, _numb, x+4, y+4, 26, 26);

if (!ready)
{
	draw_set_alpha(0.5);
	draw_rectangle_color(x-1, y-1, x+sprite_width, y+sprite_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	//draw_sprite_ext(spr_loading_spinner, 0, x+sprite_width/2, y+sprite_height/2, 0.25, 0.25, 0, c_white, 1);
}