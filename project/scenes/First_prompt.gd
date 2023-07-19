extends Area2D
var keys = ["intro1", "intro2"]
signal intro_prompt(keys, count)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	intro_prompt.emit(keys, 2)
	queue_free()



