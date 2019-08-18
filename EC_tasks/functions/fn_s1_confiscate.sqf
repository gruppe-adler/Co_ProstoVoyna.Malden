_taskNameTitle = "Boote konfiszieren";
_taskDescription = "Konfiszieren Sie Boote, um Ihre Taucher an Land zu bringen.";

_areaMarkerName = " target area ";

_tsk = [
	east,
	_taskNameTitle,
	[
		_taskDescription,
		_taskNameTitle,
		_areaMarkerName
	],
	getMarkerPos "mrk_s1_secureBoats",
	"AUTOASSIGNED",
	1,
	true,
	"attack"
] call BIS_fnc_taskCreate;

_tsk