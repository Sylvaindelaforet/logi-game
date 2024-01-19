extends Resource
class_name Chose


# id DOIT être unique
var id: int
var nom: String = ""

var is_denombrable: bool = false

# masse volumique en g.mL-1 càd kg/L
var masse_volumique:float

# dictionnaire Chose.CARAC -> valeur
var default_caracteristics:Dictionary

func _init(p_id:int, p_nom:String, p_is_denombrable:bool, p_masse_volumique:float, p_default_carac:Dictionary):

	if p_id == -1 or p_nom == "" or p_is_denombrable == null or p_masse_volumique == null:
		push_error("chose not initialized correctly p_id=", p_id, " p_nom=", p_nom)

	id = p_id
	nom = p_nom
	is_denombrable = p_is_denombrable
	masse_volumique  = p_masse_volumique
	default_caracteristics = p_default_carac


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
}



static var DEFAULT = {
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
	ID.FER : Chose.new(
		ID.FER,
		"lingot de fer j'imagine",
		true,
		3,
		{
			Carac.METAL : 2
		}
	),
	ID.EPEE_FER : Chose.new(
		ID.EPEE_FER,
		"épée",
		true,
		3,
		{
			Carac.METAL : 2
		}
	)
}












