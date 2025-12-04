class_name Player extends CharacterBody3D

@export var max_speed := 7.0
@export var acceleration := 30.0

@onready var camera:Camera = Global.camera

func _init() -> void: Global.player = self

var next:Vector3
func _physics_process(delta: float) -> void:
	
	# Gravity
	if not is_on_floor(): velocity += get_gravity() * delta
	
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	
	next = camera.basis * max_speed * Vector3(direction.x, 0, direction.y)
	velocity.x = move_toward(velocity.x, next.x, delta * acceleration)
	velocity.z = move_toward(velocity.z, next.z, delta * acceleration)
	
	if next != Vector3.ZERO and not global_transform.origin.is_equal_approx(global_position + velocity.slide(Vector3.UP)):
		look_at(global_position + next.slide(Vector3.UP))
	
	move_and_slide()
