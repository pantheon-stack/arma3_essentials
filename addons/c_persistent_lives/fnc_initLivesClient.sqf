#include "\z\a3e\addons\persistent_lives\script_component.hpp"

/*
  AUTHOR: Dikus

	- CLIENT SIDE ONLY -
*/

params [ [ "_player", objNull ], ["_default_total_lives", objNull] ];
private ["_total_lives", "_all_players", "_headless_clients", "_players_total_lives"];

_is_enabled = missionNamespace getVariable ["a3e_persistent_lives_enabled", false];
_has_init = missionNamespace getVariable ["a3e_lives_system_client_init", false];

if ( !_is_enabled || _has_init ) exitWith {
  false;
};

// To avoid running twice
missionNamespace setVariable ["a3e_lives_system_client_init", true];

if (hasInterface && local player) then {
  [] spawn {

    waitUntil {
      sleep 1;
      _server_init = missionNamespace getVariable ["a3e_lives_system_init", false];
      !isNil { player } && _server_init;
    };

    _uid = "lives_" + (getPlayerUID player);
    _player_lives = missionNamespace getVariable [ _uid, [false, 0] ];

    if ( _player_lives select 0 ) then {
      _remaining_lives = _player_lives select 1;
      if ( _remaining_lives > 0 ) then {
        [player] call FUNC(hintLives);
      } else {
        call FUNC(doDie);
      };
    };

    player addMPEventHandler ["MPKilled", {
      params ["_unit", "_killer", "_instigator", "_useEffects"];

      [ -1, _unit ] call FUNC(setLives);
    }];

    player addMPEventHandler ["MPRespawn", {
      params ["_unit", "_corpse"];

      format ["Running MPRespawn %1 (Local %2), %3", _unit, local _unit, _corpse] call FUNC_INNER(main,debug);

      if ( local _unit ) then {
        _uid = "lives_" + (getPlayerUID _unit);
        _player_lives = missionNamespace getVariable [ _uid, [false, 0] ];

        if ( _player_lives select 0 ) then {
          _remaining_lives = _player_lives select 1;
          if ( _remaining_lives > 0 ) then {
            if (_unit getVariable ["a3e_is_dead", false]) then {
              _unit allowDamage true;
              _unit enableSimulation true;
              [ _unit, false ] remoteExec [ "hideObjectGlobal", 2 ];
              [ "Terminate", [ _unit, [], true ] ] call BIS_fnc_EGSpectator;
              _unit setVariable ["a3e_is_dead", false, true];
            };
            [_unit] call FUNC(hintLives);
          } else {
            call FUNC(doDie);
          };
        };
      };
    }];
  };

};

 true;