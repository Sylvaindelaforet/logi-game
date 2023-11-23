extends Window


var vbox:VBoxContainer

var tabcontainer:TabContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	tabcontainer = $ColorRect/HBoxContainer/PanelContainer/TabContainer
	vbox = VBoxContainer.new()
	
	var texte = RichTextLabel.new()
	texte.text = "item 1"
	var texte2 = RichTextLabel.new()
	texte2.text = "item 2"	

	tabcontainer.add_child(vbox)
	
	
	vbox.add_child(texte)
	vbox.add_child(texte2)
