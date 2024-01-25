extends Resource
class_name Reagent


# si les chose et caracs sont null alors on accepte n'importe quelle entrée
 
var chose:Chose

# une liste de condition : CondCarac
var caracs_necessaires

# 
var ratio



func _init(p_chose, p_ratio, p_caracs_necessaires = []):
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


func get_ratio():
	return ratio


func is_denombrable():
	if chose is Chose:
		return chose.is_denombrable
	return







