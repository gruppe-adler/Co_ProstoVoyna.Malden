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



// initialize intro speech, todo: add delay
[_helis, _groups] call server_fnc_initSpeech;