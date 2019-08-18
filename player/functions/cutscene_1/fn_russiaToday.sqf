
/*
	Original File: fn_AAN.sqf
	Author: Karel Moricky

	Description:
	It's showtime!

	Parameter(s):
	_this select 0: STRUCTURED TEXT: Header text
	! --> <t size='2.3'>text</t><br />subtext
	_this select 1: STRUCTURED TEXT: Bottom text (moving)

	Returns:
	Nothing
*/

params ["_headline", "_subline", "_camtarget"];
	
		
_camera = "camera" camCreate [5000,1000,250];
_camera camSetTarget _camtarget; // LHD_officer
_camera cameraEffect ["internal","back"];
_camera camSetFov 0.4;
_camera camCommit 0;

_camera camSetPos [4950,950,20];
_camera camSetFov 0.1;
_camera camCommit 30;

cutText ["", "BLACK IN", 1];

// hintSilent "triggered RT";

cutrsc ["rscRT","plain",0,true];

_filmgrain = ppEffectCreate ["FilmGrain",2000];  
_filmgrain ppEffectEnable true;  
_filmgrain ppEffectAdjust [0.3,0.3,0.12,0.12,0.12,true];  
_filmgrain ppEffectCommit 0;

_headline = _this select 0;
_subline = _this select 1;

disableserialization;

_display = uinamespace getvariable "GUI_RT";// = uinamespace getvariable "GUI_RT";




_textHeader = _display displayctrl 3001;
_textHeader ctrlsetstructuredtext _headline;//parsetext "<t size='2.3'>Military press conference</t><br />Col. Kane announces the end of the op. Arrowhead";
_textHeader ctrlcommit 0;

_textLine = _display displayctrl 3002;
_textLine ctrlsetstructuredtext _subline;//"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pulvinar euismod neque, eget malesuada lectus auctor sit amet. Maecenas ac est ipsum. Vestibulum in sapien turpis. Nunc ultricies, tellus ac lacinia consequat, mi massa sodales eros, vel semper justo enim non erat. Cras vitae urna et erat dapibus sagittis ac porttitor odio. Aliquam adipiscing malesuada libero, vitae suscipit mi interdum at. Vivamus sapien metus, ultricies quis ultricies ultrices, venenatis nec orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In egestas congue malesuada. Vestibulum gravida ligula volutpat ipsum auctor vulputate. ";
_textLine ctrlcommit 0;
_textLinePos = ctrlposition _textLine;
_textLinePos set [0,-100];
_textLine ctrlSetPosition _textLinePos;
_textLine ctrlcommit 1500;

_textClock = _display displayctrl 3003;
[_display,_textClock] spawn {
	while {!isnull (_this select 0)} do {

		(_this select 1) ctrlsettext ([daytime,"HH:MM"] call bis_fnc_timetostring);
		(_this select 1) ctrlcommit 0;
		sleep 60;
	};
};
sleep 20;




_camera camSetPos (getPos player);
_camera camSetFov 0.7;
_camera camCommit 30;
sleep 30;



cutText ["", "PLAIN"];

_filmgrain ppEffectEnable false;   
ppEffectDestroy _filmgrain; 

_camera cameraEffect ["terminate","back"];
camDestroy _camera;