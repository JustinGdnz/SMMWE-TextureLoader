/// @description 

var _icon = sprite_exists(icon) ? icon : spr_gui_texture_slot_icon;
var _preview = sprite_exists(preview) ? preview : spr_gui_texture_slot_preview;

draw_sprite_stretched(_preview, 0, x+10, y+40, 136, 80);
draw_self();
draw_sprite_stretched(_icon, 0, x+12, y+92, 26, 26);

var _name = scribble(name).starting_format("fnt_aseprite", c_black).align(fa_left, fa_middle);
_name.draw(x+16, y+10);

var _author = scribble(author).starting_format("fnt_aseprite", c_black).align(fa_left, fa_middle);
_author.draw(x+35, y+31);

/*var _description = scribble(description).starting_format("fnt_aseprite", c_black);
_description.wrap(82)
_description.draw(x+153, y+38);*/

var _version = scribble(version).align(fa_left, fa_middle);
_version.draw(x+42, y+109);

//credits_element.wrap(62).draw(x+244, y+38);

/*var _credits = scribble(credits).starting_format("fntAseprite", c_white);
_credits.wrap(62).draw(x+240, y+38);*/

//var _region = credits_element.region_detect(x+244, y+38, mouse_x, mouse_y);
//credits_element.region_set_active(_region, c_red, 0.8);