extends Node2D

@export var radius := 75.0
@export var max_point_count := 80
@export var arc_width := 10
@export var arc_color := Color.WHITE
@export var background_color := Color.BLACK
@export var arc_invalid_color := Color.RED
@export var arc_valid_color := Color.GREEN
@export var max_input_delay := 0.3
@export var min_input_delay := -0.3
@export var arc_size_per_beat := 3.0

@export var up_color := Color.GREEN
@export var down_color := Color.GREEN
@export var left_color := Color.GREEN
@export var right_color := Color.GREEN
@export var action_color := Color.GREEN

signal qte_succeed
signal qte_failed

var arrow_texture = load("res://sprites/direction_arrow.png")
var e_texture = load("res://sprites/e_action.png")
var current_arc_color : Color

const sprite_dict = {
	"input_up" : {"rotation": 0},
	"input_down" : {"rotation": 180},
	"input_left" : {"rotation": -90},
	"input_right" : {"rotation": 90},
	"input_action": {"rotation": 0}
}

var creation_time = 0.0
var counter = 0.0
var timer := 1.0
var expected_action := "ui_accept"

func init(timer:float = timer, action:String = expected_action):
	self.timer = timer
	self.creation_time = StaticMusic.get_player_total_position()
	self.expected_action = action
	$TextEdit.text = action
	if action == "input_action":
		$Sprite.texture = e_texture
		$Sprite.modulate = Color.BLACK
	else:
		$Sprite.texture = arrow_texture
		if action == "input_up" :
				$Sprite.modulate = up_color
		elif action == "input_down" :
				$Sprite.modulate = down_color
		elif action == "input_left" :
				$Sprite.modulate = left_color		
		elif action == "input_right" :
				$Sprite.modulate = right_color
		
	$Sprite.rotation_degrees = sprite_dict[action]["rotation"]

func _ready():
	current_arc_color = arc_invalid_color

func _process(delta):
	if counter > timer + StaticMusic.beat_length * max_input_delay:
		self.fail()
	counter = StaticMusic.get_player_total_position() - creation_time
	if is_input_valid():
		current_arc_color = arc_valid_color
	else:
		current_arc_color = arc_invalid_color
	queue_redraw()

func _draw():
	var qte_ratio = 1 - counter / timer
	var angle = 2 * PI - (qte_ratio * PI * 2)
	var point_count = max_point_count - (qte_ratio * max_point_count)
	if expected_action == "input_action" :
		draw_circle( self.global_position - self.position, radius, action_color)
	else :
		draw_circle( self.global_position - self.position, radius, background_color)
		draw_arc( self.global_position - self.position, radius, 0.0, 2*PI, max_point_count, arc_color, arc_width, false)
				
	draw_arc( self.global_position - self.position, radius + radius * (arc_size_per_beat * maxf(qte_ratio, 0)), 0.0,
			  2*PI, max_point_count, Color(current_arc_color.r, current_arc_color.g, current_arc_color.b, 1 - qte_ratio), arc_width, false)

func is_input_valid():
	if(timer - counter > 0.0):
		return timer - counter < StaticMusic.beat_length * max_input_delay
	return timer - counter > StaticMusic.beat_length * min_input_delay

func try_input(event):
	if event.is_action_pressed(expected_action) and is_input_valid():
		succeed()
	else:
		fail()

func fail():
	qte_failed.emit(timer - counter)
	queue_free()

func succeed():
	qte_succeed.emit(timer - counter)
	queue_free()
