extends TileMap
@onready var trash = $Node2D
@onready var timer =  $Timer
var keys = ["lvl_progress"]
signal progress_lvl(keys, count)
var prompts = ["lvl2_dead"]
signal lvl2_dead(prompts, count)
var called = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(Global.died):
		Global.died=false
		lvl2_dead.emit(prompts, 1)
	if Input.get_action_strength("ESC"):
		get_tree().change_scene_to_file("res://menu/menu.tscn")
		
	if trash.get_child_count()==0 and !called:
		timer.start()
		called = true
	


func _on_timer_timeout():
	progress_lvl.emit(keys, 1)


func _on_exit_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/cellar.tscn")
