extends Node2D

var current_level
var brief_count = 0

func _ready():
	$TransitionLayer.wake_transition(func(): pass)
	current_level = ProgressData.get_current_level()
	if current_level.has("briefs"):
		$RichTextLabel.text = current_level["briefs"][brief_count]

func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("input_begin"):
		if brief_count < current_level["briefs"].size() - 1:
			brief_count += 1
			$RichTextLabel.text = current_level["briefs"][brief_count]
		else:
			$TransitionLayer.sleep_transition(func(): ProgressData.load_level_scene())
