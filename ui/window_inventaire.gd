extends Window
class_name Window_inventaire

var tabcontainer:TabContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	tabcontainer = $ColorRect/HBoxContainer/PanelContainer/TabContainer

func create_tab(inventaire:Inventaire):
	var scrollbar = ScrollContainer.new()
	var grid:GridContainer = GridContainer.new()
	grid.columns = 3
	tabcontainer.add_child(scrollbar)
	scrollbar.add_child(grid)
	scrollbar.name = inventaire.get_name()
	# add items
	inventaire.create_tab(grid)

func _notification(blah):
	match blah:
		NOTIFICATION_WM_MOUSE_EXIT:
			print('Mouse left window')
		NOTIFICATION_WM_MOUSE_ENTER:
			print('Mouse entered window')


func _on_focus_exited():
	print("focus exited")

func _on_focus_entered():
	print("focus entered")

func _on_mouse_exited():
	print("mouse exited")

func _on_mouse_entered():
	print("mouse entered")
