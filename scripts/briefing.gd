extends Node2D

var current_level
var brief_count = 0
var transitioning = false

func _ready():
	$TransitionLayer.wake_transition(func(): pass)
	current_level = ProgressData.get_current_level()
	if current_level.has("briefs"):
		update_text_label()

func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("input_begin"):
		if current_level.has("briefs") and brief_count < current_level["briefs"].size() - 1:
			brief_count += 1
			update_text_label()
		elif not transitioning:
			transitioning = true
			$TransitionLayer.sleep_transition(func(): ProgressData.load_level_scene())

func update_text_label():
	$RichTextLabel.text = current_level["briefs"][brief_count].format({"night_count": ProgressData.capitalism_level_count + 1})
