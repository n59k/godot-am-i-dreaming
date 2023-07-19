extends CharacterBody2D

@export var speed : float = 70
var motion = Vector2.ZERO
var player = null
@onready var _animated_sprite = $AnimatedSprite2D
	
func _physics_process(delta):
	motion = Vector2.ZERO
	if player:
		velocity = (position.direction_to(player.position)) * speed 
		move_and_slide()

func _on_area_2d_body_entered(body):
	player = body	
	_animated_sprite.play("walk")
	if body==self:
		_animated_sprite.stop()

func _on_area_2d_body_exited(body):
	player = null
	_animated_sprite.stop()
