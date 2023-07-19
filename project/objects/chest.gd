extends StaticBody2D

var closed = true
var in_area = false
var prompts = ["lvl3_key"]
signal key_found(prompts, count)
@onready var _animated_sprite = $AnimatedSprite2D
@onready var _opening_sound = $Opening_sound

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		in_area = true	

func _physics_process(delta):
	if closed == true and in_area == true and \
	Input.is_action_just_pressed("PICK_UP"):
		_animated_sprite.play("default")
		_opening_sound.play()
		key_found.emit(prompts, 1)
		closed = false

func _on_area_2d_body_exited(body):
	in_area = false
