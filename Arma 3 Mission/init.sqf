AO_ARRAY = 
[
	// Settlements
	// Kavala, Agios Dionysios and Aggelochori will have to be 350m Diameter
	// Everything else is 300m Diameter AO's
	["Selakano", "City"],
	["Feres", "City"],
	["Panagia", "City"],
	["Faronaki", "City"],
	["Pyrgos", "City"],
	["Charkia", "City"],
	["Kalochori", "City"],
	["Paros", "City"],
	["Rodopoli", "City"],
	["Chalkeia", "City"],
	["Ioannia", "City"],
	["Definaki", "City"],
	["Sofia", "City"],
	["Molos", "City"],
	["Gatolia", "City"],
	["Anthrakia", "City"],
	["Telos", "City"],
	["Kalithea", "City"],
	["Gravia", "City"],
	["Athira", "City"],
	["Frini", "City"],
	["Stavros", "City"],
	["Lakka", "City"],
	["Neochori", "City"],
	["Ifestonia", "City"],
	["Koroni", "City"],
	["Agios Dionysios", "City"], // 350m
	["Therisa", "City"],
	["Zaros", "City"],
	["Panochori", "City"],
	["Neri", "City"],
	["Athanos", "City"],
	["Kavala", "City"],	// 350m
	["Aggelochori", "City"], // 350m
	["Edessa", "City"],
	["Negades", "City"],
	["Agios Konstantinos", "City"],
	["Syrta", "City"],
	["Topolia", "City"],
	["Kavirida", "City"],
	["Abdera", "City"],
	["Galati", "City"],
	["Oreokastro", "City"],
	["Orino", "City"],
	// Refuge (25m Diameter)
	["Agia Pelagia", "Refuge"],
	["Agios Petros", "Refuge"],
	["Agios Georgios", "Refuge"],
	["Agia Triada", "Refuge"],
	["Agia Stemma", "Refuge"],
	["Agios Kosmas", "Refuge"],
	["Limni Refuge", "Refuge"],
	["Surf Club Refug", "Refuge"],
	["Agios Minas", "Refuge"],
	["Sideras", "Refuge"],
	// Military Bases
	["Altis Airbase", "Military"],
	["AIA Military Garrison", "Military"],
	["Lakka Garrison", "Military"],
	["Iraklia Garrison", "Military"],
	["Skiptro Radar Station", "Military"],
	["Galati Garrison", "Military"],
	["Sceptre Garrison", "Military"],
	["Pyrgos Garrison", "Military"],
	//Military Science Bases
	["Pefkas Research Center", "Science"],
	["Telos Research Facility", "Science"],
	["Facility Delta", "Science"],
	["Facility Omega", "Science"],
	// Airfields 
	["Molos Airfield", "Airfield"],
	["Almyra Airfield", "Airfield"],
	["Altis International Airport", "Airfield"],
	["AAC Airfield", "Airfield"],
	["Abdera Airstrip", "Airfield"],
	// Industry
	["Lakka Industrial District", "Industrial"],
	["Kore Industrial District", "Industrial"],
	["Agios Dionysios Industrial District", "Industrial"],
	["Alikampos Industrial District", "Industrial"],
	["Edessa Industrial District", "Industrial"],
	["Charkia Storage", "Industrial"],
	["Pyrgos Quarry", "Industrial"],
	["Gori Factory", "Industrial"],
	// Power Plants
	["Telos Power Plant", "Power"],
	["Magos Power Plant", "Power"],
	["Sofia Power Plant", "Power"],
	["Fotia Solar Facility", "Power"],
	["Skopos Wind Turbines", "Power"],
	["Therisa Solar Farm", "Power"],
	// Ruins
	["Aktinarki Ruins", "Ruins"],
	["Thronos Castle", "Ruins"],
	["Vikos Castle", "Ruins"],
	["Castle Kastro", "Ruins"],
	["Iraklia Ruins", "Ruins"],
	["Pefkas Ampitheatre", "Ruins"]
];

/*
esc_fnc_tallyBuildings
========================================================================================
esc_fnc_tallyBuildings calculates the amount of each building type is inside of an AO, 
to give data in CSV friendly format in the Arma.rpt to figure out Economics for each AO

TODO: Add Fuel Stations, Cargo Containers, and Archaoelogical Ruins
	
Writes all of this information to a RPT file. 
This is for calculations for a realistic economy.
*/ 

esc_fnc_tallyBuildings = {

	private ["_airport_bldgs", "_commercial_bldgs", "_military_bldgs", "_church_bldgs", "_industrial_bldgs", "_other_bldgs", "_science_bldgs", "_lower_class_bldgs", "_medium_class_bldgs", "_upper_class_bldgs", "_garage_bldgs", "_destroyed_abandoned_bldgs", "_house_addon_bldgs", "_solar_power_bldgs"];
	// Airport
	_airport_bldgs = ["Land_Airport_Tower_F", "Land_Airport_left_F", "Land_Airport_right_F", "Land_Hangar_F", "Land_Radar_F"];
	// Commercial
	_commercial_bldgs = ["Land_Offices_01_V1_F", "Land_CarService_F", "Land_d_Shop_01_V1_F", "Land_d_Shop_02_V1_F", "Land_u_Shop_01_V1_F", "Land_u_Shop_02_V1_F"];
	// MILITARY
	_military_bldgs = ["Land_Cargo_HQ_V1_F", "Land_Cargo_HQ_V3_F", "Land_Cargo_House_V1_F", "Land_Cargo_House_V2_F", "Land_Cargo_House_V3_F", "Land_Cargo_Patrol_V1_F", "Land_Cargo_Patrol_V2_F", "Land_Cargo_Patrol_V3_F", "Land_Cargo_Tower_V1_F", "Land_Cargo_Tower_V3_F", "Land_MilOffices_V1_F", "Land_i_Barracks_V1_F", "Land_i_Barracks_V2_F", "Land_u_Barracks_V2_F"];
	// Churches
	_church_bldgs = ["Land_Chapel_Small_V1_F", "Land_Chapel_Small_V2_F", "Land_Chapel_V1_F", "Land_Chapel_V2_F"];
	// Industrial
	_industrial_bldgs = ["Land_Crane_F", "Land_Factory_Main_F", "Land_Unfinished_Building_01_F", "Land_Unfinished_Building_02_F", "Land_WIP_F", "Land_i_Shed_Ind_F", "Land_dp_bigTank_F", "Land_dp_smallTank_F", "Land_dp_smallFactory_F", "Land_dp_mainFactory_F", "Land_u_Shed_Ind_F", "Land_Factory_Main_F", "Land_Factory_Hopper_F", "Land_Factory_Hopper_F", "Land_Factory_Conv1_Main_F", "Land_cmp_Hopper_F", "Land_cmp_Shed_F", "Land_cmp_Tower_F"];
	// Other
	_other_bldgs = ["Land_LightHouse_F", "Land_Lighthouse_small_F", "Land_i_Windmill01_F", "Land_Metal_Shed_F"];
	// Science
	_science_bldgs = ["Land_Research_HQ_F", "Land_Research_house_V1_F", "Land_Dome_Big_F", "Land_Dome_Small_F", "Land_Medevac_HQ_V1_F", "Land_Medevac_house_V1_F"];
	// Houses
	// --- Lower Class
	_lower_class_bldgs = ["Land_Slum_House01_F", "Land_Slum_House02_F", "Land_Slum_House03_F", "Land_cargo_house_slum_F", "Land_i_Stone_Shed_V1_F", "Land_i_Stone_Shed_V2_F", "Land_i_Stone_Shed_V3_F"];
	// --- Medium Class
	_medium_class_bldgs = ["Land_i_House_Small_01_V1_F", "Land_i_House_Small_01_V2_F", "Land_i_House_Small_01_V3_F", "Land_i_House_Small_02_V1_F", "Land_i_House_Small_02_V2_F", "Land_i_House_Small_02_V3_F", "Land_i_House_Small_03_V1_F", "Land_i_Stone_HouseSmall_V1_F", "Land_i_Stone_HouseSmall_V2_F", "Land_i_Stone_HouseSmall_V3_F"];
	// --- Upper Class
	_upper_class_bldgs = ["Land_i_House_Big_01_V1_F", "Land_i_House_Big_01_V2_F", "Land_i_House_Big_01_V3_F", "Land_i_House_Big_02_V1_F", "Land_i_House_Big_02_V2_F", "Land_i_House_Big_02_V3_F", "Land_i_Stone_HouseBig_V1_F", "Land_i_Stone_HouseBig_V2_F", "Land_i_Stone_HouseBig_V3_F"];
	// --- Garages 
	_garage_bldgs = ["Land_i_Garage_V1_F", "Land_i_Garage_V1_dam_F", "Land_i_Garage_V2_F", "Land_i_Garage_V2_dam_F"];
	// --- Destroyed or Uninhabited
	_destroyed_abandoned_bldgs = ["Land_d_House_Small_01_V1_F", "Land_d_House_Small_02_V1_F", "Land_d_Stone_HouseSmall_V1_F", "Land_d_Windmill01_F", "Land_d_House_Big_01_V1_F", "Land_d_House_Big_02_V1_F", "Land_d_Stone_HouseBig_V1_F", "Land_d_Addon_02_V1_F", "Land_d_Stone_Shed_V1_F", "Land_u_House_Big_01_V1_F", "Land_u_House_Big_02_V1_F", "Land_u_House_Small_01_V1_F", "Land_u_House_Small_02_V1_F"];
	// --- Addons
	_house_addon_bldgs = ["Land_i_Addon_02_V1_F", "Land_i_Addon_03_V1_F", "Land_i_Addon_03mid_V1_F", "Land_i_Addon_04_V1_F", "Land_u_Addon_01_V1_F", "Land_u_Addon_02_V1_F"];
	// Power Buildings
	_solar_power_bldgs = ["Land_spp_Tower_F", "Land_spp_Mirror_F", "Land_spp_Panel_F", "Land_SolarPanel_1_F", "Land_SolarPanel_2_F", "Land_SolarPanel_3_F"];
	_wind_power_bldgs = ["Land_wpp_Turbine_V1_F", "Land_wpp_Turbine_V2_F"];

	{
		private["_aoName", "_aoType", "_objects"];
		private["_airport", "_commercial", "_military", "_churches", "_industrial", "_science", "_lwrclass", "_medclass", "_uppclass", "_garages", "_destroyed", "_addons", "_solar", "_wind" , "_other"];
		_aoName = _x select 0;
		_aoType = _x select 1;

		_airport = count nearestObjects [getMarkerPos _aoName, _airport_bldgs, 200];
		_commercial = count nearestObjects [getMarkerPos _aoName, _commercial_bldgs, 200];
		_military = count nearestObjects [getMarkerPos _aoName, _military_bldgs, 200];
		_churches = count nearestObjects [getMarkerPos _aoName, _church_bldgs, 200];
		_industrial = count nearestObjects [getMarkerPos _aoName, _industrial_bldgs, 200];
		_science = count nearestObjects [getMarkerPos _aoName, _science_bldgs, 200];
		_lwrclass = count nearestObjects [getMarkerPos _aoName, _lower_class_bldgs, 200];
		_medclass = count nearestObjects [getMarkerPos _aoName, _medium_class_bldgs, 200];
		_uppclass = count nearestObjects [getMarkerPos _aoName, _upper_class_bldgs, 200];
		_garages = count nearestObjects [getMarkerPos _aoName, _garage_bldgs, 200];
		_destroyed = count nearestObjects [getMarkerPos _aoName, _destroyed_abandoned_bldgs, 200];
		_addons = count nearestObjects [getMarkerPos _aoName, _house_addon_bldgs, 200];
		_solar = count nearestObjects [getMarkerPos _aoName, _solar_power_bldgs, 200];
		_wind = count nearestObjects [getMarkerPos _aoName, _wind_power_bldgs, 200];

		diag_log format["%1, %2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14", _aoName, _airport, _commercial, _military, _churches, _industrial, _science, _lwrclass, _medclass, _uppclass, _garages, _destroyed, _addons, _solar, _wind];

	} forEach AO_ARRAY;

};



// Initialize Mission

// Initialize Player Scripts

// Sync JIP Players

// Main Loop 

