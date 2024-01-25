extends Resource
class_name StackList



var chose:Chose

var stack_list:Array[Stack]

var masse_liste:float


signal removed_from_stack_list

################################################
################ Constructors ##################
################################################


## init soit stack soit une liste de stack
func _init(p_stack_list):
	if p_stack_list is Array[Stack]:
		if p_stack_list == []:
			push_error("wrong initialization")
		stack_list = p_stack_list
		chose = p_stack_list[0].chose
		
		for i_stack in stack_list:
			i_stack.removed_from_stack.connect(_on_removed_from_stack)
			masse_liste += i_stack.masse_stack

	elif p_stack_list is Stack:
		p_stack_list.removed_from_stack.connect(_on_removed_from_stack)
		stack_list = [p_stack_list]
		masse_liste = p_stack_list.masse_stack
		chose = p_stack_list.chose
	else:
		push_error("wrong initialisation")


################################################
################ on Stacks #####################
################################################

func add_stack(stack:Stack):
	masse_liste += stack.get_masse()
	for i_stack in stack_list:
		if i_stack.same_carac(stack):
			i_stack.merge_stack(stack)
			return
	stack_list.append(stack)
	stack.removed_from_stack.connect(_on_removed_from_stack)


## return the stack in the list if this list contains at least the stack
## else return null
func has_stack(stack:Stack) -> bool:
	for i_stack in stack_list:
		if i_stack.same_carac(stack):
			return i_stack.contains_enough(stack.masse_totale)
	return false


## remove stack from the list
## signal if list is empy
func erase_stack(stack:Stack):
	var masse = stack.get_masse()
	masse_liste -= masse
	stack_list.erase(stack)
	stack.removed_from_stack.disconnect(_on_removed_from_stack)
	removed_from_stack_list.emit(get_id_chose(), masse)


func add_stack_list(p_stack_list:StackList):
	for s in p_stack_list.stack_list:
		add_stack(s)
		

################################################
################ signals #######################
################################################



func _on_removed_from_stack(stack:Stack, masse):
	masse_liste -= masse
	if stack.get_quantite() <= 0.000_000_1:
		stack.removed_from_stack.disconnect(_on_removed_from_stack)
		stack_list.erase(stack)
	removed_from_stack_list.emit(get_id_chose(), masse)



################################################
################ utilitaires ###################
################################################


func get_masse():
	return masse_liste
	

func get_volume():
	var volume = 0
	for stack in stack_list:
		volume = volume + stack.get_volume()
		return volume
					
						
func is_empty():
	return stack_list.is_empty()


func add_handle_for_label(array):
	for s in stack_list:
		array.append(s)


func get_array_string() -> Array[String]:
	var array:Array[String] = []
	array.append(chose.nom)
	array.append(String.num(masse_liste, 3))
	array.append(String.num(get_volume(), 3))
	for stack in stack_list:
		array = array + stack.get_array_string()
	return array


func get_id_chose():
	return chose.id





