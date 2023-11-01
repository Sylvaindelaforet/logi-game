extends StaticBody2D


@export var liste_choses:Array[Ressource]

var hud:CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	hud = $/root/Main/HUD
	if hud == null:
		print("HUD missing")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input_event(_viewport, event, _shape_idx):
	if event.is_action("clic_droit"):
		print("ok")
		var pos: Vector2 = get_global_mouse_position()
		hud.display_popup_menu.emit(pos)
