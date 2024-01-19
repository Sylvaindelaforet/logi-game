extends Resource
class_name Reagent


# si les chose et caracs sont null alors on accepte n'importe quelle entrée
 
var chose:Chose

# une liste de condition :
var caracs_necessaires

# 
var ratio



func _init(p_chose = null, p_caracs_necessaires = [], p_ratio = 0.0):
	chose = p_chose
	caracs_necessaires = p_caracs_necessaires
	ratio = p_ratio




func conforme(stack:Stack) -> bool:
	
	var is_conforme:bool = true
	
	if chose != null:
		is_conforme = is_conforme and stack.chose.id == chose.id
	

	if caracs_necessaires != []:
		for cond in caracs_necessaires:
			is_conforme = is_conforme and cond.conforme(stack)

	return is_conforme








