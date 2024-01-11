class_name InventaireUI
extends VBoxContainer

# Node Root pour l'affichage d'un inventaire. Elle possède une arboserscence telle que :
# se met dans le hbox de la fenêtre, et affiche un inventaire

# InventaireUI (extends Vbox)
# | - TabBarUI (extends Hbox) trie les onglets TODO ajouter un horizontal scroll ?	
#   | - TabButton (extends PanelContainer) homebrew bouton onglets possède poignet de l'inventaire
#       | - var label
#   | - TabButton (extends PanelContainer) homebrew bouton onglets
#   | - ...
# | - TabInventaire (extends ScrollContainer) container pour y draw les inventaires
#   | - GridContainer
#       | - LabelInvTab (extends Label) pour écrire les composants de l'inventaire
#       | - LabelInvTab ...

# subclass pour le tri et l'affichage des boutons d'onglet

var tab_bar:TabBarUI
var tab_inventaire:TabInventaire


func _init():
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_EXPAND_FILL
	tab_bar = TabBarUI.new()
	add_child(tab_bar)
	tab_inventaire = TabInventaire.new()
	add_child(tab_inventaire)


#func _ready():
#	size_flags_horizontal = Control.SIZE_EXPAND_FILL
#	size_flags_vertical = Control.SIZE_EXPAND_FILL
#	tab_bar = TabBarUI.new([])
#	add_child(tab_bar)
#	tab_inventaire = TabInventaire.new()
#	add_child(tab_inventaire)


func get_current_inv():
	return tab_bar.get_current_inv()


func add_inventaire(inventaire:Inventaire):
	tab_bar.add_inventaire_array([inventaire])


func add_inventaire_array(inventaire_array:Array[Inventaire]):
	tab_bar.add_inventaire_array(inventaire_array)


func draw_inventaire(inventaire:Inventaire):
	tab_inventaire.draw_inventaire(inventaire)

func clear_inventaire():
	tab_inventaire._clear_inventaire()

