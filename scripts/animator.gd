class_name UIAnimator extends AnimationPlayer

func _init() -> void: Global.animator = self



func _on_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"game_to_reset":
			var new = Global.current_level_scene.instantiate()
			
			Global.set_level_to(new)
			
			Global.main.add_child(new)
			
			play("reset_to_game")
