extends Resource
class_name Chose

# DOIT être unique, il ne doit pas y avoir 2 choses différentes avec le même nom
@export var nom: String = ""

@export var denombrable: bool = false
var nombre: int

# masse volumique en g.mL-1 càd kg/L
@export var masse_volumique:float = -1

#il me faut une image peut être ? peut être pas en vrai lol

# @export var liste_caracteristiques:Array[Caracteristique]
# on utilisera pour : liquide, bonne qualité ...
# dictionnaire "caractéristique" -> valeur ???
# 


func equal_thing(autre_chose:Chose):
	# TODO plus tard : ajouer caractéristiques
	return nom == autre_chose.nom

