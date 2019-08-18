_MISSION_PROGRESS_listener = {
	switch (_this select 1) do {
		case "INTRO": {};
		case "STAGE_1": {};
		case "CUTSCENE_1": {};
		case "STAGE_2": {};
		case "CUTSCENE_2": {};
		case "STAGE_3": {};
		case "OUTRO": {};
		default {};
	};
};

"MISSION_PROGRESS" addPublicVariableEventHandler _MISSION_PROGRESS_listener;


// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_MISSION_PROGRESS_listener spawn {
		_tmpProgress = MISSION_PROGRESS;
		waitUntil {sleep 1; _tmpProgress != MISSION_PROGRESS};
		[0, MISSION_PROGRESS] call _this;
	};
};