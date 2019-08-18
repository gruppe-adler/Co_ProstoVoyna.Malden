class server {

	class artillery {
		file = server\functions\artillery;

		class fireArtilleryAt {};
		class flak {};

	};

    class cutscene_1 {
        file = server\functions\cutscene_1;
        
        class createAmphibious {};
        class createHelicopter {};
        class createHeliLight {};
        class createLHD_stage2 {};
        class createMusterUnits {};
        class createT50 {};
        class createUnitsAtHeli {};
        class musterUnits {};
        class musterUnitsSetOff {};
        class setPitchBankYaw {};
    };

    class fx {
		file = server\functions\fx;

		class createSmokeColumn {};
		class createSubmarineSmoke {};
		class destroySubmarine {};
		class fireAndSmoke {};
		class sinkShip {};
		class spawnBomb {};
		class splashUp {};

	};

	class intro {
		file = server\functions\intro;

		class createLHD_stage1 {};
		class initSpeech {};

	};
};