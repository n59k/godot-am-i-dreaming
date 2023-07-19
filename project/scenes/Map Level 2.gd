extends TileMap

var has_key=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.get_action_strength("ESC"):
		get_tree().change_scene_to_file("res://menu/menu.tscn")


func _on_exit_body_entered(body):
	if body.is_in_group("Player") and has_key:
		get_tree().change_scene_to_file("res://scenes/school_lvl.tscn")


func _on_chest_key_found(prompts, count):
	has_key=true
