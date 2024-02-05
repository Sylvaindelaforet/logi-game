extends Resource
class_name Stack

## class d'un stack
## un stack regroupe des chose avec les mêmes caractéristiques

var chose:Chose

# si denombrable :
var nombre:int
var masse_individuelle:float

var masse_stack:float

# key carac -> valeur carac
var modified_caracteristiques:Dictionary

signal removed_from_stack


################################################
################ Constructors ##################
################################################


# quantite {masse : nombre} ou float
func _init(p_chose:Chose, quantite):
	chose = p_chose
	if chose.is_denombrable:
		masse_individuelle = chose.get_masse_indiv()
		nombre = quantite
		masse_stack = masse_individuelle * nombre
	else:
		masse_stack = quantite


################################################
############# Setters / Getters ################
################################################

func get_id() -> int:
	return chose.id


func get_volume():
	return masse_stack / chose.masse_volumique


func set_carac(carac_id, value):
	modified_caracteristiques[carac_id] = value


func get_carac(carac_id):
	if modified_caracteristiques.has(carac_id):
		return modified_caracteristiques[carac_id]
	else:
		return chose.get_carac(carac_id)


func get_all_carac():
	var caracteristics = chose.default_caracteristics.duplicate()
	caracteristics.merge(modified_caracteristiques, true)
	return caracteristics


func get_masse():
	return masse_stack

func is_empty():
	return masse_stack < 0.000_001

func get_quantite():
	if chose.is_denombrable:
		return nombre
	else:
		return masse_stack


################################################
######### Function Modification ################
################################################

func merge_stack(stack:Stack):
	if stack.chose.is_denombrable:
		nombre += stack.nombre
		masse_stack += stack.masse_stack
	else:
		masse_stack += stack.masse_stack


## quantite float for masse or int for denombrable
func contains_enough(quantite):
	if chose.is_denombrable:
		if quantite is int:
			return nombre >= quantite
		else:
			return masse_stack >= quantite
	else:
		return masse_stack >= masse_stack


## remove a certain quantity then call signal : removed_from_stack
func remove(quantite):
	var masse
	if chose.is_denombrable:
		if quantite - round(quantite) != 0:
			push_error("quantite is not a int, it is :", quantite)
		nombre -= quantite
		masse_stack = masse_individuelle * nombre
		masse = quantite * masse_individuelle
	else:
		masse = quantite
		masse_stack -= quantite

	removed_from_stack.emit(self, masse)


## entirely remove the stack
func delete():
	masse_stack = 0
	removed_from_stack.emit(self, masse_stack)


## Renvoie true si les 2 stacks sont les mêmes choses avec les mêmes caractéristiques modifiées
func same_carac(other_stack:Stack):
	if masse_individuelle != other_stack.masse_individuelle:
		return false
	if other_stack.chose.id != chose.id:
		return false
	if other_stack.modified_caracteristiques.is_empty() and modified_caracteristiques.is_empty():
		return true
	for key in other_stack.modified_caracteristiques.keys():
		if not modified_caracteristiques.has[key]:
			return false
		if modified_caracteristiques[key] != other_stack.modified_caracteristiques[key]:
			return false
	return true


## renvoie true si la valeur de la caractéristique est bonne selon caracteristics
func compatible(caracteristics:Array[CondCarac]):

	for cond in caracteristics:
		if not cond.conforme(self):
			return false
	return true


################################################
################### Utilitaires ################
################################################


func get_array_string() -> Array[String]:
	# return list of ["nom_stack_1, masse_1, volume_1, nom_stack_2, masse_2, ....]
	var array:Array[String] = []
	if chose.is_denombrable:
		array.append(" - " + String.num(masse_individuelle) + "kg x" + String.num(nombre))
	else:
		array.append("")
	array.append(String.num(get_masse(), 3))
	array.append(String.num(get_volume(), 3))
	return array


