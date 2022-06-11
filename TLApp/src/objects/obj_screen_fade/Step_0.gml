/// @description 

var alpha = (state == 0) ? max_alpha : min_alpha;
image_alpha = lerp(image_alpha, alpha, lerp_amount);

if (state != 0 && image_alpha <= min_alpha)
	instance_destroy();