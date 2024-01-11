extends Resource
class_name Ressources

enum ID {
	POMME,
	FARINE_BLE,
	GRAINES_BLE,
	EAU,
	JUS,
	PULPE,
	FER,
}

# ATTENTION dans Stack.compatible() y a merge()
enum Carac {
	POISONED,
	ROTTEN,
	BOIRE, # eau / litre
	MANGER, # nutriments / kg
	ETAT,
	TEMPERATURE,
	METAL,
	VITAMINES,
}

enum CARAC_OPE {
	SUPERIOR,
	INFERIOR,
	BETWEEN,
	HAS,
	EQUAL,
}


# "etat" -> [solide, liquide, gazeux] || "poussière", 
enum Etat {SOLIDE, LIQUIDE, GAZEUX, POUSSIERE} # on garde ???

const DEFAULT_VALUE_CARAC = {
	Carac.POISONED : 0,
	Carac.ROTTEN : 0,
	Carac.BOIRE : -20,
	Carac.MANGER : -20,
	Carac.ETAT : Etat.SOLIDE,
	Carac.METAL : 0,
	Carac.VITAMINES : 0,
}


static var Choses = {
	ID.POMME : Chose.new(
		ID.POMME,
		"pomme",
		true,
		0.84,
		{
			Carac.MANGER : 60,
			Carac.BOIRE : 20,
		}
	),
	ID.FARINE_BLE : Chose.new(
		ID.FARINE_BLE,
		"farine de blé",
		false,
		0.5,
		{
			Carac.MANGER : 20,
			Carac.BOIRE : -5,
		}
		),
	ID.GRAINES_BLE : Chose.new(
		ID.GRAINES_BLE,
		"graines de blé",
		false,
		0.4, # masse volumique ???
		{
			Carac.MANGER : 20,
			Carac.BOIRE : 0,
		}
		),
	ID.EAU : Chose.new(
		ID.EAU,
		"eau",
		false,
		1,
		{
			Carac.MANGER : 0,
			Carac.BOIRE : 75,
		}
		),
	ID.JUS : Chose.new(
		ID.JUS,
		"jus",
		false,
		1,
		{
			"origine" : "id_eau"
		}
		),
}


