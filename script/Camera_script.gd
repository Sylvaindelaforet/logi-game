extends Camera2D

signal display_popup_menu(pos:Vector2)

var menu:PopupMenu

func _ready():
	display_popup_menu.connect(test_signal)
	menu = $ClicDroit

#func _process(_delta):
#	print(get_child_count())

func test_signal(pos:Vector2):
	menu.clear()
	print(get_viewport_transform().origin)
	menu.position = pos + get_viewport_transform().origin
	print(pos - get_viewport_transform().origin)
	menu.add_item("option 1")
	menu.visible = true
	menu.add_item("option 2")

