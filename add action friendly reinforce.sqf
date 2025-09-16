player addAction
[
	"CALL FOR FRIENDLY REINFORCEMENTS5!!!!",
	{
		_player = _this select 1;
		_aoLocation = getMarkerPos "BluforAO";
		//Location Marker To Travel To
		
		private _result = [getMarkerPos "createBluVehicle", 180, "B_ION_Pickup_mmg_rf", west] call BIS_fnc_spawnVehicle;
		
		private _vehicle = _result select 0;
		_result params ["_vehicle", "_crew", "_groupDrvGun"];
		
		
		_groupMen = createGroup blufor;
		_unit1 = _groupMen createUnit ["B_ION_medic_lxWS", [0,0,0], [], 0, "NONE"];
		_unit2 = _groupMen createUnit ["B_ION_soldier_AR_lxWS", [0,0,0], [], 0, "NONE"];
		_unit3 = _groupMen createUnit ["B_ION_Soldier_GL_lxWS", [0,0,0], [], 0, "NONE"];
		_unit4 = _groupMen createUnit ["B_ION_shot_lxWS", [0,0,0], [], 0, "NONE"];
		_unit5 = _groupMen createUnit ["B_ION_shot_lxWS", [0,0,0], [], 0, "NONE"];
		_unit6 = _groupMen createUnit ["B_ION_shot_lxWS", [0,0,0], [], 0, "NONE"];
		_unit7 = _groupMen createUnit ["B_ION_shot_lxWS", [0,0,0], [], 0, "NONE"];
		
		{_x moveInAny _vehicle} forEach units _groupMen;
		
		//_vehicle doMove position player;
		_vehicle doMove _aoLocation;

		waitForVehicleArrival = {
			params ["_player", "_vehicle", "_aoLocation", "_groupMen"];
			waitUntil {sleep 1; (_aoLocation distance _vehicle) <= 25};
			
			/*{
				_x leaveVehicle _vehicle;
			} forEach units _groupMen;*/

            _groupMen leaveVehicle _vehicle;

            /*waitUntil {
                {(_x in vehicle _x) } forEach units _groupMen;
            };*/
            waitUntil {
                {sleep 1; !(_x in vehicle _vehicle) || !(alive _x)} forEach units _groupMen
            };

			(units _groupMen) joinSilent (group _player);
			//_playerGroup = group _player;

			//_playerGroup move position _player;
			//_vehicle doMove position _player;

			//waitUntil {((_player distance (_groupMen select 1)) <= 25)};
			//
		};
		// Spawn the wait function
		[_player, _vehicle, _aoLocation, _groupMen] spawn waitForVehicleArrival;
	},
	nil,
	1.5,
	true,
	true,
	"",
	"true",
	50,
	false,
	"",
	""
];