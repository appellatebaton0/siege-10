extends Node

const LEVELS_PATH := "res://scenes/levels/"

var player:Player
var camera:Camera
var main:Main
var animator:AnimationPlayer
var current_level:Node
var current_level_scene:PackedScene

var level_scenes := get_level_scenes()
func get_level_scenes(path := LEVELS_PATH) -> Array[PackedScene]:
	var response:Array[PackedScene]
	
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				response.append_array(get_level_scenes(path + file_name + "/"))
			else:
				response.append(load(path + file_name))
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	
	return response

func set_level_to(to:Node):
	if current_level != null:
		current_level.queue_free()
	current_level = to


@export var reset_time = 3.0
var reset_timer = 0.0

func _process(delta: float) -> void:
	if current_level != null:
		reset_timer = move_toward(reset_timer, reset_time if Input.is_action_pressed("Reset") else 0.0, delta)
		if reset_timer >= reset_time:
			Global.animator.play("game_to_reset")
			reset_timer = 0.0
