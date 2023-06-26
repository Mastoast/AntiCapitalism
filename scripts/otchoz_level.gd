extends Node2D

var music_pitch = 1.0
@export var fail_delay = 0.5
@export var valid_input_cooldown = 0.5
@export var player_movement_time = 0.1

var grid_size = 16

var trash2D = load("res://objects/trash_2d.tscn")
@onready var pattern_player = $PatternPlayer
@onready var truck = $level/truck2D

var inputs = {
	"input_up": Vector2.UP,
	"input_down": Vector2.DOWN,
	"input_left": Vector2.LEFT,
	"input_right": Vector2.RIGHT
}
var last_ahead_beat_used := 0
var last_after_beat_used := 0
var last_input_time = 0.0
var starting_pattern = false
var current_trash

func _ready():
	load_level(Level.level2d)
	StaticMusic.new_beat.connect(_on_new_beat)
	pattern_player.pattern_succeeded.connect(_on_pattern_success)
	pattern_player.pattern_failed.connect(_on_pattern_failure)
	pattern_player.qte_succeeded.connect(_on_qte_success)
	$TransitionLayer.wake_transition(func(): pass)

func load_level(level):
	StaticMusic.play(level["music"], level["pitch"])
	for item in level["trashes"]:
		var trash = trash2D.instantiate()
		trash.init(item["pattern"])
		trash.position = item["position"]
		$level.add_child(trash)

func _process(delta):
	pass

func _input(event):
	if starting_pattern or current_trash:
		return
	if event.is_action_pressed("ui_accept"):
		if not truck.get_node("Area2D").get_overlapping_areas().is_empty():
			starting_pattern = true
	for input in inputs.keys():
		if event.is_action_pressed(input):
			try_move(inputs[input])

func try_move(move):
	truck.get_node("RayCast2D").target_position = move * grid_size
	truck.get_node("RayCast2D").force_raycast_update()
	if !truck.get_node("RayCast2D").is_colliding() and is_input_valid():
		var tween = create_tween()
		var prop = tween.tween_property(truck, "position", move * grid_size, player_movement_time)
		prop.as_relative().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN)

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
	if StaticMusic.beat_count % 2 == 0: # trigger every 2 beat
		if starting_pattern:
			current_trash = truck.get_node("Area2D").get_overlapping_areas()[0].get_parent()
			$PatternPlayer.start_pattern(current_trash.pattern)
			starting_pattern = false

func _on_pattern_success():
	current_trash.empty()
	current_trash = null

func _on_pattern_failure():
	current_trash = null

func _on_qte_success(precision:float):
	pass
