extends Resource
class_name Product

# ce qui est produit par une transformation, ça peut être
#	- stack
#	- changement stat joueur
#	- changement environnemental (plus tard : énergie, feu, pousse...)
#	- 
#	- 

var chose

# {function_name | carac -> list of parameters/callable}
var modification

var list_stack_reagent

var ratio

func _init(p_chose, p_modification, p_ratio = {}):
	chose = p_chose
	modification = p_modification
	list_stack_reagent = []
	ratio = p_ratio


func produce(actor, p_list_stack_reagent, nombre_item = 1):
	var stack_produced = null
	list_stack_reagent = p_list_stack_reagent.duplicate()

	# create and modifies stack produced
	if chose is Chose:
		var masse = 0
		for rat in ratio:
			masse = masse + p_list_stack_reagent[rat].get_masse() * ratio[rat]
		stack_produced = Stack.new(chose, masse/nombre_item, nombre_item)
	
		for key in modification.keys():
			var parameters = execute_functions(modification[key])
			stack_produced.callv(key, parameters)
	
	# call modification on actor
	elif chose == Transformation.ON_ACTOR:
		for key in modification.keys():
			var parameters = execute_functions(modification[key])
			actor.callv(key, parameters)

	# call modification on environment
	elif chose == Transformation.ON_ENVIRONMENT:
		push_error("TODO")

	list_stack_reagent.clear()
	
	return stack_produced


func execute_functions(list):

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
		if typeof(result) != TYPE_ARRAY:
			result = [result]

	if result[0] is Callable:
		var function = result.pop_front()
		result = function.callv(result)
		if typeof(result) != TYPE_ARRAY:
			result = [result]

	return result



func get_carac_reagent(at:int, carac:int):
	return list_stack_reagent[at].get_carac(carac)


func get_valeur_marginale(at:int, carac:int):
	return get_masse(at) * get_carac_reagent(at, carac)


func get_masse(at:int):
	return list_stack_reagent[at].get_masse()









