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

/* Crap Code  Don't worry about this.
pos = getMarkerPos "Kavala";
// House
// Church
// Signs
// Ruins

blah = nearestObjects [pos, ["House"], 175];
hint format ["Houses: %1", count blah];
diag_log blah; 

TODO: Write a Helper Function that goes through each AO counts the following:

	Houses
		Inhabited
		Abandoned			
		Ruins
	Stores
		Inhabited
		Abandoned
		Ruins
	Churches
	Industrial Buildings
	Fuel Stations / Containers
	Power Buildings (Solar, Power Plant, Wind Turbine)
	Military Buildings
	Gas Stations
	Cargo Containers
	Archaelogical Ruins

	Writes all of this information to a RPT file. 
	This is for calculations for a realistic economy.
*/ 



// Initialize Mission

// Initialize Player Scripts

// Sync JIP Players

// Main Loop 

