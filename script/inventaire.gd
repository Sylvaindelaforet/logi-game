extends Node
class_name Inventaire

# pour les masses des objets différents, on a la possibilité d'avoir 
# il ne faut pas un grand nombre de masses différentes pour  les choses
var stacks:Array[Stack]

func debug_print_inventory():
	print("print de l'inventaire : ")
	for stack in stacks:
		print(stack.debug_to_string())

# must be either {masse (float) : nombre(int)} either float 
func add_stack(new_stack:Stack):
	# test documentation
	"""test documentation"""
	print(new_stack)
	for stack in stacks:
		if stack.equals(new_stack):
			stack.add_stack(new_stack)
			return
	stacks.append(new_stack)


func add_dictionary(dic1:Dictionary, dic2:Dictionary):
	for key in dic2.keys():
		if dic1.has(key):
			dic1[key] = dic1[key] + dic2[key]
		else:
			dic1[key] = dic1[key] + dic2[key]


func create_tab(grid:GridContainer):
	for stack in stacks:
		stack.create_tab(grid)

func get_tab_name():
	return get_parent().name + "Inventaire"

