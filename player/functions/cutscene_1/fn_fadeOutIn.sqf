player allowDamage false;
1 fadeSound 0;
cutText ["", "BLACK OUT", 1];
hintSilent "";
sleep 1;

player allowDamage false;
player setPosASL [5000,846,18];
player allowDamage true;
player setDir 0;


[
	[
		["G E O R G I S C H E  K Ü S T E","<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t align = 'center' shadow = '0' size = '1.5' font='EtelkaNarrowMediumPro'>%1</t><br/>",25],
		["Wenige Tage später","<t color = '#80ffffff' align = 'center' shadow = '0' size = '0.7'>%1</t>",50]
	]
] spawn BIS_fnc_typeText;

sleep 5;
sleep 0.5;
1 fadeSound 1;

[
parseText "<t size='2.3'>Russische Truppen bereiten Invasion Georgiens vor.</t><br /> Putin nennt Vorgehen legitime Vergeltung nach heimtückischer Attacke auf U-Boot.",
parseText "Amerikaner warnen beide Seiten vor Eskalation des Konflikts. 
+++ Deutscher Außenminister nennt Entwicklung 'beunruhigend'. 
+++ Verteidigungsminister Breschnow: 'Wir sind vorbereitet.' 
+++ DAX sackt auf 12.000 Punkte.
+++ Georgischer Premierminister dementiert Sprengung von K-137 und bittet NATO um Unterstützung.
+++ Amerikaner warnen beide Seiten vor Eskalation des Konflikts.
+++ Deutscher Außenminister nennt Entwicklung 'beunruhigend.
+++ Verteidigungsminister Breschnow: 'Wir sind vorbereitet.' 
+++ DAX sackt auf 12.000 Punkte.
+++ Georgischer Premierminister dementiert Sprengung von K-137 und bittet NATO um Unterstützung.
",LHD_officer] call player_fnc_russiaToday;