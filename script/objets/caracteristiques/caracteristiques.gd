extends Resource
class_name Carac
# Cette classe définit toutes les caractéristiques possible
# des choses, ainsi que les valeurs par défaut

enum {
	POISONED, # hp / kg must be negative, positive will heal
	ROTTEN,
	BOIRE, # eau / litre
	MANGER, # nutriments / kg
	ETAT,
	TEMPERATURE,
	METAL,
}

# "etat" -> [solide, liquide, gazeux] || "poussière", 

enum Etat {SOLIDE, LIQUIDE, GAZEUX, POUSSIERE}


const DEFAULT_VALUE = {
	POISONED : 0,
	ROTTEN : 0,
	BOIRE : -20,
	MANGER : -20,
	ETAT : Etat.SOLIDE,
	METAL : 0,
}


