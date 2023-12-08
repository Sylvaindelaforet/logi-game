extends VBoxContainer
class_name InventaireUI

var tab_bar

var inventaire_panel

var tab_inventaire:TabInventaire

func _ready():
	tab_bar = $TabBarUI
	tab_inventaire = TabInventaire.new()
	add_child(tab_inventaire)


func add_inventaire(inventaire:Inventaire):
	_create_button(inventaire)
	tab_inventaire.draw_inventaire(inventaire)


func add_inventaire_array(inventaire_array:Array[Inventaire]):
	if inventaire_array != []:
		for inv in inventaire_array:
			_create_button(inv)
		tab_inventaire.draw_inventaire(inventaire_array[0])


func _create_button(inv:Inventaire):
	var tab_button = TabButton.new(inv)
	tab_bar.add_child(tab_button)


