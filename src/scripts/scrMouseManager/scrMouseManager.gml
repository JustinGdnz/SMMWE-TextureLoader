function getButtonID() {
	with(objMouseManager) {
		return button_id;
	}
	return noone;
}

function isButtonSelected() {
	with (objMouseManager) {
		return button_selected;
	}
	return false;
}

function SelectButton(_selected) {
	with (objMouseManager) {
		button_selected = _selected;
	}
}