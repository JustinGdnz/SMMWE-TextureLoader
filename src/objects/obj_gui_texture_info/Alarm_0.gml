/// @description 
if (owner == undefined) {instance_destroy(); exit;}

icon = owner.icon;
preview = owner.preview;
texture = owner.texture;

// Simplify credits stuff
for (var i = 0, n = 0, s = array_length(texture.Credits); i < s; i++)
{
	var _credit = texture.Credits[i];
	
	if (_credit.User != "")
	{
		credit_names += "[region," + string(n) + "]" + _credit.User + "[/region]\n";
		array_push(credit_urls, _credit.SupportURL);
		n++;
	}
}

// Create text elements
text_name = text_create_wrap(x+16, y+7, depth-5, "[][c_black]" + texture.Name, 256, 12, true);
text_author = text_create_wrap(x+35, y+27, depth-5, "[][c_black]" + texture.Author, 116, 12, true);
text_version = text_create_wrap(x+42, y+106, depth-5, "[][c_white]v" + string(texture.Version.major) + "." + string(texture.Version.minor), 100, 12, true);
text_desc = text_create_box(x+153, y+40, 83, 80, depth-5, "[c_black]"+texture.Description); 
text_credits = text_create_hyperlink_box(x+244, y+40, 64, 80, depth-5, "[c_black]"+credit_names, "dummy", c_red, 0.8, open_supporturl)

ready = true;