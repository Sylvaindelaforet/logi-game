extends Resource
class_name Transformation


# TODO encore :
# value : [
#		[paramètre entrée (ex chaleur flamme ou exp personnage)],
#		[stacks_consommé * ratio],



enum {
	ON_ACTOR = -1,
	ON_ENVIRONMENT = -2,
}

# en entrée : 1 aliment
# en sortie : régen nourriture
static var transfo_manger = Transformation.new(
	"Manger",
	[
		Reagent.new(null, 1),
	], # en entrée n'importe quoi est bon (1 seul stack du coup)
	[
		Product.new(
			ON_ACTOR,
			1,
			{
				"regen_hunger" : ["get_valeur_marginale", 0, Carac.MANGER],
				"regen_thirst" : ["get_valeur_marginale", 0, Carac.BOIRE],
				"regen_hp" : ["get_valeur_marginale", 0, Carac.POISONED],
			},
		)
	],
)

static var func_durabilite_metal = func(cat_metal): return cat_metal * 100

# en entrée : 1 lingot d'un métal
# en sortie : 1 épée de ce même métal
static var transfo_forger_epee = Transformation.new(
	"Forger épée",
	[
		Reagent.new(Chose.DEFAULT[Chose.ID.LINGOT_FER], 1),
		Reagent.new(Chose.DEFAULT[Chose.ID.POMME], 1),
	], # en entrée métal supérieur à 0
	[
		Product.new(
			Chose.DEFAULT[Chose.ID.EPEE_FER],
			1,
			{
				Carac.METAL : ["get_carac_reagent", 0, Carac.METAL],
				Carac.DURABILITE : [func_durabilite_metal, ["get_carac_reagent", 0, Carac.METAL]]
			}
		)
	],
)











## liste des transfo de bases créées
static var DEFAULT = [
	transfo_manger,
	transfo_forger_epee,
]









var nom_transfo:String
var parametres_entree = []
var parametres_sortie = []


func _init(p_nom_transfo:String, entres:Array[Reagent], sorties:Array[Product]):
	nom_transfo = p_nom_transfo
	parametres_entree = entres
	parametres_sortie = sorties


## transformateur en général = joueur
func transform(actor, stacks_entree):

	var array = []

	var param = parametres_entree.duplicate()
	# check if stacks are ok for transfo
	for i in range(len(stacks_entree)):
		if not param[i].conforme(stacks_entree[i]):
			return array


	# calculer le réactif limitant
	var res = calc_reactif_limitant(stacks_entree)
	var reagent_limitant = res[0]
	var ratio_quantite = res[1]

	# si il y a des dénombrables --> que des ratio entier
	if denombrable_in_transfo():
		ratio_quantite = int(ratio_quantite / reagent_limitant.get_ratio())
	else:
		ratio_quantite = ratio_quantite / reagent_limitant.get_ratio()

	# on crée les stacks en sortie

	for prod in parametres_sortie:
		array.append(prod.produce(actor, ratio_quantite, stacks_entree))

	# on enlève les réactifs consommés
	
	for i in range(len(stacks_entree)):
		stacks_entree[i].remove(ratio_quantite * parametres_entree[i].ratio)
	
	return array


## returns true if dénombrable in transfo
func denombrable_in_transfo():
	for entre in parametres_entree:
		if entre.is_denombrable():
			return true
	for sortie in parametres_sortie:
		if sortie.is_denombrable():
			return true
	return false


## calcul le réactif limitant avec le quotient
func calc_reactif_limitant(stack_entree:Array):
	var i = 0
	var stack_limitant = stack_entree[i]
	var quantite_max = stack_limitant.get_quantite() / parametres_entree[i].get_ratio()
	var reagent_limitant = parametres_entree[i]

	var quantite_stack
	i += 1
	while i < len(stack_entree):
		i += 1
		quantite_stack = stack_entree[i].get_quantite() / parametres_entree[i].get_ratio()
		if quantite_max < quantite_stack:
			reagent_limitant = parametres_entree[i]
			stack_limitant = stack_entree[i]
			quantite_max = quantite_stack
	return [reagent_limitant, quantite_max]


## a delete
static func get_transfo_manger():
	return transfo_manger
	












