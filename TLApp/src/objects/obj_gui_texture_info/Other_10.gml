/// @description Object methods

// Open the support url
open_supporturl = function(_region)
{
	// Get url
	var _url = credit_urls[real(_region)];
	
	// Open url if it's not empty
	if (_url != "")
		tl_open_url(_url);
}
