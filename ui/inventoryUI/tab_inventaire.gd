class_name TabInventaire
extends ScrollContainer

var grid

const NUMBER_GRID_COLUMN = 3

func _init():
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_EXPAND_FILL


func draw_inventaire(inventaire:Inventaire):
	if grid != null:
		_clear_inventaire()
	_new_grid()
	
	var array_txt = inventaire.get_array_string()
	var array_stack = inventaire.get_handle_for_label()
	
	# crée les labels et les wire
	var i:int = 0
	for txt in array_txt:
		_new_label(txt, array_stack[i/NUMBER_GRID_COLUMN])
		i+=1


func _set_background_color():
	var panel_stylebox = StyleBoxFlat.new()
	panel_stylebox.bg_color = Color(0.4, 0.4, 0.4, 1.0)
	add_theme_stylebox_override("panel", panel_stylebox)


func _new_label(txt:String, p_stack = null):
	var label:LabelInvTab = LabelInvTab.new()
	label.text = txt
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if p_stack != null:
		label.stack_or_list_stack = p_stack
	grid.add_child(label)


func _new_grid():
	grid = GridContainer.new()
	add_child(grid)
	grid.columns = NUMBER_GRID_COLUMN
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid.size_flags_vertical = Control.SIZE_EXPAND_FILL


func _clear_inventaire():
	grid.queue_free()
	grid = null


func _get_drag_data(_pos):
	print("TabInventaire: TODO deplacer objets")


func _can_drop_data(_pos, data):
	return is_instance_of(data, LabelInvTab) and data.get_parent().get_parent() != self


func _drop_data(_pos, _data):
	var new_inv = get_parent().get_current_inv()
	_data.transfer_to_inv(new_inv)



