extends Resource
class_name CondCarac


var carac_id:int
var op:int
var valeur_s


var chose
var masse
var volume


# valeur_s soit valeur, soit [up_bound, low_bound]
func _init(p_carac_id, p_op, p_valeur_s = []):
	carac_id = p_carac_id
	op = p_op
	valeur_s = p_valeur_s
	pass


func conforme(stack:Stack) -> bool:

	var valeur_carac = stack.get_carac(carac_id)	
	
	match op:
		OP.HAS:
			push_error("pas encore fait, à y réfléchir")
			return false
		OP.GREATER:
			return valeur_carac > valeur_s
		OP.GREATER_EQUAL:
			return valeur_carac >= valeur_s
		OP.LOWER:
			return valeur_carac < valeur_s
		OP.LOWER_EQUAL:
			return valeur_carac <= valeur_s
		OP.BETWEEN:
			return valeur_carac > valeur_s[0] and valeur_carac < valeur_s[1]
		OP.EQUAL:
			return valeur_carac == valeur_s

	push_error("problem, should not have reach this point, op is not from OP")
	return false














