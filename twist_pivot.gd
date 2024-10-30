extends Node3D  # or Node3D if your camera type is different

@export var player: Node3D  # Assign the player node in the editor

func _process(delta):
	if player:
		# Update the camera's position to follow the player
		global_transform.origin = player.global_transform.origin
		
		# Freeze the camera's rotation by explicitly setting it
		# Here we set the rotation to a fixed value (e.g., no rotation)
		rotation_degrees = Vector3(0, 0, 0)  # Change this to your desired fixed rotation
