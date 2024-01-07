class_name TabButton
extends PanelContainer

var label
var parent_ui
var inventaire:Inventaire

var button_chosen:bool

const COLOR_BG_DEFAULT = Color(0, 0, 0)
const COLOR_BG_SELECTED = Color(0.2, 0.2, 0.2)


func _init(p_inventaire:Inventaire, is_open:bool = false):
	label = Label.new()
	label.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	add_child(label)
	label.text = " " + p_inventaire.get_inv_name() + " "
	custom_minimum_size = Vector2(10,10)
	inventaire = p_inventaire
	inventaire.inventaire_modified.connect(_on_inventaire_modified)
	button_chosen = is_open
	if is_open:
		_set_background_color(COLOR_BG_SELECTED)
	else:
		_set_background_color(COLOR_BG_DEFAULT)


func button_is_chosen():
	button_chosen = true
	_set_background_color(COLOR_BG_SELECTED)


func _on_inventaire_modified():
	# TODO enlever get_parent().get_parent()
	if button_chosen:
		parent_ui = get_parent().get_parent()
		parent_ui.draw_inventaire(inventaire)


func untoggle():
	button_chosen = false
	_set_background_color(COLOR_BG_DEFAULT)


func _gui_input(event):
	if event.is_action_pressed("clic_molette"):
		get_parent().remove_button(self)
		queue_free()

	if event.is_action_pressed("clic_gauche"):
		if not button_chosen:
			_set_background_color(COLOR_BG_SELECTED)
			button_chosen = true
			get_parent().button_clicked.emit(self)



func _set_background_color(color:Color = Color(0.2, 0.2, 0.2)):
	var panel_stylebox = StyleBoxFlat.new()
	panel_stylebox.bg_color = color
	add_theme_stylebox_override("panel", panel_stylebox)


func _get_drag_data(_at_position):
	print("button_tab_ui tried dragged")
	return self


func _can_drop_data(_at_position, data):
	return is_instance_of(data, TabButton)


func _drop_data(_at_position, _data):
	print(_data.size)
	print("drop button_tab_ui", _at_position)

