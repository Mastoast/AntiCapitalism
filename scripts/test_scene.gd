extends Node2D

const qte := preload("res://objects/qte.tscn")
var inputs = ["ui_left", "ui_right", "ui_up", "ui_down"]
var catch_pattern = {"input": "input_begin", "delay": 2.0, "position": Vector2(650, 350), "timer": 1.0}
var pattern1 = [
	{"input": "input_left", "delay": 0.5, "position": Vector2(200, 200), "timer": 1.0},
	{"input": "input_right", "delay": 0.5, "position": Vector2(500, 200), "timer": 1.0},
	{"input": "input_up", "delay": 0.25, "position": Vector2(200, 500), "timer": 1.0},
	{"input": "input_down", "delay": 1.0, "position": Vector2(800, 500), "timer": 1.0}
]

var pattern2 = [
	{"input": "input_right", "delay": 0.25, "position": Vector2(200, 200), "timer": 1.0},
	{"input": "input_left", "delay": 0.25, "position": Vector2(500, 200), "timer": 1.0},
	{"input": "input_right", "delay": 0.5, "position": Vector2(200, 500), "timer": 1.0},
	{"input": "input_up", "delay": 1.0, "position": Vector2(800, 500), "timer": 1.0}
]

func _ready():
	randomize()
	load_patterns(pattern2)

func _process(delta):
	if Input.is_key_pressed(KEY_F5):
		get_tree().reload_current_scene()
	pass

func load_patterns(patterns):
	for pattern in patterns:
		spawn_qte(pattern["timer"], pattern["position"], pattern["input"])
		await get_tree().create_timer(pattern["delay"]).timeout

func spawn_qte(timer, position, input):
	var new_qte = qte.instantiate()
	new_qte.init(timer, input)
	new_qte.position = position
	add_child(new_qte)

func _input(event):
	if !event.is_action_type():
		return
	var min_time = 99999
	var selected_qte
	for qte in get_tree().get_nodes_in_group("qte"):
		if event.is_action_pressed(qte.expected_action) and (qte.timer - qte.counter < min_time):
			min_time = qte.timer - qte.counter
			selected_qte = qte
	if selected_qte:
		selected_qte.try_input()
