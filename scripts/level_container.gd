class_name LevelContainer extends GridContainer

var button_scene := load("res://scenes/level_button.tscn")

func _ready() -> void:
	for i in len(Global.level_scenes):
		var new:LevelButton = button_scene.instantiate()
		
		new.level_index = i
		
		add_child(new)
	
	#columns = ceil(sqrt(len(Global.level_scenes)))
