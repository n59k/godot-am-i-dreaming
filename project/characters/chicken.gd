extends CharacterBody2D

enum CHICKEN_STATE { IDLE, WALK }
@export var move_speed : float = 20
@export var idle_time : float = 3
@export var walk_time : float = 2
@onready var _animated_sprite = $AnimatedSprite2D
@onready var timer = $Timer
var move_direction : Vector2 = Vector2.ZERO
var current_state : CHICKEN_STATE = CHICKEN_STATE.IDLE

func _ready():
	select_new_direction()
	pick_new_state()
	_animated_sprite.play("default")
	
func _physics_process(delta):
	if (current_state == CHICKEN_STATE.WALK):
		velocity = move_direction * move_speed
		move_and_slide()

# Random direction
func select_new_direction():
	move_direction = Vector2(
		randi_range(-1, 1),
		randi_range(-1, 1)
	)
	if 	(move_direction.x < 0):
		_animated_sprite.flip_h = true
	elif (move_direction.x > 0):
		_animated_sprite.flip_h = false
		
	
# Toggle state
func pick_new_state():
	if (current_state == CHICKEN_STATE.IDLE):
		current_state = CHICKEN_STATE.WALK
		select_new_direction()
		timer.start(walk_time)
	elif (current_state == CHICKEN_STATE.WALK):
		current_state = CHICKEN_STATE.IDLE
		timer.start(idle_time)
	

# Timer ends
func _on_timer_timeout():
	pick_new_state()
