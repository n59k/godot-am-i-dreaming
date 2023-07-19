extends StaticBody2D

var pushed = false
@onready var _collision_shape = $CollisionShape2D
@onready var _animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if pushed == true:
		_animated_sprite.frame = 3
		_collision_shape.disabled = true
	else:
		_collision_shape.disabled = false

func _on_pressure_plate_pressure_plate_pushed(state):
	pushed = state
