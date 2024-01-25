extends StaticBody2D
class_name House

func _on_body_exited(body):
	if body is Player:
		$Exterieur.show()

func _on_body_entered(body):
	if body is Player:
		$Exterieur.hide()