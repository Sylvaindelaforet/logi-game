extends Resource
class_name Ressources

const ChoseGen = preload("res://objets/chose.gd")

static var data = {
	"id_pomme" = ChoseGen.new("id_pomme", "pomme", true, 0.84),
	"id_farine_ble" = ChoseGen.new("id_farine de blé", "farine de blé", false, 0.5), 
	"id_graines_ble" = ChoseGen.new("id_graines de blé", "graines de blé", false, 0.4), # masse volumique ???
	"id_eau" = ChoseGen.new("id_eau", "eau", false, 1),
	"id_jus" = ChoseGen.new("id_jus", "jus", false, 1),
}

