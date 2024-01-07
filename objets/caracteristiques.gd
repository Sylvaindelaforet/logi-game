extends Resource
class_name Caracteristiques
# Cette classe définit toutes les caractéristiques possible
# des choses, ainsi que les valeurs par défaut

enum Carac {
	POISONED,
	ROTTEN,
	BOIRE, # eau / litre
	MANGER, # nutriments / kg
	ETAT,
	TEMPERATURE,
	METAL,
}

# "etat" -> [solide, liquide, gazeux] || "poussière", 

enum Etat {SOLIDE, LIQUIDE, GAZEUX, POUSSIERE}

enum {
	ID_POMME,
	ID_FARINE_BLE,
	ID_GRAINES_BLE,
	ID_EAU,
	ID_JUS,
	ID_PULPE,
	ID_FER,
}

const DEFAULT_CARACTERISTIQUES = {
	ID_POMME : {
		Carac.MANGER : 20,
		Carac.BOIRE : 0,
	},
	ID_FARINE_BLE :{
		Carac.MANGER : 20,
		Carac.BOIRE : -5,
	},
	ID_GRAINES_BLE : {
		Carac.MANGER : 20,
		Carac.BOIRE : 0,
	},
	ID_EAU : {
		Carac.MANGER : 0,
		Carac.BOIRE : 75,
	},
	ID_JUS : {
		"origine" : "id_eau"
	},
	ID_PULPE : {
		"origine" : "id_pomme"
	},
	ID_FER : {
		Carac.METAL : 10
	}
}

const DEFAULT_VALUE = {
	Carac.POISONED : 0,
	Carac.ROTTEN : 0,
	Carac.BOIRE : -20,
	Carac.MANGER : -20,
	Carac.ETAT : Etat.SOLIDE,
	Carac.METAL : 0,
}


