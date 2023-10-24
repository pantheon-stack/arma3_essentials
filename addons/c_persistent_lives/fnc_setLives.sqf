#include "\z\a3e\addons\persistent_lives\script_component.hpp"

/*
  AUTHOR: Dikus

  Quita una vida al jugador local
  [ -1 ] call A3E_fnc_setLives;

  Quita 1 vida al jugador
  [ -1, player ] call A3E_fnc_setLives;

  Asigna 2 vidas al jugador
  [ 2, player, true ] call A3E_fnc_setLives;

	inicializa la cantidad de vidas para todo jugador

*/
params [ [ "_lives", 0 ], [ "_player", player ], [ "_force", false ] ];
private [ "_uid" ];

waitUntil {
  sleep 1;
  missionNamespace getVariable ["a3e_lives_system_init", false];
};

_uid = "lives_" + (getPlayerUID _player);
_player_lives = missionNamespace getVariable [ _uid, [false, 0] ];

_lives_enabled = _player_lives select 0;
_current_lives = _player_lives select 1;

if ( _force ) exitWith {
  if ( _lives < 0 ) then {
    _player_lives = [false, _current_lives];
  } else {
    _lives = _lives max 0;
    _player_lives = [true, _lives];
  };
  
  missionNamespace setVariable [ _uid, _player_lives, true ];

  [_player] call FUNC(hintLives);
};

if ( _lives_enabled ) exitWith {

  _remaining_lives = _current_lives + _lives;

  if ( _remaining_lives >= 0 ) then {
    _player_lives set [1, _remaining_lives];
  } else{
    _player_lives set [1, 0];
  };

  missionNamespace setVariable [ _uid, _player_lives, true ];
};
