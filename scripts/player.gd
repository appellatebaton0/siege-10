class_name Player extends CharacterBody3D

@onready var camera:Camera = Global.camera

func _init() -> void: Global.player = self
#
#func _physics_process(delta: float) -> void:
	#
