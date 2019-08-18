waitUntil { sleep 3; INTRO_DONE }; // till first player exits intro

/* necessary variables :

SUBMARINE_FOUND
SUBMARINE_SECURE
SUBMARINE_DIVEN
BOMB_PLANTED
EXFIL_S1
*/

sleep 10;

[["Вот что командир Владивостока Михаил Цаплин. Его задача состоит в сохранении K-137 Красный Oktabr шедший пред абхазскому побережью свое и не может возникнуть сама по себе. Обеспечить при любых обстоятельствах, что ни абхазские силы не приближается подводную лодку. Успешная заявка маловероятно после наступления темноты, так что вам не терять время.",
"Hier spricht der Kommandant der Vladivostok, Mikhail Tsaplin. Ihr Auftrag ist es, die K-137 Krasny Oktabr zu sichern, die vor der abchasischen Küste auf Grund gelaufen ist und nicht aus eigener Kraft auftauchen kann. Stellen Sie unter allen Umständen sicher, dass sich keine abchasischen Kräfte dem U-Boot nähern. Ein erfolgreicher Einsatz wird nach Einbruch der Nacht sehr unwahrscheinlich, also verlieren Sie keine Zeit.",
"gui_message_carrier",
3100,3101],"common\fx\translateArray.sqf"] remoteExec ["BIS_fnc_execVM",2,false];

sleep 10;

_search = call EC_tasks_fnc_s1_search;


/* condition: trigger near submarine */
waitUntil { sleep 3; SUBMARINE_FOUND };
[_search,"SUCCEEDED",true] call BIS_fnc_taskSetState;
sleep 5;


/* condition: enemy boat sunk */
_secure = call EC_tasks_fnc_s1_secure;
waitUntil { sleep 3; SUBMARINE_SECURE };
[_secure,"SUCCEEDED",true] call BIS_fnc_taskSetState;
sleep 5;


/* condition: person very close to submarine */
_dive = call EC_tasks_fnc_s1_dive;
waitUntil { sleep 3; SUBMARINE_DIVEN };
[_dive,"SUCCEEDED",true] call BIS_fnc_taskSetState;


/* condition: bomb planted */
_detonate = call EC_tasks_fnc_s1_detonate;
_wait = call EC_tasks_fnc_s1_wait;
waitUntil { sleep 3; BOMB_PLANTED };
[_wait,"CANCELED",true] call BIS_fnc_taskSetState;
[_detonate,"SUCCEEDED",true] call BIS_fnc_taskSetState;


/* condition: exfil s1 trigger */
_exfil = call EC_tasks_fnc_s1_exfil;
waitUntil { sleep 3; EXFIL_S1 };
[_exfil,"SUCCEEDED",true] call BIS_fnc_taskSetState;