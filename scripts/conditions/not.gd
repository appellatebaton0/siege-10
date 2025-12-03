class_name NOT extends Condition

@export var input:Condition

func _ready() -> void:
	if input == null:
		print("LOOKING")
		for child in get_children(): if child is Condition:
			input = child
			print("FOUND ", child)
			break

func value() -> bool:
	return not input.value()
