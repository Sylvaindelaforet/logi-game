class_name TabInventaire
extends ScrollContainer

var grid


func _init():
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_EXPAND_FILL


func draw_inventaire(inventaire:Inventaire):
	if get_child_count() != 0:
		_clear_inventaire()
	_new_grid()
	_new_label("nom")
	_new_label("masse")
	_new_label("volume")
	
	var array = inventaire.get_array_string()
	for txt in array:
		_new_label(txt)


func _set_background_color():
	var panel_stylebox = StyleBoxFlat.new()
	panel_stylebox.bg_color = Color(0.4, 0.4, 0.4, 1.0)
	add_theme_stylebox_override("panel", panel_stylebox)


func _new_label(txt:String):
	var label:LabelInvTab = LabelInvTab.new()
	label.text = txt
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid.add_child(label)


func _new_grid():
	grid = GridContainer.new()
	add_child(grid)
	grid.columns = 3
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid.size_flags_vertical = Control.SIZE_EXPAND_FILL


func _clear_inventaire():
	grid.queue_free()


func _get_drag_data(_pos):
	print("TabInventaire: TODO deplacer objets")


func _can_drop_data(_pos, _data):
	print("TabInventaire: TODO deplacer objets")


func _drop_data(_pos, _data):
	print("TabInventaire: TODO deplacer objets ")


