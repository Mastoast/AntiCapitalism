extends Node2D

@export var line_color := Color.WHITE
@export var line_width := 2.0

var posA
var posB

var creation_time = 0.0
var counter = 0.0
var duration = 0.0

# Called when the node enters the scene tree for the first time.
func init(_posA, _posB, _duration):
	posA = Vector2(_posA.x * ProjectSettings.get_setting("display/window/size/viewport_width") / 1920.0,
				   _posA.y * ProjectSettings.get_setting("display/window/size/viewport_height") / 1080.0)
	posB = Vector2(_posB.x * ProjectSettings.get_setting("display/window/size/viewport_width") / 1920.0,
				   _posB.y * ProjectSettings.get_setting("display/window/size/viewport_height") / 1080.0)
	
	duration = _duration
	creation_time = StaticMusic.get_player_total_position()
	print(posA)
	print(posB)
	print(creation_time)
	print(_duration)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter = StaticMusic.get_player_total_position() - creation_time
	if counter > duration :
		succeed()
	
func _draw():
	draw_line(posA, posB, line_color, line_width, true)

func succeed():
	print("Destroy")
	queue_free()
