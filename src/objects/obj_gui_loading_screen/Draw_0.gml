/// @description 
var _text = "";

switch(global.texture_process)
{
	case 0:
		_text = "[scale,2][fa_center][fa_middle]Deleting cache..."
		break;
	case 1:
		_text = "[scale,2][fa_center][fa_middle]Extracting texture..."
		break;
	case 2:
		_text = "[scale,2][fa_center][fa_middle]Loading texture..."
		break;
	default:
		_text = "[scale,2][fa_center][fa_middle]This shouldn't be shown, we're all gonna die! D: (Something went wrong)";
}

var _element = scribble(_text).wrap(384);
_element.draw(room_width / 2, room_height / 2 + 32);