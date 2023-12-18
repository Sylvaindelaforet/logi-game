class_name Coffre
extends StaticBody2D

var hud:Hud

var inventaire:Inventaire

enum {OUVRIR, AJOUTER_POMME, AJOUTER_GROSSE_POMME}
var options_clic_droit:Array[String] = ["ouvrir", "ajouter 3 pomme", "ajouter grosse pomme"]

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
			inventaire.add_stack(Stack.new(Ressources.data["id_pomme"], {0.145 : 3}))
		AJOUTER_GROSSE_POMME:
			inventaire.add_stack(Stack.new(Ressources.data["id_pomme"], {0.200 : 1}))

func _on_screen_entered():
	hud.add_inventaire_visible(inventaire)

func _on_screen_exited():
	hud.remove_inventaire_visible(inventaire)
