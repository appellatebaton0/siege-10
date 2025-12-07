class_name Crate extends RigidBody3D

@onready var player_stopper := $StaticBody3D/CollisionShape3D

@export var touch_buffer = 0.1
var touch_time = 0.0

@onready var player := Global.player

func _by_dist_to_player(a:Node3D, b:Node3D):
	var a_dist = a.global_position.distance_to(player.global_position)
	var b_dist = b.global_position.distance_to(player.global_position)
	return a_dist < b_dist

func _physics_process(_delta: float) -> void:
	if player == null: return
	
	player_stopper.disabled = not $WallCheck.is_colliding()
	
	if get_colliding_bodies().has(player) and abs(player.global_position.y - global_position.y) < 1:
		var dist = player.global_position.slide(Vector3.UP).distance_to(global_position.slide(Vector3.UP))
		
		apply_force(dist * (player.next.slide(Vector3.UP)))
