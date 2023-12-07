extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _get_drag_data(_at_position):
	print("button_tab_ui tried dragged")

func _can_drop_data(_at_position, _data):
	print("TODO : button_tab_ui")

func _drop_data(_at_position, _data):
	print("drop button_tab_ui")
