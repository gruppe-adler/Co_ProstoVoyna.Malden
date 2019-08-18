_taskNameTitle = "Unglücksstelle sichern";
_taskDescription = "Sichern Sie die Unglücksstelle. Niemand darf sich ihr nähern.";

_areaMarkerName = " target area ";

_tsk = [
	east,
	_taskNameTitle,
	[
		_taskDescription,
		_taskNameTitle,
		_areaMarkerName
	],
	getMarkerPos "mrk_s1_submarinePosition",
	"AUTOASSIGNED",
	1,
	true,
	"defend"
] call BIS_fnc_taskCreate;

_tsk