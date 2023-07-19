extends CharacterBody2D

@export var move_speed : float = 100
@onready var _animated_sprite = $AnimatedSprite2D
@onready var _sound_swing = $Sound_swing
@onready var _sound_walk = $Sound_walk
@onready var _attack_right_col = $Attack_right/CollisionShape2D
@onready var _attack_left_col = $Attack_left/CollisionShape2D
@onready var _attack_up_col = $Attack_up/CollisionShape2D
@onready var _attack_down_col = $Attack_down/CollisionShape2D
@onready var attack_timer = $Timer
@onready var stun_timer: Timer = $StunTimer
var past_dir = null
var move = true
var state = MOVING
var normal_speed = move_speed
var slow_speed := move_speed / 2
#signal pick_up
#var picking_up = false
enum {
	MOVING,
	READING
}

func _ready():
	_animated_sprite.play("idle_down")
	past_dir = "DOWN"
	_attack_right_col.disabled = true
	_attack_left_col.disabled = true
	_attack_up_col.disabled = true
	_attack_down_col.disabled = true

func _physics_process(delta):
#	print(_attack_right_col.disabled)
	# Get input direction 
	if (state==MOVING):
		var input_direction = Vector2(
			Input.get_action_strength("RIGHT") - Input.get_action_strength("LEFT"),
			Input.get_action_strength("DOWN") - Input.get_action_strength("UP")
		).normalized()
			
		# Walk
		if move and Input.is_action_pressed("LEFT"):
			_animated_sprite.play("walk_side")
			_animated_sprite.flip_h = false
			past_dir = "LEFT"
		elif move and Input.is_action_pressed("RIGHT"):
			_animated_sprite.play("walk_side")
			_animated_sprite.flip_h = true
			past_dir = "RIGHT"
		elif move and Input.is_action_pressed("UP"):
			_animated_sprite.play("walk_up")
			past_dir = "UP"
		elif move and Input.is_action_pressed("DOWN"):
			_animated_sprite.play("walk_down")
			past_dir = "DOWN"	
		if Input.is_action_pressed("DOWN") or Input.is_action_pressed("UP") \
		or Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT"):
			if !_sound_walk.is_playing():
				_sound_walk.play()
			
		# Attack
		if Input.is_action_just_pressed("ATTACK") and past_dir=="DOWN" and move == true:
			_attack_down_col.disabled = false
			_animated_sprite.play("attack_down")
		elif Input.is_action_just_pressed("ATTACK") and past_dir=="UP" and move == true:
			_attack_up_col.disabled = false
			_animated_sprite.play("attack_up")
		elif Input.is_action_just_pressed("ATTACK") and past_dir=="LEFT" and move == true:
			_attack_left_col.disabled = false
#			print(_attack_left_col.disabled)
#			print(_attack_right_col.disabled)
			_animated_sprite.play("attack_side")
			_animated_sprite.flip_h = false
		elif Input.is_action_just_pressed("ATTACK") and past_dir=="RIGHT" and move == true:
			_attack_right_col.disabled = false
#			print(_attack_left_col.disabled)
#			print(_attack_right_col.disabled)
			_animated_sprite.play("attack_side")
			_animated_sprite.flip_h = true
		if Input.is_action_just_pressed("ATTACK"):
			if move == true:
				_sound_swing.play()
				attack_timer.start(0.5)
				move = false
				move_speed = slow_speed				
			
		# No movement
		if !Input.is_action_pressed("DOWN") and !Input.is_action_pressed("UP") \
		and !Input.is_action_pressed("LEFT") and !Input.is_action_pressed("RIGHT") \
		and _animated_sprite.animation != "pick_up" and move == true:
			_on_animated_sprite_2d_animation_finished()
			
		# Pick up
		if Input.is_action_just_pressed("PICK_UP"):
			_animated_sprite.play("pick_up")
	#		picking_up = true
		
		# Update velocity
		velocity = input_direction * move_speed
		move_and_slide()
	else:
		_on_animated_sprite_2d_animation_finished()

func _on_animated_sprite_2d_animation_finished():	
	_sound_walk.stop()
	# Idle
	if past_dir == "DOWN":
		_animated_sprite.play("idle_down")
	elif past_dir == "UP":
		_animated_sprite.play("idle_up")
	elif past_dir == "LEFT":
		_animated_sprite.play("idle_side")
		_animated_sprite.flip_h = false
	elif past_dir == "RIGHT":
		_animated_sprite.play("idle_side")
		_animated_sprite.flip_h = true
	move = true
#	if picking_up == true:
#		picking_up = false
#		emit_signal("pick_up")
	move_speed = normal_speed

#func stun(duration: = 1)->void:
#	stun_timer.wait_time = duration
#	stun_timer.start()
#
#func knock_back(direction: Vector2)->void:
#	var distance = 20
#	var tween = create_tween()
#	tween.tween_property(self, "position", position + direction * distance, 0.3)
#
#func _on_hitbox_area_entered(area):
#	var knock_direction = (position - area.position).normalized()
#	stun()
#	knock_back(knock_direction)

func _on_timer_timeout():
#	print("STOPEEEED")
	_attack_right_col.disabled = true
	_attack_left_col.disabled = true
	_attack_up_col.disabled = true
	_attack_down_col.disabled = true
