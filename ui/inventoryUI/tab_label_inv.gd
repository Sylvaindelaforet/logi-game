class_name LabelInvTab
extends Label

enum {TOUT_PRENDRE, PRENDRE1}
var options_clic_droit:Array[String] = ["tout prendre", "prendre 1"]

var hud:Hud

# keeps what the button is associated to (stack or list stack)
var stack_or_list_stack



func _ready():
	hud = $/root/Main/HUD
	mouse_filter = Control.MOUSE_FILTER_PASS

func _gui_input(event):
	if event.is_action_pressed("clic_droit"):
		hud.popup_menu_asked.emit(options_clic_droit, self)

func chosen_action(option:int):
	match option:
		TOUT_PRENDRE:
			
			var inv = get_parent().get_parent().get_parent().get_current_inv()
			if stack_or_list_stack is StackList:
				$/root/Main/Player.get_inventaire().add_stack_list(stack_or_list_stack)
				inv.erase_stack_list(stack_or_list_stack)
			else:
				inv.erase_stack(stack_or_list_stack)
				$/root/Main/Player.get_inventaire().add_stack(stack_or_list_stack)
		PRENDRE1:
			if stack_or_list_stack is StackList:
				print("stack StackList")
			if stack_or_list_stack is Stack:
				print("Stack ")


func transfer_to_inv(new_inv):
	var current_inv = get_parent().get_parent().get_parent().get_current_inv()
	if stack_or_list_stack is StackList:
		new_inv.add_stack_list(stack_or_list_stack)
		current_inv.erase_stack_list(stack_or_list_stack)
	else:
		new_inv.add_stack(stack_or_list_stack)
		current_inv.erase_stack(stack_or_list_stack)



func _get_drag_data(_pos):
	return self


func _can_drop_data(_pos, data):
	return is_instance_of(data, LabelInvTab) and get_parent() != data.get_parent()


func _drop_data(_pos, _data):
	get_parent().get_parent()._drop_data(_pos, _data)

















