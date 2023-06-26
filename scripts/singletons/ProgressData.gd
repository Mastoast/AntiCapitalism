extends Node

var capitalism_level_count = 0
var otchoz_level_count = 0

func _ready():
	pass

func setup_next_level():
	if capitalism_level_count < Level.capitalism_levels.size():
		capitalism_level_count += 1
	elif otchoz_level_count < Level.otchoz_levels.size():
		otchoz_level_count += 1

func load_level_scene():
	if ProgressData.capitalism_level_count < Level.capitalism_levels.size():
		get_tree().change_scene_to_file("res://scenes/capitalist_level.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/otchoz_level.tscn")

func get_current_level():
	if capitalism_level_count < Level.capitalism_levels.size():
		return Level.capitalism_levels[capitalism_level_count]
	else:
		return Level.otchoz_levels[otchoz_level_count]
