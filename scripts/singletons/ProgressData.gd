extends Node

var capitalism_level_count = 0
var otchoz_level_count = 0
var is_otchoz = false

func _ready():
	pass

func setup_next_level():
	if not is_otchoz:
		capitalism_level_count += 1
		if capitalism_level_count == Level.capitalism_levels.size():
			Level.capitalism_levels.append(Level.capitalism_levels[Level.capitalism_levels.size()].duplicate(true))
	elif otchoz_level_count < Level.otchoz_levels.size():
		otchoz_level_count += 1

func load_level_scene():
	if not is_otchoz:
		get_tree().change_scene_to_file("res://scenes/capitalist_level.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/otchoz_level.tscn")

func get_current_level():
	if not is_otchoz:
		return Level.capitalism_levels[capitalism_level_count]
	else:
		return Level.otchoz_levels[otchoz_level_count]
