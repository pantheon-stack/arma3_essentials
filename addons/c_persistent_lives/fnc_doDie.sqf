/*
  AUTHOR: Dikus

  [ player ] call A3E_fnc_doDie;

*/
params [ [ "_player", player ] ];
private [ "_uid", "_total_lives", "_remaining_lives" ];

if (not local _player) exitWith {
  false;
};

waitUntil {
  sleep 1;
  missionNamespace getVariable ["a3e_lives_system_init", false];
};

_uid = "lives_" + (getPlayerUID _player);
_total_lives = missionNamespace getVariable [ _uid, [false, 0] ];

// lives enabled?
if ( _total_lives select 0 ) then {
  _remaining_lives = _total_lives select 1;
  if ( _remaining_lives <= 0 ) then {
    if (hasInterface) then {
      // is a player!
      // TO DO localize
      cutText [ "<t color='#ff0000' size='2'> Has muerto! </t>", "PLAIN DOWN", -1, true, true ];
    };
    // revisit this functions
    _player setVariable ["a3e_is_dead", true, true];
    _player allowDamage false;
    _player setPos (getMarkerPos "respawn");
    [ _player, false ] remoteExec [ "enableSimulationGlobal", 2 ];
    [ _player, true ] remoteExec [ "hideObjectGlobal", 2 ];
    [ "Initialize", [ _player, [], true ] ] call BIS_fnc_EGSpectator;
  };
};

true;