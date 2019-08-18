_bomb = _this select 0;
_submarine = _this select 1;

[_bomb,_submarine] spawn {

	sleep random 1;

	ORANGE_ACTIVE = false;
	RED_ACTIVE = false;
	EXPLODE = false;

	_colorDark = [0,0,0];

	_colorGreen = [0.3, 0.8, 0.3];
	_colorGreenDelay = 3;
	_colorGreenDuration = 0.3;

	_colorOrange = [0.8, 0.8, 0.3];
	_colorOrangeDelay = 1.5;
	_colorOrangeDuration = 0.3;

	_colorRed = [0.8, 0.3, 0.3];
	_colorRedDelay = 0.3;
	_colorRedDuration = 0.3;

	_light = "#lightpoint" createVehicleLocal position (_this select 0);
	_light setLightBrightness 1.5;
	_light setLightAmbient [0.0, 0.0, 0.0];
	
	_light lightAttachObject [(_this select 0), [0,0,-0.5]];
	_light setLightUseFlare true,
	_light setLightFlareSize 1.5;
	_light setLightFlareMaxDistance 25;
	_light setLightColor _colorGreen;

	while {true} do {
		
		_light setLightColor _colorDark;
		sleep _colorGreenDelay;
		_light setLightColor _colorGreen;
		sleep _colorGreenDuration;
		
		if (!alive (_this select 1)) exitWith {_light setLightUseFlare false; _light setLightBrightness 0; deleteVehicle _light;};
		if (ORANGE_ACTIVE) exitWith {};
	};

	if (!alive (_this select 1)) exitWith {};
	while {true} do {
		
		_light setLightColor _colorDark;
		sleep _colorOrangeDelay;
		_light setLightColor _colorOrange;
		sleep _colorOrangeDuration;
		
		if (!alive (_this select 1)) exitWith {_light setLightUseFlare false; _light setLightBrightness 0;  deleteVehicle _light;};
		if (RED_ACTIVE) exitWith {};
	};

	if (!alive (_this select 1)) exitWith {};
	while {true} do {
		
		_light setLightColor _colorDark;
		sleep _colorRedDelay;
		_light setLightColor _colorRed;
		sleep _colorRedDuration;
		if (!alive (_this select 1)) exitWith {_light setLightUseFlare false; _light setLightBrightness 0;  deleteVehicle _light;};
		if (EXPLODE) exitWith {};
	};
	
	
	

};