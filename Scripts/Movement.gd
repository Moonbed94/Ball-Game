extends RigidBody3D

# Set positions for the ball to move to
var positions = [Vector3(-10, 0, 0), Vector3(0, 0, 0), Vector3(10, 0, 0)]  # Left, Middle, Right
var current_position_index = 1  # Start at the middle position

# Movement properties
var move_speed = 10

# Called when the node enters the scene tree for the first time
func _ready():
	global_transform.origin = positions[current_position_index]  # Set initial position to the middle

# Input function to handle arrow key movement
func _input(event):
	if event.is_action_pressed("ui_left"):
		current_position_index = max(current_position_index - 1, 0)  # Clamp to the leftmost position
	elif event.is_action_pressed("ui_right"):
		current_position_index = min(current_position_index + 1, positions.size() - 1)  # Clamp to the rightmost position

# Physics process to apply gravity, movement, and rolling
func _physics_process(delta):
	# Calculate the target position based on the current index
	var target_position = positions[current_position_index]

	# Determine the velocity towards the target position
	var direction = (target_position - global_transform.origin).normalized()
	var desired_velocity = direction * move_speed
	
	# Set linear velocity
	linear_velocity.x = desired_velocity.x
	
	# Optional: Apply rolling force if you want continuous rolling
	apply_central_impulse(Vector3(10, 0, 0) * delta)  # Adjust as necessary
