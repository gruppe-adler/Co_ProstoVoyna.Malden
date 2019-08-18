_taskNameTitle = "Sprengladung legen";
_taskDescription = "Legen Sie eine Sprengladung an das U-Boot. 
Tun Sie dann, als hätten Sie diese dort gefunden und der Timer würde bereits laufen. Befehlen Sie den Rückzug.";

_areaMarkerName = " target area ";

_tsk = [
	diver_tl,
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
	"destroy"
] call BIS_fnc_taskCreate;

_tsk