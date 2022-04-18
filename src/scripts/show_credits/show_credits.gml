function show_credits(region = undefined) {
	if (!instance_exists(obj_gui_credits))
	{
		global.click_layer++;
		instance_create_depth(room_width/2, room_height/2, depth-100, obj_gui_credits);
	}
}