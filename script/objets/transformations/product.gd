class_name Product
extends Resource
## ce qui est produit par une transformation, ça peut être
##	- stack
##	- changement stat joueur
##	- changement environnemental (plus tard : énergie, feu, pousse...)


var chose

var actor

# {function_name | carac -> list of parameters/callable}
var modification

var list_stack_reagent

## le ratio marche de tandem avec celui en entrée, si c'est dénombrable
## c'est le nombre d'item, sinon c'est la quantité pour et en kg
## exemple :
## glacer :
## eau = 1 kg			--> si 800g --> si 850g
## glaçon = 10 (de 100g)	--> alors 8 --> alors 8 + 50g eau not consumed
## fondre :
## glaçon = 10 (de 100g)
## eau = 1 kg
var ratio



## pour une chose : modification {Carac -> valeur | [fonctions pour get valeur]} 
func _init(p_chose, p_ratio, p_modification = {}):
	chose = p_chose
	modification = p_modification
	ratio = p_ratio
	list_stack_reagent = []


## crée le produit et le modifie selon modification
func produce(p_actor, ratio_quantite, p_list_stack_reagent):

	var stack_produced
	actor = p_actor
	list_stack_reagent = p_list_stack_reagent.duplicate()

	# create and modifies stack produced
	if chose is Chose:

		stack_produced = Stack.new(chose, ratio_quantite * ratio)
	
		for key in modification.keys():
			var parameters = execute_functions(modification[key])
			stack_produced.set_carac(key, parameters)
	
	# call modification on actor
	elif chose == Transformation.ON_ACTOR:
		for key in modification.keys():
			var parameters = execute_functions(modification[key])
			actor.call(key, parameters)

	# call modification on environment
	elif chose == Transformation.ON_ENVIRONMENT:
		push_error("TODO")

	actor = null
	list_stack_reagent.clear()
	return stack_produced


func execute_functions(list):

	if typeof(list) != TYPE_ARRAY:
		return list

	if list == []:
		return []

	var l:int = len(list)
	var result = list.duplicate()

	for i in range(l):
		if typeof(result[i]) == TYPE_ARRAY:
			result[i] = execute_functions(result[i])

	if result[0] is String:
		var nom_func = result.pop_front()
		result = callv(nom_func, result)
	elif result[0] is Callable:
		var function = result.pop_front()
		result = function.callv(result)

	return result


func is_denombrable():
	if chose is Chose:
		return chose.is_denombrable
	return


###########################################
############### Utilitaires ###############
###########################################


func get_carac_reagent(at:int, carac:int):
	return list_stack_reagent[at].get_carac(carac)


func get_valeur_marginale(at:int, carac:int):
	return get_masse(at) * get_carac_reagent(at, carac)


func get_masse(at:int):
	return list_stack_reagent[at].get_masse()









