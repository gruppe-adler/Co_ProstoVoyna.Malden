params ["_helis"];

LHD_officer = (createGroup east) createUnit ["rhs_msv_emr_officer", [5004.74,926.24,100], [], 0, "CAN_COLLIDE"];
LHD_officer allowDamage false;
LHD_officer setPosASL [5004.74,926.24,18];

_groups = [];

// make those bastards hold their feet
{
	_group = createGroup east;
	[_group,_x] call server_fnc_createUnitsAtHeli;
	_groups = _groups + [_group];
} forEach _helis;

_groups