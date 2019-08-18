/*---------------------------------------------------------------------------
BEGIN SUBMARINE STUFF
---------------------------------------------------------------------------*/

call compile preprocessfile "common\SHK_pos\shk_pos_init.sqf";

STAGE_1_MSG_1 = false;
STAGE_1_MSG_2 = false;
STAGE_1_MSG_3 = false;
STAGE_1_MSG_4 = false;


_opfor_submarine_pos = getPos opfor_submarine;
SUBXPLODE = false;
0 = [opfor_submarine, "mrk_submarine_debris"] call server_fnc_destroySubmarine;

for [{_i=0}, {_i<400}, {_i=_i+1}] do
{
	_randP = [_opfor_submarine_pos, [0,100],random 360,2] call SHK_pos;
	//diag_log format ["position for plant is %1", _randP];
	_plant = createVehicle ["CUP_A2_p_phragmites_summer", _randP, [], 0, "CAN_COLLIDE"];
	_plant enableSimulationGlobal false;
};
for [{_i=0}, {_i<200}, {_i=_i+1}] do
{
	_randP = [_opfor_submarine_pos, [0,100],random 360,2] call SHK_pos;
	//diag_log format ["position for plant is %1", _randP];
	_plant = createVehicle ["CUP_A1_clutter_grass_long", _randP, [], 0, "CAN_COLLIDE"];
	_plant enableSimulationGlobal false;
};

_opfor_submarine_bubble = [(_opfor_submarine_pos select 0) + 1 , (_opfor_submarine_pos select 1) + 1 , 0];
[_opfor_submarine_bubble] spawn {
	for [{_i=0}, {_i<8}, {_i=_i+1}] do
	{
	_bubbles = createVehicle ["test_EmptyObjectForBubbles", _this select 0, [], 0, "CAN_COLLIDE"];
	sleep random 1;
	};
};


subbie_detocharges = [
explo_charge,
explo_charge_2,
explo_charge_3,
explo_charge_4,
explo_charge_5,
explo_charge_6,
explo_charge_7,
explo_charge_8,
explo_charge_9
];

subbie_detocharges_inside = [
explo_charge_inside,
explo_charge_inside_2,
explo_charge_inside_3,
explo_charge_inside_4,
explo_charge_inside_5
];





if (!isDedicated) then {
	_plankton = "#particlesource" createVehicleLocal (position player);
	_plankton setParticleClass "PlanktonEffect";
	_plankton attachto [opfor_submarine,[0,2,1.3]];
};

trawler_sdv attachTo [trawler,[-4,-8,0]];
trawler_sdv allowDamage false;
trawler_sdv enableSimulationGlobal false;

buoy_1 attachTo [trawler,[0,-10,0]];
buoy_2 attachTo [trawler,[0,-19,-4]];
buoy_2 setVectorDirAndUp [[0,-0.5,0.5],[0,0.5,0.5]];

trawler addEventHandler ["killed", {_null = [_this select 0, "LEFT BACK", 120] call server_fnc_sinkShip;

}];

 gamelogic action ["lightOn",  SDV_empty];

 /*---------------------------------------------------------------------------
 END SUBMARINE STUFF
 ---------------------------------------------------------------------------*/


// declare global public variables for use in triggers

AA_FIRED = false;