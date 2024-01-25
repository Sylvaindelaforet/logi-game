extends ScrollContainer
class_name TabInventaire

var grid

var number_grid_column = 3

var current_inv

## initialize the grid
func _init():
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_EXPAND_FILL


## draw the inventory given
func draw_inventaire(inventaire:Inventaire):
	if grid != null:
		_clear_inventaire()
	_new_grid()
	
	current_inv = inventaire

	var array_txt = inventaire.get_array_string()
	var array_stack = inventaire.get_handle_for_label()
	
	# la première ligne ne doit pas pouvoir être déplacée
	_new_label(array_txt[0])
	_new_label(array_txt[1])
	_new_label(array_txt[2])
	for i in range(3,len(array_txt)):
	# warning-ignore:integer_division
		var j = (i-3)/number_grid_column
		_new_label(array_txt[i], array_stack[j])


## never used, just for style
func _set_background_color():
	var panel_stylebox = StyleBoxFlat.new()
	panel_stylebox.bg_color = Color(0.4, 0.4, 0.4, 1.0)
	add_theme_stylebox_override("panel", panel_stylebox)


## create a new labelinv and add it to the grid
func _new_label(txt:String, p_stack = null):
	var label
	if p_stack == null:
		label = Label.new()
	else:
		label = LabelInvTab.new()
	label.text = txt
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if p_stack != null:
		label.stack_or_list_stack = p_stack
	grid.add_child(label)


## create a new grid
func _new_grid():
	grid = GridContainer.new()
	add_child(grid)
	grid.columns = number_grid_column
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid.size_flags_vertical = Control.SIZE_EXPAND_FILL


## clear the grid
func _clear_inventaire():
	grid.queue_free()
	grid = null
	current_inv = null


func _get_drag_data(_pos):
	print("TabInventaire: TODO deplacer objets")


func _can_drop_data(_pos, data):
	return is_instance_of(data, LabelInvTab)


func _drop_data(_pos, _data):
	var my_inv = current_inv
	_data.transfer_to_inv(my_inv)



