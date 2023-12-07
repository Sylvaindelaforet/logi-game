extends Label

enum {OUVRIR, AJOUTER_POMME, AJOUTER_GROSSE_POMME}
var options_clic_droit:Array[String] = ["action 1", "action 2", "action 3"]

var hud:Hud

func _ready():
	hud = $/root/Main/HUD
	mouse_filter = Control.MOUSE_FILTER_PASS

func _gui_input(event):
	if event.is_action_pressed("clic_droit"):
		hud.popup_menu_asked.emit(options_clic_droit, self)

func chosen_action(option:int):
	match option:
		OUVRIR:
			print("action 1")
		AJOUTER_POMME:
			print("action 2")
		AJOUTER_GROSSE_POMME:
			print("action 3")



