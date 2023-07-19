extends Area2D

var pushed = false
var entered = 0
signal pressure_plate_pushed(state)

func _on_body_entered(body):
	entered += 1
	pushed = true

func _physics_process(delta):
	if pushed == true:
		pressure_plate_pushed.emit(true)
	else:
		pressure_plate_pushed.emit(false)

func _on_body_exited(body):
		entered -=1
		if entered==0:
			pushed = false
