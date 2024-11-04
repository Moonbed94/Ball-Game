extends RigidBody3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
		#var input := Vector3.ZERO
		#input.x = Input.get_axis("move_left", "move_right")
		#input.z = Input.get_axis("move_forward", "move_down")
		
		#apply_central_force(input * 1200.0 * delta)

# Define positions as a set distance apart along the X-axis
const POSITIONS = [
	Vector3(-5, 0, 0),  # Left position
	Vector3(0, 0, 0),     # Middle position
	Vector3(5, 0, 0)     # Right position
]
var current_position_index = 1  # Start at middle position (index 1)

func _process(delta: float) -> void:
	# Check for left/right input
	if Input.is_action_just_pressed("move_left") and current_position_index > 0:
		current_position_index -= 1
	elif Input.is_action_just_pressed("move_right") and current_position_index < POSITIONS.size() - 1:
		current_position_index += 1

	# Move the player towards the target position
	var target_position = POSITIONS[current_position_index]
	var movement = (target_position - global_transform.origin).normalized() * 1200.0 * delta
	apply_central_force(movement)
