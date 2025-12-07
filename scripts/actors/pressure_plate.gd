class_name PressurePlate extends Actor

@onready var anim := $AnimationPlayer

@export var stand_time := 1.0
var time := -1.0

func _on_body_entered(_body: Node3D) -> void: 
	value = true
	anim.play("down")
	$GPUParticles3D.restart()
	$Switch.play()
func _on_body_exited(_body: Node3D) -> void:
	time = stand_time

func _process(delta: float) -> void:
	
	if time > 0: time = move_toward(time, 0, delta)
	
	if time == 0:
		
		value = false
		anim.play("up")
		$Switch.play()
		$GPUParticles3D.restart()
		
		time = -1
