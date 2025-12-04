class_name DeathBox extends Area3D

func _on_body_entered(_body: Node3D) -> void: Global.animator.play("game_to_reset")
	
