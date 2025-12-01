class_name Camera extends Camera3D

@export_range(0.0, 1.0, 0.01) var lerp_amount := 0.2

@onready var player:Player = Global.player
@onready var offset:Vector3 = global_position

func _init() -> void: Global.camera = self

func _ready() -> void:
	global_position = player.global_position + offset
	look_at(player.global_position)

func _process(_delta: float) -> void:
	var goal := player.global_position + offset
	
	global_position.x = lerp(global_position.x, goal.x, lerp_amount)
	global_position.y = lerp(global_position.y, goal.y, lerp_amount)
	global_position.z = lerp(global_position.z, goal.z, lerp_amount)
	
