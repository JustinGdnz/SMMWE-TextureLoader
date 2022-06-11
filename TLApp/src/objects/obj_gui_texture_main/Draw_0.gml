/// @description Draw me

// Draw background
draw_sprite_stretched(spr_gui_textures_back, 0, 28, 22, 328, 172);

// Draw edges
draw_sprite_stretched(spr_gui_textures_front, 0, 28, 22, 328, 172);

// Draw the close "button"
draw_sprite(spr_button_gb_close, 0, 356, 22);

// Draw the reload "button"
draw_sprite(spr_button_gb_back, 0, 18, 178);
draw_sprite(spr_button_gb_front, 1, 18, 178);

// Draw the folder "button"
draw_sprite(spr_button_gb_back, 0, 18, 157);
draw_sprite(spr_button_gb_front, 0, 18, 157);