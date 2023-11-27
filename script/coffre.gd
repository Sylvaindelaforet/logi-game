extends StaticBody2D
class_name Coffre


var hud:Hud

var inventaire:Inventaire

var options_clic_droit:Array[String] = ["ouvrir", "ajouter pomme", "ajouter grosse pomme"]

var pomme:Chose = preload("res://objets/choses/pomme.tres")

func _ready():
	inventaire = $Inventaire
	hud = $/root/Main/HUD
	if $VisibleOnScreenEnabler2D.is_on_screen():
		_on_screen_entered()

func _input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("clic_droit"):
		hud.popup_menu_asked.emit(options_clic_droit, self)

func chosen_action(option:int):
	match option:
		0:
			hud.display_inventory(inventaire)
		1:
			inventaire.add_stack(Stack.new(pomme, {0.145 : 3}))
		2:
			inventaire.add_stack(Stack.new(pomme, {0.200 : 1}))

func _on_screen_entered():
	hud.add_inventaire_visible(inventaire)

func _on_screen_exited():
	hud.remove_inventaire_visible(inventaire)
