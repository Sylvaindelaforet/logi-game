extends ScrollContainer
class_name TabInventaire

var inventaire_linked:Inventaire

var grid

var script_label


func _init(inventaire:Inventaire):
	script_label = preload("res://ui/label_inventaire_ui.gd")
	inventaire_linked = inventaire
	grid = GridContainer.new()
	add_child(grid)
	grid.columns = 3
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	
	_new_label("nom")
	_new_label("masse")
	_new_label("volume")
	
	var array = inventaire_linked.create_tab()
	for txt in array:
		_new_label(txt)


func _get_drag_data(_pos):
	return self


func _can_drop_data(_pos, data):
	return is_instance_of(data, TabInventaire)


func _drop_data(_pos, data):
	data.reparent(get_parent())


func _new_label(txt:String):
	var label:Label = Label.new()
	label.text = txt
	label.size_flags_horizontal = Label.SIZE_EXPAND_FILL
	label.set_script(script_label)
	grid.add_child(label)



