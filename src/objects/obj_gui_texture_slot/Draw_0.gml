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

if (!invalid)
{
	if (!ready)
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(x-1, y-1, x+sprite_width, y+sprite_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
}
else
{
	draw_text(x, y, err.message);
}