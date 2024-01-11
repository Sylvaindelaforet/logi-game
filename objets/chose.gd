extends Resource
class_name Chose


# id DOIT être unique
var id: int
var nom: String = ""

var is_denombrable: bool = false

# masse volumique en g.mL-1 càd kg/L
var masse_volumique:float = -1

# dictionnaire "caractéristique" -> valeur par défaut
var default_caracteristics:Dictionary

func _init(p_id:int = -1, p_nom:String = "", p_is_denombrable = null, p_masse_volumique = null, p_default_carac = {}):
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
		return Ressources.DEFAULT_VALUE_CARAC[carac_id]
