_taskNameTitle = "Warten Sie auf die Spezialkräfte";
_taskDescription = "Warten Sie auf Spezialkräfte, die das U-Boot bergen und die Sprengsätze entschärfen können.";

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