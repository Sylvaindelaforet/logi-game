extends HBoxContainer
class_name TabBarUI

func _can_drop_data(_at_position, data):
	return is_instance_of(data, TabButton)

func _drop_data(_at_position, _data):
	print(_data.size)
	print("drop button_tab_ui", _at_position)
	_data.reparent(self)
