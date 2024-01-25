extends Resource
class_name Chose


# id DOIT être unique
var id: int
var nom: String = ""

var is_denombrable: bool = false
var masse_individuelle:float = 0.0

# masse volumique en g.mL-1 càd kg/L
var masse_volumique:float

# dictionnaire Chose.CARAC -> valeur
var default_caracteristics:Dictionary

func _init(p_id:int, p_nom:String, p_is_denombrable:bool, p_masse_volumique:float, p_default_carac:Dictionary, p_masse_indiv:float = 0.0):

	id = p_id
	nom = p_nom
	masse_volumique  = p_masse_volumique
	default_caracteristics = p_default_carac
	is_denombrable = p_is_denombrable
	masse_individuelle = p_masse_indiv


func get_masse_indiv():
	return masse_individuelle


func get_masse_volumique():
	return masse_volumique

func get_carac(carac_id:int):
	if default_caracteristics.has(carac_id):
		return default_caracteristics[carac_id]
	else:
		return Carac.DEFAULT_VALUE[carac_id]


##############################################################################
################### initialisation des choses de bases #######################
##############################################################################


enum ID {
	POMME,
	FARINE_BLE,
	GRAINES_BLE,
	EAU,
	JUS,
	PULPE,
	FER,
	EPEE_FER,
	# lingots
	DEBUT_LINGOTS,
	LINGOT_FER,
	LINGOT_CUIVRE,
	LINGOT_OR,
	LINGOT_MITHRIL,
	FIN_LINGOTS,
}



static var DEFAULT = {
# 	ID.Object :		Chose.new(ID.Object,  "nom objet", is_dénombrable, masse_volumique, caracs, masse_individuelle(optional))

	ID.POMME : 		Chose.new(ID.POMME, 		"pomme", 			true, 0.84, {Carac.MANGER : 60, Carac.BOIRE : 20},	0.15),
	ID.FARINE_BLE : Chose.new(ID.FARINE_BLE, 	"farine de blé", 	false, 0.5, {Carac.MANGER : 20, Carac.BOIRE : -5,}		),
	ID.GRAINES_BLE: Chose.new(ID.GRAINES_BLE, 	"graines de blé", 	false, 0.6, {Carac.MANGER : 20, Carac.BOIRE : 0,}		),
	ID.EAU : 		Chose.new(ID.EAU, 			"eau", 				false, 1, 	{Carac.MANGER : 0, Carac.BOIRE : 75}		),
	ID.JUS : 		Chose.new(ID.JUS, 			"jus", 				false, 1, 	{"origine" : "id_eau"}						),
	ID.EPEE_FER : 	Chose.new(ID.EPEE_FER, 		"épée", 			true, 7, 	{Carac.METAL : 2}, 						1),

# lingots
	ID.LINGOT_FER : Chose.new(ID.LINGOT_FER, "lingot de fer", true, 10, { Carac.METAL : 2},	1),

# TODO en dessous
	ID.LINGOT_CUIVRE: Chose.new(ID.LINGOT_CUIVRE, "lingot de cuivre", true, 10, {Carac.METAL : 3},	1),
	ID.LINGOT_OR : Chose.new(ID.LINGOT_OR, "lingot d'or", true, 10, { Carac.METAL : 2},	1),
}








