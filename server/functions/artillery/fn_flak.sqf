//Maximum distance target can be for flak to activate
_maxDistance = 4000;

//When Flak Tigris has less than this ammo count (total ammo 680) it will spawn flak.  IE value 678 will spawn one flak per three shots.
_ammoCountForFlak = 678;

//Linear Dispersion when speed is zero, dispersion added is zero.  When speed is 100 km/h, dispersion will equal this variable
_speedDispersion = 20;

//Linear Dispersion when distance is zero, dispersion added is zero.  When distance is 500m, dispersion will equal this variable
_distanceDispersion = 10;

//Height target must be for flak to activate (IE target can fly "under the radar")
_targetMinHeight = 70;


//END Editable variables

params ["_unit"];

if (_unit ammo "autocannon_35mm" < _ammoCountForFlak) then {
	(_unit) setAmmo ["autocannon_35mm", 680];
	_tarPos = [];
	_target = 0;
	if (isPlayer (assignedGunner _unit)) then {
		_target = cursorTarget;
		if (_unit distance _target < _maxDistance) then {
			_tarPos = getPos _target;
		};
	} else {
		_possTar = _unit nearTargets _maxDistance;
		if ((count _possTar) > 0) then {
			_threat = 0;
			{
				if (_x select 3 > _threat) then {
					_threat = _x select 3;
					_target = _x select 4;
					_tarPos = getPos _target;
				};
			} forEach _possTar;
			_unit fireAtTarget [_target];
		};
	};
	if ((count _tarPos) > 0) then {
		_tarX = _tarPos select 0;
		_tarY = _tarPos select 1;
		_tarZ = _tarPos select 2;
		if (_tarZ > _targetMinHeight) then {
			_flakDis = ((speed _target) * (_speedDispersion / 100)) + ((_unit distance _target) * (_distanceDispersion / 500));
			_disX = (random (_flakDis * 2)) - _flakDis;
			_disY = (random (_flakDis * 2)) - _flakDis;
			_disZ = (random (_flakDis * 2)) - _flakDis;
			_flak = "SmallSecondary" createVehicle [_tarX + _disX, _tarY + _disY, _tarZ + _disZ];
		};
	};
};