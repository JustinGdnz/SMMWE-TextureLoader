/// @description 

var _region = credits_element.region_get_active();
if (_region != undefined)
{
	if (mouse_check_button_pressed(mb_left))
	{
		var _url = credit_urls[real(_region)];
		if (_url != "")
			tl_open_url(_url);
	}
}