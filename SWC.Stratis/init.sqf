//Nastavit všechny hráče bez hlasu a vypnout arty comp.
enableSaving [false, false];
enableSentences true;
enableRadio true;
enableEngineArtillery false;
{_x disableConversation true} forEach playableUnits;
{_x setSpeaker "ace_novoice"} forEach playableUnits;



//CBA funkce
["hint", {
    [[(_this select 0)], "hint", true] call BIS_fnc_MP;
}, "admin"] call CBA_fnc_registerChatCommand;

