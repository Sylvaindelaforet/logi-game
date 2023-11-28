extends Resource
class_name Stack

var chose:Chose

# si denombrarble : {masse : nombre}
var chose_quantities:Dictionary

var masse_totale:float

# key carac -> valeur carac
var modified_caracteristiques:Dictionary

# quantite {masse : nombre} ou float
func _init(p_chose:Chose, quantite):
	chose = p_chose
	if chose.is_denombrable:
		for key in quantite.keys():
			if chose_quantities.has(key):
				chose_quantities[key] = chose_quantities[key] + quantite[key]
			else:
				chose_quantities[key] = quantite[key]
	else:
		masse_totale = masse_totale + quantite


func add_stack(stack:Stack):
	if stack.chose.is_denombrable:
		for key in stack.chose_quantities.keys():
			masse_totale = masse_totale + key * stack.chose_quantities[key]
			if self.chose_quantities.has(key):
				chose_quantities[key] = chose_quantities[key] + stack.chose_quantities[key]
			else:
				chose_quantities[key] = stack.chose_quantities[key]
	else:
		masse_totale = masse_totale + stack.masse_totale

func debug_print_stack():
	if chose.is_denombrable:
		print(chose.nom)
		for key in chose_quantities.keys():
			print("    masse : ", key, " x", chose_quantities[key])
	else:
		print(chose.nom, " : ", masse_totale)
	if not modified_caracteristiques.is_empty():
		for key in modified_caracteristiques.keys():
			print("    carac : ", key, " value : ", modified_caracteristiques[key])

func f_to_string():
	var string: String = ""
	if chose.is_denombrable:
		string = chose.nom
		for key in chose_quantities.keys():
			string = string + "\n    masse : " + String.num(key) + " x" + String.num(chose_quantities[key])
	else:
		string = chose.nom + " : " + String.num(masse_totale)
	if not modified_caracteristiques.is_empty():
		for key in modified_caracteristiques.keys():
			string = string + "\n    carac : " + String.num(key) + " value : " + modified_caracteristiques[key].to_string()
	return string

func equals (other_stack:Stack):
	if other_stack.modified_caracteristiques.is_empty() and modified_caracteristiques.is_empty():
		return true
	for key in other_stack.modified_caracteristiques.keys():
		if not modified_caracteristiques.has[key]:
			return false
		if modified_caracteristiques[key] != other_stack.modified_caracteristiques[key]:
			return false


func create_tab(grid:GridContainer):
	_new_label(chose.nom, grid)
	_new_label(String.num(masse_totale), grid)
	_new_label(String.num(masse_totale*chose.masse_volumique), grid)
	
	if chose.is_denombrable:
		for sub_stack in chose_quantities.keys():
			var txt = String.num(sub_stack) + "kg x" + String.num_int64(chose_quantities[sub_stack])
			_new_label(txt, grid)
			_new_label(String.num(sub_stack*chose_quantities[sub_stack]), grid)
			_new_label(String.num(sub_stack*chose_quantities[sub_stack]*chose.masse_volumique), grid)

func _new_label(txt:String, grid:GridContainer):
	var label:Label = Label.new()
	label.text = txt
	grid.add_child(label)
	return label
	
