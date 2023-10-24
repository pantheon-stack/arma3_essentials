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

			// load view?

			waitUntil {
				sleep 1;
				_players = synchronizedObjects _logic;
				count _players > 0;
			};

			["registeredToWorld3DEN",[_logic]] spawn FUNC(moduleSetLives);
		};
	};

	case "registeredToWorld3DEN": {
		// todo considerar casos en que se sincronizan grupos
		_lives = _logic getVariable ["NumberOfLives", -1];
		_type = parseNumber (_logic getVariable ["Units", "0"]);

		private _players = [];
		if ( _type == 0 ) then {
			_players = synchronizedObjects _logic;
		} else {
			["Unit type %1 is not implemented yet on module %2",_type,typeof _logic] call bis_fnc_error;
		};

		if ( (count _players) > 0 ) then {
			{
				[ _lives, _x, true ] call FUNC(setLives);
			} forEach _players;
		} else {
			["No se ha seleccionado un jugador en el modulo %1",typeof _logic] call bis_fnc_error;
		};

		deleteVehicle _logic;
	};

};