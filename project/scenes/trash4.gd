extends StaticBody2D
@onready var area = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("PICK_UP") and area.has_overlapping_bodies():
		queue_free()
