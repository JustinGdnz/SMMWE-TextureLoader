/// @description Validate json data

// Exit if it's not a valid struct object
if (!is_struct(data)) { invalid = true; exit; }

// Ensure there's a "version" key
data[$ "version"] ??= PACK_DATA_FORCE_VERSION;
var _version = data.version

// Choose the correct version
switch(_version)
{
	// Version 1
	case 1:
		
		// Ensure there's a "pack" key
		data[$ "pack"] ??= {};
		
		// Save reference
		var _pack = data.pack
		
			// Ensure thoose keys exists
			_pack[$ "Name"]					??= "<Name>";
			_pack[$ "Author"]				??= "<Author>";
			_pack[$ "Description"]			??= "<Description>";
			_pack[$ "Version"]				??= {};
				_pack.Version[$ "major"]		??= 1;
				_pack.Version[$ "minor"]		??= 0;
			_pack[$ "TargetVersion"]		??= []
			_pack[$ "Credits"]				??= []
			
			// Also make sure to fix Credits array if needed
			for (var i = 0, n = array_length(_pack.Credits); i < n; i++)
			{
				// Check if it's a valid struct object
				if (is_struct(_pack.Credits[i]))
				{
					var _credit = _pack.Credits[i];
					_credit[$ "User"]	??= ""
					_credit[$ "SupportURL"] ??= ""
				}
				// Otherwise delete it from existence...
				else
				{
					array_delete(_pack.Credits, i, 1);
					n--
				}
			}
		
	break;
	default:
	
		// Force version
		data.version = PACK_DATA_FORCE_VERSION;
		
		// Run script again
		event_user(0);

	break;
}