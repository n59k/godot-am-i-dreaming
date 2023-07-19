extends Area2D
var keys = ["intro_wall",]
signal intro_wall_prompt(keys, count)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	intro_wall_prompt.emit(keys, 1)


func _on_tile_map_progress_lvl(_keys, _count):
	queue_free()
