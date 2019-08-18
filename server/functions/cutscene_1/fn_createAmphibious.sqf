btr_group = creategroup east;
"rhs_btr70_vdv" createUnit [[5110.28,768.065,0],btr_group,"",0, "Private"];
"rhs_btr70_vdv" createUnit [[5110.28,738.065,0],btr_group,"",0, "Private"];
"rhs_btr60_vdv" createUnit [[5110.28,708.065,0],btr_group,"",0, "Private"];
"rhs_btr60_vdv" createUnit [[5110.28,678.065,0],btr_group,"",0, "Private"];
"rhs_btr60_vdv" createUnit [[5110.28,658.065,0],btr_group,"",0, "Private"];

btr_group setCombatMode "BLUE";
btr_group setBehaviour "CARELESS";

{
	_x enableDynamicSimulation true; 
} forEach units btr_group;

_wp = btr_group addWaypoint [[5285.53,2342.51,0], 0];