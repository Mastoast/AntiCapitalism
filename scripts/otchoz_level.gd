extends Node2D

var music_pitch = 1.0
var fail_delay = 0.5
var valid_input_cooldown = 0.5
var player_movement_time = 0.1

var grid_size = 16
var inputs = {
	"input_up": Vector2.UP,
	"input_down": Vector2.DOWN,
	"input_left": Vector2.LEFT,
	"input_right": Vector2.RIGHT
}
var last_ahead_beat_used := 0
var last_after_beat_used := 0
var last_input_time = 0.0

func _ready():
	StaticMusic.play(StaticMusic.music1, music_pitch)
	StaticMusic.new_beat.connect(_on_new_beat)

func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if not $truck2D/Area2D.get_overlapping_areas().is_empty():
			$PatternPlayer.start_pattern(Pattern.pattern1)
	for input in inputs.keys():
		if event.is_action_pressed(input):
			try_move(inputs[input])

func try_move(move):
	$truck2D/RayCast2D.target_position = move * grid_size
	$truck2D/RayCast2D.force_raycast_update()
	if !$truck2D/RayCast2D.is_colliding() and is_input_valid():
#		$truck2D.position += move * grid_size
		var tween = create_tween()
		var prop = tween.tween_property($truck2D, "position", move * grid_size, player_movement_time)
		prop.as_relative().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN)
#		last_beat_used = StaticMusic.beat_count
#		last_input_time = StaticMusic.get_player_total_position()

func is_input_valid():
	var is_before = StaticMusic.get_delay_with_next_beat() < StaticMusic.beat_length * fail_delay
	var is_after = StaticMusic.get_delay_with_previous_beat() < StaticMusic.beat_length * fail_delay
	if is_after and StaticMusic.beat_count != last_after_beat_used:
		last_ahead_beat_used = StaticMusic.beat_count
		return true
	if is_before and StaticMusic.beat_count != last_ahead_beat_used:
		last_ahead_beat_used = StaticMusic.beat_count
		return true

func _on_new_beat():
	pass
