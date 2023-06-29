extends Node2D

var music_pitch = 1.0
@export var fail_delay = 0.5
@export var valid_input_cooldown = 0.5
@export var beat_per_level = 100

@onready var grid_size = $level/TileMap.cell_quadrant_size

var trash2D = load("res://objects/trash_2d.tscn")
@onready var pattern_player = $PatternPlayer
@onready var truck = $level/truck2D

var satisfaction_per_trash = [0.33, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, -0.1, -0.1, -0.1, -0.33]
var satisfaction = 50.0

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
var level_ending = false

func _ready():
	randomize()
	load_level(Level.level2d)
	StaticMusic.new_beat.connect(_on_new_beat)
	pattern_player.pattern_succeeded.connect(_on_pattern_success)
	pattern_player.pattern_failed.connect(_on_pattern_failure)
	pattern_player.qte_succeeded.connect(_on_qte_success)
	$TransitionLayer.wake_transition(func(): pass)

func load_level(level):
	StaticMusic.play(level["music"], level["pitch"])
	var cells = $level/TileMap.get_used_cells(0).filter(is_tile_spawnable)
	for i in range(level["trash_count"]):
		var cell = $level/TileMap.get_used_cells(0).filter(is_tile_spawnable).pick_random()
		if cell != null:
			var pattern = Level.level2d["patterns"].pick_random()
			ProgressData.otchoz_trash.append({"coords": cell, "pattern": pattern})
	for trash in ProgressData.otchoz_trash:
		var new_trash = trash2D.instantiate()
		new_trash.modulate = Color.DEEP_PINK
		new_trash.init(trash["pattern"], trash["coords"])
		new_trash.position = Vector2(trash["coords"].x * grid_size, trash["coords"].y * grid_size) + Vector2(grid_size / 2, grid_size / 2)
		$level.add_child(new_trash)

func _process(delta):
	if StaticMusic.beat_count >= beat_per_level and not level_ending:
		level_ending = true
		$TransitionLayer.sleep_transition(func(): get_tree().change_scene_to_file("res://scenes/briefing.tscn"))

func _unhandled_input(event):
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
		return
	if starting_pattern or current_trash:
		return
	if event.is_action_pressed("ui_accept"):
		if not truck.get_node("Area2D").get_overlapping_areas().is_empty():
			starting_pattern = true
	for input in inputs.keys():
		if event.is_action_pressed(input) and is_input_valid():
			truck.try_move(inputs[input], grid_size)

func is_input_valid():
	var is_before = StaticMusic.get_delay_with_next_beat() < StaticMusic.beat_length * fail_delay
	var is_after = StaticMusic.get_delay_with_previous_beat() < StaticMusic.beat_length * fail_delay
	if is_after and StaticMusic.beat_count != last_after_beat_used:
		last_after_beat_used = StaticMusic.beat_count
		return true
	if is_before and StaticMusic.beat_count != last_ahead_beat_used:
		last_ahead_beat_used = StaticMusic.beat_count
		return true

func _on_new_beat():
	satisfaction += satisfaction_per_trash[min(ProgressData.otchoz_trash.size(), satisfaction_per_trash.size() - 1)]
	$ProgressBar.value = satisfaction
	if satisfaction >= 100.0 and not level_ending:
		level_ending = true
		$TransitionLayer.sleep_transition(func(): get_tree().change_scene_to_file("res://scenes/menu.tscn"))
	if StaticMusic.beat_count % 2 == 0: # trigger every 2 beat
		if starting_pattern:
			current_trash = truck.get_node("Area2D").get_overlapping_areas()[0].get_parent()
			$PatternPlayer.start_pattern(current_trash.pattern, current_trash.global_position)
			starting_pattern = false

func _on_pattern_success():
	current_trash.empty()
	current_trash.visible = false
	ProgressData.otchoz_trash.erase(ProgressData.otchoz_trash.filter(func(i): return i["coords"] == current_trash.coords)[0])
	current_trash.queue_free()
	current_trash = null


func _on_pattern_failure():
	current_trash = null

func _on_qte_success(precision:float):
	pass

func is_tile_spawnable(coords:Vector2i):
	return $level/TileMap.get_cell_tile_data(0, coords).get_custom_data("spawnable") and not ProgressData.otchoz_trash.any(func(item): coords == item["coords"])

