/// @description 
var prev_selected = selected;

if (!block)
{
	if (!isButtonSelected()) {
		selected = (getButtonID() == id);
	} else if (getButtonID() != id) {
		selected = false;
	}

	if (prev_selected != selected) {
		SelectButton(selected)
		if (selected) {
			event_user(0);
		} else {
			event_user(1);
		}
	}
}