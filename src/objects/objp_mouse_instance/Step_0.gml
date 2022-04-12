if (hover) {
	if (!mouseGetSelected()) {
		selected = true;
		onEnter();
		mouseSetSelected(selected);
	}
}
else if (!hover && prev_hover) {
	selected = false;
	onLeave();
	mouseSetSelected(selected);
}

if (selected) image_blend = c_red;
else image_blend = c_white;