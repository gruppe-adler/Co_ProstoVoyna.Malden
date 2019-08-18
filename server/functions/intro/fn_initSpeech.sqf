params ["_helis", "_groups"];

{
	_x animateDoor ["RearDoors",1]; 
	_x animateDoor ["LeftDoor",1];
} 
forEach _helis;


_initialDelay = 2;
_speechDelay = 54;
_musicDelay = 60;

loudspeaker say3d "speech";


sleep _initialDelay;
sleep _speechDelay;

{
	0 = [_groups select _forEachIndex,_x,"mrk_target1",random 20] call server_fnc_musterUnits;
} forEach _helis;

sleep _musicDelay;

{
	0 = [_groups select _forEachIndex,_x,"mrk_target1",random 20] spawn server_fnc_musterUnitsSetOff;
} forEach _helis;