
STHud_UIMode = 0;
diwako_dui_main_toggled_off = true;
// camera stuff is async
[] spawn {
	
	_filmgrain = ppEffectCreate ["FilmGrain",2000];  
	_filmgrain ppEffectEnable true;  
	_filmgrain ppEffectAdjust [0.3,0.3,0.12,0.12,0.12,true];  
	_filmgrain ppEffectCommit 0;

	_lhdPosition = [
		(getMarkerPos "mrk_stage1_LZ_6" select 0), 
		(getMarkerPos "mrk_stage1_LZ_6" select 1),
		27
	];

	_camera = "camera" camCreate [20000,-600,20]; // [20541,-839,20]; // [14802, 1820, 27];
	_camera camSetTarget _lhdPosition;
	_camera cameraEffect ["internal","back"];
	_camera camSetFov 0.4;
	_camera camCommit 0;

	_camera camSetPos _lhdPosition;
	_camera camSetFov 0.2;
	_camera camCommit 55;

	sleep 50;
	_camera camSetTarget player;
	_camera camCommit 3;
	sleep 1;
	_camera camSetPos (getPos player);
	_camera camCommit 3;
	sleep 2;
	cutText ["", "BLACK OUT", 1];
	sleep 1;
	_filmgrain ppEffectEnable false;   
	ppEffectDestroy _filmgrain; 
	_camera cameraEffect ["terminate","back"];
	camDestroy _camera;
	sleep 0.5;
	cutText ["", "BLACK IN", 1];
	STHud_UIMode = 1;
};
cutText ["","BLACK FADED",999];
sleep 3;
cutText ["", "BLACK IN", 10];


playSound "arkona_zimushka";


[
	[
		["O R E L   A T A K A","<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t align = 'center' shadow = '0' size = '1.5' font='EtelkaNarrowMediumPro'>%1</t><br/><br/>",25],
		["nomisum für Gruppe Adler","<t align = 'right' color='#80ffffff' shadow = '0' size = '0.5'>%1</t>",50]
	]
] spawn BIS_fnc_typeText;


sleep 38;
[
	[
		["Hubschrauberträger","<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t align = 'center' shadow = '0' size = '0.7' font='EtelkaNarrowMediumPro'>%1</t><br/>",1],
		["W L A D I W O S T O K","<t align = 'center' shadow = '0' size = '0.7'>%1</t>",40]
	]
] spawn BIS_fnc_typeText;

sleep 4;

INTRO_DONE = true;
publicVariable "INTRO_DONE";

diwako_dui_main_toggled_off = false;