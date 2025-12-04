extends Node

const LEVELS_PATH := "res://scenes/levels/"

var player:Player
var camera:Camera
var main:Main
var animator:AnimationPlayer

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
