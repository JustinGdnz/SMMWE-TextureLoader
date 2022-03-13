/// @description 

if (step < 1)
{
	step += 1/(2*60);
}
else step = 0;

var curve = animcurve_get_channel(Spinner, "default");

var value = animcurve_channel_evaluate(curve, step);

image_angle = value * -360;