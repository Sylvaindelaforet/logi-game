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

static var transfo_manger = Transformation.new(
	"Manger",
	[
		Reagent.new(null, null),
	], # en entrée n'importe quoi est bon (1 seul item du coup)
	[
		Product.new(
			ON_ACTOR,
			{
				"regen_hunger" : ["get_valeur_marginale", 0, Carac.MANGER],
				"regen_thirst" : ["get_valeur_marginale", 0, Carac.BOIRE],
				"regen_hp" : ["get_valeur_marginale", 0, Carac.POISONED],
			},
		)
	],
)


static var transfo_forger_epee = Transformation.new(
	"Forger épée",
	[
		Reagent.new(null, CondCarac.new(Carac.METAL, OP.GREATER_EQUAL, 1), 1)
	], # en entrée métal supérieur à 0
	[
		Product.new(
			Chose.DEFAULT[Chose.ID.EPEE_FER],
			{
				"set_carac" : [Carac.METAL, ["get_carac_reagent", 0, Carac.METAL]]
			},
			{
				0 : 1
			}
			)
	], # en sortie il n'existe plus rien
)

#
#static var transfo_forger_epee_fer = Tranformation.new(
	#"Forger épée en fer",
	#[
		#Reagent.new(Chose.ID.FER, null, [Chose.CARAC_ID.METAL])
	#], # en entrée métal supérieur à 0
	#[
		#"epee", "avec solidité et dégâts dépend des caracs métal"
	#], # en sortie il n'existe plus rien
#)


#static var transfo_forger_dague = Tranformation.new(
	#[Reagent.new("test")], # en entrée n'importe quoi est bon (1 seul item du coup)
	#["dague", "avec solidité et dégâts dépend des caracs métal"], # en sortie il n'existe plus rien
	#{"NPC" : ["increase_stat +20xp"]}
#)



var nom_transfo:String
var parametres_entree = []
var parametres_sortie = []


func _init(p_nom_transfo:String, entres:Array[Reagent], sorties:Array[Product]):
	nom_transfo = p_nom_transfo
	parametres_entree = entres
	parametres_sortie = sorties



# transformateur en général = joueur
func transform(actor, stacks_entree):

	var array = []

	for elts in parametres_sortie:
		array.append(elts.produce(actor, stacks_entree))
	
	# TODO détruire les éléments en entrée

	return array
	


static func get_transfo_manger():
	return transfo_manger
	


