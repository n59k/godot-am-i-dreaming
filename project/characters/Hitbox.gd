extends Area2D
@onready var timer = $"../StunTimer"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
	

func _on_area_entered(area):
	if area.is_in_group("attack"):
		if area.is_in_group("bullet"):
			hurt()
		else:	
			timer.start(0.5)


func _on_area_exited(area):
	timer.stop()

func hurt():
	if Global.hearts>1:
		Global.hearts-=1
	else:
		Global.died=true
		Global.hearts=Global.max_hearts
		get_tree().change_scene_to_file("res://scenes/node_2d.tscn")
		
		

func _on_stun_timer_timeout():
	hurt()
