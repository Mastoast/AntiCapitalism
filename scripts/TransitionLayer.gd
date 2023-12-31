extends CanvasLayer

var current_material : ShaderMaterial
var tween_delay = 1.0

func _ready():
	current_material = $TransitionRect.material

func sleep_transition(callback, duration = tween_delay):
	StaticSfx.play_sfx(StaticSfx.outro)
	current_material.set_shader_parameter("direction", 1.0)
	create_transition_tween(callback, duration)

func wake_transition(callback, duration = tween_delay):
	StaticSfx.play_sfx(StaticSfx.intro)
	current_material.set_shader_parameter("direction", -1.0)
	create_transition_tween(callback, duration)

func create_transition_tween(callback, duration):
	current_material.set_shader_parameter("progress", 0.0)
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_method(update_transition_progress, 0.0, 1.0, duration)
	tween.tween_callback(callback)

func update_transition_progress(progress):
	current_material.set_shader_parameter("progress", progress)
