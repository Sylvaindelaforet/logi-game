extends Node
class_name Inventaire

# chose -> masse / nombre
var p_ressources:Dictionary

func print_inventory():
	print("print de l'inventaire : ")
	for p_ressource in p_ressources:
		print(p_ressource, " : ", p_ressources[p_ressource] )

func add_ressource(chose:Chose, quantite:float):
	if p_ressources.has(chose):
		p_ressources[chose] = p_ressources[chose] + quantite
	else:
		p_ressources[chose] = quantite

