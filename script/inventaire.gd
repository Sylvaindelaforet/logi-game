extends Node
class_name Inventaire

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
			return
	stacks.append(new_stack)


func has_stack(stack:Stack):
	for i_stack in stacks:
		if i_stack.same_carac(stack):
			return i_stack.contain_stack(stack)
	stacks.append(stack)


func remove_stack(stack:Stack) -> bool:
	for i_stack in stacks:
		if i_stack.same_carac(stack):
			if i_stack.contain_stack(stack):
				i_stack.remove_stack(stack)
				return true
	return false


func send(stack:Stack, other_inv:Inventaire):
	# TODO remove a stack from stacks
	if has_stack(stack):
		remove_stack(stack)
		other_inv.add_stack(stack)
	push_error("un item non possédé a essayé d'être envoyé")


func add_dictionary(dic1:Dictionary, dic2:Dictionary):
	for key in dic2.keys():
		if dic1.has(key):
			dic1[key] = dic1[key] + dic2[key]
		else:
			dic1[key] = dic1[key] + dic2[key]


func create_tab() -> Array[String]:
	var array:Array[String] = []
	for stack in stacks:
		array = array + stack.create_tab()
	return array


func get_tab_name():
	return get_parent().name + "Inventaire"

