extends Object
class_name TasksTests


# a task is a list of action
# [priority €[0, 9], liste d'action ?, task_ensuite]

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








