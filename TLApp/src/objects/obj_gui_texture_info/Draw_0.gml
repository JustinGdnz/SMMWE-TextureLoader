/// @description 

if (!ready) exit;

// Choose sprites
var _icon = sprite_exists(icon) ? icon : spr_gui_texture_slot_icon;
var _preview = sprite_exists(preview) ? preview : spr_gui_texture_slot_preview;

// Draw preview first
draw_sprite_stretched(_preview, 0, x+10, y+40, 136, 80);

// Then draw self
draw_self();

// And last draw the icon
draw_sprite_stretched(_icon, 0, x+12, y+92, 26, 26);