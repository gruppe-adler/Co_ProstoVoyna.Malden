_submarine = _this select 0;
_marker = _this select 1;
_subbiePos = getpos _submarine;
_subbiePosSL = [getPos _submarine select 0, getPos _submarine select 1, 0];
_subbiePosSSL = [getPos _submarine select 0, getPos _submarine select 1, -30];

waitUntil {sleep 1; SUBXPLODE};
if (isMultiplayer) then {_submarine enableSimulationGlobal false;} else {_submarine enableSimulation false;};

[_subbiePos] remoteExec ["player_fnc_nuke", 2, false];

/*
for [{_i=0}, {_i<count subbie_detocharges}, {_i=_i+1}] do
{
     _ammo = _ammos call BIS_fnc_selectRandom;
     _ex = createVehicle [
                    "Bo_GBU12_LGB_MI10",
                    position (subbie_detocharges select _i),
                    [],
                    0,
                    "CAN_COLLIDE"
                ];
    _ex setVectorDirAndUp [[0,0,1],[0,-1,0]];
    _ex setVelocity [0,0,-1000];
    sleep random 0.01;
};
*/

_bigex = createVehicle ["Bo_GBU12_LGB_MI10",[position _submarine select 0, position _submarine select 1, -10], [], 0, "CAN_COLLIDE"];



stage1_surfacelight setDamage 1;
_bigex = createVehicle ["rhs_ammo_rgn_exp",[position _submarine select 0, position _submarine select 1, -10], [], 0, "CAN_COLLIDE"];



_bigex = createMine ["UnderwaterMine",[_subbiePosSL select 0, _subbiePosSL select 1, -10], [], 0];
_bigex setPosATL [getPosATL _bigex select 0,getPosATL _bigex select 1,(getPosATL _bigex select 2) - 2];
_bigex setdamage 1;
sleep 0.1;


_submarine setPosATL [getPos _submarine select 0, getPos _submarine select 1, -5];

// set exact yaw, pitch, and roll
_y = 151.657; _p = 0; _r = 25;
_submarine setVectorDirAndUp [
    [ sin _y * cos _p,cos _y * cos _p,sin _p],
    [ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D
];

0 = [[getPos _submarine select 0, getPos _submarine select 1, -30],"oil","large"] call server_fnc_createSubmarineSmoke;


for [{_i=0}, {_i<7}, {_i=_i+1}] do
{
	 _randP = [_subbiePos, [0,20],random 360,2] call SHK_pos;
 _ex = createVehicle [
        "rhs_ammo_3d17_shell_902B",
        _randP,
        [],
        0,
        "CAN_COLLIDE"
    ];
    _ex setVelocity [(random 10) - (random 20),(random 10) - (random 20),20];
    sleep 0.1;
};


for [{_i=0}, {_i<10}, {_i=_i+1}] do
{
 _ex = createVehicle [
        "rhs_ammo_rdg2_black",
        [getPos _submarine select 0, getPos _submarine select 1, -3],
        [],
        0,
        "CAN_COLLIDE"
    ];
    _ex setVelocity [(random 10) - (random 20),(random 10) - (random 20),20];
    sleep 0.1;
};

 for [{_i=0}, {_i<10}, {_i=_i+1}] do
{
 _randP = [_subbiePos, [0,10],random 360,2] call SHK_pos;

_fire     = "BigDestructionFire";
_brightness    = 1.0;
_color    = [1,0.85,0.6];
_ambient    = [1,0.85,0.6];
_intensity    = 3000;
_attenuation    = [0,0,0,1.6];


_eFire = "#particlesource" createVehicle [_randP select 0, _randP select 1, 1];
_eFire setParticleClass _fire;
//_eFire setPosATL _pos;
// _eFire attachto [_submarine];
 
_light = createVehicle ["#lightpoint", _randP, [], 0, "CAN_COLLIDE"];
//_light setPosATL _pos;
 
_light attachto [_submarine];
_light setLightBrightness _brightness;
_light setLightColor _color;
_light setLightAmbient _ambient;
_light setLightIntensity _intensity;
_light setLightAttenuation _attenuation;
_light setLightDayLight false;
_light setLightUseFlare true;
sleep 0.1;
};