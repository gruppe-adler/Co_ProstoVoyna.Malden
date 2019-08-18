/*
["Вот что командир Владивостока Михаил Цаплин. Его задача состоит в сохранении K-137 Красный Oktabr шедший пред абхазскому побережью свое и не может возникнуть сама по себе. Обеспечить при любых обстоятельствах, что ни абхазские силы не приближается подводную лодку. Успешная заявка маловероятно после наступления темноты, так что вам не терять время.",
"Hier spricht der Kommandant der Vladivostok, Mikhail Tsaplin. Ihr Auftrag ist es, die K-137 Krasny Oktabr zu sichern, die vor der abchasischen Küste auf Grund gelaufen ist und nicht aus eigener Kraft auftauchen kann. Stellen Sie unter allen Umständen sicher, dass sich keine abchasischen Kräfte dem U-Boot nähern. Ein erfolgreicher Einsatz wird nach Einbruch der Nacht sehr unwahrscheinlich, also verlieren Sie keine Zeit.",
"gui_message_carrier",
3100,3101] execVM "common\fx\translateArray.sqf";
*/



// sounds
_typeSounds = [
"typewriter_1",
"typewriter_2",
"typewriter_3",
"typewriter_4",
"typewriter_5",
"typewriter_6",
"typewriter_7",
"typewriter_8",
"typewriter_9"
];



_string_1 = _this select 0;
_string_2 = _this select 1;
_guivariable = _this select 2;
_control = _this select 3;
_status = _this select 4;

_array_1 = _string_1 splitString " ";
_array_2 = _string_2 splitString " ";

_array_1_length = count _array_1;
_array_2_length = count _array_2;

_empty_array = [];

cutRsc [_guivariable,"PLAIN"];

// fill empty array for incoming message
for [{_i=0}, {_i<_array_1_length}, {_i=_i+1}] do
{
	_empty_array = _empty_array + [""];
};


waitUntil {!isNull (uiNameSpace getVariable _guivariable)};
diag_log format ["debug: entering function translateArray"];
((uiNameSpace getVariable _guivariable) displayCtrl _control) ctrlSetStructuredText parseText (_empty_array joinString " ");
((uiNameSpace getVariable _guivariable) displayCtrl _status) ctrlSetStructuredText parseText "Nachrichtensystem lädt...";
sleep 1;
for [{_i=0}, {_i<_array_1_length}, {_i=_i+1}] do
	{
	//hintsilent format ["%1",_i];
	 _display = _empty_array joinString " ";
	 _empty_array set [_i, _array_1 select _i];
	 _result = _empty_array joinString " ";
	 // hintsilent format ["%1",_result];
	playSound (_typeSounds call BIS_fnc_selectRandom);
	 ((uiNameSpace getVariable _guivariable) displayCtrl _control) ctrlSetStructuredText parseText _result;
	 ((uiNameSpace getVariable _guivariable) displayCtrl _status) ctrlSetStructuredText parseText "Eingehende Nachricht...";
	// _control ctrlSetStructuredText _result;
	sleep (random 0.2 + 0.1);
};
((uiNameSpace getVariable _guivariable) displayCtrl _status) ctrlSetStructuredText parseText "Bereite Dechiffrierung vor...";
playSound "typewriter_break";
// check for difference between russian and german translation in string length
_difference = _array_1_length - _array_2_length;

// fill the smaller array with empty strings
switch (true) do {
	case (_difference > 0): {
		for [{_i=0}, {_i<_difference}, {_i=_i+1}] do
		{
		_array_2 = _array_2 + [""];
		};
	};

	case (_difference < 0): {
		for [{_i=_difference}, {_i < 0}, {_i=_i+1}] do
		{
		_array_1 = _array_1 + [""];
		};
	};
	default {};
};

_array_1_length = count _array_1;
_array_2_length = count _array_2;
sleep 4;
for [{_i=0}, {_i<_array_1_length}, {_i=_i+1}] do
	{
	//hintsilent format ["%1",_i];
	 _display = _array_1 joinString " ";
	 _array_1 set [_i, _array_2 select _i];
	 _result = _array_1 joinString " ";
	 // hintsilent format ["%1",_result];
	playSound (_typeSounds call BIS_fnc_selectRandom);
	 ((uiNameSpace getVariable _guivariable) displayCtrl _control) ctrlSetStructuredText parseText _result;
	 ((uiNameSpace getVariable _guivariable) displayCtrl _status) ctrlSetStructuredText parseText "Dechiffrierung läuft...";
	// _control ctrlSetStructuredText _result;
	sleep (random 0.2 + 0.1);
};
((uiNameSpace getVariable _guivariable) displayCtrl _status) ctrlSetStructuredText parseText "Dechiffrierung abgeschlossen.";
playSound "typewriter_return";
sleep 10;
0 cutText ["", "PLAIN"];