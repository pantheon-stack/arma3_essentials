#include "\z\a3e\addons\persistent_lives\script_component.hpp"

/*
  AUTHOR: Dikus

	- SERVER SIDE ONLY -
  
  Initialize lives system to all playable units in the server.

  lives contains 2 variables, the first one if the lives system is enabled and the second one the number of lives

*/
params [ [ "_player", objNull ], ["_default_total_lives", objNull] ];
private ["_total_lives", "_all_players", "_headless_clients", "_players_total_lives"];

_is_enabled = missionNamespace getVariable ["a3e_persistent_lives_enabled", false];
if ( !_is_enabled || !isServer ) exitWith {
  false;
};

if ( isNull _default_total_lives ) then {
  _default_total_lives = round ( missionNamespace getVariable ["a3e_persistent_lives_quantity", 3] );
};

if ( isNull _player ) then {
  _headless_clients = entities "HeadlessClient_F";
  _all_players = allPlayers - _headless_clients;
  "initializing lives in all players" call FUNC_INNER(main,debug);
} else {
  // Me aseguro que el jugador quede en un arreglo
  _all_players = [_player];
  format ["initializing lives in %1",_player] call FUNC_INNER(main,debug);
};

{
  _uid = "lives_" + (getPlayerUID _x);
  _player_lives = missionNamespace getVariable [ _uid, [true, _default_total_lives] ];
  _players_total_lives = _player_lives select 1;

  [format [
    "Lives %1 = %2",
    _uid,
    _player_lives
  ]] call FUNC_INNER(main,debug);

  if ( _players_total_lives > _default_total_lives ) then {
    _player_lives set [1, _default_total_lives];
  };

  // [ true, _players_total_lives ] => [lives_enabled, total_lives]
  missionNamespace setVariable [ _uid, _player_lives, true ];

  remoteExec [QFUNC(initLivesClient), _x];

} forEach _all_players;

missionNamespace setVariable ["a3e_lives_system_init", true, true];

true;