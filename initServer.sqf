STAGE_2 = false;
LHD_spawned1 = false;
LHD_spawned2 = false;
INTRO_DONE = false;

MISSION_PROGRESS = "INTRO";
publicVariable "MISSION_PROGRESS";

call server_fnc_createLHD_stage1;
0 = [] execVM "EC_tasks\init.sqf";

_trg_stage1_objects = createTrigger ["EmptyDetector", [13902, 1820, 0]];
_trg_stage1_objects setTriggerArea [2000, 2000, 0, true];
_trg_stage1_objects setTriggerActivation ["ANYBODY", "PRESENT", true];
_trg_stage1_objects setTriggerStatements ["true", "", ""];
sleep 2;
_tlist = list _trg_stage1_objects;


/* submarine sounds */
bongs = ["bongs1","bongs2","bongs3","bongs4"];

[]spawn {
	while {alive opfor_submarine} do {
	opfor_submarine say3d (bongs call BIS_fnc_selectRandom);
	sleep random 5;
	};
};


[]spawn {
	while {alive opfor_submarine} do {
	opfor_submarine say3d "screams2";
	sleep 60;
	};
};


waitUntil {sleep 1; INTRO_DONE};

MISSION_PROGRESS = "STAGE_1";
publicVariable "MISSION_PROGRESS";

/*

STAGE II

*/
waitUntil {sleep 5; MISSION_PROGRESS isEqualTo "STAGE_2"};
// delete all stuff from stage 1
{ if (!isNull _x && !isPlayer _x) then { deleteVehicle _x; }; } forEach _tlist;


// create LHD, helicopters, amphibious attack, t50 flight pass
call server_fnc_createLHD_stage2;
_helis = call server_fnc_createHelicopter;
_groups = [_helis] call server_fnc_createMusterUnits;
call server_fnc_createAmphibious;
call server_fnc_createT50;

sleep 2; // to give clients time to fadeout

remoteExec ["player_fnc_fadeOutIn", 2, false];

/* time skipping */
setDate [2008, 10, 12, 22, 0];
0 setFog [1, 0.2, 1];

// todo: clean up former player vehicles


/* ambient fire + smoke */
_fires = [ambient_fire_1,ambient_fire_2,ambient_fire_3,ambient_fire_4,ambient_fire_5,ambient_fire_6,ambient_fire_7,ambient_fire_8,ambient_fire_9,ambient_fire_10,ambient_fire_11];

for [{_i=0}, {_i<count _fires}, {_i=_i+1}] do
{
	_object = _fires select _i;
	0 = [_object, "FIRE_BIG"] call server_fnc_fireAndSmoke;
	0 = [_object, "SMOKE_BIG"] call server_fnc_fireAndSmoke;
};


// initialize intro speech, todo: add delay
[_helis, _groups] call server_fnc_initSpeech;


_spawned = [getMarkerPos "mrk_ind_airport","mrk_ind_airport",[8,1,6],["RANDOM", "SIMULATION:",1200]] call FUPS_fnc_spawn;