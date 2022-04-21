/// @description 

var _icon = sprite_exists(icon) ? icon : spr_gui_texture_slot_icon;
var _banner = sprite_exists(banner) ? banner : spr_gui_texture_slot_banner;


draw_sprite_stretched(_banner, 0, x+3, y+3, 94, 28);
draw_self();
draw_sprite_stretched(_icon, 0, x+4, y+4, 26, 26);

var _element = scribble(name).wrap(94, 12, true).starting_format("fnt_aseprite", c_black).align(fa_left, fa_center);
_element.draw(x+6, y+37)
