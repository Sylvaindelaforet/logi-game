extends Resource
class_name Chose

# DOIT être unique, il ne doit pas y avoir 2 choses différentes avec le même id
@export var id: String = ""
@export var nom: String = ""

@export var is_denombrable: bool = false

# masse volumique en g.mL-1 càd kg/L
@export var masse_volumique:float = -1

#il me faut une image peut être ? peut être pas en vrai lol

# @export var liste_caracteristiques:Array[Caracteristique]
# on utilisera pour : liquide, bonne qualité ...
# dictionnaire "caractéristique" -> valeur par défaut
# voir plutôt dans caractéristiques
#@export var possible_caracteristiques:Dictionary

func _init(p_id, p_nom, p_is_denombrable, p_masse_volumique):
	id = p_id
	nom = p_nom
	is_denombrable = p_is_denombrable
	masse_volumique  = p_masse_volumique

func default_caracteristics():
	if Caracteristiques.DEFAULT_CARACTERISTIQUES.has(id):
		return Caracteristiques.DEFAULT_CARACTERISTIQUES[id]
	else:
		push_error("no caracteristiques given for id_item = ", id)
