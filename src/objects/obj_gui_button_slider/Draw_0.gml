/// @description 

// Draw the slider back
draw_sprite_stretched(spr_gui_button_slider, 1, x, y, 4, height)

// Draw the slider button
draw_sprite_stretched(spr_gui_button_slider, 0, x, y+pos, 4, size)

/* DEBUG */
//draw_text(x+12, y, value);
//draw_text(x+12, y+12, max_pos);
//draw_text(x+12, y+12*2, size);
//draw_text(x+12, y+12*3,  pos);
//draw_text(x+12, y+12*4, height / max_value);