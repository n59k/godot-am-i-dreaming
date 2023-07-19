extends CharacterBody2D

@export var speed : int = 200
@onready var bullet = preload("res://characters/bullet.tscn")
@export var max_health : float = 1
var health : float = max_health
var player = null
@onready var _animated_sprite = $AnimatedSprite2D
@onready var ray_cast = $RayCast2D
@onready var reload_timer = $RayCast2D/ReloadTimer
@onready var shoot_sound = $AudioStreamPlayer

func _ready():
	player = find_target()
	_animated_sprite.flip_v = false
	_animated_sprite.flip_h = true
	
func _physics_process(delta):
	if player != null:
		var angle_to_target : float = global_position.direction_to(player.global_position).angle()
		ray_cast.global_rotation = angle_to_target
		
		if ray_cast.is_colliding() and ray_cast.get_collider().is_in_group("Player"):
			_animated_sprite.flip_v = true
			_animated_sprite.flip_h = false
			_animated_sprite.rotation = angle_to_target
			if reload_timer.is_stopped():
				shoot()

# Shooting
func shoot():
	ray_cast.enabled = false	
	if bullet:
		var bul: Node2D = bullet.instantiate()
		get_tree().current_scene.add_child(bul)
		bul.global_position = global_position
		bul.global_rotation = ray_cast.global_rotation		
		shoot_sound.play()
		if !_animated_sprite.is_playing():
			_animated_sprite.play("default")
	reload_timer.start()
	
# Finding 
func find_target():
	var new_target = null	
	if get_tree().has_group("Player"):
		new_target = get_tree().get_nodes_in_group("Player")[0]	
	return new_target		

func _on_reload_timer_timeout():
	ray_cast.enabled = true
	_animated_sprite.stop()
	
func _destroy():
	queue_free()

func _on_hitbox_area_entered(area):
	var new_target = null	
	if get_tree().has_group("Swing"):
		new_target = get_tree().get_nodes_in_group("Swing")[0]	
#		print(new_target)
#		print(str("ahoj; ", new_target))
		health -= 1
		if health == 0:
			_destroy()
	return new_target	
