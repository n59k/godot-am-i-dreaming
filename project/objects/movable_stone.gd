extends RigidBody2D
var applied_forces: Vector2 = Vector2.ZERO
@export var mu_static : float = 400  # friction coefficients
@export var mu_moving : float = 500  #

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#add_force_for_frame(-applied_forces)
	
	add_force_for_frame(- self.mass * mu_static * self.linear_velocity.normalized())
	#add_force_for_frame(- self.mass * mu_moving * self.linear_velocity.normalized())



func add_force_for_frame(force: Vector2):
	# add_force adds a permanent force, for a temporary one we need to wipe it
	# by undo the force next frame, just keep track of forces applied
	applied_forces += force
	self.apply_central_force(force)

