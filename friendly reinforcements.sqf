/*
Make a maker with the name BluforAO where you want the vehicle to drive to
Make a maker with the name createBluVehicle where you want the vehicle/crew to be spawned at

*this code* should make it so the crew dismounts and joins the players group and doesn't get trapped running if they die... but who knows ><
*/

_aoLocation = getMarkerPos "BluforAO";
_spawnLocation = getMarkerPos "createBluVehicle";

_truckGun = "B_ION_Pickup_rcws_rf" createVehicle [(_spawnLocation select 0) + 2, (_spawnLocation select 1) + 0];
_truckTransport = "B_ION_Pickup_rf" createVehicle [(_spawnLocation select 0) - 2, (_spawnLocation select 1) - 0];

_groupGun = createGroup blufor;
_unit1 = _groupGun createUnit ["B_ION_Soldier_lxWS", [0,0,0], [], 0, "NONE"];
_unit2 = _groupGun createUnit ["B_ION_Soldier_lxWS", [0,0,0], [], 0, "NONE"];

{_x moveInAny _truckGun} forEach units _groupGun;
_truckGun doMove _aoLocation;

_groupTransport = createGroup blufor;
_soldierTypes = [
    "B_ION_Soldier_lxWS",   // ION Rifleman
    "B_ION_medic_lxWS", // ION Medic
	"B_ION_Soldier_GL_lxWS", // ION Grenadier
	"B_ION_soldier_LAT_RF", // ION Heavy AT
	"B_ION_marksman_lxWS", // ION Marksman
	"B_ION_soldier_AR_lxWS" // ION Autorifleman
];

_truckTransportCrewCount = ["B_ION_Pickup_rf", true] call BIS_fnc_crewCount;
//_truckTransportCrewCount = _truckTransportCrewCount - 1; // Use this if you want to decrease the vehicle from a full load

for "_i" from 1 to _truckTransportCrewCount do {
    _randomSoldier = selectRandom _soldierTypes;
    _unit = _groupTransport createUnit [_randomSoldier, [0,0,0], [], 0, "NONE"];
    _unit setSkill 0.8;
};
_groupTransport setFormation "WEDGE"; 

{_x moveInAny _truckTransport} forEach units _groupTransport;
_truckTransport doMove _aoLocation;

waitForVehicleArrival = {
	params ["_truckTransport", "_aoLocation", "_groupTransport"];
	waitUntil {sleep 1; (_aoLocation distance _truckTransport) <= 50 || !(alive _truckTransport)};

	_groupTransport leaveVehicle _truckTransport;
    waitUntil {
        {sleep 1; !(_x in vehicle _truckTransport) || !(alive _x)} forEach units _groupTransport
    };

	(units _groupTransport) joinSilent (group player);
};

[_truckTransport, _aoLocation, _groupTransport] spawn waitForVehicleArrival;