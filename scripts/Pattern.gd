class_name Pattern extends Node

const pattern1 = [
	{"input": "input_down"	, "delay": 2.0, 	"position": Vector2(1600.0, 500.0), "timer": 2.0, "draw_line" : false},
	{"input": "input_left"	, "delay": 1.0, 	"position": Vector2(1600.0, 920.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(800.0, 920.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_down"	, "delay": 2.0, 	"position": Vector2(1600.0, 500.0), "timer": 3.0, "draw_line" : false},
	{"input": "input_left"	, "delay": 1.0, 	"position": Vector2(1600.0, 920.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(800.0, 920.0), "timer": 2.0, "draw_line" : true}
]
	
const pattern2 = [
	{"input": "input_left"	, "delay": 2.0, 	"position": Vector2(1200.0, 880.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_action", "delay": 1.0, 	"position": Vector2(350.0, 880.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_down"	, "delay": 2.0, 	"position": Vector2(350.0, 300.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 0.0, 	"position": Vector2(400.0, 250.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(600.0, 400.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_down"	, "delay": 1.0, 	"position": Vector2(800.0, 250.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(1000.0, 400.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_action", "delay": 1.0, 	"position": Vector2(1200.0, 250.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 2.0, 	"position": Vector2(1200.0, 880.0), "timer": 3.0, "draw_line" : true},
]

const pattern3 = [
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(200, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(300, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(300, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(400, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(500, 200), "timer": 0.5, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(600, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(700, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(800, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(900, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(900, 200), "timer": 1.0, "draw_line" : true},
]

const pattern4 = [
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(200, 200), "timer": 2.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 1.0, 	"position": Vector2(300, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_left"	, "delay": 1.0, 	"position": Vector2(300, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(200, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 1.0, 	"position": Vector2(300, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_left"	, "delay": 1.0, 	"position": Vector2(300, 200), "timer": 1.0, "draw_line" : true}
]

const pattern5 = [
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(200, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_down"	, "delay": 0.0, 	"position": Vector2(300, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_left"	, "delay": 1.0, 	"position": Vector2(300, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 0.0, 	"position": Vector2(200, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 5/3, 	"position": Vector2(300, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_left"	, "delay": 0.0, 	"position": Vector2(300, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 2/3, 	"position": Vector2(200, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_down"	, "delay": 0.0, 	"position": Vector2(300, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 2/3, 	"position": Vector2(200, 200), "timer": 1.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 0.0, 	"position": Vector2(300, 200), "timer": 1.0, "draw_line" : true},
]
