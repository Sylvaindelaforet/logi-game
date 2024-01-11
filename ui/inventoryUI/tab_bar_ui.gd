class_name TabBarUI
extends HBoxContainer


signal button_clicked(button)

var button_chosen:TabButton

func _init():
	custom_minimum_size = Vector2(0, 30)
	button_clicked.connect(_on_button_clicked)
	button_chosen = null


func _on_button_clicked(button):
	if button_chosen != null:
		button_chosen.untoggle()
	button_chosen = button
	button.button_is_chosen()
	get_parent().draw_inventaire(button_chosen.inventaire)


func add_inventaire_array(inventaire_array:Array[Inventaire]):
	for inv in inventaire_array:
		if button_chosen == null:
			button_chosen = _create_button(inv, true)
			get_parent().draw_inventaire(button_chosen.inventaire)
		else:
			_create_button(inv, false)


func remove_button(button:TabButton):
	# remove button from tab bar
	if button == button_chosen:
		var children = get_children()
		if children.size() > 0:
			button_chosen = children[0]
			button_chosen.button_is_chosen()
			get_parent().draw_inventaire(button_chosen.inventaire)
		else:
			button_chosen = null
			get_parent().clear_inventaire()


func get_current_inv():
	return button_chosen.inventaire


func _create_button(inv:Inventaire, selected:bool = false):
	var tab_button = TabButton.new(inv, selected)
	add_child(tab_button)
	return tab_button


func _can_drop_data(_at_position, data):
	return is_instance_of(data, TabButton)


func _drop_data(_at_position, data):
	var ancien_parent = data.get_parent()
	data.reparent(self)
	ancien_parent.remove_button(data)
	_on_button_clicked(data)




