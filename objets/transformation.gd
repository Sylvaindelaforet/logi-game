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
#		[paramètre entrée (ex chaleur flamme ou exp personnage)],
#		[stacks_consommé * ratio],
#		[stacks_produits * ratio],
#		[carac utiles],
#		[changement stats/propr personnage],
#		[],
#		[],
#	]





static var transfo_pomme = {
	INGERER : [[], [], [], []]
}

static var default_transfo = {
	# ingérer renvoie les valeurs
	INGERER : [[], [], [], []]
}


# fonction qui "se contente" de lire les éléments d'une transfrormation
# type_transfo et renvoie le(s) produit(s)* 
static func transformer(type_transfo, stack_cible, parametres, acteur):
	
	if false:
		pass
	else:
		# utiliser options par défaut de la transfo
		var liste = default_transfo[type_transfo]
		var necessites = liste[0]
		var consommation = liste[1]
		var produits = liste[2]
		var changement_personnage = liste[3]
		
		for elts in changement_personnage:
			pass
		acteur.change_stats
		pass
	




# fonctionnement : chaque objet a des transformations possibles
# décrites dans des dico spécialisé pour la chose
# il y a un dico pour décrire le 





