extends Area2D
var keys = ["spikes1"]
signal spikes (keys, count)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		spikes.emit(keys, 1)
		queue_free()
		
