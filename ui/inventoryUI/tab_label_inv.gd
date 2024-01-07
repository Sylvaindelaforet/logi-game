class_name LabelInvTab
extends Label

enum {TOUT_PRENDRE, PRENDRE1}
var options_clic_droit:Array[String] = ["tout prendre", "prendre 1"]

var hud:Hud
var stack:Stack

func _ready():
	hud = $/root/Main/HUD
	mouse_filter = Control.MOUSE_FILTER_PASS

func _gui_input(event):
	if event.is_action_pressed("clic_droit"):
		hud.popup_menu_asked.emit(options_clic_droit, self)

func chosen_action(option:int):
	match option:
		TOUT_PRENDRE:
			var inv = get_parent().get_parent().get_parent().get_current_inv()
			inv.erase_stack(stack)
			$/root/Main/Player.get_inventaire().add_stack(stack)
		PRENDRE1:
			print("action 2")




