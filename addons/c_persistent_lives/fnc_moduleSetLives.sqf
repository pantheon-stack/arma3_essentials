#include "\z\a3e\addons\persistent_lives\script_component.hpp"

_mode = _this select 0;
_params = _this select 1;
_logic = _params select 0;

switch (_mode) do {
	case "init": {
		_activated = _params select 1;
		_isCuratorPlaced = _params select 2;

		//--- Local to curator who placed the module
		if (_isCuratorPlaced && {local _x} count (objectcurators _logic) > 0) then {
			//--- Reveal the circle to curators
			_logic hideobject false;
			_logic setpos position _logic;
		};

		//--- Terminate on client, all effects are handled by server
		if !(isserver) exitwith {};

		//--- Call effects (not in 3DEN, "registeredToWorld3DEN" handler is called automatically)
		if (_activated && !is3DEN) then {

			waitUntil {
				sleep 1;
				_variable_player = !isNull (_logic getVariable ["Player", objNull]);
				_sync_players = count (synchronizedObjects _logic) > 0;
				_variable_player || _sync_players;
			};

			["registeredToWorld3DEN",[_logic]] spawn FUNC(moduleSetLives);
		};
	};

	case "registeredToWorld3DEN": {
		// todo considerar casos en que se sincronizan grupos
		_lives = _logic getVariable ["NumberOfLives", -1];
		_player = _logic getVariable ["Player", objNull];
		_type = parseNumber (_logic getVariable ["Units", "0"]);

		private _players = [];

		if ( _type != 0 && isNull _player ) exitWith {
			["Unit type %1 is not implemented yet on module %2",_type,typeof _logic] call bis_fnc_error;
		};

		if ( _type == 0 && isNull _player ) then {
			_players = synchronizedObjects _logic;
		};

		if ( !isNull _player ) then {
			_players = [_player];
		};

		if ( (count _players) > 0 ) then {
			{
				// [ _lives, _x, true ] call QFUNC(setLives);
				[ [ _lives, _x, true ] ] remoteExec [QFUNC(setLives), _x];
			} forEach _players;
		} else {
			["No se ha seleccionado un jugador en el modulo %1",typeof _logic] call bis_fnc_error;
		};

		deleteVehicle _logic;
	};

};