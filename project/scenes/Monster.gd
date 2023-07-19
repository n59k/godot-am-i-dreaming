extends AnimatableBody2D
@export var speed = 80
@export var velocity = Vector2.ZERO


	

func _physics_process(delta):
	sync_to_physics = false
	move_and_collide(velocity * delta)

func _on_monster_activate_body_entered(body):
	velocity = Vector2(1,0) * speed


func _on_canvas_layer_visibility_changed():
	pass # Replace with function body.
