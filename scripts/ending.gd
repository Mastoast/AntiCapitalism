extends Node2D


func _ready():
	$TransitionLayer.wake_transition(func(): pass)


func _input(event):
	if event.is_action_pressed("input_begin"):
		$TransitionLayer.sleep_transition(func(): get_tree().change_scene_to_file("res://scenes/menu.tscn"))
