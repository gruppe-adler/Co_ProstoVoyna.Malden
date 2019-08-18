params ["_group", "_heli"];

_LHD_group_class = [
	"rhs_msv_sergeant",
	"rhs_msv_efreitor",
	"rhs_msv_grenadier_rpg",
	"rhs_msv_strelok_rpg_assist",
	"rhs_msv_machinegunner",
	"rhs_msv_LAT",
	"rhs_msv_strelok_rpg_assist",
	"rhs_msv_rifleman",
	"rhs_msv_rifleman",
	"rhs_msv_medic"
	];

_group setSpeedMode "FULL";
_group setBehaviour "CARELESS";
_group setCombatMode "BLUE";
_heliPosY = (getPos _heli) select 1;
_offset = 1;

{
	_offset = _offset + 1;
	_position = [5016 + _offset,_heliPosY - 4 + (random 0.1),17.5];
	// diag_log format ["set heli pos to %1",getPos _x];
	// _newUnit = _x createUnit [_position, _group, "", 0, "PRIVATE"];
	_newUnit = _group createUnit ["rhs_msv_sergeant",_position, [], 0, "CAN_COLLIDE"];
	_newUnit disableAI "ALL";
	_newUnit setSkill 0;
	_newUnit setDir 270 + (random 0.1) - (random 0.1);
	[_newUnit, true] call ACE_captives_fnc_setHandcuffed;

} forEach _LHD_group_class;

_group