if (!tl_is_process_running()) {
	if (!tl_init()) {
		block = true;
		image_index = 1;
		if (!instance_exists(objSpinner)) {
			with(instance_create_layer(192, 134, "Instances_1", objSpinner))
			{
				image_xscale = 0.5;
				image_yscale = 0.5;
			}
		}
	}
} else {
	if (!tl_has_module()) {
		block = false;
		image_index = 0;
		with (objSpinner) instance_destroy();
	}
	else {
		block = true;
		image_index = 1;
		if (!instance_exists(objSpinner)) {
			with(instance_create_layer(192, 134, "Instances_1", objSpinner))
			{
				image_xscale = 0.5;
				image_yscale = 0.5;
			}
		}
	}
}

alarm[0] = 15