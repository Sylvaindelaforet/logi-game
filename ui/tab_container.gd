extends TabContainer
class_name Tab


func _can_drop_data(_pos, data):
	return is_instance_of(data, TabInventaire)

func _drop_data(_pos, data):
	data.reparent(self)
