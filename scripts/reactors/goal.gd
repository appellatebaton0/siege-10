class_name Goal extends Reactor

@onready var ui := Global.animator

@onready var anim := $AnimationPlayer
var value_buffer:bool

func _once_ready() -> void: value_buffer = not current_value

func _active(_delta:float) -> void:
	if value_buffer != current_value and not anim.is_playing():
		anim.play("on" if current_value else "off")
		value_buffer = current_value


func _on_body_entered(_body: Node3D) -> void:
	if current_value:
		ui.play("game_to_levels")
