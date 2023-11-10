#include "\z\a3e\addons\persistent_lives\script_component.hpp"

/*
  AUTHOR: Dikus

  [ player ] call A3E_fnc_hintLives;

*/
params [ [ "_player", player ] ];
private ["_uid", "_player_lives", "_remaining_lives", "_msg"];

if ( isServer && !local _player ) exitWith {
	remoteExec [QFUNC(hintLives), _player];
};

if (hasInterface && local _player) exitWith {
	_uid = "lives_" + (getPlayerUID _player);
    _player_lives = missionNamespace getVariable [ _uid, [false, 0] ];
	_remaining_lives = _player_lives select 1;
	_msg = str (formatText ["<t color='#ff0000' size='2'> Te quedan %1 vidas </t>", _remaining_lives]);

	cutText [ _msg, "PLAIN DOWN", -1, true, true ];
};
