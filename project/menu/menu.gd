extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/VBoxContainer/Start.grab_focus()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.get_action_strength("ESC"):
		get_tree().change_scene_to_file("res://scenes/node_2d.tscn")
	pass


func _on_exit_pressed():
	get_tree().quit()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/node_2d.tscn")


func _on_options_pressed():
	get_tree().quit()
