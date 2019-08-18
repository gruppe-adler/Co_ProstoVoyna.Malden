params ["_unit", "_pos"];

_unit = _this select 0;
_pos = getMarkerPos (_this select 1);

_group = group _unit;


{
	_x enableDynamicSimulation false;
 	_x commandArtilleryFire 
	[_pos,
	getArtilleryAmmo [_unit] select 0,
	20];
} forEach units _group;

sleep 30;

{
	_x enableDynamicSimulation true;
} forEach units _group;
