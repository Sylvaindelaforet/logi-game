extends Object
class_name TaskManager

# a task is a list of action
# [priority €[0, 9], task_tree see below]
var task_list

# actions possibles NPC :
# - déplacer à position finale
# - exploiter poste de travail
# - interagir avec chose dans inventaire
# - interagir avec objets
# - vérifier possession objet dans inventaire

# par exemple se nourir peut être : 
# check inv -> manger depuis inv
# 			-> check inv maison -> déplacer maison -> manger depuis inv
#								-> acheter bouffe

# acheter bouffe serait alors une nouvel arbre = Task_complex

# 30 - 39 -> conditional with 2 possible following node
# 40 - 49 -> conditional with +2 possible following node
enum {MOVE_TO, EAT, CHECK_INVENTORY = 30}


static var une_pomme = Stack.new(Ressources.data["id_pomme"], {0.145: 1})

# un arbre de noeud c'est : [Action ID, [parameters], following node or if conditional [followings nodes] ]

static var task_npc_nourrir = [
	CHECK_INVENTORY, ["self", une_pomme],
		[
			[EAT, ["self", Stack.new(Ressources.data["id_pomme"], {0.145: 1})]],
			[CHECK_INVENTORY, "at_home", une_pomme]
		]
	]


# add task
func add_task(task):
	var temporary_list = []
	while task_list != []:
		if task_list[0][0] <= task[0]:
			temporary_list.append(task)
			task_list = temporary_list + task_list
			return
		temporary_list.append(task_list.pop_front())
	temporary_list.append(task)
	task_list = temporary_list







