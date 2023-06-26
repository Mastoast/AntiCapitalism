extends Node

var capitalism_level_count = 0
var otchoz_level_count = 0
var is_otchoz = false

func _ready():
	pass

func setup_next_level():
	if not is_otchoz:
		capitalism_level_count += 1
		if capitalism_level_count >= Level.capitalism_levels.size():
			var new_lvl = Level.capitalism_levels[Level.capitalism_levels.size() - 1].duplicate(true)
			var new_pitch = new_lvl["pitch"] + 0.1
			var difficulty_ratio = 1 - new_lvl["pitch"] / new_pitch
			new_lvl["pitch"] += 0.1
			new_lvl["combo_decrease_speed"] += difficulty_ratio * new_lvl["combo_decrease_speed"]
			Level.capitalism_levels.append(new_lvl)
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
