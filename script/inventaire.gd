extends Node
class_name Inventaire


# pour les masses des objets différents, on a la possibilité d'avoir 
# il ne faut pas un grand nombre de masses différentes pour  les choses
var stacks:Array[Stack]


func print_inventory():
	print("print de l'inventaire : ")
	for stack in stacks:
		print(stack.f_to_string())


# must be either {nombre(int) : masse (float)} either float 
func add_stack(new_stack:Stack):
	# test documentation
	"""test documentation"""
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


