extends Node3D  # or Node3D if your camera type is different

@export var player: RigidBody3D  # Assign the player node in the editor

func _process(delta):
	if player:
		
		# Gets global position of the player
		var position = player.global_transform.origin
		# Update the camera's position to follow the player
		global_transform.origin = player.global_transform.origin
