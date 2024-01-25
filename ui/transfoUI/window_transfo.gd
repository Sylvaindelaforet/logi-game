extends Window
class_name WindowTransfo


var interface
var vbox
var transfo_selected
var liste_param
var liste_reagent

func _ready():
	interface = $ColorBack/Panels/InvSide/InterfaceTransfo
	vbox = $ColorBack/Panels/TransfoSide/List/TransfoChoice
	liste_param = $ColorBack/Panels/TransfoSide/List
	liste_reagent = []



func _on_transfo_clicked():
	var transfo_manger:Transformation = Transformation.get_transfo_manger()
	var stacks = interface.get_stacks_transfo()

	print_debug(stacks)
	var player = $/root/Main/Player
	transfo_manger.transform(player, stacks)



func _on_transfo_selected(indice_transfo):
	transfo_selected = Transformation.DEFAULT[indice_transfo]
	if liste_reagent != []:
		for node in liste_reagent:
			node.queue_free()

	liste_reagent = []

	for i in range(len(transfo_selected.parametres_entree)):
		var slot = SlotReagent.new()
		liste_reagent.append(slot)
		liste_param.add_child(slot)
	


func _on_close_requested():
	queue_free()
	
