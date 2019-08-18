/*

GORKA_RF
GORKA_MED
GORKA_AT
GORKA_MG
GORKA_TL
PILOT

*/

params ["_type"];

switch (_type) do {

	case "GORKA_RF": {
		player setUnitLoadout [["rhs_weap_ak74m_camo","rhs_acc_dtk","rhs_acc_2dpZenit","rhs_acc_1p63",
		["rhs_45Rnd_545X39_7N10_AK",45],[],""],[],["rhs_weap_makarov_pmm","","","",
		["rhs_mag_9x18_12_57N181S",12],[],""],["rhs_uniform_gorka_r_g",
		[["ACE_morphine",3],["ACE_epinephrine",1],["ACE_packingBandage",2],["ACE_elasticBandage",6],["ACE_EarPlugs",2],["ACE_Flashlight_KSF1",1],["ACE_CableTie",1],["ACE_quikclot",4],["ACE_bloodIV_500",1]]],["rhs_6b23_digi_vydra_3m",[["rhs_45Rnd_545X39_7N10_AK",3,45],["rhs_45Rnd_545X39_7N22_AK",2,45]]],
		["rhs_sidor",[["rhs_45Rnd_545X39_7U1_AK",2,45],["rhs_45Rnd_545X39_AK_Green",2,45],["rhs_45Rnd_545X39_7N22_AK",2,45],["Chemlight_red",2,1],["rhs_mag_rgd5",2,1],["ACE_HandFlare_Red",1,1],["rhs_mag_rdg2_white",2,1],["rhs_mag_rdg2_black",1,1],["rhs_mag_nspn_green",1,1]]],"rhs_6b28_green_bala","",
		["Laserdesignator_03","","","",["Laserbatteries",1],[],""],["","","tf_fadak_2","","ItemWatch",""]];
	};

	default {};

};