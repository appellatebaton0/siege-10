class_name ResetBar extends TextureProgressBar

func _ready() -> void: max_value = Global.reset_time * 100
func _process(_delta: float) -> void: 
	value = Global.reset_timer * 100
