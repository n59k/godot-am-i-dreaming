extends Area2D
var keys = ["outro1", "outro2", "outro3", "outro4"]
signal outro_prompt(keys, count)


# Called when the node enters the scene tree for the first time.
func _ready():
	self.outro_prompt
	outro_prompt.emit(keys, 4)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	self.outro_prompt
	pass


func _on_body_entered(body):
	print("penis")
	outro_prompt.emit(keys, 4)


func _on_label_release_player():
	queue_free()
