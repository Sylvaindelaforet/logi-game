extends Resource
class_name Caracteristiques
# Cette classe définit toutes les caractéristiques possible
# des choses, ainsi que les valeurs par défaut

const EXISTING_CARACTERISTIQUES = ["potable", "poisoned", "rotten", "etat", "temperature"]

# "etat" -> [solide, liquide, gazeux] || "poussière", 

enum etat {SOLIDE, LIQUIDE, GAZEUX, POUSSIERE}


const DEFAULT_CARACTERISTIQUES = {
	"id_pomme" : {
		"poisoned" : 0.0,
		"rotten" : 0.0
	},
	"id_farine_ble" :{
		"poisoned" : 0.0,
		"rotten" : 0.0
	},
	"id_graines_ble" : {
		"poisoned" : 0.0,
		"rotten" : 0.0
	},
	"id_eau": {
		"potable" : 1.0
	},
	"id_jus": {
		"origine" : "id_eau"
	},
	"id_pulpe": {
		"origine" : "id_pomme"
	}
}



