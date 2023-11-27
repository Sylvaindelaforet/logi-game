extends Window
class_name Window_inventaire

var right_tab_container:TabContainer
var left_tab_container:TabContainer

var inventaires_modifiables:Inventaire

var tab_scene:PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	left_tab_container = $ColorRect/HBoxContainer/TabContainerLeft
	right_tab_container = $ColorRect/HBoxContainer/TabContainerRight
	tab_scene = preload("res://ui/tab_inventaire.tscn")
	create_tab($/root/Main/Player.get_inventaire())


func create_tab(inventaire:Inventaire, left:bool = true):
	var tab = tab_scene.instantiate()
	tab.name = inventaire.get_name()

	if left:
		left_tab_container.add_child(tab)
	else:
		right_tab_container.add_child(tab)

	# add items TODO aller chercher array de string
	tab.create_tab(inventaire)


func _on_close_requested():
	queue_free()

