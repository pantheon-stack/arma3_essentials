#include "\z\a3e\addons\main\script_component.hpp"
/*
  AUTHOR: Dikus
*/

params [ "_message" ];

_debug_enabled = missionNamespace getVariable ["a3e_main_debug", false];

if (_debug_enabled ) then {
  diag_log format ["  [A3E DEBUG] %1", _message];
};
