class_name Inventaire
extends Node

# pour les masses des objets différents, on a la possibilité d'avoir 
# il ne faut pas un grand nombre de masses différentes pour  les choses
# var stacks:Array[Stack]

# un inventaire stocke les ressources tel que :
# ID_chose(int) -> StackList
var ressources_inv:Dictionary

var masse_inv:float

# pourquoi pas avoir {chose -> [stack]} au lieu de [Stack] ??

signal inventaire_modified

################################################
#################### Stack #####################
################################################

## add a stack, merge if already here
func add_stack(new_stack:Stack):
	masse_inv += new_stack.masse_stack
	if ressources_inv.has(new_stack.get_id()):
		ressources_inv[new_stack.get_id()].add_stack(new_stack)
	else:
		var new_stack_list = StackList.new(new_stack)
		new_stack_list.removed_from_stack_list.connect(_on_removed_from_stack_list)

		ressources_inv[new_stack.get_id()] = new_stack_list
	inventaire_modified.emit()

## create and add a stack
func add_new_stack(p_chose:Chose, quantite):
	var a = Stack.new(p_chose, quantite)
	add_stack(a)

## retourne le stack si il le possède null sinon
func has_stack(stack:Stack) -> Stack:
	if ressources_inv.has(stack.get_id()):
		return ressources_inv[stack.get_id()].has_stack(stack)
	return null


func erase_stack(stack:Stack):
	ressources_inv[stack.get_id()].erase_stack(stack)


## returns list of stacks compatible 
func has_compatible(caracteristique):
	var list_of_stacks = []
	for stack_list in ressources_inv.values:
		list_of_stacks = list_of_stacks + stack_list.has_compatible(caracteristique)
	return list_of_stacks


################################################
################# StackList ####################
################################################


## returns Array[StackList]
func get_all_stack_list():
	return ressources_inv.values()



func erase_stack_list(stack_list:StackList):
	masse_inv = masse_inv - stack_list.get_masse()
	stack_list.removed_from_stack_list.disconnect(_on_removed_from_stack_list)
	ressources_inv.erase(stack_list.get_id_chose())
	inventaire_modified.emit()


func add_stack_list(stack_list:StackList):
	masse_inv = masse_inv + stack_list.get_masse()
	if ressources_inv.has(stack_list.get_id_chose()):
		ressources_inv[stack_list.get_id_chose()].add_stack_list(stack_list)
	else:
		ressources_inv[stack_list.get_id_chose()] = stack_list
		stack_list.removed_from_stack_list.connect(_on_removed_from_stack_list)
	inventaire_modified.emit()


func remove_chose(chose_id):
	if ressources_inv.has(chose_id):
		masse_inv -= ressources_inv[chose_id].get_masse()
		ressources_inv.erase(chose_id)


################################################
################# on Signal ####################
################################################


func _on_removed_from_stack_list(id_chose, masse):
	masse_inv -= masse
	if ressources_inv[id_chose].is_empty():
		ressources_inv.erase(id_chose)
	inventaire_modified.emit()
	

################################################
################ utilitaries ###################
################################################


func get_inv_name() -> String:
	return get_parent().name + "Inventaire"


## returns array of string for display in grid
func get_array_string() -> Array[String]:
	var array:Array[String] = [get_inv_name(), String.num(masse_inv, 3) + "kg", String.num(get_volume(), 3) +"L"]
	for stack_list in ressources_inv.values():
		array = array + stack_list.get_array_string()
	return array


func get_volume():
	var volume = 0
	for key in ressources_inv.keys():
		volume = volume + ressources_inv[key].get_volume()
	return volume


func get_handle_for_label():
	var array = []
	for v in ressources_inv.values():
		array.append(v)
		v.add_handle_for_label(array)
	return array


## use for debug
func debug_print_inventory():
	print("print de l'inventaire : ", self)
	print(get_array_string())



