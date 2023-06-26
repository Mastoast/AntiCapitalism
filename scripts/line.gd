extends Node2D

@export var line_color := Color.WHITE
@export var line_width := 2.0
@export var line_speed := 2.0

var line_posA
var line_posB

var counter = 0.0
var line_start = 0.0
var end_qteA_time = 0.0
var line_durationB = 0.0

# Called when the node enters the scene tree for the first time.
func init(qteA, qteB, pattern_succeeded, pattern_failed):
	var raw_posA = qteA.position
	var raw_posB = qteB.position
	end_qteA_time = 99999
	line_start = StaticMusic.get_player_total_position()
	
	line_posA = raw_posA + (raw_posB - raw_posA).normalized() * qteA.radius
	line_posB = raw_posB + (raw_posA - raw_posB).normalized() * qteB.radius
	qteA.qte_succeed.connect(_disapear)
	pattern_succeeded.connect(_finished)
	pattern_failed.connect(_finished)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter = StaticMusic.get_player_total_position()	
	queue_redraw()
	
func _draw():
	var distance = (line_posA - line_posB).length();
	var speed = line_speed / (StaticMusic.beat_length * distance)
	draw_line(lerp(line_posA, line_posB, min(max((counter - end_qteA_time) * speed, 0.0), 1.0)),
			  lerp(line_posA, line_posB, min(max((counter - line_start) * speed, 0.0), 1.0)),
			  line_color, line_width, true)

func _disapear(precision:float):
	print("disapear")
	end_qteA_time = StaticMusic.get_player_total_position()

func _finished():
	print("destroy")
	queue_free()
