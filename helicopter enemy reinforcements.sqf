spawnVehicleGroup = {
_aoLocation = getMarkerPos "redforAO"; 
_helipad = getMarkerPos "RedforHeliLand";
_spawnLocation = getMarkerPos "createRedVehicle";
_spawnLocation = [_spawnLocation select 0, _spawnLocation select 1, (_spawnLocation select 2) + 100];

private _result = [_spawnLocation, 180, "C_Heli_EC_01_civ_RF", east] call BIS_fnc_spawnVehicle; 
 
private _vehicle = _result select 0; 
_result params ["_vehicle", "_crew", "_groupDrvGun"]; 

_groupMen = createGroup opfor;
_unit1 = _groupMen createUnit ["O_Tura_defector_lxWS", [0,0,0], [], 0, "NONE"]; 
_unit2 = _groupMen createUnit ["O_Tura_defector_lxWS", [0,0,0], [], 0, "NONE"]; 
_unit3 = _groupMen createUnit ["O_Tura_defector_lxWS", [0,0,0], [], 0, "NONE"]; 
_unit4 = _groupMen createUnit ["O_Tura_medic2_lxWS", [0,0,0], [], 0, "NONE"]; 
_unit5 = _groupMen createUnit ["O_Tura_watcher_lxWS", [0,0,0], [], 0, "NONE"]; 
_unit6 = _groupMen createUnit ["O_Tura_HeavyGunner_lxWS", [0,0,0], [], 0, "NONE"]; 
_unit7 = _groupMen createUnit ["O_Tura_deserter_lxWS", [0,0,0], [], 0, "NONE"]; 
_unit8 = _groupMen createUnit ["O_Tura_defector_lxWS", [0,0,0], [], 0, "NONE"]; 
_unit9 = _groupMen createUnit ["O_Tura_defector_lxWS", [0,0,0], [], 0, "NONE"]; 
_unit10 = _groupMen createUnit ["O_Tura_defector_lxWS", [0,0,0], [], 0, "NONE"]; 
_unit11 = _groupMen createUnit ["O_Tura_medic2_lxWS", [0,0,0], [], 0, "NONE"]; 
_unit12 = _groupMen createUnit ["O_Tura_watcher_lxWS", [0,0,0], [], 0, "NONE"]; 
_unit13 = _groupMen createUnit ["O_Tura_HeavyGunner_lxWS", [0,0,0], [], 0, "NONE"]; 
_unit14 = _groupMen createUnit ["O_Tura_deserter_lxWS", [0,0,0], [], 0, "NONE"]; 
_unit15 = _groupMen createUnit ["O_Tura_HeavyGunner_lxWS", [0,0,0], [], 0, "NONE"]; 
 
{_x moveInAny _vehicle} forEach units _groupMen; 
 
_vehicle doMove _aoLocation; 
//_vehicle landAt [_helipad, "GetOut", 10];
_vehicle landAt [_helipad, "LAND"];
waitUntil {sleep 1; (_helipad distance _vehicle) <= 10}; 
  
_groupMen leaveVehicle _vehicle; 
 
_groupMen move position player; 
_vehicle doMove _spawnLocation; 
};

[]spawn spawnVehicleGroup