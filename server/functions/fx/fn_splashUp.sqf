_position = _this select 0;

_splashUp = "#particlesource" createVehicle _position;
_splashCircle = "#particlesource" createVehicle _position;

/*
	_splashDebris = "#particlesource" createVehicle _position;

	_splashDebris setParticleCircle [0, [1, 1, 1]];
	_splashDebris setParticleRandom [0, [0.25, 0.25, 0], [0.175, 30, 30], 0, 1, [0, 0, 0, 0.1], 0, 0];
	_splashDebris setParticleParams [["\ca\misc\kusplechu3", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 100], 0, 10, -100, 0.075, [15, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", ""];
	_splashDebris setDropInterval 0.01;
	sleep 0.2;

	deleteVehicle _splashDebris;
*/
_splashUp setParticleCircle [0, [0, 0, 0]];
_splashUp setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_splashUp setParticleParams [["\A3\data_f\Cl_water", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, -3], [0, 0, 90], 0, 1, -10, 0, [15, 10, 2, 1, 2, 5], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0.1]], [0.1, 0.1, 0.05, 0.1, 0.1, 0.1], 1, 0, "", "", ""];
_splashUp setDropInterval 0.01;

_splashCircle setParticleCircle [5, [20, 20, 20]];
_splashCircle setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_splashCircle setParticleParams [["\A3\data_f\Cl_water", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, -3], [10, 10, 0], 0, 1, -10, 0, [15, 10, 2, 1, 2, 5], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0.1]], [0.1, 0.1, 0.05, 0.1, 0.1, 0.1], 1, 0, "", "", ""];
_splashCircle setDropInterval 0.01;

sleep 0.5;
deleteVehicle _splashUp;
deleteVehicle _splashCircle;