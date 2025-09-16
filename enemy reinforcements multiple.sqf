_bigGroupMen = createGroup opfor;

spawnVehicleGroup = {
params ["_bigGroupMen"];
_aoLocation = getMarkerPos "redforAO"; 
 
private _result = [getMarkerPos "createRedVehicle", 180, "O_G_Pickup_rf", east] call BIS_fnc_spawnVehicle; 
 
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
 
(_crew) joinSilent (_groupMen); 
 
{_x moveInAny _vehicle} forEach units _groupMen; 
 
_vehicle doMove _aoLocation; 
 
waitUntil {sleep 1; (_aoLocation distance _vehicle) <= 50}; 
  
_groupMen leaveVehicle _vehicle; 
 
_groupMen move position player; 
_vehicle doMove position player; 

(units _groupMen) joinSilent (_bigGroupMen);

_bigGroupMen move position player;
};


mainHandlerVehicleSpawner = {
params ["_bigGroupMen"];
[_bigGroupMen]spawn spawnVehicleGroup;
sleep 7;
[_bigGroupMen]spawn spawnVehicleGroup;
sleep 7;
[_bigGroupMen]spawn spawnVehicleGroup;
}; 

[_bigGroupMen]spawn mainHandlerVehicleSpawner