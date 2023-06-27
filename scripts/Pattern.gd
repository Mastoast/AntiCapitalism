class_name Pattern extends Node

const pattern1 = [ # difficulty 1 TRASH BAG
	{"input": "input_down"	, "delay": 2.0, 	"position": Vector2(1600.0, 500.0), "timer": 2.0, "draw_line" : false},
	{"input": "input_left"	, "delay": 1.0, 	"position": Vector2(1600.0, 920.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_action", "delay": 1.0, 	"position": Vector2(1200.0,  650.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(800.0, 920.0), "timer": 2.0, "draw_line" : true},
]

const pattern2 = [ # difficulty 1.5 TORN TRASH BAG
	{"input": "input_down"	, "delay": 2.0, 	"position": Vector2(1600.0, 500.0), "timer": 2.0, "draw_line" : false},
	{"input": "input_left"	, "delay": 1.0, 	"position": Vector2(1600.0, 920.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(800.0, 920.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_down"	, "delay": 2.0, 	"position": Vector2(1600.0, 500.0), "timer": 3.0, "draw_line" : false},
	{"input": "input_left"	, "delay": 1.0, 	"position": Vector2(1600.0, 920.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(800.0, 920.0), "timer": 2.0, "draw_line" : true}
]
	
const pattern3 = [ # difficulty 1.5 SIMPLE CONTAINER
	{"input": "input_left"	, "delay": 2.0, 	"position": Vector2(1200.0, 880.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_action", "delay": 2.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(400.0, 880.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 1.0, 	"position": Vector2(400.0, 250.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_down"	, "delay": 1.0, 	"position": Vector2(1000.0, 250.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_action", "delay": 1.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 2.0, 	"position": Vector2(1000.0, 880.0), "timer": 3.0, "draw_line" : true},
]


const pattern4 = [ # difficulty 2 OLD CONTAINER
	{"input": "input_left"	, "delay": 2.0, 	"position": Vector2(1200.0, 880.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_action", "delay": 2.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(400.0, 880.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 2.0, 	"position": Vector2(400.0, 250.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_down"	, "delay": 1.0, 	"position": Vector2(600.0, 250.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 1.0, 	"position": Vector2(600.0, 450.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(800.0, 450.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 1.0, 	"position": Vector2(800.0, 250.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_down"	, "delay": 1.0, 	"position": Vector2(1000.0, 250.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_action", "delay": 1.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 2.0, 	"position": Vector2(1000.0, 880.0), "timer": 3.0, "draw_line" : true},
]

const pattern5 = [ # difficulty 2.5 PLASTIC CONTAINER
	{"input": "input_left"	, "delay": 2.0, 	"position": Vector2(1200.0, 880.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_action", "delay": 2.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(400.0, 880.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 2.0, 	"position": Vector2(400.0, 250.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_down"	, "delay": 0.66, 	"position": Vector2(600.0, 250.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_right"	, "delay": 0.66, 	"position": Vector2(600.0, 450.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_down"	, "delay": 0.66, 	"position": Vector2(800.0, 450.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_right"	, "delay": 0.66, 	"position": Vector2(800.0, 650.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_down"	, "delay": 0.66, 	"position": Vector2(1000.0, 650.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_right"	, "delay": 0.66, 	"position": Vector2(1000.0, 880.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_action", "delay": 2.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, "draw_line" : true},
]

const pattern6 = [ # difficulty 3 DOUBLE CONTAINER
	{"input": "input_action", "delay": 2.0, 	"position": Vector2(1200.0,  650.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_left"	, "delay": 2.0, 	"position": Vector2(1200.0, 880.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(400.0, 880.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_action", "delay": 2.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 1.66, 	"position": Vector2(400.0, 250.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_down"	, "delay": 0.66, 	"position": Vector2(600.0, 250.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_right"	, "delay": 0.66, 	"position": Vector2(600.0, 450.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_down"	, "delay": 0.66, 	"position": Vector2(800.0, 450.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_action", "delay": 2.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_left"	, "delay": 2.0, 	"position": Vector2(1000.0, 250.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_down"	, "delay": 0.66, 	"position": Vector2(800.0, 250.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_left"	, "delay": 0.66, 	"position": Vector2(800.0, 450.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_up"	, "delay": 0.66, 	"position": Vector2(600.0, 450.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_left"	, "delay": 0.66, 	"position": Vector2(600.0, 250.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_down"	, "delay": 0.66, 	"position": Vector2(400.0, 250.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_right"	, "delay": 2.0, 	"position": Vector2(400.0, 880.0), "timer": 3.0, "draw_line" : true},
]
