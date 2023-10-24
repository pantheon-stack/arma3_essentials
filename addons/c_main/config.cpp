#include "\z\a3e\addons\main\script_component.hpp"

class CfgPatches {
	class ADDON_C {
		name = QUOTE(COMPONENT_C);
		units[]={};
		weapons[]={};
		requiredVersion=REQUIRED_VERSION;
		requiredAddons[]=
		{
			"A3_Modules_F",
			"a3e_main",
			"cba_common"
		};
		author = "Dikusss";
    	VERSION_CONFIG;
	};
};
