extends Resource
class_name Stack

var chose:Chose

# si denombrable : {float : int}
var chose_quantities:Dictionary

var masse_totale:float

# key carac -> valeur carac
var modified_caracteristiques:Dictionary


# quantite {masse : nombre} ou float
func _init(p_chose:Chose = null, quantite = null):
	if p_chose == null or quantite == null:
		push_error("init gone wrong for stack")
	chose = p_chose
	if chose.is_denombrable:
		for key in quantite.keys():
			masse_totale = masse_totale + key * quantite[key]
			if chose_quantities.has(key):
				chose_quantities[key] = chose_quantities[key] + quantite[key]
			else:
				chose_quantities[key] = quantite[key]
	else:
		masse_totale = masse_totale + quantite


func merge_stack(stack:Stack):
	if stack.chose.is_denombrable:
		for key in stack.chose_quantities.keys():
			masse_totale = masse_totale + key * stack.chose_quantities[key]
			if self.chose_quantities.has(key):
				chose_quantities[key] = chose_quantities[key] + stack.chose_quantities[key]
			else:
				chose_quantities[key] = stack.chose_quantities[key]
	else:
		masse_totale = masse_totale + stack.masse_totale

func contain_stack(stack:Stack):
	if stack.chose.is_denombrable:
		for key in stack.chose_quantities.keys():
			if not chose_quantities.has(key):
				return false
			if chose_quantities[key] < stack.chose_quantities[key]:
				return false
	else:
		return masse_totale >= stack.masse_totale


func remove_stack(stack:Stack):
	if stack.chose.is_denombrable:
		for key in stack.chose_quantities.keys():
			masse_totale = masse_totale - key * stack.chose_quantities[key]
			if chose_quantities.has(key):
				if chose_quantities[key] - stack.chose_quantities[key] == 0:
					chose_quantities.erase(key)
				else:
					chose_quantities[key] = chose_quantities[key] - stack.chose_quantities[key]
			else:
				push_error("tried to remove from a stack smthng that doesn't exist")
	else:
		masse_totale = masse_totale - stack.masse_totale
	

# renvoie true si les 2 stacks sont les mêmes choses avec les mêmes caractéristiques modifiées
func same_carac(other_stack:Stack):
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


# caracteristics = [[Carac_id, has], [Carac_id, SUP | INF, EQUAL , value],
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






## utilitaires


func debug_print_stack():
	if chose.is_denombrable:
		print(chose.nom)
		for key in chose_quantities.keys():
			print("    masse : ", key, " x", chose_quantities[key])
	else:
		print(chose.nom, " : ", masse_totale)
	if not modified_caracteristiques.is_empty():
		for key in modified_caracteristiques.keys():
			print("    carac : ", key, " value : ", modified_caracteristiques[key])

func f_to_string():
	var string: String = ""
	if chose.is_denombrable:
		string = chose.nom
		for key in chose_quantities.keys():
			string = string + "\n    masse : " + String.num(key) + " x" + String.num(chose_quantities[key])
	else:
		string = chose.nom + " : " + String.num(masse_totale)
	if not modified_caracteristiques.is_empty():
		for key in modified_caracteristiques.keys():
			string = string + "\n    carac : " + String.num(key) + " value : " + modified_caracteristiques[key].to_string()
	return string



func get_array_string() -> Array[String]:
	# return list of ["nom_stack_1, masse_1, volume_1, nom_stack_2, masse_2, ....]
	var array:Array[String] = []
	array.append(chose.nom)
	array.append(String.num(masse_totale))
	array.append(String.num(masse_totale * chose.masse_volumique))
	if chose.is_denombrable:
		for sub_stack in chose_quantities.keys():
			var txt = String.num(sub_stack) + "kg x" + String.num_int64(chose_quantities[sub_stack])
			array.append(txt)
			array.append(String.num(sub_stack * chose_quantities[sub_stack]))
			array.append(String.num(sub_stack * chose_quantities[sub_stack] * chose.masse_volumique))
	return array


