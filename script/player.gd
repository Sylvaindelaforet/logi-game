extends CharacterBody2D
class_name Player

const SPEED = 300.0

var running:float

var hud:Hud

var inventaire:Inventaire


var max_health:float = 100
var max_hunger:float = 100
var max_thirst:float = 100
var max_endurance:float = 100

var health:float
var hunger:float
var thirst:float
var endurance:float



func _ready():
	hud = $/root/Main/HUD
	inventaire = $InventairePlayer
	hud.add_player_inventaire(inventaire)
	running = 1.0
	health = 80
	hunger = 65
	thirst = 65
	endurance = 50


func _process(_delta):
	hud.set_bar(health, hunger, thirst)


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


func regen_hunger(valeur):
	hunger += valeur
	if hunger > max_hunger:
		hunger=max_hunger


func regen_thirst(valeur):
	thirst += valeur
	if thirst > max_thirst:
		thirst = max_thirst


func regen_hp(valeur):
	health += valeur
	if health > max_health:
		health = max_health


