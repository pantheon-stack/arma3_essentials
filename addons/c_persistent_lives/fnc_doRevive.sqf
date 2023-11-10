#include "\z\a3e\addons\persistent_lives\script_component.hpp"
/*
  AUTHOR: Dikus

  [ player ] call A3E_fnc_doDie;

*/
params [ [ "_player", player ] ];
private [ "_uid", "_total_lives", "_remaining_lives" ];

if ( isServer && !(local _player)) exitWith {
  remoteExec [QFUNC(doRevive), _player];
};

if ( !local _player ) exitWith {
  false;
};

if (! (missionNamespace getVariable ["a3e_lives_system_init", false])) exitWith {
  false;
};

_uid = "lives_" + (getPlayerUID _player);
_total_lives = missionNamespace getVariable [ _uid, [false, 0] ];

"Should revive" call FUNC_INNER(main,debug);

// lives enabled?
if ( _total_lives select 0 ) then {
  _remaining_lives = _total_lives select 1;
  _is_dead = _player getVariable ["a3e_is_dead", true];
  if ( _remaining_lives <= 0 || _is_dead ) then {
    "Reviving!" call FUNC_INNER(main,debug);
    _player setVariable ["a3e_is_dead", false, true];
    _player allowDamage true;
    [_player] call a3e_main_fnc_moveToRespawn;
    [ _player, true ] remoteExec [ "enableSimulationGlobal", 2 ];
    [ _player, false ] remoteExec [ "hideObjectGlobal", 2 ];
    [ "Terminate", [ _player, [], true ] ] call BIS_fnc_EGSpectator;
    [_player] call FUNC(hintLives);
  };
};

true;