extends CharacterBody2D
class_name NPC


const SPEED = 300.0

var movement_speed: float = 300.0


@export var coffre:Coffre

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D



var max_health:float = 100
var max_hunger:float = 100
var max_thirst:float = 100
var max_endurance:float = 100

var health:float
var hunger:float
var thirst:float
var endurance:float


var task_manager:TaskManager

# fonctionnement des actions des personnages :
# le task manager a une liste de task avec des priorités, 
# 
# 




func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0
	task_manager = TaskManager.new(self)
	health = 100
	hunger = 100
	thirst = 100
	endurance = 100

# ## pour les déplacer par test
# func _unhandled_input(event):
# 	if event.is_action_pressed("clic_gauche"):
# 		var destination_position = get_global_mouse_position()
# 		set_movement_target(destination_position)


# clic droit pour tester ###############################################################
enum {LISTER_TASK, ADD_TASK, ACTIVATE_TASK}
var options_clic_droit:Array[String] = ["lister task", "add task", "activate task"]

func _input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("clic_droit"):
		$/root/Main/HUD.popup_menu_asked.emit(options_clic_droit, self)

func chosen_action(option:int):
	match option:
		LISTER_TASK:
			task_manager.print_task_list()
		ADD_TASK:
			task_manager.add_task_test()
		ACTIVATE_TASK:
			task_manager.next_task()

# fin clic droit pour tester ###############################################################

func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target


func _physics_process(_delta):
	
	if navigation_agent.is_navigation_finished():
		return
	
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	move_and_slide()


# eat food out of the stack in the array given
func increase_stat(stat):
	
	print("activated function eat : stat : ", stat)




## utilitaires

func get_inventaire():
	return($Inventaire)


