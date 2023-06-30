extends Node2D

@export var scale_multipliyer = 1.0

@export_category("line")
@export var line_length = 100.0
@export var line_width = 2.0
@export var line_color = Color.DIM_GRAY

@export_category("beat")
@export var beat_line_color = Color.BLACK
@export var visible_beat_count = 6.0
@export var beat_line_height := 25.0
@export var beat_line_width = 4.0

#func _ready():
#	StaticMusic.play(StaticMusic.music_cap150)
#	pass

func _process(delta):
	var new_scale = 1 - (StaticMusic.beat_length - StaticMusic.get_delay_with_next_beat()) / StaticMusic.beat_length
	new_scale = 0.5 + new_scale * 0.5
	$rythm_helper.scale = Vector2.ONE * new_scale * scale_multipliyer
	queue_redraw()

func _draw():
	var line_start = Vector2($Marker2D.global_position.x - line_length/2, $Marker2D.global_position.y)
	var line_end = Vector2($Marker2D.global_position.x + line_length/2, $Marker2D.global_position.y)
	draw_line(line_start, line_end, line_color, line_width, false)
	for i in range(visible_beat_count):
		var offset = Vector2((int)(StaticMusic.get_player_total_position() / StaticMusic.beat_length * line_length / visible_beat_count) % (int)(line_length / visible_beat_count), 0)
		var beat_pos = lerp(line_start, line_end, i/visible_beat_count) + offset
		draw_line(Vector2(beat_pos.x, beat_pos.y - beat_line_height/2), Vector2(beat_pos.x, beat_pos.y + beat_line_height/2), beat_line_color, beat_line_width, false)

