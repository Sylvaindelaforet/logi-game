extends Node2D


signal open_pop_up_menu

@export var hud:CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	hud = get_node("HUD")



