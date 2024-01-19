class_name Inventaire
extends Node

# pour les masses des objets différents, on a la possibilité d'avoir 
# il ne faut pas un grand nombre de masses différentes pour  les choses
# var stacks:Array[Stack]

# un inventaire stocke les ressources tel que :
# ID_chose(int) -> StackList
var ressources_inv:Dictionary

var masse_inv:float
var volume_inv:float


# pourquoi pas avoir {chose -> [stack]} au lieu de [Stack] ??

signal inventaire_modified


func add_stack(new_stack:Stack):
	masse_inv += new_stack.masse_stack
	volume_inv += new_stack.volume_stack()
	if ressources_inv.has(new_stack.get_id()):
		ressources_inv[new_stack.get_id()].add_stack(new_stack)
	else:
		ressources_inv[new_stack.get_id()] = StackList.new(new_stack)
	inventaire_modified.emit()


func add_new_stack(p_chose:Chose, p_masse:float, p_nombre = 0):
	var a = Stack.new(p_chose, p_masse, p_nombre)
	add_stack(a)


# retourne le stack si il le possède null sinon
func has_stack(stack:Stack) -> Stack:
	if ressources_inv.has(stack.get_id()):
		return ressources_inv[stack.get_id()].has_stack(stack)
	return null


# si impossible push error
func remove_stack(stack:Stack):
	masse_inv -= stack.masse_stack
	volume_inv -= stack.volume_stack()
	if ressources_inv.has(stack.get_id()):
		if ressources_inv[stack.get_id()].remove_stack(stack):
			ressources_inv.erase(stack.get_id())
		inventaire_modified.emit()
	else:
		push_error("tried to remove a stack that isn't present")


func erase_stack(stack:Stack):
	masse_inv -= stack.masse_stack
	volume_inv -= stack.volume_stack()
	# clean if no more stack
	if ressources_inv[stack.get_id()].erase_stack(stack):
		ressources_inv.erase(stack.get_id())
	inventaire_modified.emit()


# ??? wtf c'es utile cette fonction ???
func send(_stack:Stack, _other_inv:Inventaire):
	push_error("c'est quoi cette foction ? elle est utilisée où ?")


# returns list of stacks compatible 
func has_compatible(caracteristique):
	var list_of_stacks = []
	for stack_list in ressources_inv.values:
		list_of_stacks = list_of_stacks + stack_list.has_compatible(caracteristique)
	return list_of_stacks


func has_thing(chose):
	push_error("TODO finaliser la fonction si utile...")
	if typeof(chose) == TYPE_ARRAY:
		print_debug("TODO for chose array")
	
	if ressources_inv.has(chose):
		return ressources_inv[chose]
	return null


func get_array_string() -> Array[String]:
	var array:Array[String] = [get_inv_name(), String.num(masse_inv) + "kg", String.num(volume_inv) +"L"]
	for stack_list in ressources_inv.values():
		array = array + stack_list.get_array_string()
	return array


func get_all_stack_list() -> Array[StackList]:
	return ressources_inv.values()


func get_inv_name() -> String:
	return get_parent().name + "Inventaire"


func get_handle_for_label():
	var array = []
	for v in ressources_inv.values():
		array.append(v)
		v.add_handle_for_label(array)
	return array


func erase_stack_list(stack_list:StackList):
	masse_inv = masse_inv - stack_list.get_masse()
	ressources_inv.erase(stack_list.get_id_chose())

func add_stack_list(stack_list:StackList):
	if ressources_inv.has(stack_list.get_id_chose()):
		ressources_inv[stack_list.get_id_chose()].add_stack_list(stack_list)

# debug utilitaires

func debug_print_inventory():
	print("print de l'inventaire : ", self)
	print(get_array_string())



