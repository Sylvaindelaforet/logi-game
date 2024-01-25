extends PanelContainer
class_name SlotReagent

func _ready():
	custom_minimum_size.y = 30

func _can_drop_data(_at_position, data):
	return is_instance_of(data, LabelInvTab)



func _drop_data(_at_position, _data):
	var label = Label.new()
	label.text = "super génial"
	add_child(label)



