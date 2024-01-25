extends Window
class_name WindowTransfo


var interface
var vbox
var transfo_selected
var liste_reagent_label
var liste_reagent # list of SlotReagent

func _ready():
	interface = $ColorBack/Panels/InvSide/InterfaceTransfo
	vbox = $ColorBack/Panels/TransfoSide/List/TransfoChoice
	liste_reagent_label = $ColorBack/Panels/TransfoSide/List
	liste_reagent = []



func _on_transfo_clicked():
	var array = [] 
	var produced = []
	# get stacks from slot for transfo
	for slot in liste_reagent:
		if slot.stack_linked == null:
			return
		array.append(slot.stack_linked)

	var at_most = $ColorBack/Panels/TransfoSide/List/Number/Choice.value

	# execute order 66
	produced = transfo_selected.transform($/root/Main/Player, array, at_most)

	print(produced)



func _on_transfo_selected(indice_transfo):
	transfo_selected = Transformation.DEFAULT[indice_transfo]
	if liste_reagent != []:
		for node in liste_reagent:
			node.queue_free()

	liste_reagent = []

	for i in range(len(transfo_selected.parametres_entree)):
		var slot = SlotReagent.new()
		liste_reagent.append(slot)
		liste_reagent_label.add_child(slot)
	


func _on_close_requested():
	queue_free()
	
