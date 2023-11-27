extends Window
class_name WindowInventaire

var right_tab_container:Tab
var left_tab_container:Tab

var inventaires_modifiables:Inventaire

var tab_scene:PackedScene

var inventaire_left:Array[Inventaire]
var inventaire_right:Array[Inventaire]

# Called when the node enters the scene tree for the first time.
func _ready():
	left_tab_container = $ColorRect/HBoxContainer/TabContainerLeft
	right_tab_container = $ColorRect/HBoxContainer/TabContainerRight
	tab_scene = preload("res://ui/tab_inventaire.tscn")


func create_tab(inventaire:Inventaire, left:bool = true):
	var tab = tab_scene.instantiate()
	tab.name = inventaire.get_tab_name()

	if left:
		left_tab_container.add_child(tab)
	else:
		right_tab_container.add_child(tab)

	# add items TODO aller chercher array de string
	tab.create_tab(inventaire)

func add_inventaire(inventaire:Inventaire, left:bool=true):
	if left:
		inventaire_left.append(inventaire)
	else:
		inventaire_right.append(inventaire)

func add_inventaire_array(inventaire_array:Array[Inventaire], left:bool=true):
	if left:
		inventaire_left.append_array(inventaire_array)
	else:
		inventaire_right.append_array(inventaire_array)

func draw_all():
	if inventaire_left!=null:
		for inv in inventaire_left:
			create_tab(inv)
	if inventaire_right!=null:
		for inv in inventaire_right:
			create_tab(inv, false)


func _on_close_requested():
	queue_free()

