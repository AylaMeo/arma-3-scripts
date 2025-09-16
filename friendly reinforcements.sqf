/*
Make a maker with the name BluforAO where you want the vehicle to drive to
Make a maker with the name createBluVehicle where you want the vehicle/crew to be spawned at

*this code* should make it so the crew dismounts and joins the players group and doesn't get trapped running if they die... but who knows ><
*/

_aoLocation = getMarkerPos "BluforAO";
_vehicleSpawnLocation = getMarkerPos "createBluVehicle";

private _result = [_vehicleSpawnLocation, 180, "B_ION_Pickup_mmg_rf", west] call BIS_fnc_spawnVehicle;
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
_vehicle doMove _aoLocation;

waitForVehicleArrival = {
	params ["_vehicle", "_aoLocation", "_groupMen"];
	waitUntil {sleep 1; (_aoLocation distance _vehicle) <= 25 || !(alive _vehicle)};
	
    waitUntil {
        {sleep 1; !(_x in vehicle _vehicle) || !(alive _x)} forEach units _groupMen
    }
	(units _groupMen) joinSilent (group player);
};

[_vehicle, _aoLocation, _groupMen] spawn waitForVehicleArrival;