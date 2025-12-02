@abstract class_name Reactor extends Entity
# Has built-ins for when a provided condition changes states.

@export var condition:Condition

func _ready() -> void:
	if condition == null: for child in get_children(): if child is Condition:
		condition = child
		break
	
	if condition != null:
		condition.switched.connect(_on_switch)

func _process(delta: float) -> void:
	if condition.value(): _while_true()
	else: _while_false()

func _on_switch(to:bool):
	if to: _on_true() 
	else: _on_false()

func _while_true() -> void: pass
func _while_false() -> void: pass

func _on_true() -> void: pass
func _on_false() -> void: pass
