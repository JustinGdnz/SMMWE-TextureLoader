/// @description 
open_url = function(_event) 
{
	switch(_event)
	{
		case "justin":
			tl_open_url(JUSTIN_YT);
			break;
		case "limo":
			tl_open_url(LIMO_YT);
			break;
		case "ek":
			tl_open_url(EK_SERVER);
			break;
		case "juju":
			tl_open_url(SCRIBBLE_SRC);
			break;
		case "4j":
			tl_open_url(M4J_SERVER);
			break;
	}
}

// Create focus
focus = focus_create_below();

// Create hyper texts
htext_justin = hypertext_create(x-36, y-14, -1, "[fa_center][fa_middle]Justin", "justin", c_yellow, 0.8, open_url);
htext_limo = hypertext_create(x+36, y-14, -1, "[fa_center][fa_middle]Limorbak", "limo", c_yellow, 0.8, open_url);
htext_special = hypertext_create(x, y+44, -1, "[fa_center][fa_middle]SMM:WE Team[/region]  [region,juju]JujuAdams[/region]\n4J Friends <3\n\nFont by Aseprite", "ek", c_yellow, 0.8, open_url);