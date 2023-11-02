extends CanvasLayer

signal display_popup_menu(pos:Vector2)

var menu:PopupMenu

func _ready():
	display_popup_menu.connect(test_signal)
	print($PopupMenu)
	menu = $ClicDroit

func _create_popup():
	var menu:PopupMenu = PopupMenu.new()
	menu.add_item("coucou")
	menu.visible = true


func test_signal(pos:Vector2):
	menu.clear()
	menu.position = pos
	menu.add_item("option 1")
	menu.visible = true
	menu.add_item("option 2")

