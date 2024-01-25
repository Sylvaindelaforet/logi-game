class_name Coffre
extends StaticBody2D

var hud:Hud

var inventaire:Inventaire

enum {OUVRIR, AJOUTER_POMME, AJOUTER_UNE_POMME}
var options_clic_droit:Array[String] = ["ouvrir", "ajouter 3 pomme", "ajouter 1 lingot de fer"]




func _ready():
	inventaire = $Inventaire
	hud = $/root/Main/HUD
	if $VisibleOnScreenEnabler2D.is_on_screen():
		_on_screen_entered()


func _deny_region():
	var nav_region:NavigationRegion2D = $/root/Main/NavRegion
	var nav_pol:NavigationPolygon = nav_region.navigation_polygon
	var array = [position + Vector2(-60, -60), position + Vector2(-60, 60),
		position + Vector2(60, 60), position + Vector2(60, -60)]
	var outline = PackedVector2Array(array)
	nav_pol.add_outline(outline)
	nav_region.bake_navigation_polygon()
	print("area denied ? : ", outline)


func _input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("clic_droit"):
		hud.popup_menu_asked.emit(options_clic_droit, self)


func chosen_action(option:int):
	match option:
		OUVRIR:
			hud.display_inventory(inventaire)
		AJOUTER_POMME:
			inventaire.add_new_stack(Chose.DEFAULT[Chose.ID.POMME], 3)
		AJOUTER_UNE_POMME:
			inventaire.add_new_stack(Chose.DEFAULT[Chose.ID.LINGOT_FER], 1)

			# var stack = Stack.new(Chose.DEFAULT[Chose.ID.LINGOT_FER], 1)
			# var transfo_forger:Transformation = Transformation.transfo_forger_epee
			# var produced = transfo_forger.transform($/root/Main/Player, [stack]) 
			# print(produced)



func _on_screen_entered():
	hud.add_inventaire_visible(inventaire)


func _on_screen_exited():
	hud.remove_inventaire_visible(inventaire)



