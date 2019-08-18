_taskNameTitle = "Exfiltrieren";
_taskDescription = "Exfiltrieren Sie zur Wladiwostok. Bergen Sie Ihre Taucher mit Hilfe der Boote vom abchasischen Stützpunkt.";

_areaMarkerName = " target area ";

_tsk = [
	east,
	_taskNameTitle,
	[
		_taskDescription,
		_taskNameTitle,
		_areaMarkerName
	],
	getMarkerPos "mrk_stage1_LZ_6",
	"AUTOASSIGNED",
	1,
	true,
	"exit"
] call BIS_fnc_taskCreate;

_tsk