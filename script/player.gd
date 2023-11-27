extends CharacterBody2D
class_name Player

const SPEED = 300.0

var hud:CanvasLayer

func _ready():
	hud = $/root/Main/HUD

func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("gauche", "droite", "haut", "bas")
	velocity = direction * SPEED
	move_and_slide()

func _input(event):
	if event.is_action_pressed("open_inventory"):
		hud.display_inventory($InventairePlayer, true)

func get_inventaire():
	return $InventairePlayer
