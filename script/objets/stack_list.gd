extends Resource
class_name StackList

var stack_list:Array[Stack]

var masse_liste:float

var stacks_denombrable

# init soit stack soit une liste de stack
func _init(p_stack_list):
	if p_stack_list is Array[Stack]:
		if p_stack_list == []:
			push_error("wrong initialization")
		stack_list = p_stack_list
		stacks_denombrable = stack_list[0].chose.is_denombrable
		
		for i_stack in stack_list:
			masse_liste += i_stack.masse_stack 
	if p_stack_list is Stack:
		stack_list = [p_stack_list]
		stacks_denombrable = p_stack_list.chose.is_denombrable
		masse_liste = p_stack_list.masse_stack


# opertions for adding / substracting stacks

func add_stack(stack:Stack):
	masse_liste += stack.masse_stack
	for i_stack in stack_list:
		if i_stack.same_carac(stack):
			i_stack.merge_stack(stack)
			return
	stack_list.append(stack)


# return the stack in the list if this list contains at least the stack
# else return null
func has_stack(stack:Stack) -> Stack:
	for i_stack in stack_list:
		if i_stack.same_carac(stack):
			return i_stack.contains_enough(stack.masse_totale, stacks_denombrable)
	return null


# remove from the list return true if stack list empy
func remove_stack(stack:Stack):
	masse_liste -= stack.masse_stack
	var i_stack = has_stack(stack)
	if i_stack != null:
		i_stack.remove(stack.get_quantite())
		if i_stack.masse_stack == 0:
			stack_list.erase(i_stack)
	else:
		push_error("tried to remove a stack that isn't present")
	return stack_list.is_empty()


# remove from the list return true if stack list empy
func erase_stack(stack:Stack):
	masse_liste -= stack.masse_stack
	stack_list.erase(stack)
	return stack_list.is_empty()


func has_compatible(carac):
	var array:Array[Stack] = []
	for stack in stack_list:
		pass
	# return liste des compatibles, [] sinon
	return array

# operators pour les listes de stack

func add_stack_list(p_stack_list:StackList):
	for s in p_stack_list.stack_list:
		add_stack(s)

func erase_from_stack_list(stak_list):
	push_error("TODO")

func get_masse():
	return masse_liste

# fin des opérateurs

func is_empty():
	return stack_list.is_empty()


func get_array_string() -> Array[String]:
	var array:Array[String] = []
	array.append(stack_list[0].chose.nom)
	array.append(String.num(masse_liste))
	array.append(String.num(masse_liste * stack_list[0].chose.masse_volumique))
	for stack in stack_list:
		array = array + stack.get_array_string()
	return array


func add_handle_for_label(array):
	for s in stack_list:
		array.append(s)

func get_id_chose():
	return stack_list[0].get_id()

#func sent(inventory:Inventaire):
	









