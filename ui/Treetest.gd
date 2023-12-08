extends Tree


# Called when the node enters the scene tree for the first time.
func _ready():
	var root = create_item()
	hide_root = true
	var child1 = create_item(root)
	child1.set_text(0, "chose")
	#var child2 = create_item(root)
	var subchild2 = create_item(child1)
	subchild2.set_text(0, "Subchild1")

