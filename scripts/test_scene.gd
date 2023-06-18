extends Node2D

const qte := preload("res://objects/qte.tscn")
var score:int = 0
var combo:float = 0.0

var expected_actions = ["input_left", "input_right", "input_up", "input_down", "input_action"]

var pattern1 = [
	{"input": "input_left", "delay": 1.0, "position": Vector2(200, 200), "timer": 1.0},
	{"input": "input_right", "delay": 1.0, "position": Vector2(500, 200), "timer": 1.0},
	{"input": "input_up", "delay": 0.5, "position": Vector2(200, 500), "timer": 2.0},
	{"input": "input_down", "delay": 2.0, "position": Vector2(800, 500), "timer": 1.0}
]

var pattern2 = [
	{"input": "input_right", "delay": 0.5, "position": Vector2(200, 200), "timer": 1.0},
	{"input": "input_left", "delay": 0.5, "position": Vector2(500, 200), "timer": 1.0},
	{"input": "input_right", "delay": 0.25, "position": Vector2(200, 500), "timer": 1.0},
	{"input": "input_up", "delay": 1.0, "position": Vector2(800, 500), "timer": 1.0}
]

var pattern3 = [
	{"input": "input_up", "delay": 1.0, "position": Vector2(200, 200), "timer": 1.0},
	{"input": "input_up", "delay": 1.0, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_up", "delay": 1.0, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_up", "delay": 1.0, "position": Vector2(400, 200), "timer": 1.0},
	{"input": "input_up", "delay": 1.0, "position": Vector2(500, 200), "timer": 0.5},
	{"input": "input_up", "delay": 1.0, "position": Vector2(600, 200), "timer": 1.0},
	{"input": "input_up", "delay": 1.0, "position": Vector2(700, 200), "timer": 1.0},
	{"input": "input_up", "delay": 1.0, "position": Vector2(800, 200), "timer": 1.0},
	{"input": "input_up", "delay": 1.0, "position": Vector2(900, 200), "timer": 1.0},
	{"input": "input_up", "delay": 1.0, "position": Vector2(900, 200), "timer": 1.0},
]

var pattern4 = [
	{"input": "input_up", "delay": 1.0, "position": Vector2(200, 200), "timer": 2.0},
	{"input": "input_right", "delay": 2.0, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_left", "delay": 3.0, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_up", "delay": 4.0, "position": Vector2(200, 200), "timer": 1.0},
	{"input": "input_right", "delay": 5.0, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_left", "delay": 6.0, "position": Vector2(300, 200), "timer": 1.0}
]

var buffer_qte = []
var pattern_start
var last_pos = Vector2(200, 200)
var current_pattern = false

func _ready():
	randomize()
	StaticMusic.play(StaticMusic.music1, 1.0)
	StaticMusic.new_beat.connect(_on_new_beat)


func _process(delta):
	if !buffer_qte.is_empty() and current_pattern:
		if StaticMusic.get_player_total_position() >= pattern_start + buffer_qte[0]["delay"] * StaticMusic.beat_length - buffer_qte[0]["timer"] * StaticMusic.beat_length:
			spawn_qte(StaticMusic.beat_length * buffer_qte[0]["timer"], last_pos, buffer_qte[0]["input"])
			last_pos.x = 200 + (int)(last_pos.x + 100) % 800
			buffer_qte.pop_front()
			if buffer_qte.is_empty():
				current_pattern = false
	$ScoreText.text = str(score)
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func load_patterns(patterns):
	patterns.duplicate(true).pop_back()
	var pos = Vector2(200, 200)
	for pattern in patterns:
		spawn_qte(StaticMusic.beat_length * pattern["timer"], pos, pattern["input"])
		pos.x = 200 + (int)(pos.x + 100) % 800
		await get_tree().create_timer(pattern["delay"] * StaticMusic.beat_length).timeout

func spawn_qte(timer, position, input):
	var new_qte = qte.instantiate()
	new_qte.init(timer, input)
	new_qte.position = position
	new_qte.qte_succeed.connect(_on_qte_success)
	new_qte.qte_failed.connect(_on_qte_failure)
	add_child(new_qte)

func _input(event):
	if event.is_action_pressed("input_begin") and !current_pattern:
		buffer_qte = pattern4.duplicate(true)
		return
	if !event.is_action_type() || !is_expected_action(event):
		return
	var min_time = 99999
	var selected_qte
	for qte in get_tree().get_nodes_in_group("qte"):
		if event.is_action_pressed(qte.expected_action) and (qte.timer - qte.counter < min_time):
			min_time = qte.timer - qte.counter
			selected_qte = qte
	if selected_qte:
		selected_qte.try_input(event)
	else:
		_on_bad_input()

func is_expected_action(event):
	for action in expected_actions:
		if event.is_action_pressed(action):
			return true
	return false

func _on_new_beat():
	if !buffer_qte.is_empty() and !current_pattern:
		pattern_start = StaticMusic.get_player_total_position()
		current_pattern = true

func _on_qte_success(precision:float):
	score += 10 * (1.0 - precision)

func _on_qte_failure(precision:float):
	score -= 5

func _on_bad_input():
	score -= 3
