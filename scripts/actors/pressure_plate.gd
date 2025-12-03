class_name PressurePlate extends Actor

@export var stand_time := 1.0
var time := 0.0

func _on_body_entered(_body: Node3D) -> void: value = true
func _on_body_exited(_body: Node3D) -> void:
	time = stand_time

func _process(delta: float) -> void:
	
	if time > 0: time = move_toward(time, 0, delta)
	
	if time == 0:
		
		value = false
		
		time = -1
