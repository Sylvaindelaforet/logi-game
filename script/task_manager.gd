extends Resource
class_name TaskManager

# a task is a list of action
# [priority €[0, 9], task_tree see below]
var _task_list:Array

# current task and its ramification (task_tree)
var _current_task

const CONDITIONAL_MIN_ID = 30

var _npc_body:NPC


# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????
# POURQUOI IL N'y A PAS DE CLASSE TASK ????



# actions (atomique) possibles NPC :
# - se déplacer vers position
# - exploiter poste de travail
# - interagir avec inventaire
# - interagir avec objets dans inventaire (ou pas)

# par exemple se nourir : 
# check inv -> manger depuis inv
# 			-> check inv maison -> déplacer maison -> manger depuis inv
#								-> acheter bouffe

# acheter bouffe serait alors une nouvel arbre = Task_complex

# 30 - 39 -> conditional with 2 possible following node
# 40 - 49 -> conditional with +2 possible following node

# enum Actions (voir ci dessus)
enum {MOVE_TO, MOVE_TO_CHEST, EAT, CHECK_INVENTORY = CONDITIONAL_MIN_ID}


#static var une_pomme = Stack.new(Ressources.Choses[Ressources.ID.POMME], {0.145: 1})

# un arbre de noeud c'est : [Action ID, [parameters], following action ]
# pour conditional : [Action ID, [parameters], [followings ations] ]
static var task_npc_nourrir = [
	CHECK_INVENTORY, ["self", [Chose.ID.POMME]],
		[
			[EAT, ["self", [Chose.ID.POMME]], []],
			[CHECK_INVENTORY, ["at_home", null], [[],[]]]
		]
	]

# TODO faut faire des tests pour voir si ça marche les task
static var task_only_chest = [
	MOVE_TO_CHEST, [], []
]

func _init(p_npc_body = null):
	if p_npc_body == null:
		print_debug("npc_body not initialized in TaskManager")
	_npc_body = p_npc_body
	_current_task = []


# add task
func add_task(priority:int, task):
	var temporary_list = []
	while _task_list != []:
		if _task_list[0][0] <= priority:
			temporary_list.append([priority, task])
			_task_list = temporary_list + _task_list
			return
		temporary_list.append(_task_list.pop_front())
	temporary_list.append([priority, task])
	_task_list = temporary_list


func next_task():
	if _task_list.is_empty():
		return true
	_current_task = _task_list[0][1]
	execute_current_task()

 
func execute_current_task():
	var action_id = _current_task[0]
	var parameters = _current_task[1]
	var following_action = _current_task[2]
	
	if _current_task == []:
		return false
	
	match action_id:
		MOVE_TO:
			_npc_body.set_movement_target(parameters[0])
		MOVE_TO_CHEST:
			_npc_body.set_movement_target(_npc_body.coffre.position)
			print("Action move to chest ACTIVATED to pos : ", _npc_body.coffre.position)
		EAT:
			print_debug("TODO : EAT")
			next_action()
		CHECK_INVENTORY:
			var inv = parameters[0]
			var caracteristiques = parameters[1]
			if inv == "self":
				inv = _npc_body.get_inventaire()
			var list_compatible:Array = inv.has_compatible(caracteristiques)
			if not list_compatible.is_empty() :
				next_action(following_action[0])
			else:
				next_action(following_action[1])


# lance l'exécution de la prochaine action de la task
# si la task est finie, lance la prochaine task
# lance l'action en paramètre si donnée
func next_action(following_action = null):
	var following = _current_task[2]
	if following_action != null:
		following = following_action

	if following == []:
		_current_task = []
		_task_list.pop_front()
		next_task()
	else:
		_current_task = following
		execute_current_task()


func print_task_list():
	print(_task_list)


#### TODO DELETE EN DESSOUS
func add_task_test():
	add_task(9, task_only_chest)




