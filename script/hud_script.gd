extends CanvasLayer

signal display_popup_menu(pos:Vector2)


func _ready():
	display_popup_menu.connect(test_signal)


func _create_popup():
	var menu:PopupMenu = PopupMenu.new()
	menu.add_item("coucou")
	menu.visible = true


func test_signal(pos:Vector2):
	print("essai réussi")
	print(pos)
