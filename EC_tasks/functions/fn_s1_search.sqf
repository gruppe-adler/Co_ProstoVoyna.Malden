_taskNameTitle = "Finden Sie das U-Boot";
_taskDescription = "Suchen Sie im Zielsektor nach dem U-Boot.";

_areaMarkerName = " target area ";

_tsk = [
	east,
	_taskNameTitle,
	[
		_taskDescription,
		_taskNameTitle,
		_areaMarkerName
	],
	objNull,
	"AUTOASSIGNED",
	1,
	true,
	"search"
] call BIS_fnc_taskCreate;

_tsk