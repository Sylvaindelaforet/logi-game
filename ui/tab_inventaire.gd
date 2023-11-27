extends ScrollContainer
class_name TabInventaire

var inventaire_linked:Inventaire

func _get_drag_data(_pos):
	print(self)
	return self

func _gui_input(event):
	if event.is_action_pressed("clic_gauche"):
		print("test clic")

func _can_drop_data(_pos, data):
	return is_instance_of(data, TabInventaire)

func _drop_data(_pos, data):
	data.reparent(get_parent())

func create_tab(inventaire:Inventaire):
	inventaire_linked = inventaire
	print("écrire affichage dans TabInventaire")
