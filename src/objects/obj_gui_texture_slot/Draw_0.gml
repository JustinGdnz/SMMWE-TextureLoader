/// @description Draw slot

if (hidden) exit;

// Verify text surface
if (!surface_exists(text_surf))
	text_surf = surface_create(90, 12);

// Set the crop shader
shader_set(shd_crop);

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
	if (ready)
	{
		// Reset the shader
		shader_reset();
		
		// Draw to surface
		surface_set_target(text_surf)
		
		// Clear surface
		draw_clear_alpha(c_white, 0);
		
		// Draw text
		text_name.draw();
		
		// Stop drawing to surface
		surface_reset_target()
		
		// Set shader again
		shader_set(shd_crop);
		
		// Draw surface
		draw_surface(text_surf, x+6, y+33)
	}
	else
	{
		// Draw the rectangle
		draw_set_alpha(0.5);
		draw_rectangle_color(x-1, y-1, x+sprite_width, y+sprite_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		// Draw the spinner
		spinner.y = y+sprite_height/2
		spinner.draw()
	}
}
else
{
	draw_text(x, y, err.message);
}

// Reset shader
shader_reset();