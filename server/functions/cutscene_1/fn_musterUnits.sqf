// [this,1,false,truck1,"mrk_target1"] execVM "server\musterUnits.sqf";

params ["_group", "_targetVehicle", "_targetMarker", "_wait"];


_groupVehicle = group _targetVehicle;
_targetPosition = getMarkerPos _targetMarker;

{[_x, false] call ACE_captives_fnc_setHandcuffed;sleep (random 0.1);} forEach units _group;

{_x switchMove "AmovPercMstpSlowWrflDnon_SaluteIn"; _x disableAI "anim";} forEach units _group;