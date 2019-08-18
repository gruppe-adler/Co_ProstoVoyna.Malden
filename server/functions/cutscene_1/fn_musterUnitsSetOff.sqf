params ["_group", "_targetVehicle", "_targetMarker", "_wait"];
_groupVehicle = group _targetVehicle;
_targetPosition = getMarkerPos _targetMarker;

{_x enableAI "anim";_x switchMove "";} forEach units _group;

{
	
	[_x,_targetVehicle] spawn {
		_un = _this select 0;
		_ve = _this select 1;
		_un assignAsCargo _ve;
		sleep (random 1);
		[_un] orderGetIn true;
		_un setDir 0;
		_un doTarget _ve;
		_un doWatch _ve;
		sleep 1;
		_un switchMove "ACE_Climb";
		sleep 1;
		_un moveInCargo _ve;
		diag_log format ["%1 assigned as cargo for %2",_un,_ve];
	};
	
}
forEach units _group;


sleep _wait + 3.2;
_targetVehicle animateDoor ["RearDoors",0];
_targetVehicle animateDoor ["LeftDoor",0];
_groupVehicle setBehaviour "AWARE";


_groupVehicle move _targetPosition;
waitUntil {
  (getPosASL _targetVehicle) select 2 > 50
};
waitUntil {vehicle (leader _groupVehicle) distance _targetPosition < 400};
{
	deleteVehicle _x;
} forEach units _group;

{deleteVehicle _x} forEach crew _targetVehicle;
deleteVehicle _targetVehicle;