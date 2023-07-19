extends Area2D

const RIGHT = Vector2.RIGHT
@export var speed : float = 200

func _physics_process(delta):
	var movement = RIGHT.rotated(rotation) * speed * delta
	global_position += movement
	
func _destroy():
	queue_free()

#func _on_visible_on_screen_notifier_2d_screen_entered():
#	pass # Replace with function body.
#
#func _on_visible_on_screen_notifier_2d_screen_exited():
#	queue_free()
#
#func _on_body_entered(body):

#	if body.is_in_group("Player"):
#		_destroy()

#func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
#
#	if body.is_in_group("Player"):
#		_destroy()

func _on_area_entered(area):
	if area.is_in_group("skip"): 
		return
	if !area.is_in_group("attack"):
		_destroy()
