extends Camera3D

# Reference to the ball
@export var ball: RigidBody3D  # Assign the ball in the Inspector

# Called every frame
func _process(_delta):
	if ball:
		# Set the camera's position directly to the ball's position
		global_transform.origin = ball.global_transform.origin
