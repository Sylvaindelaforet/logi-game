extends CanvasLayer
class_name Hud

signal popup_menu_asked(options:Array[String], demandeur)

var clic_droit:PopupMenu
var quémandeur
var window_inventaire:PackedScene

var inventaire_joueur:Inventaire
var inventaires_visible:Array[Inventaire] = []

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

func display_inventory(inventaire_focus:Inventaire = null):
	# instantiate window
	var window:WindowInventaire = window_inventaire.instantiate()
	self.add_child(window)
	window.position = get_viewport().get_mouse_position()
	# fill window
	window.add_inventaire(inventaire_joueur)
	if inventaire_focus == null:
		window.add_inventaire_array(inventaires_visible, false)
	else:
		if inventaires_visible.has(inventaire_focus):
			inventaires_visible.erase(inventaire_focus)
			inventaires_visible.push_front(inventaire_focus)
			window.add_inventaire_array(inventaires_visible, false)
		else:
			var invs = inventaires_visible.duplicate()
			invs.push_front(inventaire_focus)
			window.add_inventaire_array(invs, false)
	window.draw_all()


func add_inventaire_visible(inv:Inventaire):
	inventaires_visible.append(inv)

func add_player_inventaire(inv:Inventaire):
	inventaire_joueur = inv

func remove_inventaire_visible(inv:Inventaire):
	inventaires_visible.erase(inv)

