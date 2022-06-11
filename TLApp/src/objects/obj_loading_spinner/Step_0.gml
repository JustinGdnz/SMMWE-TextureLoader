/// @description 

if (anim_step < 1)
	anim_step += 1/(anim_speed*room_speed);
else anim_step = 0;

var _anim = animcurve_get_channel(ac_loading_spinner, "idle");
var _val = animcurve_channel_evaluate(_anim, anim_step);

image_angle = -360 * _val