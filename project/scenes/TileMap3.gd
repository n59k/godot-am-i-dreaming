extends TileMap

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.get_action_strength("ESC"):
		get_tree().change_scene_to_file("res://menu/menu.tscn")
