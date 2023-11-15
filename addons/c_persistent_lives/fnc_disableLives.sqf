/*
  AUTHOR: Dikus

	- SERVER SIDE ONLY -

  [ player] call A3E_fnc_disableLives;
  [ ] call A3E_fnc_disableLives;

	Not implemented yet

*/
params [ [ "_player", objNull ] ];
private ["_all_players", "_headless_clients"];

if ( isServer ) then {

  waitUntil {
    sleep 1;
    missionNamespace getVariable ["a3e_lives_system_init", false];
  };

  if ( isNull _player ) then {
    _headless_clients = entities "HeadlessClient_F";
    _all_players = allPlayers - _headless_clients;
  } else {
    // Me aseguro que el jugador quede en un arreglo
    _all_players = [_player];
  };

  {
    _uid = "lives_" + (getPlayerUID _x);
    _default_total_lives = "TotalLives" call BIS_fnc_getParamValue;

    _player_lives_data = missionNamespace getVariable [ _uid, [ true, _default_total_lives ] ];
    _player_lives_data set [0, false];
    // It's modified by reference to do check if it is sent to all clients
    // missionNamespace setVariable [ _uid, _player_lives_data, true ];

  } forEach _all_players;

};
