extends Node2D

var current_level

func _ready():
	$TransitionLayer.wake_transition(func(): pass)
	current_level = ProgressData.get_current_level()
	if current_level.has("briefs"):
		$RichTextLabel.text = current_level["briefs"][0]

func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("input_begin"):
		# TODO cycle messages before changing scene
		$TransitionLayer.sleep_transition(func(): ProgressData.load_level_scene())
