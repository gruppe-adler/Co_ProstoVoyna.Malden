params ["_heli"];

_lamp = "Land_PortableLight_single_F" createvehicle getpos _heli; 
_lamp attachTo [_heli,[0,5.6,-2.1]]; 
[_lamp,[100,0,180]] call server_fnc_setPitchBankYaw;
_lamp