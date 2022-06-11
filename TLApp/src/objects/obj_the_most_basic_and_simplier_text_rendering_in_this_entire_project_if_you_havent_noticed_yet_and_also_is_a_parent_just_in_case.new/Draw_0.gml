/// @description 

draw_set_font(fntAseprite);

var _text = scribble(text).padding(2, 2, 2, 2);

var _bbox = _text.get_bbox(x, y);
draw_rectangle(_bbox.left, _bbox.top, _bbox.right, _bbox.bottom, true);

_text.draw(x, y);




/*var state_halign = draw_get_halign();
var state_valign = draw_get_valign();

draw_set_font(fntAseprite);
draw_set_halign(h_align);
draw_set_valign(v_align);

draw_text(x, y, text);

draw_set_halign(state_halign);
draw_set_valign(state_valign);