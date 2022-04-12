/// @description 

var _icon = sprite_exists(icon) ? icon : spr_Selector_TextureIcon;
var _banner = sprite_exists(banner) ? banner : spr_Selector_TextureBanner;


draw_sprite_stretched(_banner, 0, x+3, y+3, 94, 28);
draw_self();
draw_sprite_stretched(_icon, 0, x+4, y+4, 26, 26);

var _element = scribble(name).wrap(94, 12, true).starting_format("fntAseprite", c_black).align(fa_left, fa_center);
_element.draw(x+6, y+37)
