class_name Pattern extends Node

const pattern1 = [
	{"input": "input_left", "delay": 1.0, "position": Vector2(200, 200), "timer": 1.0},
	{"input": "input_action", "delay": 1.0, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_down", "delay": 2.0, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_right", "delay": 0.0, "position": Vector2(400, 200), "timer": 1.0},
	{"input": "input_up", "delay": 1.0, "position": Vector2(500, 200), "timer": 1.0},
	{"input": "input_down", "delay": 1.0, "position": Vector2(600, 200), "timer": 1.0},
	{"input": "input_up", "delay": 1.0, "position": Vector2(700, 200), "timer": 1.0},
	{"input": "input_action", "delay": 1.0, "position": Vector2(800, 200), "timer": 1.0},
	{"input": "input_right", "delay": 2.0, "position": Vector2(900, 200), "timer": 1.0},
]

const pattern2 = [
	{"input": "input_right", "delay": 1, "position": Vector2(200, 200), "timer": 1.0},
	{"input": "input_left", "delay": 0.5, "position": Vector2(500, 200), "timer": 1.0},
	{"input": "input_right", "delay": 0.25, "position": Vector2(200, 500), "timer": 1.0},
	{"input": "input_up", "delay": 0.25, "position": Vector2(800, 500), "timer": 1.0}
]

const pattern3 = [
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

const pattern4 = [
	{"input": "input_up", "delay": 1.0, "position": Vector2(200, 200), "timer": 2.0},
	{"input": "input_right", "delay": 1.0, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_left", "delay": 1.0, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_up", "delay": 1.0, "position": Vector2(200, 200), "timer": 1.0},
	{"input": "input_right", "delay": 1.0, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_left", "delay": 1.0, "position": Vector2(300, 200), "timer": 1.0}
]

const pattern5 = [
	{"input": "input_up", "delay": 1.0, "position": Vector2(200, 200), "timer": 1.0},
	{"input": "input_down", "delay": 0.0, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_left", "delay": 1.0, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_right", "delay": 0.0, "position": Vector2(200, 200), "timer": 1.0},
	{"input": "input_up", "delay": 1.0 + 2/3, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_left", "delay": 0.0, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_up", "delay": 2/3, "position": Vector2(200, 200), "timer": 1.0},
	{"input": "input_down", "delay": 0, "position": Vector2(300, 200), "timer": 1.0},
	{"input": "input_up", "delay": 2/3, "position": Vector2(200, 200), "timer": 1.0},
	{"input": "input_right", "delay": 0, "position": Vector2(300, 200), "timer": 1.0},
]

func _ready():
	pass

func _process(delta):
	pass
