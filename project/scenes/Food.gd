extends StaticBody2D
@onready var area = $Area2D
var keys = ["food_eaten1", "food_eaten2"]
signal food_eaten(keys, count)


# Called when the node enters the scene tree for the first time.
func _ready():
	input_pickable=true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("PICK_UP") and area.has_overlapping_bodies():
		food_eaten.emit(keys, 2)
		queue_free()



func _on_area_2d_area_entered(area):
	pass


func _on_area_2d_body_entered(body):
	pass
	
