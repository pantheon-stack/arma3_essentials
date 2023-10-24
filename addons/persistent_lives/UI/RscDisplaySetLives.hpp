class RscDisplaySetLives
{
	idd = 1001;
	scriptName="RscDisplaySetLives";
	scriptPath="A3E_Lives_GUI";
	onLoad="[""onLoad"",_this,""RscDisplaySetLives"",""A3E_Lives_GUI""] call (uinamespace getvariable ""BIS_fnc_initDisplay"")";
	onUnload="[""onUnload"",_this,""RscDisplaySetLives"",""A3E_Lives_GUI""] call (uinamespace getvariable ""BIS_fnc_initDisplay"")";
	class Controls
	{
		class RscBackground: RscText
		{
			idc = 1000;
			x = "0.371094 * safezoneW + safezoneX";
			y = "0.302 * safezoneH + safezoneY";
			w = "0.278437 * safezoneW";
			h = "0.22 * safezoneH";
			colorBackground[] = {0,0,0,0.6};
		};
		class RscFrame: RscFrame
		{
			idc = 1001;

			x = "0.37625 * safezoneW + safezoneX";
			y = "0.313 * safezoneH + safezoneY";
			w = "0.268125 * safezoneW";
			h = "0.198 * safezoneH";
		};
		class RscSliderTotalLives: RscXSliderH
		{
			idc = 1002;

			text = "Total Lives"; //--- ToDo: Localize;
			x = "0.45875 * safezoneW + safezoneX";
			y = "0.401 * safezoneH + safezoneY";
			w = "0.165 * safezoneW";
			h = "0.033 * safezoneH";
			sliderRange[] = {-1,10};
			sliderPosition = 3;
			sliderStep = 1;
		};
		class RscComboPlayer: RscCombo
		{
			idc = 1003;

			text = "Player"; //--- ToDo: Localize;
			x = "0.45875 * safezoneW + safezoneX";
			y = "0.335 * safezoneH + safezoneY";
			w = "0.165 * safezoneW";
			h = "0.033 * safezoneH";
		};
		class RscButtonMenuOK_2600: RscButtonMenuOK
		{
			x = "0.567031 * safezoneW + safezoneX";
			y = "0.456 * safezoneH + safezoneY";
			w = "0.0567187 * safezoneW";
			h = "0.033 * safezoneH";
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButtonMenuCancel_2700: RscButtonMenuCancel
		{
			x = "0.396875 * safezoneW + safezoneX";
			y = "0.456 * safezoneH + safezoneY";
			w = "0.0567187 * safezoneW";
			h = "0.033 * safezoneH";
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class RscTextPlayer: RscText
		{
			idc = 1004;
			text = "Player"; //--- ToDo: Localize;
			x = "0.386562 * safezoneW + safezoneX";
			y = "0.335 * safezoneH + safezoneY";
			w = "0.0567187 * safezoneW";
			h = "0.033 * safezoneH";
		};
		class RscTextLives: RscText
		{
			idc = 1005;
			text = "Lives"; //--- ToDo: Localize;
			x = "0.386562 * safezoneW + safezoneX";
			y = "0.401 * safezoneH + safezoneY";
			w = "0.0515625 * safezoneW";
			h = "0.033 * safezoneH";
		};
		class RscTextLivesCounter: RscText
		{
			idc = 1006;
			x = "0.438125 * safezoneW + safezoneX";
			y = "0.401 * safezoneH + safezoneY";
			w = "0.020625 * safezoneW";
			h = "0.033 * safezoneH";
		};
	};
};