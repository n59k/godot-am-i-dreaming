extends Area2D
var prompts = ["lvl3_exit"]
signal finall (prompts, count)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		finall.emit(prompts, 1)
		queue_free()
		
