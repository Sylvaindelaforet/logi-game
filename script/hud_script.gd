extends CanvasLayer
class_name Hud

signal popup_menu_asked(options:Array[String], demandeur)

var clic_droit:PopupMenu

var quémandeur

var window_inventaire:PackedScene

func _ready():
	popup_menu_asked.connect(display_popup_menu)
	clic_droit = $ClicDroit
	clic_droit.popup_window = true
	clic_droit.id_pressed.connect(send_response)
	window_inventaire = preload("res://ui/window_inventaire.tscn")


func display_popup_menu(options:Array[String], demandeur):
	clic_droit.clear()
	clic_droit.position = get_viewport().get_mouse_position()
	for option in options:
		clic_droit.add_item(option)
	clic_droit.visible = true
	quémandeur = demandeur

func send_response(option):
	quémandeur.chosen_action(option)
	quémandeur = null


func display_inventory(inventaire:Inventaire):
	var window = window_inventaire.instantiate()
	window.position = get_viewport().get_mouse_position()
	self.add_child(window)
	window.create_tab(inventaire)
	


func _on_clic_droit_mouse_entered():
	print("sur clic droit")
