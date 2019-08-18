class rscRT {
	idd = 3000;
	fadein = 0;
	fadeout = 0;
	duration = 99999997952.000000;
	onLoad = "uinamespace setvariable ['GUI_RT',_this select 0]";
	onUnLoad = "uinamespace setvariable ['GUI_RT',nil]";

	class ControlsBackground {

		class BackgroundBarWhite: RscText {
			x = "safezoneX";
			y = "safezoneY + safezoneH - 	0.0425 * safezoneH";
			w = "safezoneW";
			h = "0.0425 * safezoneH";
			colorBackground[] = {1, 1, 1, 1};
		};

		class BackgroundBarSilver: BackgroundBarWhite {
			y = "safezoneY + safezoneH - 	0.0425 * safezoneH - 	0.1275 * safezoneH";
			h = "0.1275 * safezoneH";
			colorBackground[] = {0.8, 0.8, 0.8, "0.6*2"};
		};
	};

	class Controls {

		class GUI_RT_logo_corner: RscPicture {
			x = "safezoneX";
				y = "safezoneY + safezoneH - 	0.0425 * safezoneH - 	0.1275 * safezoneH";
				w = "0.1275 * safezoneH * 3 / 4";
				h = "0.1275 * safezoneH";
				colorText[] = {1, 1, 1, 1};
				text = "common\fx\gui\pic\rt.paa";
			};
		
		
		class TextHeader: RscStructuredText {
			idc = 3001;
			x = "safezoneX + (	0.1275 * safezoneH)"; // + * 2.5
			y = "safezoneY + safezoneH - 	0.0425 * safezoneH - 	0.1275 * safezoneH + 	0.1275 * safezoneH * 0.1";
			w = "safezoneW - (	0.1275 * safezoneH)"; // + * 2.5
			h = "0.1275 * safezoneH - 	0.1275 * safezoneH * 0.1"; // * 0.1 -> * 0.2

			colorText[] = {0.1, 0.1, 0.1, 1};
			style = "0x00 + 0x10";
			shadow = 0;
			size = "((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) / 1.17647) * safezoneH";

			class Attributes {
				font = "RobotoCondensed";
				color = "#262626";
				align = "left";
				shadow = 0;
				valign = "top";
			};
		};

		class TextLine: TextHeader {
			idc = 3002;
			x = "safezoneX";
			y = "safezoneY + safezoneH - 	0.0425 * safezoneH + 0.005";
			w = 1000;
			h = "0.0425 * safezoneH";
			colorText[] = {0.1, 0.1, 0.1, 1};
			shadow = 0;

			class Attributes {
				color = "#000000";
				align = "left";
				shadow = 0;
				valign = "top";
			};
		};

		class TextClock: RscText {
			idc = 3003;
			style = 2;
			x = "safezoneX + safezoneW - 0.15";
			y = "safezoneY + safezoneH - 	0.0425 * safezoneH";
			w = 0.150000;
			h = "0.0425 * safezoneH";
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0.100000, 0.100000, 0.100000, 1};
			sizeEx = "0.0425 * safezoneH";
			shadow = 0;
		};

		class BackgroundBlackLeft: RscText {
			x = "safezoneXAbs";
			y = "safezoneY";
			w = "(safezoneWAbs - safezoneW) / 2";
			h = "safezoneH";
			colorBackground[] = {0, 0, 0, 1};
		};

		class BackgroundBlackRight: BackgroundBlackLeft {
			x = "safezoneX + safezoneW";
		};
	};
};

class Default 
{
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 0;
};

class gui_message_carrier
	{
		idd = -1;
		duration = 999999;
		name = "gui_message_carrier";
	//		fadeIn = 1;
		onLoad = "with uiNameSpace do { gui_message_carrier = _this select 0 }";
		fadeout = 2;
		
		

		controlsBackground[] = { gui_msg_carrier_bg };
		controls[] = { gui_msg_carrier_pic,msg_carrier_text,msg_carrier_status };

			

			class gui_msg_carrier_pic: RscPicture
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.25;  
				y = safeZoneY + 0.1;
				w = 0.2;
				h = 0.2 * 4 / 3;
				text = "common\fx\gui\pic\carrier.paa";

			};


			class msg_carrier_text: RscStructuredText {
				idc = 3100;
				x = safeZoneX + safeZoneW - 0.29;  
				y = safeZoneY + 0.4;
				w = 0.28;
				h = 0.6;

				colorText[] = {0.1, 0.1, 0.1, 1};
				colorBackground[] = {0,0,0,0};
				style = "0x00 + 0x10";
				shadow = 0;
				text = "";

				class Attributes {
					font = "RobotoCondensed";
					color = "#262626";
					align = "left";
					shadow = 0.2;
					shadowColor = "#767676";
					valign = "top";
				};
			};

			class msg_carrier_status: RscStructuredText {
				idc = 3101;
				x = safeZoneX + safeZoneW - 0.29;  
				y = safeZoneY + 1.1;
				w = 0.28;
				h = 0.2;

				colorText[] = {0.1, 0.1, 0.1, 1};
				colorBackground[] = {0,0,0,0};
				shadow = 0;
				text = "";

				class Attributes {
					font = "RobotoCondensed";
					color = "#000000";
					align = "center";
					shadow = 1;
					shadowColor = "#000000";
					valign = "top";
				};
			};

			

		

		
			class gui_msg_carrier_bg: RscStructuredText
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.3;  
				y = safeZoneY + 0.1;
				w = 0.3;
				h = 1.1;
				colorBackground[] = {0.8,0.8,0.8,1};
			};
		
		
};

class gui_message_command
	{
		idd = -1;
		duration = 999999;
		name = "gui_message_command";
		fadeIn = 1;
		onLoad = "with uiNameSpace do { gui_message_command = _this select 0 }";
		fadeout = 2;
		// fadeOut = 5;

	 	class controls {
			
	 		class gui_msg_command_pic: RscPicture
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.3;  
				y = safeZoneY + 0.1;
				w = 0.3;
				h = 0.3 * 4 / 3;
				text = "common\fx\gui\pic\command.paa";
			};

			class msg_command_text: RscStructuredText {
				idc = 3200;
				x = safeZoneX + safeZoneW - 0.29;  
				y = safeZoneY + 0.4;
				w = 0.28;
				h = 0.6;

				colorText[] = {0.1, 0.1, 0.1, 1};
				colorBackground[] = {0,0,0,0};
				shadow = 0;
				text = "";

				class Attributes {
					font = "RobotoCondensed";
					color = "#262626";
					align = "center";
					shadow = 0.2;
					shadowColor = "#767676";
					valign = "top";
				};
			};

			class msg_command_status: RscStructuredText {
				idc = 3201;
				x = safeZoneX + safeZoneW - 0.29;  
				y = safeZoneY + 1.1;
				w = 0.28;
				h = 0.2;

				colorText[] = {0.1, 0.1, 0.1, 1};
				colorBackground[] = {0,0,0,0};
				shadow = 0;
				text = "";

				class Attributes {
					font = "RobotoCondensed";
					color = "#ee3333";
					align = "left";
					shadow = 1;
					shadowColor = "#ffffff";
					valign = "top";
				};
			};



			class gui_msg_command_bg: RscStructuredText
				{
					idc = -1;
					// fadeout = 5;
					x = safeZoneX + safeZoneW - 0.3;  
					y = safeZoneY + 0.4;
					w = 0.3;
					h = 0.8;
					colorBackground[] = {0.8,0.8,0.8,1};
					colorText[] = {0.0, 0.0, 0.0, 0};
				};
			};

			

			

			
};
