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

//waitUntil {((player distance _vehicle) <= 25)};
waitUntil {((_aoLocation distance _vehicle) <= 25)};

_groupMen leaveVehicle _vehicle;

_groupMen move position player;
_vehicle doMove position player;
waitUntil {((player distance _unit1) <= 25)};
(units _groupMen) joinSilent (group player);