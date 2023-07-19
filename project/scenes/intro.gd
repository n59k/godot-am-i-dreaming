extends Area2D
var keys = ["lvl2_intro"]
signal lvl2_intro (keys, count)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	lvl2_intro.emit(keys, 1)
	queue_free()
