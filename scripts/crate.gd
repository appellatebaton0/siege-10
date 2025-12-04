class_name Crate extends RigidBody3D

@onready var player := Global.player

func _physics_process(_delta: float) -> void:
	
	if get_colliding_bodies().has(player):
		var push_direction = player.global_position.direction_to(global_position).slide(Vector3.UP)
		
		apply_force(80 * push_direction)
