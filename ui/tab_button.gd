extends PanelContainer
class_name TabButton

var label
var inventaire:Inventaire

func _init(p_inventaire:Inventaire):
	label = Label.new()
	label.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	add_child(label)
	label.text = " " + p_inventaire.get_inv_name() + " "
	custom_minimum_size = Vector2(10,10)
	inventaire = p_inventaire


func _gui_input(event):
	if event.is_action_pressed("clic_molette"):
		print("TODO fermer onglet")
	if event.is_action_pressed("clic_gauche"):
		print("TODO fermer onglet")


func _get_drag_data(_at_position):
	print("button_tab_ui tried dragged")
	return self


func _can_drop_data(_at_position, data):
	return is_instance_of(data, TabButton)


func _drop_data(_at_position, _data):
	print(_data.size)
	print("drop button_tab_ui", _at_position)

