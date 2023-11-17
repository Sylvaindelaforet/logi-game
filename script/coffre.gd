extends StaticBody2D
class_name Coffre


var hud:CanvasLayer

var inventaire:Inventaire

var options_clic_droit:Array[String] = ["ouvrir", "ajouter pomme"]

var pomme:Chose = preload("res://objets/choses/pomme.tres")

func _ready():
	inventaire = $Inventaire
	hud = $/root/Main/HUD


func _input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("clic_droit"):
		hud.popup_menu_asked.emit(options_clic_droit, self)

func chosen_action(option:int):
	match option:
		0:
			inventaire.print_inventory()
		1:
			inventaire.add_ressource(pomme, 1)

