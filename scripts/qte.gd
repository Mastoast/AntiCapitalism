extends Node2D

@export var radius := 75.0
@export var max_point_count := 80
@export var arc_width := 10
@export var arc_color := Color.RED
@export var max_input_delay := 0.15

signal qte_succeed
signal qte_failed

var counter = 0.0
var timer := 1.0
var expected_action := "ui_accept"

func init(timer:float = timer, action:String = expected_action):
	self.timer = timer
	self.expected_action = action
	$TextEdit.text = action

func _ready():
	pass

func _process(delta):
	if counter > timer + max_input_delay:
		self.fail()
	counter += delta
	if is_input_valid():
		arc_color = Color.GREEN
	else:
		arc_color = Color.RED
	queue_redraw()

func _draw():
	var qte_ratio = 1 - counter / timer
	var angle = 2 * PI - (qte_ratio * PI * 2)
	var point_count = max_point_count - (qte_ratio * max_point_count)
	draw_arc( self.global_position - self.position, radius, 0.0,
		2*PI, max_point_count, Color(1.0, 1.0, 1.0, 0.3), arc_width, false)
	draw_arc( self.global_position - self.position, radius + radius * (2 * maxf(qte_ratio, 0)), 0.0,
		2*PI, max_point_count, Color(arc_color.r, arc_color.g, arc_color.b, 1 - qte_ratio), arc_width, false)
#	draw_arc( self.global_position - self.position, radius, 0.0,
#		angle, point_count, arc_color, arc_width, false)

func is_input_valid():
	return absf(timer - counter) < max_input_delay

func try_input(event):
	if event.is_action_pressed(expected_action) and is_input_valid():
		succeed()
	else:
		fail()

func fail():
	print("FAIL")
	qte_failed.emit(timer - counter)
	queue_free()

func succeed():
	qte_succeed.emit(timer - counter)
	print("OK")
	queue_free()
