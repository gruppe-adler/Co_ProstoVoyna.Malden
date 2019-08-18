_t50Group = creategroup east;
_flyASL = 30;
"RHS_T50_vvs_generic" createUnit [[16874,303,_flyASL],_t50Group,"",0, "Private"];
"RHS_T50_vvs_generic" createUnit [[16874,343,_flyASL],_t50Group,"",0, "Private"];

_t50Group setCombatMode "BLUE";
_t50Group setBehaviour "CARELESS";

{ 
 _x disableAI "TARGET"; 
 _x disableAI "AUTOTARGET"; 
 _x setPilotLight true; 
 _x forceSpeed 1000;
} forEach units _t50Group;

_wp0 = _t50Group addWaypoint [[7300.44,757.492,_flyASL], 0];
_wp1 = _t50Group addWaypoint [[0,0,_flyASL], 1];

[_t50Group,_wp1] spawn {
	params ["_group", "_wp"];

	waitUntil {leader _group distance _wp < 500};

	{ deleteVehicle _x } forEach units _group;
};
