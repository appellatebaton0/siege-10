class_name Crate extends RigidBody3D

@export var touch_buffer = 0.1
var touch_time = 0.0

@onready var player := Global.player

func _physics_process(delta: float) -> void:
	
	var bodies = get_colliding_bodies()
	
	touch_time = move_toward(touch_time, 0, delta)
	if bodies.has(player): touch_time = touch_buffer
	
	
	if touch_time > 0 and abs(player.global_position.y - global_position.y) < 1:
		var dist = player.global_position.slide(Vector3.UP).distance_to(global_position.slide(Vector3.UP))
		
		apply_force(dist * (player.next.slide(Vector3.UP)))
