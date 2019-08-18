_mi8positions = [
	[5024.86,968.191,85], 
	[5023.93,946.291,87], 
	[5023.79,924.824,89], 
	[5024.52,902.523,90]
];

_mi8objects = [];

{
	_heli = "RHS_Mi8mt_Cargo_vdv" createVehicle _x; 
	_heli allowDamage false;
	_heli setPosATL _x; _heli setDir 90;
	_heli setObjectTextureGlobal [0, "rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_body_g_vsr_co.paa"];
	createVehicleCrew _heli;
	/* _landingLight = [_heli] call server_fnc_createHeliLight;*/
	_mi8objects = _mi8objects + [_heli];
}
forEach _mi8positions;


_ka60positions = [
	[5022.91,785.606,98],
	[5023.67,769.938,99],
	[5004.77,751.569,101]
];	

_ka60objects = [];

{
	_heli = "rhs_ka60_grey" createVehicle [5022.91,785.606,98];
	_heli allowDamage false;
	_heli setPosATL [5022.91,785.606,98]; _heli setDir 90;
	_ka60objects = _ka60objects + [_heli];
} forEach _ka60positions;


_mi28 = "rhs_mi28n_vvs" createVehicle [5019.4,735.432,101];
_mi28 allowDamage false;
_mi28 setPosATL [5019.4,735.432,101]; _mi28 setDir 0;

_mi8objects