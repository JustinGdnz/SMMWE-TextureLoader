/// @description 

if (selected) {
	draw_sprite(sprButtonBorder, 0, x, y);
}

draw_self()

if (!block)
{
	draw_set_font(fntDefault);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(x, y-6, "Cargar", 4, 4, 0);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}