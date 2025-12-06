class_name Player extends CharacterBody3D

@export var max_speed := 7.0
@export var acceleration := 30.0

@onready var camera:Camera = Global.camera

func _init() -> void: Global.player = self

var next:Vector3
func _physics_process(delta: float) -> void:
	
	# Gravity
	if not is_on_floor(): velocity += get_gravity() * delta * 5.0
	
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	
	next = camera.basis * max_speed * Vector3(direction.x, 0, direction.y)
	velocity.x = move_toward(velocity.x, next.x, delta * acceleration)
	velocity.z = move_toward(velocity.z, next.z, delta * acceleration)
	
	if next != Vector3.ZERO and not global_transform.origin.is_equal_approx(global_position + velocity.slide(Vector3.UP)):
		var look:Vector3
		var curr:Vector3
		
		curr = global_rotation
		look_at(global_position + next.slide(Vector3.UP))
		look = global_rotation
		
		if abs(look.y - curr.y) >= deg_to_rad(270):
			curr.y += deg_to_rad(360) * abs(look.y - curr.y) / (look.y - curr.y)
	
		#global_rotation.x = move_toward(curr.x, look.x, rot_speed * delta)
		global_rotation.y = lerp(curr.y, look.y, 0.4)
		#global_rotation.z = move_toward(curr.z, look.z, rot_speed * delta)
	
	move_and_slide()
