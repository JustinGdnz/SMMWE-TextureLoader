/// @description 

// Inherit the parent event
event_inherited();

var _region = element.region_get_active();
if (_region != undefined)
{
	if (mouse_check_button_pressed(mb_left))
		hypertext_action(_region);
}