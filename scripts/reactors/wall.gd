class_name Wall extends Reactor

@onready var anim := $AnimationPlayer
var value_buffer:bool

func _once_ready() -> void:
	value_buffer = not current_value


func _active(_delta:float) -> void:
	
	if value_buffer != current_value and not anim.is_playing():
		anim.play("on" if current_value else "off")
		value_buffer = current_value
	
	pass
