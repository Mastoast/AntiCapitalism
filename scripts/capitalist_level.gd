extends Node2D

var distance = 0.0
var score = 0
var combo = 20.0

var combo_decrease_speed = 5.0
var previous_time = 0.0

func _ready():
	randomize()
	StaticMusic.play(StaticMusic.music1, 1.0)
	StaticMusic.new_beat.connect(_on_new_beat)


func _process(delta):
	var current_time = StaticMusic.get_player_total_position()
	combo -= combo_decrease_speed * (current_time - previous_time)
	#
	$ScoreText.text = str(score)
	$ComboBar.value = combo
	previous_time = current_time

func _on_new_beat():
	pass

func _on_qte_success(precision:float):
	score += 10 * (1.0 - precision)

func _on_qte_failure(precision:float):
	score -= 5

func _on_bad_input():
	score -= 3
