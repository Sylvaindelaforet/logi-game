class_name Hud
extends CanvasLayer

signal popup_menu_asked(options:Array[String], demandeur)

var clic_droit:PopupMenu
var quemandeur
var window_inventaire:PackedScene
var window_transfo:PackedScene

var inventaire_joueur:Inventaire
var inventaires_visible:Array[Inventaire] = []


func _ready():
	popup_menu_asked.connect(display_popup_menu)
	clic_droit = $ClicDroit
	clic_droit.popup_window = true
	clic_droit.id_pressed.connect(send_response)
	window_inventaire = preload("res://ui/window_inventaire.tscn")
	window_transfo = preload("res://ui/transfoUI/window_transfo.tscn")


func display_popup_menu(options:Array[String], demandeur):
	clic_droit.clear()
	clic_droit.position = get_viewport().get_mouse_position()
	for option in options:
		clic_droit.add_item(option)
	clic_droit.visible = true
	quemandeur = demandeur


func send_response(option):
	quemandeur.chosen_action(option)
	quemandeur = null


func display_inventory(inventaire_focus:Inventaire = null):
	# instantiate window
	var window:WindowInventaire = window_inventaire.instantiate()
	add_child(window)
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


func open_transformation_window():
	# instantiate window
	var window:WindowTransfo = window_transfo.instantiate()
	add_child(window)

func open_inventaire_joueur():
	# instantiate window
	var player:Player = $/root/Main/Player
	display_inventory(player.get_inventaire())
	# fill window
	





func add_inventaire_visible(inv:Inventaire):
	inventaires_visible.append(inv)


func add_player_inventaire(inv:Inventaire):
	inventaire_joueur = inv


func remove_inventaire_visible(inv:Inventaire):
	inventaires_visible.erase(inv)

