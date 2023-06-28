extends Node2D

var in_transition = false

func _init():
	pass

func _ready():
	$TransitionLayer.wake_transition(func(): pass)

func _process(delta):
	$StartLabel.visible = Time.get_time_dict_from_system().second % 5 > 0

func _input(event):
	if event.is_action_pressed("input_begin") and not in_transition:
		$TransitionLayer.sleep_transition(func(): get_tree().change_scene_to_file("res://scenes/briefing.tscn"))
		in_transition = true
