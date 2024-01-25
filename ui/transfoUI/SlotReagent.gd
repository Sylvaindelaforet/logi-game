extends PanelContainer
class_name SlotReagent

var stack_linked:Stack

func _ready():
	custom_minimum_size.y = 30


func _can_drop_data(_at_position, data):
	return is_instance_of(data, LabelInvTab) and data.stack_or_list_stack is Stack


func _clear():
	stack_linked = null
	for child in get_children():
		child.queue_free()


func _drop_data(_at_position, _data):
	_clear()
	var label = Label.new()
	stack_linked = _data.stack_or_list_stack
	stack_linked.removed_from_stack.connect(_on_removed_from_stack)
	label.text = stack_linked.get_array_string()[0]
	add_child(label)


func _on_removed_from_stack(_unused, _inutile):
	if stack_linked.is_empty():
		_clear()

