#include "\z\a3e\addons\persistent_lives\script_component.hpp"
disableSerialization;

_mode = _this select 0;
_params = _this select 1;
_logic = _params select 0;

switch (_mode) do {
	
	case "onLoad": {
		_params params ["_display"];

		_player_controller = _display displayCtrl 1003;
		_lives_slider_controller = _display displayCtrl 1002;
		_lives_label_controller = _display displayCtrl 1006;

		_lives_slider_controller ctrlAddEventHandler ["SliderPosChanged", {
			["livesSliderPosChange", _this,"RscDisplaySetLives","A3E_Lives_GUI"] call (uinamespace getvariable "BIS_fnc_initDisplay");
		}];

		_all_players = allPlayers - entities "HeadlessClient_F";

		if ( (count _all_players) > 0 ) then {
			{
				_player_controller lbAdd (name _x);
			} forEach _all_players;

			_player_controller lbSetCurSel 0;
		};

		_current_selection = sliderPosition _lives_slider_controller;
		_lives_label_controller ctrlSetText (str _current_selection);
	};

	case "onUnload": {
		_params params ["_display", "_exitCode"];

		// the target is always the module that was placed by the curator
		_logic = missionnamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objnull];

		if ( _exitCode == 1 ) then {

			_lives = sliderPosition 1002;
			_index = lbCurSel 1003;
			_player_name = lbText[1003,_index];

			if ( _player_name == "" ) then {
				exit;
			};

			_all_players = allPlayers - entities "HeadlessClient_F";
			_player = _all_players select { name _x == _player_name };
			_player = _player # 0;

			_logic setVariable ["NumberOfLives", _lives];
			_logic synchronizeObjectsAdd [_player];
		};
	};

	case "livesSliderPosChange": {
		_params params ["_control", "_newValue"];
		
		_display = findDisplay 1001;
		_lives_label_controller = _display displayCtrl 1006;
		_lives_label_controller ctrlSetText (str _newValue);
	};
 
};