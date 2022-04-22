/// @description Cleanup some stuff

// Delete temporal images
if (ready)
{
	if (sprite_exists(icon))
		sprite_delete(icon)

	if (sprite_exists(banner))
		sprite_delete(banner)

	if (sprite_exists(preview))
		sprite_delete(preview)
}

// Destroy spinner
loadspinner_destroy(spinner);

// Restore the frame delay
global.frame_delay = false;