class_name Inventaire
extends Node

# pour les masses des objets différents, on a la possibilité d'avoir 
# il ne faut pas un grand nombre de masses différentes pour  les choses
var stacks:Array[Stack]
# pourquoi pas avoir {chose -> [stack]} au lieu de [Stack] ??

signal inventaire_modified


func debug_print_inventory():
	print("print de l'inventaire : ")
	for stack in stacks:
		print(stack.debug_to_string())


func add_stack(new_stack:Stack):
	# ajoute un stack à l'inventaire
	# le merge dans un autre si possible
	for i_stack in stacks:
		if i_stack.same_carac(new_stack):
			i_stack.merge_stack(new_stack)
			inventaire_modified.emit()
			return
	stacks.append(new_stack)
	inventaire_modified.emit()


func has_stack(stack:Stack):
	for i_stack in stacks:
		if i_stack.same_carac(stack):
			return i_stack.contain_stack(stack)
	stacks.append(stack)

# return true si changement effectué, false si impossible
func remove_stack(stack:Stack):
	for i_stack in stacks:
		if i_stack.same_carac(stack):
			if i_stack.contain_stack(stack):
				i_stack.remove_stack(stack)
				inventaire_modified.emit()
				return
	push_error("change impossible")


func erase_stack(stack:Stack):
	stacks.erase(stack)
	inventaire_modified.emit()
	return


func send(stack:Stack, other_inv:Inventaire):
	if has_stack(stack):
		remove_stack(stack)
		other_inv.add_stack(stack)
	push_error("un item non possédé a essayé d'être envoyé")


# returns list of stacks compatible 
func has_compatible(caracteristique):
	var list_of_stacks = []
	for stack in stacks:
		if stack.compatible(caracteristique):
			list_of_stacks.append(stack)
	return list_of_stacks


func has_thing(chose):
	if typeof(chose) == TYPE_ARRAY:
		print_debug("TODO for chose array")

	var list_of_stacks = []
	for stack in stacks:
		if stack.chose == chose:
			list_of_stacks.append(stack)
	return list_of_stacks


func add_dictionary(dic1:Dictionary, dic2:Dictionary):
	for key in dic2.keys():
		if dic1.has(key):
			dic1[key] = dic1[key] + dic2[key]
		else:
			dic1[key] = dic1[key] + dic2[key]


func get_array_string() -> Array[String]:
	var array:Array[String] = []
	for stack in stacks:
		array = array + stack.get_array_string()
	return array


func get_array_stack() -> Array[Stack]:
	return stacks


func get_inv_name():
	return get_parent().name + "Inventaire"

