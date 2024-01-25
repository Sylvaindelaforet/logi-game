extends TabInventaire
class_name InterfaceTransfo

# une class pour afficher des élémets de plusieurs inventaires
# utilisé pour : transformation window



var stackchose = {}


func _ready():
	number_grid_column = 3
	current_inv = $/root/Main/Player.get_inventaire()
	current_inv.inventaire_modified.connect(_self_draw)
	_self_draw()



# func draw_inventaire(inventaire:Inventaire):
# 	if grid != null:
# 		stackchose.clear()
# 		_clear_inventaire()
# 	_new_grid()
	
# 	current_inv = inventaire

# 	var array_txt = inventaire.get_array_string()
# 	var array_stack = inventaire.get_handle_for_label()
	
# 	# la première ligne ne doit pas pouvoir être déplacée

# 	var check_button = CheckButton.new()
# 	stackchose[check_button] = inventaire
# 	grid.add_child(check_button)
# 	_new_label(array_txt[0])
# 	_new_label(array_txt[1])
# 	_new_label(array_txt[2])
# 	for i in range(len(array_stack)):
# 		check_button = CheckButton.new()
# 		stackchose[check_button] = array_stack[i]
# 		grid.add_child(check_button)
# 		_new_label(array_txt[i*3+3], array_stack[i])
# 		_new_label(array_txt[i*3+4], array_stack[i])
# 		_new_label(array_txt[i*3+5], array_stack[i])


# ## create a new grid
# func _new_grid():
# 	grid = GridContainer.new()
# 	add_child(grid)
# 	grid.columns = number_grid_column
# 	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
# 	grid.size_flags_vertical = Control.SIZE_EXPAND_FILL



# func get_selected_stacks_and_stack_list():
# 	var list_of_stacks = []
# 	for check_button in stackchose.keys():
# 		if check_button.button_pressed:
# 			list_of_stacks.append(stackchose[check_button])
	
# 	print(list_of_stacks)
# 	return list_of_stacks


func _self_draw():
	draw_inventaire(current_inv)


func _can_drop_data(_pos, data):
	return is_instance_of(data, LabelInvTab) 


func _drop_data(_pos, _data):
	_data.transfer_to_inv(current_inv)

