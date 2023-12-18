class_name WindowInventaire
extends Window


var right_inventory:InventaireUI
var left_inventory:InventaireUI


# Called when the node enters the scene tree for the first time.
func _ready():
	left_inventory = $ColorRect/HBoxContainer/Inventaire_left
	right_inventory = $ColorRect/HBoxContainer/Inventaire_right
	print(left_inventory)



func add_inventaire(inventaire:Inventaire, left:bool = true):
	if left:
		left_inventory.add_inventaire(inventaire)
	else:
		right_inventory.add_inventaire(inventaire)


func add_inventaire_array(inventaire_array:Array[Inventaire], left:bool=true):
	if left:
		left_inventory.add_inventaire_array(inventaire_array)
	else:
		right_inventory.add_inventaire_array(inventaire_array)


func _on_close_requested():
	queue_free()

