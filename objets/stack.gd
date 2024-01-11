extends Resource
class_name Stack

# class d'un stack
# un stack regroupe des chose avec les mêmes caractéristiques
# ainsi que les items dénombrables de même masse

var chose:Chose

# si denombrable :
var nombre:int
var masse_individuelle:float

var masse_stack:float

# key carac -> valeur carac
var modified_caracteristiques:Dictionary


# quantite {masse : nombre} ou float
func _init(p_chose:Chose, p_masse:float, p_nombre = 0):
	if p_nombre == 0 and p_chose.is_denombrable:
		push_error("init gone wrong for stack")
	
	chose = p_chose
	if chose.is_denombrable:
		masse_individuelle = p_masse
		nombre = p_nombre
		masse_stack = p_masse * p_nombre
	else:
		masse_stack = p_masse


func merge_stack(stack:Stack):
	if stack.chose.is_denombrable:
		nombre += stack.nombre
		masse_stack += stack.masse_stack
	else:
		masse_stack += stack.masse_stack


# quantite float or int for denombrable0
func contains_enough(quantite, denombrable:bool):
	if denombrable:
		if quantite is int:
			return nombre >= quantite
		else:
			return masse_stack >= quantite
	else:
		return masse_stack >= masse_stack


func remove(quantite):
	if chose.is_denombrable:
		if not quantite is int:
			push_error("can't retirer denombrable")
		nombre -= quantite
		masse_stack = masse_individuelle * nombre
	else:
		masse_stack -= quantite


func get_quantite():
	if chose.is_denombrable:
		return nombre
	else:
		return masse_stack


# renvoie true si les 2 stacks sont les mêmes choses avec les mêmes caractéristiques modifiées
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




# renvoie vrai si la valeur de la caractéristique est bonne selon caracteristics
# ça a l'air un peu foireux à refaire ?
# caracteristics = [[Carac_id, has], [Carac_id, SUP | INF | EQUAL , value],
# [Carac_id, between , [value1 value 2]]
# or caracteristics = [id_chose_1, id_chose_2, id_chose_3, ...]
func compatible(caracteristics):
	
	var temp_dictionary = chose.default_caracteristics.duplicate()
	temp_dictionary.merge(modified_caracteristiques, true)
	
	for elt in caracteristics:
		if typeof(elt) != TYPE_ARRAY:
			if chose.id == elt:
				return true
		
		var carac_id = elt[0]
		var operator = elt[1]
		
		if not chose.default_caracteristics.has(carac_id):
			return false
		
		match operator:
			Ressources.CARAC_OPE.HAS:
				pass
			Ressources.CARAC_OPE.SUPERIOR:
				if temp_dictionary[carac_id] < elt[2]:
					return false
			Ressources.CARAC_OPE.INFERIOR:
				if temp_dictionary[carac_id] > elt[2]:
					return false
			Ressources.CARAC_OPE.BETWEEN:
				var lower_bound = elt[3][0]
				var higher_bound = elt[3][1]
				if temp_dictionary[carac_id] < lower_bound and temp_dictionary[carac_id] > higher_bound:
					return false
			Ressources.CARAC_OPE.EQUAL:
				if temp_dictionary[carac_id] != elt[2]:
					return false
	
	return true


func get_id() -> int:
	return chose.id


func volume_stack():
	return masse_stack * chose.masse_volumique


func get_carac(carac_id):
	if modified_caracteristiques.has(carac_id):
		return modified_caracteristiques[carac_id]
	else:
		return chose.get_carac(carac_id)


func get_all_carac():
	var caracteristics = chose.default_caracteristics.duplicate()
	caracteristics.merge(modified_caracteristiques, true)
	return caracteristics


#
#func remove_stack(stack:Stack):
	#if stack.chose.is_denombrable:
		#for key in stack.chose_quantities.keys():
			#masse_totale = masse_totale - key * stack.chose_quantities[key]
			#if chose_quantities.has(key):
				#if chose_quantities[key] - stack.chose_quantities[key] == 0:
					#chose_quantities.erase(key)
				#else:
					#chose_quantities[key] = chose_quantities[key] - stack.chose_quantities[key]
			#else:
				#push_error("tried to remove from a stack smthng that doesn't exist")
	#else:
		#masse_totale = masse_totale - stack.masse_totale





## utilitaires


#func debug_print_stack():
	#if chose.is_denombrable:
		#print(chose.nom)
		#for key in chose_quantities.keys():
			#print("    masse : ", key, " x", chose_quantities[key])
	#else:
		#print(chose.nom, " : ", masse_totale)
	#if not modified_caracteristiques.is_empty():
		#for key in modified_caracteristiques.keys():
			#print("    carac : ", key, " value : ", modified_caracteristiques[key])
#
#func f_to_string():
	#var string: String = ""
	#if chose.is_denombrable:
		#string = chose.nom
		#for key in chose_quantities.keys():
			#string = string + "\n    masse : " + String.num(key) + " x" + String.num(chose_quantities[key])
	#else:
		#string = chose.nom + " : " + String.num(masse_totale)
	#if not modified_caracteristiques.is_empty():
		#for key in modified_caracteristiques.keys():
			#string = string + "\n    carac : " + String.num(key) + " value : " + modified_caracteristiques[key].to_string()
	#return string



func get_array_string() -> Array[String]:
	# return list of ["nom_stack_1, masse_1, volume_1, nom_stack_2, masse_2, ....]
	var array:Array[String] = []
	if chose.is_denombrable:
		array.append(String.num(masse_individuelle) + "kg x" + String.num(nombre))
	else:
		array.append("")
	array.append(String.num(masse_stack))
	array.append(String.num(masse_stack * chose.masse_volumique))
	return array


