extends Node2D

func _ready():
	pass

func _process(delta):
	$StartLabel.visible = Time.get_time_dict_from_system().second % 3 > 0

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://scenes/capitalist_level.tscn")
