extends TileMap

@onready var character = $main_character
@onready var timer = $Timer
var prompts = ["lvl2_dead"]
signal lvl2_dead(prompts, count)
var entered = false

enum{
	MOVING,
	READING
}

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.get_action_strength("ESC"):
		get_tree().change_scene_to_file("res://menu/menu.tscn")
	if entered:
		character.move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		character.velocity = Vector2.DOWN * character.move_speed
		character.collision_layer
		character.state=READING
		character.z_index=-1
		timer.start()
		entered=true
	


func _on_timer_timeout():
	Global.died=true
	Global.hearts=Global.max_hearts
	get_tree().change_scene_to_file("res://scenes/node_2d.tscn")
	
#	entered=false
#	character.velocity=Vector2.ZERO
#	character.position=Vector2(362,473)
#	character.z_index=1
#	lvl2_dead.emit(prompts,1)
	


func _on_exit_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://scenes/level_1.tscn")
