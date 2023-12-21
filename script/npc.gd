extends CharacterBody2D
class_name NPC

const SPEED = 300.0

var movement_speed: float = 300.0

@export var position_initiale:Vector2

@export var coffre:Coffre

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D


var task


func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0
	position_initiale = position
	task = TasksTests.task_npc_nourrir


func _unhandled_input(event):
	if event.is_action_pressed("clic_gauche"):
		var destination_position = get_global_mouse_position()
		set_movement_target(destination_position)


func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target


func _physics_process(_delta):
	if navigation_agent.is_navigation_finished():
		return
	
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	move_and_slide()


func go_to_coffre():
	set_movement_target(coffre.position)


func go_back():
	set_movement_target(position_initiale)



func read_task():
	match task[0]:
		TasksTests.MOVE_TO:
			pass
		TasksTests.EAT:
			pass
		TasksTests.CHECK_INVENTORY:
			pass













