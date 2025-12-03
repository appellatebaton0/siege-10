class_name LevelButton extends TextureRect

@export var level_index := 0

@onready var button := $MarginContainer/Button
@onready var main := Global.main

@onready var level_scene := get_level_scene()
func get_level_scene() -> PackedScene:
	return Global.level_scenes[level_index]

func _ready() -> void: 
	button.text = str(level_index + 1)
	button.pressed.connect(_on_pressed)

func _on_pressed():
	var new:Node = level_scene.instantiate()
	
	main.add_child(new)
