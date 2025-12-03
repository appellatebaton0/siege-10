class_name Wall extends Reactor

@onready var anim := $AnimationPlayer
var value_buffer:bool
var last_value := false

func _once_ready() -> void:
	value_buffer = not last_value

func _on_switch(to:bool): last_value = to

func _active(_delta:float) -> void:
	
	if value_buffer != last_value and not anim.is_playing():
		anim.play("on" if last_value else "off")
		value_buffer = last_value
	
	pass
