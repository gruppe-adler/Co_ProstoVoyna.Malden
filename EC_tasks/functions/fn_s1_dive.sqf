_taskNameTitle = "Unglücksursache untersuchen";
_taskDescription = "Untersuchen Sie die Unglücksursache. 
Tauchen Sie dafür zum U-Boot und machen Sie sich ein Bild von der Lage.";

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
	"search"
] call BIS_fnc_taskCreate;

_tsk