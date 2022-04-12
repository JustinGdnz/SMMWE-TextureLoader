/// @description 

// Draw the box
draw_self()

// "Developers" text
var _element = scribble("[rainbow][fa_center][fa_middle]-Developers-\n\n\n\n-Special Thanks-");
_element.draw(x, y-22)

// Our icons
draw_sprite_ext(spr_Limorbak, 0, x+36, y-26, 0.5, 0.5, 0, c_white, 1);
draw_sprite_ext(spr_Justin,   0, x-36, y-26, 0.5, 0.5, 0, c_white, 1);

// Draw the close button
draw_sprite(spr_close, 0, x+80, y-76);