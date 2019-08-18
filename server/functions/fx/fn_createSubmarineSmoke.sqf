/* A Handy-Dandy Smoke Column Generator
 * For all your smoke column generation needs!
 * Author: {C9}Jester
 * With special thanks to ColonelSandersLite for the templates found here: http://community.bistudio.com/wiki/ParticleTemplates
 * Questions? Problems? Find me in #cloud-9 on Gamesurge (irc.gamesurge.net:6667)
 *
 * ----------------------------------------------------------------------------------
 *
 * Parameters
 *
 * 0: (object) Object to attach the smoke column to
 * 1: (string) Type of smoke: "oil", "wood", "mixed" (optional; default mixed)
 * 2: (string) Size of column: "small", "medium", "large" (optional; default medium)
 *
 * Returns: true on success (but exits if there's errors)
 *
 * Side note: You should always pass an array, even if it's only one param
 *
 * ----------------------------------------------------------------------------------
 */


_position = _this select 0;
_positionSL = [_position select 0, _position select 1, 0];

_source1 = "#particlesource" createVehicle _position;

_source1 setParticleCircle [5, [1, 1, 1]];
_source1 setParticleRandom [5, [0.5, 0.5, 0], [0.2, 0.2, 0], 0, 0.25, [0.1, 0.1, 0, 0.1], 0, 0];
_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 1, 6], "", "Billboard", 1, 30, [0, 0, 0], [0, 0, 6.5], 0, 10, 7.9, 0.5, [7, 25, 40, 50], [[0.7, 0.1, 0.1, 0.7], [0.25, 0.25, 0.25, 0.2], [1, 1, 1, 0.3], [1, 1, 1, 0.05]], [0.125], 1, 0.1, "", "", ""];
_source1 setDropInterval 0.05;


_source2 = "#particlesource" createVehicle _positionSL;

_source2 setParticleCircle [0, [0, 0, 0]];
_source2 setParticleRandom [5, [0.5, 0.5, 0], [0.2, 0.2, 0], 0, 0.25, [0.1, 0.1, 0, 0.1], 0, 0];
_source2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 1, 6], "", "Billboard", 1, 4, [2, 2, 0], [0, 0, 6.5], 0, 10, 7.9, 0.5, [7, 25, 40, 50], [[0.7, 0.1, 0.1, 0.7], [0.25, 0.25, 0.25, 0.2], [1, 1, 1, 0.3], [1, 1, 1, 0.05]], [0.125], 1, 0.1, "", "", ""];
_source2 setDropInterval 0.05;





waitUntil {
sleep 1; MISSION_PROGRESS isEqualTo "STAGE_2"
};
deleteVehicle _source1;
deleteVehicle _source2;
	