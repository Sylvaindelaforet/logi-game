extends CharacterBody2D


const SPEED = 300.0

#func _process(delta):


func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("gauche", "droite", "haut", "bas")
	velocity = direction * SPEED
	move_and_slide()