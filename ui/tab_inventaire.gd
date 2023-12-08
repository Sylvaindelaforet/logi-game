extends ScrollContainer
class_name TabInventaire

var grid
var script_label

func _init():
	script_label = preload("res://ui/label_inventaire_ui.gd")
	grid = GridContainer.new()
	add_child(grid)
	grid.columns = 3
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_EXPAND_FILL
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_set_background_color()


func draw_inventaire(inventaire:Inventaire):
	_new_label("nom")
	_new_label("masse")
	_new_label("volume")
	
	var array = inventaire.get_array_string()
	for txt in array:
		_new_label(txt)
	
	print("TODO : TabInventaire : finir l'impression de l'invent")


func _set_background_color():
	var panel_stylebox = StyleBoxFlat.new()
	panel_stylebox.bg_color = Color(0.4, 0.4, 0.4, 1.0)
	add_theme_stylebox_override("panel", panel_stylebox)


func _new_label(txt:String):
	var label:Label = Label.new()
	label.text = txt
	label.size_flags_horizontal = Label.SIZE_EXPAND_FILL
	label.set_script(script_label)
	grid.add_child(label)


func _get_drag_data(_pos):
	print("TabInventaire: TODO deplacer objets")


func _can_drop_data(_pos, data):
	print("TabInventaire: TODO deplacer objets")


func _drop_data(_pos, data):
	print("TabInventaire: TODO deplacer objets ")


