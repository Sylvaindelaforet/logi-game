extends Window
class_name WindowTransfo




func _on_transfo_clicked():
	var transfo_manger:Transformation = Transformation.get_transfo_manger()

	var inv = $InventaireUI

	inv = inv.get_current_inv()

	var stack = inv.get_all_stack_list()[0].stack_list[0]

	print_debug(stack)

	transfo_manger.transform($Player, [stack])



