#include "\z\a3e\addons\main\script_component.hpp"
/*
  AUTHOR: Dikus

  Parameter(s):
		0: OBJECT
		1:
			STRING - Move to marker position. Marker size will be used for random placement area and marker direction for unit direction
			OBJECT - Unit, Group or Vehicle. Move to the object position or inside an object if the object is a vehicle, or if group or unit 
				is in vehicle and there is an empty seat
			ARRAY - Move to precise [x,y,z] position AGL. [x,y] array will be converted to [x,y,0]
*/

params [ ["_player", player], ["_position", null] ];

if (!(local _player)) exitWith {
  false;
};

if (isNull _position) then {
  _filtered = allMapMarkers select {
    _regex=format ["^respawn($|_(\d|%1($|_\d)))", side player];
    _x regexMatch _regex;
  };
  _filtered sort false;
  _position = _filtered select 0;
};

[ _player, _position ] call BIS_fnc_moveToRespawnPosition;