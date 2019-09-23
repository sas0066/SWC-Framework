//Inicializovat dynamics group aka "U"
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

//První spawn hráče
private ["_infohrac","_infohracarr1","_infohracarr2","_msg","_zeusarr"];
_zeusarr = [Zeus1,Zeus2,Zeus3,Zeus4];
//Získat info o hráči
_infohrac = squadParams player;
_infohracarr1 = _infohrac select 0;
_infohracarr2 = _infohrac select 1;


if (player in _zeusarr) exitWith {
  _msg =  format ["Zeus %1 se právě připojil na server. Vítej!",name player, _infohracarr1 select 1];
  _msg = str _msg;
  [_msg, "systemChat", true] call BIS_fnc_MP;
};

//Synchronizace se serverem
waitUntil {alive player};
player enableSimulation false;
hint parseText "<t color='#e32525'>Čekám na sync serveru...</t> ";
sleep 8;
hint parseText "<t color='#00ff00'>Synchronizováno!</t> ";
sleep 2;
player enableSimulation true;

//Ujistit hráče, že vše funguje
hint parseText format ["<t align='center' size='2.0'>Saint Wenceslas Company</t><br />
Hráč: %1;Vítej na další misi. Good Luck&Have Fun!<br /> <br />
 _infohracarr2 select 1, _infohracarr1 select 1, _infohracarr1 select 5, _infohracarr1 select 4];

//Dát všem vědět, že se připojil další hráč
_msg =  format ["Hráč %1 se právě připojil na server. Vítej!",name player, _infohracarr1 select 1];
_msg = str _msg;
[_msg, "systemChat", true] call BIS_fnc_MP;

//Vyčistit obrazovku od hintu
sleep 20;
hintSilent "";
