extends CharacterBody2D
class_name Player

const SPEED = 300.0

var running:float

var hud:Hud

var inventaire:Inventaire

func _ready():
	hud = $/root/Main/HUD
	inventaire = $InventairePlayer
	hud.add_player_inventaire(inventaire)
	running = 1.0
	TasksTests.super_test()


func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("gauche", "droite", "haut", "bas")
	velocity = direction * SPEED * running
	move_and_slide()


func _input(event):
	if event.is_action_pressed("run"):
		running = 1.5
	if event.is_action_released("run"):
		running = 1
	if event.is_action_pressed("open_inventory"):
		hud.display_inventory()


func get_inventaire():
	return $InventairePlayer



