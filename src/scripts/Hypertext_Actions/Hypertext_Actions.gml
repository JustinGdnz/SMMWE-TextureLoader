function hypertext_action_example(region = undefined) {
	show_message("Hypertext example!\nEvent: " + string(region));
}

function show_credits(region = undefined) {
	if (instance_number(obj_credits) == 0)
	{
		global.click_layer++;
		instance_create_layer(room_width/2, room_height/2, "Top", obj_credits);
	}
}

function open_tlserver(region = undefined) {
	tl_open_url(TL_SERVER);
}