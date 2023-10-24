#include "\z\a3e\addons\main\script_component.hpp"

class CfgPatches {
  class MAIN_ADDON {
    name = QUOTE(COMPONENT);
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {
      "cba_common"
    };
    author = "Dikusss";
    VERSION_CONFIG;
  };
};

PRELOAD_ADDONS;