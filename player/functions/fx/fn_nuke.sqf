//////////////////////////////////////////////////////////////
// MADE BY MOERDERHOSCHI
// EDITED VERSION OF THE ARMA2 ORIGINAL SCRIPT
// ARMED-ASSAULT.DE
// 06.11.2013
//////////////////////////////////////////////////////////////

//*******************************************************************
/*
_Cone = "#particlesource" createVehicleLocal _pos;
_Cone setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48], "", "Billboard", 1, 10, [0, 0, 0],
				[0, 0, 0], 0, 1.275, 1, 0, [40,80], [[0.25, 0.25, 0.25, 0], [0.25, 0.25, 0.25, 0.5], 
				[0.25, 0.25, 0.25, 0.5], [0.25, 0.25, 0.25, 0.05], [0.25, 0.25, 0.25, 0]], [0.25], 0.1, 1, "", "", _pos];
_Cone setParticleRandom [2, [1, 1, 30], [1, 1, 30], 0, 0, [0, 0, 0, 0.1], 0, 0];
_Cone setParticleCircle [10, [-10, -10, 20]];
_Cone setDropInterval 0.005;

_top = "#particlesource" createVehicleLocal _pos;
_top setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 3, 48, 0], "", "Billboard", 1, 20, [0, 0, 0],
				[0, 0, 60], 0, 1.7, 1, 0, [60,80,100], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", _pos];
_top setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_top setDropInterval 0.002;

_top2 = "#particlesource" createVehicleLocal _pos;
_top2 setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 3, 112, 0], "", "Billboard", 1, 20, [0, 0, 0],
				[0, 0, 60], 0, 1.7, 1, 0, [60,80,100], [[1, 1, 1, 0.5],[1, 1, 1, 0]], [0.07], 1, 1, "", "", _pos];
_top2 setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_top2 setDropInterval 0.002;
*/

params ["_pos"];

/*
_helper = "Land_PenBlack_F" createVehicleLocal _pos;
_helper enableSimulation false;

waterring = "#particlesource" createVehicleLocal _pos;
waterring setParticleClass "impactEffectsSea";
waterring attachTo [_helper,[0,0,0]];

*/

_warhead = "RHS_9M79_1_F" createVehicleLocal _pos;
_warhead setDamage 1;



/* initial fountain*/
_fountain = "#particlesource" createVehicleLocal _pos;
_fountain setParticleParams [["\A3\data_f\cl_water.p3d", 1, 0, 1], "", "Billboard", 1, 25, [0, 0, 0],
				[0, 0, 40], 0, 160, 1, 0, [40,70,120], 
				[[1, 1, 1, 0.4],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.5], [1, 1, 1, 0]]
				, [0.5, 0.1], 1, 1, "", "", _pos];
_fountain setParticleRandom [0, [10, 10, 15], [15, 15, 15], 1, 0, [0, 0, 0, 0], 0, 0, 360];
_fountain setDropInterval 0.002;

/* shockwave */
_shockwave = "#particlesource" createVehicleLocal _pos;
_shockwave setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract", 1,0,1], "", "Billboard", 1, 10, [0, 0, 0], 
[0, 0, 0], 
0, 10, 7.9, 0.01, [50, 50, 50], 
[[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], 
[0.125], 1, 0, "", "", ""];
/*_shockwave setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard", 1, 20, [0, 0, 0],
				[0, 0, 0], 0, 1.5, 1, 0, [50, 100], [[0.1, 0.1, 0.1, 0.5], 
				[0.5, 0.5, 0.5, 0.5], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [1,0.5], 0.1, 1, "", "", _pos];
*/
_shockwave setParticleRandom [2, [20, 20, 20], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 360];
_shockwave setParticleCircle [50, [-80, -80, 2.5]];
_shockwave setDropInterval 0.0002;


/* small particles */
_particles = "#particlesource" createVehicleLocal _pos;
_particles setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 2, 1], "", "Billboard", 1, 25, [0, 0, 0],
				[0, 0, 80], 0, 160, 1, 0, [1,2], 
				[[1, 0.7, 0.7, 1],[1, 0.7, 0.7, 1]]
				, [1.5, 1.5], 1, 1, "", "", _this, 0, false];
_particles setParticleRandom [0, [10, 10, 15], [30, 30, 30], 1, 1, [0, 0, 0, 0], 0, 0, 360];
_particles setDropInterval 0.002;

/* dark fountain*/
_darkSmoke = "#particlesource" createVehicleLocal _pos;
_darkSmoke setParticleParams [["\A3\data_f\cl_water.p3d", 1, 0, 1], "", "Billboard", 1, 25, [0, 0, 0],
				[0, 0, 80], 0, 160, 1, 0, [40,70,120], 
				[[0, 0, 0, 0.4],[0, 0, 0, 0.7],[0, 0, 0, 0.7],[0, 0, 0, 0.7],[0, 0, 0, 0.7],[0, 0, 0, 0.7],[0, 0, 0, 0.5], [1, 1, 1, 0]]
				, [0.5, 0.1], 1, 1, "", "", _pos];
_darkSmoke setParticleRandom [0, [10, 10, 15], [15, 15, 15], 1, 0, [0, 0, 0, 0], 0, 0, 360];
_darkSmoke setDropInterval 0.002;

sleep 0.1;
_warhead2 = "RHS_9M79_1_F" createVehicleLocal _pos;
_warhead2 setDamage 1;

deleteVehicle _shockwave;

sleep 1;
addCamShake [10, 1, 25];
sleep 3;

deleteVehicle _particles;
deleteVehicle _darkSmoke;
/* big particles for gischt */
_fountain setParticleParams [["\A3\data_f\cl_water.p3d", 1, 0, 1], "", "Billboard", 1, 20, [0, 0, 0],
				[0, 0, 1], 0, 2, 1, 0, [70,90,120], 
				[[1, 1, 1, 0],[1, 1, 1, 0.05],[1, 1, 1, 0.1],[1, 1, 1, 0.1],[1, 1, 1, 0.1],[1, 1, 1, 0.1],[1, 1, 1, 0.05],[1, 1, 1, 0]]
				, [0.5, 0.1], 1, 1, "", "", _pos];
_fountain setDropInterval 0.01;

sleep 15;

_fountain setDropInterval 0.05;

sleep 15;

_fountain setDropInterval 0.1;

sleep 15;



deleteVehicle _fountain;
