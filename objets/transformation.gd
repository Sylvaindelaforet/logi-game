extends Resource
class_name Tranformations

#le nom de la transformation
@export var nom:String =""

enum {
	INGERER,
	BRULER,
	FONDRE,
	BROYER,
	ENTERRER
}


# ci dessous : à réfléchir pour les stacks consommés
# value : [
#		[carac_id],
#		[paramètre entrée (ex chaleur flamme ou exp personnage)],
#		[stacks_consommé * ratio],
#		[stacks_produits * ratio],
#		[carac utiles],
#		{stats/propr personnage : changement},
#		[],
#		[],
#	]

# ATTENTION je suis trop CON j'ai pas pensé qu'on peut genre
# forger du fer en 1 épée ou 2 dagues




static var transfo_pomme = {
	INGERER : [[], [], [], []]
}

static var default_transfo = {
	# ingérer renvoie les valeurs
	INGERER : [[Ressources.Carac.MANGER, Ressources.Carac.BOIRE, Ressources.Carac.POISONED], [], [], []]
}


# fonction qui "se contente" de lire les éléments d'une transfrormation
# type_transfo et renvoie le(s) produit(s)* 
static func transformer(type_transfo, parametres, stack_cible:Stack, acteur:NPC):
	
	if type_transfo == INGERER:
		acteur.health = acteur.health - stack_cible.get_carac(Ressources.Carac.POISONED) * stack_cible.masse_stack
		if acteur.health > acteur.max_health:
			acteur.health = acteur.max_health
		
		acteur.hunger = acteur.hunger + stack_cible.get_carac(Ressources.Carac.MANGER) * stack_cible.masse_stack
		if acteur.hunger > acteur.max_hunger:
			acteur.hunger = acteur.max_hunger
		
		acteur.thirst = acteur.thirst + stack_cible.get_carac(Ressources.Carac.BOIRE) * stack_cible.masse_stack
		if acteur.thirst > acteur.max_thirst:
			acteur.thirst = acteur.max_thirst
		
		acteur.endurance = acteur.endurance + stack_cible.get_carac(Ressources.Carac.VITAMINES) * stack_cible.masse_stack
		if acteur.endurance > acteur.max_endurance:
			acteur.endurance = acteur.max_endurance
		return
	
	
	if false:
		pass
	else:
		# utiliser options par défaut de la transfo
		var liste = default_transfo[type_transfo]
		var caracs_ids = liste[0]
		var carac = []
		
		for id in caracs_ids:
			carac.append(stack_cible.get_carac(id))
		
		var necessites = liste[1]
		var consommation = liste[2]
		var produits = liste[3]
		var changement_personnage = liste[4]
		
		
		for elts in changement_personnage:
			pass
		acteur.change_stats
		pass
	




# fonctionnement : chaque objet a des transformations possibles
# décrites dans des dico spécialisé pour la chose
# il y a un dico pour décrire le 


var parametres_entree = []
var parametres_sortie = []
var entrees



# ci dessous : à réfléchir pour les stacks consommés
# value : [
#		[carac_id],
#		[paramètre entrée (ex chaleur flamme ou exp personnage)],
#		[stacks_consommé * ratio],
#		[stacks_produits * ratio],
#		[carac utiles],
#		{stats/propr personnage : changement},
#		[],
#		[],
#	]






















